package it.si2001.rentalcar.model;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@Entity
@Table(name = "mezzo", schema = "rentalcar")
public class Mezzo {
    private String targa;
    private String casaCostruttrice;
    private String modello;
    private LocalDate annoImmatricolazione;
    private Tipologia.Tipologia_veicolo tipologiaVeicolo;
    private String url_image;
    private int is_booked;



    public Mezzo () {}

    public Mezzo (String targa, String casaCostruttrice, String modello, LocalDate annoImmatricolazione, Tipologia.Tipologia_veicolo tipologia_veicolo)
    {
        setTarga(targa);
        setCasaCostruttrice(casaCostruttrice);
        setModello(modello);
        setAnnoImmatricolazione(annoImmatricolazione);
        setTipologiaVeicolo(tipologia_veicolo);
        setIs_booked(0);
    }


    // 0 se è libera, 1 se è prenotata, 2 se è guasta

    @Basic
    @Column(name = "is_booked")
    public int getIs_booked () { return this.is_booked; }

    public void setIs_booked (int is_booked){
        this.is_booked = is_booked;
    }

    @Id
    @Column(name = "targa")
    public String getTarga() {
        return targa;
    }

    public void setTarga(String targa) {
        this.targa = targa;
    }

    @Basic
    @Column(name = "casa_costruttrice")
    public String getCasaCostruttrice() {
        return casaCostruttrice;
    }

    public void setCasaCostruttrice(String casaCostruttrice) {
        this.casaCostruttrice = casaCostruttrice;
    }

    @Basic
    @Column(name = "modello")
    public String getModello() {
        return modello;
    }

    public void setModello(String modello) {
        this.modello = modello;
    }

    @Basic
    @Column(name = "anno_immatricolazione")
    public LocalDate getAnnoImmatricolazione() {
        return annoImmatricolazione;
    }

    public void setAnnoImmatricolazione(LocalDate annoImmatricolazione) {
        this.annoImmatricolazione = annoImmatricolazione;
    }

    @Basic
    @Convert(converter = Converter.class)
    @Column(name = "tipologia_veicolo")
    public Tipologia.Tipologia_veicolo getTipologiaVeicolo() {
        return this.tipologiaVeicolo;
    }

    public void setTipologiaVeicolo(Tipologia.Tipologia_veicolo tipologiaVeicolo) {
        this.tipologiaVeicolo = tipologiaVeicolo;
    }


    @Basic
    @Column(name = "url_image")
    public String getUrl_image (){ return this.url_image;}

    public void setUrl_image (String url_image) {
        this.url_image = url_image;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Mezzo that = (Mezzo) o;

        if (targa != null ? !targa.equals(that.targa) : that.targa != null) return false;
        if (casaCostruttrice != null ? !casaCostruttrice.equals(that.casaCostruttrice) : that.casaCostruttrice != null)
            return false;
        if (modello != null ? !modello.equals(that.modello) : that.modello != null) return false;
        if (annoImmatricolazione != null ? !annoImmatricolazione.equals(that.annoImmatricolazione) : that.annoImmatricolazione != null)
            return false;
        if (tipologiaVeicolo != null ? !tipologiaVeicolo.equals(that.tipologiaVeicolo) : that.tipologiaVeicolo != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = targa != null ? targa.hashCode() : 0;
        result = 31 * result + (casaCostruttrice != null ? casaCostruttrice.hashCode() : 0);
        result = 31 * result + (modello != null ? modello.hashCode() : 0);
        result = 31 * result + (annoImmatricolazione != null ? annoImmatricolazione.hashCode() : 0);
        result = 31 * result + (tipologiaVeicolo != null ? tipologiaVeicolo.hashCode() : 0);
        return result;
    }

    public String dataFormattata (LocalDate data_utente) {
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String nuovaData = "";
        nuovaData = data_utente.format(myFormatObj);
        return nuovaData;
    }
}