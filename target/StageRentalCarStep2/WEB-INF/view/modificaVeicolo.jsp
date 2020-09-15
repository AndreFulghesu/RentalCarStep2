<%@ page import="it.si2001.rentalcar.model.Mezzo" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="it">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>Modifca Auto</title>
</head>
<body style="font-family: 'Poppins',sans-serif;  font-size: 14px; color:#666; background: rgb(220,220,224);
background: linear-gradient(90deg, rgba(220,220,224,1) 2%, rgba(166,166,167,0.09567577030812324) 44%);">

<%
    String targa = "";
    String locazione = "";
    if(request.getParameter("targa")!= null){
        targa = (String)request.getParameter("targa");
    }
    System.out.println(targa);
    locazione = (String)session.getAttribute("locazione");
    Mezzo veicolo = (Mezzo)session.getAttribute("veicolo");
%>


<jsp:include page="header.jsp"/>

<div class="login-container d-flex align-items-center justify-content-center" style="margin-top: 5%;">

    <form class="shadow-sm p-3 mb-5 bg-white rounded-lg" method="post"
          action="modificaMezzo?targa=${veicolo.getTarga()}">
        <div class="form-group">
            <label for="casa1">Casa costruttrice:</label>
            <input type="text" class="form-control" id="casa1" value="<%=veicolo.getCasaCostruttrice()%>" name="casa_costruttrice1"
                   placeholder="Fiat..." aria-describedby="nameHelp">
        </div>
        <div class="form-group">
            <label for="modello1">Modello:</label>
            <input type="text" class="form-control" id="modello1"
                   placeholder="500..." name="modello_mezzo1" value="<%=veicolo.getModello()%>"
                   aria-describedby="secondNameHelp">
        </div>
        <div class="form-group">
            <label for="targa1">Targa:</label>
            <input type="text" class="form-control" value="<%=veicolo.getTarga()%>" id="targa1" name="targa_mezzo1"
                   aria-describedby="secondNameHelp"
                   placeholder="">
        </div>
        <div class="form-group">
            <label for="data_immatricolazione1">Data di immatricolazione:</label>
            <input type="date" id="data_immatricolazione1" value="<%=veicolo.getAnnoImmatricolazione()%>" name="data_immatricolazione1"
                   aria-describedby="dateHelp">
        </div>
        <div class="form-group">
            <select class="custom-select"  value="<%=veicolo.getTipologiaVeicolo()%>"  name="tipologia_veicolo1">
                <option selected>Tipologia veicolo...</option>
                <option value="berlina">Berlina</option>
                <option value="citycar">City Car</option>
                <option value="cabriolet">Cabriolet</option>
                <option value="monovolume">Monovolume</option>
                <option value="sportiva">Sportiva</option>
                <option value="stationwagon">Station Wagon</option>
                <option value="SUV">SUV</option>
                <option value="furgone">Furgone</option>
            </select>
        </div>
        <button type="submit" class="btn btn-success">Modifica veicolo</button>
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