<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="collapse navbar-collapse" id="navbarColor01">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item <c:if test="${activedMenu eq sandwichSurMesure}">active</c:if>" >
                <a class="nav-link" href="/getSandwichSurMesure">Sandwich Sur Mesure</a>
            </li>
            <li class="nav-item" <c:if test="${activedMenu eq boisson}">active</c:if>>
                <a class="nav-link" href="/getBoissons">Boisson</a>
            </li>
            <li class="nav-item" <c:if test="${activedMenu eq crudite}">active</c:if>>
                <a class="nav-link" href="/getCrudites">Crudite</a>
            </li>
            <li class="nav-item" <c:if test="${activedMenu eq dessert}">active</c:if>>
                <a class="nav-link" href="/getDessert">Dessert</a>
            </li>
            <li class="nav-item" <c:if test="${activedMenu eq frites}">active</c:if>>
                <a class="nav-link" href="/getFrites">Frites</a>
            </li>
            <li class="nav-item" <c:if test="${activedMenu eq sauce}">active</c:if>>
                <a class="nav-link" href="/getSauce">Sauce</a>
            </li>
            <li class="nav-item" <c:if test="${activedMenu eq viande}">active</c:if>>
                <a class="nav-link" href="/getViande">Viande</a>
            </li>
            <li class="nav-item" <c:if test="${activedMenu eq classique}">active</c:if>>
                <a class="nav-link" href="/getClassique">Classique</a>
            </li>
        </ul>
    </div>
</nav>