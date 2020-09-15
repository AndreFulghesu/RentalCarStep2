package it.si2001.rentalcar.model;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "prenotazione", schema = "rentalcar")
public class Prenotazione {
    private Long idPrenotazione;
    private LocalDate inizioPrenotazione;
    private LocalDate finePrenotazione;
    private long utenteRichiedente;
    private Mezzo mezzoUtilizzato;
    private int status_prenotazione;


    public Prenotazione () {}

    public Prenotazione (LocalDate data_inizio, LocalDate data_fine, Long id_utente, Mezzo mezzoUtilizzato) {

        setInizioPrenotazione(data_inizio);
        setFinePrenotazione(data_fine);
        setMezzoUtilizzato(mezzoUtilizzato);
        setUtenteRichiedente(id_utente);
        setStatus_prenotazione(0);

    }


    @Column(name = "status_prenotazione")
    public int getStatus_prenotazione (){
        return this.status_prenotazione;
    }

    public void setStatus_prenotazione (int status_prenotazione){
        this.status_prenotazione = status_prenotazione;
    }



    @Column(name = "utente_richiedente")
    public long getUtenteRichiedente() {
        return this.utenteRichiedente;
    }

    public void setUtenteRichiedente(long utente) {
        this.utenteRichiedente = utente;
    }

    @ManyToOne
    @JoinColumn(name = "mezzo_utilizzato")
    public Mezzo getMezzoUtilizzato() {
        return this.mezzoUtilizzato;
    }

    public void setMezzoUtilizzato(Mezzo mezzoUtilizzato) {
        this.mezzoUtilizzato = mezzoUtilizzato;
    }

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id_prenotazione")
    public Long getIdPrenotazione() {
        return idPrenotazione;
    }

    public void setIdPrenotazione(Long idPrenotazione) {
        this.idPrenotazione = idPrenotazione;
    }

    @Basic
    @Column(name = "inizio_prenotazione")
    public LocalDate getInizioPrenotazione() {
        return inizioPrenotazione;
    }

    public void setInizioPrenotazione(LocalDate inizioPrenotazione) {
        this.inizioPrenotazione = inizioPrenotazione;
    }

    @Basic
    @Column(name = "fine_prenotazione")
    public LocalDate getFinePrenotazione() {
        return finePrenotazione;
    }

    public void setFinePrenotazione(LocalDate finePrenotazione) {
        this.finePrenotazione = finePrenotazione;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Prenotazione that = (Prenotazione) o;

        if (idPrenotazione != that.idPrenotazione) return false;
        if (inizioPrenotazione != null ? !inizioPrenotazione.equals(that.inizioPrenotazione) : that.inizioPrenotazione != null)
            return false;
        return finePrenotazione != null ? finePrenotazione.equals(that.finePrenotazione) : that.finePrenotazione == null;
    }

    @Override
    public int hashCode() {
        int result = idPrenotazione.intValue();
        result = 31 * result + (inizioPrenotazione != null ? inizioPrenotazione.hashCode() : 0);
        result = 31 * result + (finePrenotazione != null ? finePrenotazione.hashCode() : 0);
        return result;
    }

    public String periodo() {

        String periodo;
        periodo = "Dal " + this.inizioPrenotazione.toString() + " al " + this.finePrenotazione.toString();

        return periodo;

    }
}