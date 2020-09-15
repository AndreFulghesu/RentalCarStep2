<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>Registra Utente</title>
</head>
<body style="font-family: 'Poppins',sans-serif;  font-size: 14px; color:#666; background: rgb(220,220,224);
  background: linear-gradient(90deg, rgba(220,220,224,1) 2%, rgba(166,166,167,0.09567577030812324) 44%);">


<jsp:include page="header.jsp"/>

<div class="login-container d-flex align-items-center justify-content-center" style="margin-top: 5%;">


    <form:form  class="shadow-sm p-3 mb-5 bg-white rounded-lg" method="post" action="salvaUtente" style="width: 25%" modelAttribute="user">
        <div class="form-group">
            <label for="nome">Nome:</label>
            <form:input path="nome" type="text" class="form-control" id="nome" name="nome" aria-describedby="nameHelp"/>
        </div>
        <div class="form-group">
            <label for="cognome">Cognome:</label>
            <form:input path="cognome" type="text" class="form-control" id="cognome" name="cognome" aria-describedby="nameHelp"/>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <form:input path="email" type="email" class="form-control" id="email" name="email" aria-describedby="secondNameHelp"/>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <form:input path="password"  type="password" class="form-control"  name="password" id="password"/>
        </div>
        <button type="submit" class="btn btn-primary align-items-center" style="width: 50%; margin-left: 115px;">Registra utente</button>
        <br>
    </form:form>


</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>