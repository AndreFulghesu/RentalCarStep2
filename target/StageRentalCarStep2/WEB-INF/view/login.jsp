<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <title>Login RentalCar</title>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-light bg-light">
    <a class="navbar-brand" href="#">
        <img src="/docs/4.5/assets/brand/bootstrap-solid.svg" width="30" height="30" class="d-inline-block align-top" alt="" loading="lazy">
        Login
    </a>
</nav>

<div class="container-fluid">

    <div class="row">
        <c:if test="${param.logout != null}">
            <p class="text-success mx-auto">
                You have been logged out.
            </p>
        </c:if>
        <c:if test="${param.identifcazione != null}">
            <p class="text-danger mx-auto">
                Devi prima loggarti!
            </p>
        </c:if>
        <c:if test="${credenziali != null}">
        <p class="text-danger mx-auto">
            Credenziali errate.
        </p>
        </c:if>
    </div>

    <div class="row" style="padding:3%">

        <form class="mx-auto" style="width: 40%" action="${pageContext.request.contextPath}/postLogin" method="POST">
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp" required/>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control"  name="password" id="password" required/>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>

    </div>

</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>
