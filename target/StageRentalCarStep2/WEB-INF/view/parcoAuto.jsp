<%@ page import="it.si2001.rentalcar.model.User" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="it">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>Parco Auto</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
</head>
<body>

<%
    User utente = (User) session.getAttribute("utente");

%>


<jsp:include page="header.jsp"/>

<div class="container-fluid" style="margin-top: 5%;">


    <c:if test="${mezzo_creato != null}">
        <p class="text-success mx-auto">${mezzo_creato}</p>
    </c:if>
    <c:if test="${eliminato != null}">
        <p class="text-success mx-auto">${eliminato}</p>
    </c:if>
    <c:if test="${mezzo_modificato != null}">
        <p class="text-success mx-auto">${mezzo_modificato}</p>
    </c:if>


    <% if (utente.getPrivilegi() == 1) { %>
    <a href="#" data-toggle="modal" class="btn btn-info" data-target="#myModal2">Aggiungi veicolo...</a>
    <%}%>

    <div class="row" style="width: 90%; padding: 10px;">

        <c:forEach items="${elenco_mezzi}" var="automobile">

            <div class="col-7 border-right-0 border-bottom-0 border-left-0 border border-info "
                 style="margin-top: 10px; padding: 5px;">

                <div class="media">
                    <img src="${automobile.getUrl_image()}"
                         class="align-self-start mr-3" width="300" height="250">
                    <ul class="list-group list-group-flush" style=" width:100%; padding: 5px">
                        <li class="list-group-item">Casa costruttrice:
                            <strong>${automobile.getCasaCostruttrice()}</strong>
                        </li>
                        <li class="list-group-item">Modello: <strong>${automobile.getModello()}</strong></li>
                        <li class="list-group-item">Anno immatricolazione:
                            <c:set var="data" value="${automobile.getAnnoImmatricolazione()}"></c:set>
                            <strong>${automobile.dataFormattata(data)}</strong></li>
                        <li class="list-group-item">Targa: <strong>${automobile.getTarga()}</strong></li>

                        <%if (utente.getPrivilegi() != 0) { %>
                        <td class="list-group-item">
                            <button type="button" class="btn btn-secondary"
                                    onclick="window.location.href='modificaVeicolo?targa=${automobile.getTarga()}'">
                                Modifica veicolo...
                            </button>
                        </td>
                        <%}%>

                        <td class="list-group-item"><%if (utente.getPrivilegi() == 0) { %>
                            <button type="button" class="btn btn-info"
                                    onclick="window.location.href='prenotaAuto?targaAuto=${automobile.getTarga()}'">
                                Prenota auto
                            </button>
                            <%}%></td>

                        <td class="list-group-item"><c:if test="${automobile.getIs_booked() == 2}">
                            <div class="badge badge-danger text-wrap" style="width: 6rem; margin-top: 5px;">
                                Auto in riparazione.
                            </div>
                        </c:if></td>


                        <!-- popUp per aggiungere un'auto-->
                        <div class="modal" tabindex="-1" role="dialog" id="myModal2">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Aggiungi Auto</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <!-- form dentro il popUp per aggiungere un'auto -->
                                    <div class="modal-body">
                                        <form class="shadow-sm p-3 mb-5 bg-white rounded-lg" method="post"
                                              action="aggiungiVeicolo">
                                            <div class="form-group">
                                                <label for="casa">Casa costruttrice:</label>
                                                <input type="text" class="form-control" id="casa"
                                                       name="casa_costruttrice"
                                                       placeholder="Fiat..." aria-describedby="nameHelp">
                                            </div>
                                            <div class="form-group">
                                                <label for="modello">Modello:</label>
                                                <input type="text" class="form-control" id="modello"
                                                       placeholder="500..." name="modello_mezzo"
                                                       aria-describedby="secondNameHelp">
                                            </div>
                                            <div class="form-group">
                                                <label for="targa">Targa:</label>
                                                <input type="text" class="form-control" id="targa" name="targa_mezzo"
                                                       aria-describedby="secondNameHelp"
                                                       placeholder="">
                                            </div>
                                            <div class="form-group">
                                                <label for="data_immatricolazione">Data di immatricolazione:</label>
                                                <input type="date" id="data_immatricolazione"
                                                       name="data_immatricolazione"
                                                       aria-describedby="dateHelp">
                                            </div>
                                            <div class="form-group">
                                                <select class="custom-select" name="tipologia_veicolo">
                                                    <option selected>Tipologia veicolo...</option>
                                                    <option value="berlina">Berlina</option>
                                                    <option value="citycar">City Car</option>
                                                    <option value="cabriolet">Cabriolet</option>
                                                    <option value="monovolume">Monovolume</option>
                                                    <option value="sportiva">Sportiva</option>
                                                    <option value="stationwagon">Station Wagon</option>
                                                    <option value="suv">SUV</option>
                                                    <option value="furgone">Furgone</option>
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btn-success">Aggiungi veicolo</button>
                                            <br>
                                        </form>

                                    </div>
                                    <div class="modal-footer"></div>
                                </div>
                            </div>
                        </div>

                    </ul>
                </div>

            </div>

            <div class="col-6" style="margin-top: 10px; padding: 5px;">
                <button class="btn btn-danger" onclick="deleteVeicle('${automobile.getTarga()}')">X</button>
                Elimina Veicolo
            </div>

        </c:forEach>

    </div>

</div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>

<script>
    function deleteVeicle(targa) {
        var confirmation = confirm("Sei sicuro di voler cancellare?")
        if (confirmation) {
            window.location.href = 'eliminaVeicolo?targa=' + targa;
        } else {
        }
    }
</script>
</body>
</html>
