<%--
  Created by IntelliJ IDEA.
  User: SI2001
  Date: 22/07/2020
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-dark bg-dark justify-content-center">
    <div class="card-body text-light">
        <h5 class="card-title text-center border-bottom" >Rental car</h5>
        <p class="card-text text-center">Il miglior modo per noleggiare la tua auto.</p>
    </div>
</nav>

<nav class="navbar navbar-light bg-light">
    <a class="navbar-brand" href="#">
        <img src="logo_auto.jpg" width="60" height="60" class="d-inline-block align-top" alt="" loading="lazy">
    </a>
    <a class="navbar-brand"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/StageRentalCarStep2_war_exploded/homepage">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/StageRentalCarStep2_war_exploded/parcoAuto">Parco Auto</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/StageRentalCarStep2_war_exploded/profiloUtente">Mio Profilo</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/StageRentalCarStep2_war_exploded/logout">Logout</a>
            </li>
        </ul>
    </div>
</nav>


