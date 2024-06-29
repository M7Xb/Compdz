

function setupCountdown(dealId, endTime) {
    const countdownContainer = document.getElementById(`countdown_${dealId}`);
    if (!countdownContainer || !endTime) return;

    const dealEndTime = new Date(endTime).getTime();

    const countdown = setInterval(function() {
        const now = new Date().getTime();
        const distance = dealEndTime - now;

        const days = Math.floor(distance / (1000 * 60 * 60 * 24));
        const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((distance % (1000 * 60)) / 1000);

        countdownContainer.querySelector('.days').textContent = formatTime(days);
        countdownContainer.querySelector('.hours').textContent = formatTime(hours);
        countdownContainer.querySelector('.minutes').textContent = formatTime(minutes);
        countdownContainer.querySelector('.seconds').textContent = formatTime(seconds);

        if (distance < 0) {
            clearInterval(countdown);
            countdownContainer.innerHTML = "Deal Expired";
  document.getElementById('hide-shop-now').style.display = "none";
        }
    }, 1000);
}

function formatTime(time) {
    return time < 10 ? `0${time}` : time;
}





// for the cookies

document.getElementById('hide-shop-now').onclick = function() {
    window.location.href = 'http://localhost:8081/product';
}

// function closeNavbar() {
//     $('.navbar-collapse').collapse('hide');
// }


function sendVerificationEmail() {
    // Access the value of the input fields, not the elements themselves
    const nom = document.getElementById('name').value.trim();
    const prenom = document.getElementById('prenom').value.trim();
    const address = document.getElementById('address').value.trim();
    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value.trim();
    const password2 = document.getElementById('password2').value.trim();

    // Check if any of the values are empty
    if (!nom || !address || !email || !password ||!prenom || !password2) {
        Swal.fire({
            title: 'Empty Fields',
            text: 'You must fill all the input fields to continue!',
            icon: 'warning',
            confirmButtonText: 'Ok'
        });
    } else if (password !== password2) {  // Now correctly compares the values, not the elements
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Passwords do not match!',
            confirmButtonText: 'Ok'
        });
    } else {
        Swal.fire({
            title: 'Verification Email Sent!',
            text: 'A verification email has been sent to your email address. ' +
                'Please check your email and activate your account to continue.',
            icon: 'success',
            confirmButtonText: 'Ok'
        });
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const checkbox = document.getElementById('remember-me');
    const passwordInput1 = document.getElementById('password');

    checkbox.addEventListener('click', togglePasswordVisibility);
});

function togglePasswordVisibility() {
    const passwordInput1 = document.getElementById('password');
    const passwordInput2 = document.getElementById('password2');
    const checkbox = document.getElementById('remember-me');

    if (checkbox.checked) {
        passwordInput1.type = 'text'; // show password
        passwordInput2.type = 'text'; // show password
    } else {
        passwordInput1.type = 'password'; // hide password
        passwordInput2.type = 'password'; // hide password
    }

}


//  -------------------------ADMIN PANEL PAGE--------------------------------------------//


function toggleSidebar() {
    const sidebar = document.querySelector("#sidebar");
    if (sidebar) {  sidebar.classList.toggle("collapsed");

    }
}

    // Function to show a specific content section and save the state
    function showContentSection(sectionId) {
        // Save the current section ID in localStorage
        localStorage.setItem('activeSection', sectionId);

        // Get all content sections and the dashboard
        const sections = document.querySelectorAll('.content-section');
        const dashboardSection = document.getElementById('dashboard');

        // Hide all sections and the dashboard
        sections.forEach(section => {
            section.style.display = 'none';
        });
        dashboardSection.style.display = 'none';

        // Display the requested section
        const sectionToShow = document.getElementById(sectionId);
        if (sectionToShow) {
            sectionToShow.style.display = 'block';
        } else {
            // Fallback to the dashboard if the section doesn't exist
            showDashboard();
        }
    }

// Function to display the dashboard and save the state
    function showDashboard() {
        localStorage.setItem('activeSection', 'dashboard');
        const allContentSections = document.querySelectorAll('.content-section');
        allContentSections.forEach(section => {
            section.style.display = 'none';
        });

        // Show the dashboard
        document.getElementById('dashboard').style.display = 'block';
    }


// Restore the active section or show the dashboard when the page loads
    window.onload = function() {
        const activeSection = localStorage.getItem('activeSection');

        // If there's a saved active section, show it, otherwise show the dashboard
        if (activeSection && document.getElementById(activeSection)) {
            showContentSection(activeSection);
        } else {
            showDashboard();
        }
    };

// Optional: Clear the stored active section
    function clearActiveSection() {
        localStorage.removeItem('activeSection');
        showDashboard();
    }

//  the function of delete products

    function Deleteproduit(productId) {
    Swal.fire({
        title: "Are you sure?",
        text: "To delete this product!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#1ed04b",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = `/deleteProduit/${productId}`;
        }
    });
}
// function for delete category
function DeleteCategory(categoryId) {
    Swal.fire({
        title: "Are you sure?",
        text: "To delete this category!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#1ed04b",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = `/deleteCategory/${categoryId}`;
        }
    });
}

// function for delete user

function deleteUser(userId) {
    Swal.fire({
        title: "Are you sure?",
        text: "To delete this user!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#1ed04b",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = `/admin/deleteUser/${userId}`;
        }
    });
}
// function for delete image

function deleteImage(imageId) {
    Swal.fire({
        title: "Are you sure?",
        text: "To delete this image!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#1ed04b",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = `/images/delete/${imageId}`;
        }
    });
}
function DeleteDeal(DealId) {
    Swal.fire({
        title: "Are you sure?",
        text: "To delete this image!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#1ed04b",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = `/deleteDeal/${DealId}`;
        }
    });
}
function DeleteComment(CommentId) {
    Swal.fire({
        title: "Are you sure?",
        text: "To delete this image!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#1ed04b",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = `/delete-comment/${CommentId}`;
        }
    });
}

function DeleteAds(adsId) {
    Swal.fire({
        title: "Are you sure?",
        text: "To delete this ads!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#1ed04b",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = `/delete-ads/${adsId}`;
        }
    });
}

function deleteOrder(orderId) {
    Swal.fire({
        title: "Are you sure?",
        text: "To delete this commande!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#1ed04b",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = "/commande/" + orderId ;
        }
    });
}





function EditCategoryForm(categoryId, categoryName) {
    showContentSection('editCategorySection');
    document.getElementById('categoryId').value = categoryId;
    document.getElementById('nomCategorie').value = categoryName;
}

function EditProductForm(id, name, price, categoryId, description) {
   showContentSection('editSection');
    document.getElementById("editForm").action = "/editProduit/" + id;
    document.getElementById("productId").value = id;
    document.getElementById("productName").value = name;
    document.getElementById("productPrice").value = price;
    document.getElementById("productCategory").value = categoryId;
    document.getElementById("productDescription").value = description;

}

function EditdealtForm(id, name, oldprice, newprice, description ) {
    showContentSection('editdealtimer');
    document.getElementById("editdeal").action = "/dealproducts/edit/" + id;
    document.getElementById("dealId").value = id;
    document.getElementById("name-deal").value = name;
    document.getElementById("old").value = oldprice;
    document.getElementById("new").value = newprice;
    document.getElementById("description-deal").value = description;

}
function TimerdealtForm(id) {
    showContentSection('dealtimer');
    document.getElementById("add-time-deal").action = "/dealproducts/setEndDeal/" + id;
    document.getElementById("timerdeal").value = id;
}

function EditCommentForm(id, name, career, description) {
    showContentSection('edit-comment');
    document.getElementById("editcomment").action = "/edit-comment/" + id;
    document.getElementById("comment-update").value = id;
    document.getElementById("name-comment").value = name;
    document.getElementById("career-comment").value = career;
    document.getElementById("description-comment").value = description;
}

function editAdsForm(id, description) {
    showContentSection('edit-ads');
    document.getElementById("edit-ads-form").action = "/edit-ads/" + id;
    document.getElementById("ads-update").value = id;
    document.getElementById("description-ads").value = description;
}








