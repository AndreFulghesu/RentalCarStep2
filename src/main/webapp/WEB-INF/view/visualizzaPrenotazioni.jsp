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

    <title>Prenotazioni Utente</title>
</head>
<body  style="font-family: 'Poppins',sans-serif;  font-size: 14px; color:#666; background: rgb(220,220,224);
background: linear-gradient(90deg, rgba(220,220,224,1) 2%, rgba(166,166,167,0.09567577030812324) 44%);">

<%
    int contatore = 1;
%>

<jsp:include page="header.jsp"/>


<div class="container-fluid" style="margin-top: 5%;">

    <div class="row row-cols-1 justify-content-center"  style="width: 100%; padding: 10px;">




        <table class="table table-hover" style="margin-top: 1%;">
            <thead class="thead-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Utente richiedente</th>
                <th scope="col">Mezzo</th>
                <th scope="col">Data inizio</th>
                <th scope="col">Data fine</th>
                <th scope="col"></th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>


            <c:if test="${elenco_prenotazioni_utenti.isEmpty()}">
                <p class="text-danger mx-auto">
                    Non ci sono ancora prenotazioni.
                </p>
            </c:if>


            <c:forEach items="${elenco_prenotazioni_utenti}" var="prenot">


                <tr>
                    <th scope="row"><%=contatore%></th>
                    <td><strong>${utente_selezionato.getNome() } ${ utente_selezionato.getCognome()} </strong> </td>
                    <td><strong>${prenot.getMezzoUtilizzato().getCasaCostruttrice()}  ${prenot.getMezzoUtilizzato().getModello()}</strong></td>
                    <td><strong>${prenot.getInizioPrenotazione()}</strong></td>
                    <td><strong>${prenot.getFinePrenotazione()}</strong></td>
                    <c:if test="${prenot.getStatus_prenotazione() == 0}">
                        <td><button type="button" class="btn btn-success" onclick="window.location.href='gestionePrenotazioni?idPrenotazione=${prenot.getIdPrenotazione()}'">Approva</button></td>
                        <td><button type="button" class="btn btn-danger" onclick=onclick="window.location.href='eliminaPrenotazione?idPrenotazione=${prenot.getIdPrenotazione()}'">Elimina</button></td>
                    </c:if>
                    <c:if test="${prenot.getStatus_prenotazione() == 1}">
                        <td><p class="text-success">Prenotazione confermata.</p> </td>
                    </c:if>

                    <%contatore++;%>

                </tr>

            </c:forEach>


            </tbody>
        </table>

    </div>


</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>