
    // function search product by name
    document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.getElementById('searchInput');
    const products = document.querySelectorAll('.product');

    searchInput.addEventListener('input', function () {
    const searchText = this.value.trim().toLowerCase();

    products.forEach(function (product) {
    const productName = product.getAttribute('data-name');
    const parentDiv = product.closest('.col-lg-3'); // Find the parent div with class col-lg-3

    if (productName.startsWith(searchText)) {
    product.style.display = 'block';
    parentDiv.style.display = 'block'; // Show the parent div
} else {
    product.style.display = 'none';
    parentDiv.style.display = 'none'; // Hide the parent div
}
});
});
});

    document.getElementById('categorySelect').addEventListener('change', function() {
    const selectedCategory = this.value;
    console.log("Selected Category:", selectedCategory); // Debug statement
    const products = document.querySelectorAll('.col-lg-3, .col-md-3, .col-sm-6, .col-xs-12');

    products.forEach(function(product) {
    let productCategory = product.getAttribute('data-category');
    console.log("Product Category:", productCategory); // Debug statement

    if (selectedCategory === "0" || selectedCategory === productCategory) {
    product.style.display = 'block';
} else {
    product.style.display = 'none';
}
});
});

    // -----------------panier ----------------------------------

let cart = []; // This will store the cart items

document.querySelectorAll('.buy-btn').forEach(item => {
    item.addEventListener('click', function (e) {
        e.preventDefault(); // Prevent the default anchor link behavior
        const productId = this.getAttribute('data-product-id');
        addToCart(productId, 1);
    });
});

function addToCart(productId, change) {
    const dataProduct = document.querySelector('[data-product-id="' + productId + '"]');
    const productElement = dataProduct.closest('.item');
    const productName = productElement.querySelector('h4').textContent;
    const productPrice = productElement.querySelector('.price').textContent;
    const productImage = productElement.querySelector('img').src;

    const newItem = {
        id: productId,
        name: productName,
        price: parseFloat(productPrice.replace('DZA', '')),
        quantity: 1,
        image: productImage
    };

    const existingItem = cart.find(item => item.id === newItem.id);
    if (existingItem) {
        existingItem.quantity = existingItem.quantity + change;
        // Update quantity of existing item in the cart in the DB
        if (change > 0) {
            AjouterItemDansPanierEnBdd(existingItem);
        } else {
            SupprimerItemDansPanierEnBdd(existingItem);
        }
    } else {
        cart.push(newItem);
        // Add/persist the new product in the cart in the DB
        AjouterItemDansPanierEnBdd(newItem);
    }

    updateCartUI();
}

function confirmDelete(button) {
    const productId = button.getAttribute('data-product-id');

    // Display SweetAlert confirmation
    Swal.fire({
        title: "Are you sure?",
        text: "To remove this item from cart!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#1ed04b",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, remove it!",
        customClass: {
            popup: 'swal-custom-zindex'  // Add custom class for z-index
        }
    }).then((result) => {
        // If confirmed, remove the item from the cart
        if (result.isConfirmed) {
            // Call the removeFromCart function to delete the item
            removeFromCart(productId);
        }
    });
}


function removeFromCart(productId) {
    cart = cart.filter(item => item.id !== productId);
    removeArticle(productId);
    updateCartUI();
}

function removeArticle(productId) {
    $.ajax({
        url: "/panier/item/remove/" + productId,
        type: 'DELETE',
        datatype: 'json',
        contentType: 'application/json',
        success: function (data) {
            // If the deletion was successful, update the UI
            updateCartUI();
        },
        error: function (xhr, status, error) {
            // Handle errors
            alert("Failed to remove item from cart: " + error);
        }
    });
}

function updateCartUI() {
    const cartItemCount = document.getElementById('cartItemCount');
    cartItemCount.textContent = cart.reduce((total, item) => total + item.quantity, 0);

    const cartItemsContainer = document.querySelector('.cart-items');
    const total = cart.reduce((total, item) => total + (item.price * item.quantity), 0);

    cartItemsContainer.innerHTML = cart.map(item => `
        <div class="cart-item">
            <img src="${item.image}" alt="${item.name}">
            <div class="cart-item-info">
                <div class="name">${item.name}</div>
                <div class="price">DZA ${item.price}</div>
                <div>
                    <button class="quantity-btn decrease" data-product-id="${item.id}">-</button>
                    <input type="text" class="text-center" value="${item.quantity}" data-product-id="${item.id}" size="2" style="width: 30px; color: black">
                    <button class="quantity-btn increase" data-product-id="${item.id}">+</button>
                    <button class="delete-btn btn btn-danger ms-5" data-product-id="${item.id}" onclick="confirmDelete(this)">
                        <i class="fa-solid fa-trash"></i>
                    </button>
                </div>
            </div>
        </div>
    `).join('');

    // Update the total price in the cart-controls
    document.getElementById('total-price').textContent = total.toFixed(2);

    // Reattach event listeners for dynamically created elements if necessary
    attachEventListenersToQuantityButtons();
}

function attachEventListenersToQuantityButtons() {
    document.querySelectorAll('.decrease').forEach(button => {
        button.addEventListener('click', function () {
            adjustQuantity(this.getAttribute('data-product-id'), -1);
        });
    });

    document.querySelectorAll('.increase').forEach(button => {
        button.addEventListener('click', function () {
            adjustQuantity(this.getAttribute('data-product-id'), 1);
        });
    });
}

function adjustQuantity(productId, change) {
    const product = cart.find(item => item.id === productId);
    if (!product) return;
    product.quantity += change;
    if (product.quantity < 1) {
        product.quantity = 1; // Ensure the quantity doesn't go below 1
    }
    if (change > 0) {
        AjouterItemDansPanierEnBdd(product);
    } else {
        SupprimerItemDansPanierEnBdd(product);
    }
    updateCartUI();
}

async function fetchPanier() {
    try {
        const response = await fetch(`/panier/items`);
        if (!response.ok) {
            throw new Error('Network response was not ok ' + response.statusText);
        }
        const items = await response.json();
        if (items != null) {
            cart = items;
            updateCartUI();
        }
    } catch (error) {
        console.error('There was a problem with your fetch request to retrieve the cart from the DB:', error);
    }
}

document.addEventListener('DOMContentLoaded', (event) => {
    fetchPanier();
});

function AjouterItemDansPanierEnBdd(newItem) {
    $.ajax({
        url: "/panier/item/add",
        type: 'POST',
        datatype: 'json',
        contentType: 'application/json',
        data: JSON.stringify(newItem.id),
        success: function (data) {
            // Handle success
        },
        error: function (xhr, status, error) {
            const err = JSON.parse(xhr.responseText);
            alert(err.Message);
        }
    });
}

function SupprimerItemDansPanierEnBdd(newItem) {
    $.ajax({
        url: "/panier/item/remove",
        type: 'DELETE',
        datatype: 'json',
        contentType: 'application/json',
        data: JSON.stringify(newItem.id),
        success: function (data) {
            // Handle success
        },
        error: function (xhr, status, error) {
            var err = JSON.parse(xhr.responseText);
            alert(err.Message);
        }
    });
}

function showCart() {
    const cartModal = document.getElementById('cartModal');
    cartModal.style.display = (cartModal.style.display === 'block' ? 'none' : 'block');
}

document.querySelector('.bought-button').addEventListener('click', function () {
    toggleVisibility(); // Hide the cart and product listings, show the purchase form
});


function toggleVisibility() {
    document.getElementById('purchaseContainer').style.display = 'block';
    document.getElementById('container-all').style.display = 'none';
    document.getElementById('cartModal').style.display = 'none';
    document.getElementById('price').value = document.getElementById('total-price').textContent + " DZA"; // Set total price in the form

}

document.getElementById('purchaseForm').addEventListener('submit', function (event) {
    event.preventDefault();

    // valider la commande vers le backed
    validateCommande();

    displayReceipt(); // Implement this function based on your business logic
});

    function validateCommande() {

        const infoCommande = {
            nom: document.getElementById('nom').value,
            prenom:  document.getElementById('prenom').value,
            email: document.getElementById('email').value,
            wilaya: document.getElementById('wilaya').value,
            codePostal: document.getElementById('codePostal').value,
            adress: document.getElementById('address').value,
            price : document.getElementById('price').value
        };

        $.ajax({
            url: "/commande/valide",
            type: 'POST',
            datatype: 'json',
            contentType: 'application/json',
            data: JSON.stringify(infoCommande),
            success: function (data) {
                // Handle success
                alert(data);
            },
            error: function (xhr, status, error) {
                var err = JSON.parse(xhr.responseText);
                alert(err.Message);
            }
        });
    }

    function displayReceipt() {
        const receipt = document.getElementById('receipt');
        const form = document.getElementById('purchaseContainer');
        document.getElementById('receiptContent').innerHTML = `
        <div class="receipt-item"><span class="label">Nom:</span> <span class="value">${document.getElementById('nom').value}</span></div>
        <div class="receipt-item"><span class="label">Prenom:</span> <span class="value">${document.getElementById('prenom').value}</span></div>
        <div class="receipt-item"><span class="label">Email:</span> <span class="value">${document.getElementById('email').value}</span></div>
        <div class="receipt-item"><span class="label">Wilaya:</span> <span class="value">${document.getElementById('wilaya').value}</span></div>
        <div class="receipt-item"><span class="label">Code Postal:</span> <span class="value">${document.getElementById('codePostal').value}</span></div>
        <div class="receipt-item"><span class="label">Address:</span> <span class="value">${document.getElementById('address').value}</span></div>
        <div class="receipt-item"><span class="label">Price:</span> <span class="value">${document.getElementById('price').value}</span></div>
    `;
        form.style.display = 'none';
        receipt.style.display = 'block';
    }


    document.getElementById('returnButton').onclick = function() {
        window.location.href = 'http://localhost:8081/product';
    }
    document.getElementById("downloadPDF").addEventListener("click", function () {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF({
            orientation: "portrait",
            unit: "mm",
            format: "a4"
        });

        const date = new Date();
        const dateString = date.toLocaleDateString() + " " + date.toLocaleTimeString();

        // Header
        doc.setFont("helvetica", "bold");
        doc.setFontSize(22);
        doc.setTextColor(40, 45, 50);
        doc.text("Receipt from CampDz", 105, 20, { align: "center" });

        // Sub-header
        doc.setFontSize(12);
        doc.setFont("helvetica", "normal");
        doc.setTextColor(100);
        doc.text(`Date of Purchase: ${dateString}`, 105, 30, { align: "center" });

        // Divider
        doc.setDrawColor(200);
        doc.line(20, 35, 190, 35);

        // Content
        let startY = 45;
        const content = [
            { label: 'Nom', value: document.getElementById('nom').value },
            { label: 'Prenom', value: document.getElementById('prenom').value },
            { label: 'Email', value: document.getElementById('email').value },
            { label: 'Wilaya', value: document.getElementById('wilaya').value },
            { label: 'Code Postal', value: document.getElementById('codePostal').value },
            { label: 'Address', value: document.getElementById('address').value },
            { label: 'Price', value: document.getElementById('price').value },
        ];

        content.forEach(function (item, index) {
            doc.setFontSize(12);
            doc.setTextColor(50);
            if (index % 2 === 0) {
                doc.setFillColor(240, 240, 240);
                doc.rect(20, startY, 170, 10, 'F'); // Drawing a background for even index items
            }
            doc.text(`${item.label}:`, 60, startY + 7, { align: 'right' });
            doc.text(item.value, 130, startY + 7, { align: 'left' });
            startY += 10;
        });

        // QR Code Data
        const qrData = `Verification de order\n` +
            `Date order: ${dateString}\n` +
            `Nom: ${document.getElementById('nom').value}\n` +
            `Prenom: ${document.getElementById('prenom').value}\n` +
            `Wilaya: ${document.getElementById('wilaya').value}\n` +
            `Price: ${document.getElementById('price').value}`;

        // QR Code Generation
        const qr = new QRCode(document.createElement('div'), {
            text: qrData,
            width: 100,
            height: 100,
            colorDark: "#000000",
            colorLight: "#ffffff",
            correctLevel: QRCode.CorrectLevel.H
        });

        // Render QR Code and add to PDF
        const qrCanvas = qr._oDrawing._elCanvas;
        const qrPositionY = startY + 20;
        doc.addImage(qrCanvas.toDataURL('image/png'), 'PNG', 85, qrPositionY, 40, 40);

        // Thank You Note
        doc.setFontSize(12);
        doc.setTextColor(120);
        doc.text("Thank you for your purchase!", 105, qrPositionY + 50, { align: "center" });

        // Save PDF
        doc.save("CampDz_receipt.pdf");

        // Show alert
        document.getElementById('alertContainer').style.display = 'block';
        setTimeout(() => {
            document.getElementById('alertContainer').style.display = 'none';
        }, 3000);
    });


