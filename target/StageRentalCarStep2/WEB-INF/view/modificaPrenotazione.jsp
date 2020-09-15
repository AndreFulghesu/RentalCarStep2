<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.Period" %>
<%@ page import="it.si2001.rentalcar.model.Prenotazione" %>
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

    <title>Modifica Prenotazione</title>
</head>
<body style="font-family: 'Poppins',sans-serif;  font-size: 14px; color:#666; background: rgb(220,220,224);
background: linear-gradient(90deg, rgba(220,220,224,1) 2%, rgba(166,166,167,0.09567577030812324) 44%);">


<jsp:include page="header.jsp"/>

<div class="login-container d-flex align-items-center justify-content-center" style="margin-top: 5%;">

    <form class="shadow-sm p-3 mb-5 bg-white rounded-lg" method="post"
          action="modificaPrenotazione?idPrenotazione=${da_modificare.getIdPrenotazione()}">
        <div class="form-group">
            <label for="data_inizio">Seleziona la data di inizio:</label>
            <input type="date" id="data_inizio" value="${da_modificare.getInizioPrenotazione()}" name="data_inizio"
                   aria-describedby="dateHelp">
        </div>
        <div class="form-group">
            <label for="data_fine">Seleziona la data di resa:</label>
            <input type="date" id="data_fine" value="${da_modificare.getFinePrenotazione()}" name="data_fine"
                   aria-describedby="dateHelp">
        </div>
        <button type="submit" class="btn btn-success">Prenota Auto</button>
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



</body>
</html>
