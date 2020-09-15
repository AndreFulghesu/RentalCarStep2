<%@ page import="it.si2001.rentalcar.model.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="it">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>Modifca utente</title>
</head>
<body style="font-family: 'Poppins',sans-serif;  font-size: 14px; color:#666; background: rgb(220,220,224);
background: linear-gradient(90deg, rgba(220,220,224,1) 2%, rgba(166,166,167,0.09567577030812324) 44%);">

<%
    long idUtente =0;
    String locazione = "Modifica Utente";
    if(request.getParameter("idUtenteElenco")!= null){
        idUtente = Long.parseLong(request.getParameter("idUtenteElenco"));
    }
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    session.setAttribute("locazione",locazione);
    User utente = (User)session.getAttribute("utente_da_modificare");
%>


<jsp:include page="header.jsp"/>

<div class="login-container d-flex align-items-center justify-content-center" style="margin-top: 5%;">



    <form class="shadow-sm p-3 mb-5 bg-white rounded-lg" method="post" style="width: 30%"
          action="modifica?idUtenteElenco=${customer.getIdUtente()}">
        <div class="form-group">
            <label for="nome_utente">Nome:</label>
            <input type="text" class="form-control"  value="<%=utente.getNome()%>" id="nome_utente" name="nome_utente"
                   placeholder="Giorgio..." aria-describedby="nameHelp">
        </div>
        <div class="form-group">
            <label for="cognome_utente">Cognome:</label>
            <input type="text" class="form-control" value="<%=utente.getCognome()%>" id="cognome_utente"
                   placeholder="Canariello..." name="cognome_utente"
                   aria-describedby="secondNameHelp">
        </div>
        <div class="form-group">
            <label for="email_utente">Email:</label>
            <input type="text" class="form-control" value="<%=utente.getEmail()%>" id="email_utente" name="email_utente"
                   aria-describedby="secondNameHelp"
                   placeholder="email...">
        </div>
        <div class="form-group">
            <label for="data_utente">Data di nascita:</label>
            <input type="date" id="data_utente" value="<%=utente.getDataNascita()%>" name="data_utente"
                   aria-describedby="dateHelp">
        </div>
        <div class="form-group">
            <label for="password_utente">Password:</label>
            <input type="password" class="form-control" value="" id="password_utente" name="password_utente"
                   aria-describedby="secondNameHelp"
                   placeholder="password...">

        </div>
        <button type="submit" class="btn btn-success">Modifica utente</button>
        <br>
    </form>

</div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>