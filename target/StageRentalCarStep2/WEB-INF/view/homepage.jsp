<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<%@ page import="java.util.TimeZone" %>
<%@ page import="java.util.Locale" %>
<%@ page import="sun.util.resources.LocaleData" %>
<%@ page import="it.si2001.rentalcar.model.User" %><%--
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

    <title>Homepage</title>
</head>
<body  style="font-family: 'Poppins',sans-serif;  font-size: 14px; color:#666; background: rgb(220,220,224);
background: linear-gradient(90deg, rgba(220,220,224,1) 2%, rgba(166,166,167,0.09567577030812324) 44%);">


<%
    int contatore = 1;
    User loggato = (User) session.getAttribute("loggato");
%>

<jsp:include page="header.jsp"/>



<div class="container-fluid d-flex align-items-center justify-content-center" style="margin-top: 5%;">

    <div class="row row-cols-1 text-center"  style="width: 70%; padding: 10px;">


        <c:if test="${utente_creato != null}">
            <p class="text-success mx-auto">${utente_creato}</p>
        </c:if>

        <c:if test="${eliminato != null}">
            <p class="text-success mx-auto">${eliminato}</p>
        </c:if>

        <c:if test="${utente_modificato!= null}">
            <p class="text-success mx-auto">${utente_modificato}</p>
        </c:if>

        <c:if test="${successo_prenotazione!= null}">
            <p class="text-success mx-auto">${successo_prenotazione}</p>
        </c:if>

        <c:if test="${accettata!= null}">
            <p class="text-success mx-auto">${accettata}</p>
        </c:if>

        <c:if test="${impossibile_modificare!= null}">
            <p class="text-danger mx-auto">${impossibile_modificare}</p>
        </c:if>




        <% if(loggato.getPrivilegi()== 0) {%>
        <a href="/StageRentalCarStep2_war_exploded/parcoAuto" class="btn btn-primary" role="button" aria-pressed="true">Aggiungi una prenotazione...</a>
        <% }%>

        <% if(loggato.getPrivilegi() == 1) {%>
        <a  class="btn btn-primary" href="/StageRentalCarStep2_war_exploded/nuovoUtente"> Aggiungi utente...</a>
        <% }%>


        <br>

        <%if(loggato.getPrivilegi()==1){%>

        <table class="table table-hover" style="margin-top: 1%;">
            <thead class="thead-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Utente</th>
                <th scope="col">Prenotazione</th>
                <th scope="col"></th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${allUsers}" var="utente2">

                <tr>
                    <th scope="row"><%=contatore%></th>
                    <td><strong>${utente2.getNome() } ${ utente2.getCognome()} </strong> </td>
                    <td> <button type="button" class="btn btn-info" onclick="window.location.href='visualizzaPrenotazioni?idUtente=${utente2.getIdUtente()}'">Visualizza</button></td>
                    <td><button type="button" class="btn btn-warning" onclick="window.location.href='modificaUtente?idUtenteElenco=${utente2.getIdUtente()}'">Modifica</button></td>
                    <td><button class="btn btn-danger"  onclick="deleteUser('${utente2.getIdUtente()}')">Elimina</button></td>

                </tr>
                <%contatore++;%>

            </c:forEach>


            </tbody>
        </table>


    </div>

    <!-- gestione elenco prenotazioni utente Customer -->

    <%}else{%>

    <c:if test="${allPrenotazioni.isEmpty()}">
        <p class="text-danger mx-auto">Non ci sono prenotazioni</p>
    </c:if>


    <c:forEach items="${allPrenotazioni}" var="prenot">

        <div class="col border border-info shadow-sm p-3 mb-5 bg-white" style="margin-top: 1%; width: 40%">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">Prenotazione: <strong>${utente.getNome()} ${utente.getCognome()}</strong></li>
                <li class="list-group-item">Data:  <strong>${prenot.periodo()}</strong></li>
                <li class="list-group-item">Auto:  <strong>${prenot.getMezzoUtilizzato().getModello()}</strong></li>
                <li class="list-group-item"><button type="button" class="btn btn-info" onclick="window.location.href='modificaPrenotazione?idPrenotazione=${prenot.getIdPrenotazione()}'">Modifica prenotazione</button></li>
                <li class="list-group-item"><button type="button" class="btn btn-danger" onclick="deletePrenotazione('${prenot.getIdPrenotazione()}')">Elimina prenotazione </button> </li>
                <c:if test="${prenot.getStatus_prenotazione() == 0}">
                    <p class="text-warning">Prenotazione non confermata</p>
                </c:if>
                <c:if test="${prenot.getStatus_prenotazione() == 1}">
                    <p class="text-success">Prenotazione confermata</p>
                </c:if>

            </ul>
        </div>

    </c:forEach>

    <%}%>


</div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script>
    function deleteUser(idUtente){
        var confirmation = confirm("Sei sicuro di voler cancellare l'utente?")
        if (confirmation){
            window.location.href='elimina?idUtente='+idUtente;
        }else{
        }
    }
</script>
<script>
    function deletePrenotazione(idPrenotazione){
        var confirmation = confirm ("Sei sicuro di voler eliminare la prenotazione?")
        if(confirmation){
            window.location.href='eliminaPrenotazione?idPrenotazione='+idPrenotazione;
        }else{

        }
    }
</script>
</body>
</html>
