<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="it.si2001.rentalcar.model.User" %>
<%--
  Created by IntelliJ IDEA.
  User: SI2001
  Date: 22/07/2020
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>Profilo Utente</title>
</head>
<body style="font-family: 'Poppins',sans-serif;  font-size: 14px; color:#666; background: rgb(220,220,224);
background: linear-gradient(90deg, rgba(220,220,224,1) 2%, rgba(166,166,167,0.09567577030812324) 44%);">

<%

    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy");
    //String formattedDate = utente.getDataNascita().format(myFormatObj);

%>


<jsp:include page="header.jsp"/>

<div class="container-fluid d-flex align-items-center justify-content-center" style="margin-top: 10%;">


    <div class="card  text-center shadow-lg p-3 mb-5 bg-white rounded" style="width: 30%;">
        <img src="./profilo.jpg"  width="100" height="300" class="card-img-top">
        <div class="card-body">
            <h5 class="card-title">Ciao  ${utente.getNome()}</h5>
            <p class="card-text">Questi sono i tuoi dati</p>
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">Nome: <strong>${utente.getNome()}</strong></li>
            <li class="list-group-item">Cognome: <strong>${utente.getCognome()}</strong></li>
            <li class="list-group-item">Data di nascita: <strong>${utente.dataFormattata(utente.getDataNascita())}</strong></li>
        </ul>
        <a href="modificaUtente?idUtenteElenco=${utente.getIdUtente()}"  class="btn btn-info">Modifica utente...</a>


    </div>

</div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>
