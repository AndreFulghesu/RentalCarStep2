package it.si2001.rentalcar.model;

import javax.persistence.AttributeConverter;


@javax.persistence.Converter
public class Converter implements AttributeConverter<Tipologia.Tipologia_veicolo, String> {

    @Override
    public String convertToDatabaseColumn(Tipologia.Tipologia_veicolo attribute) {
        if (attribute == null)
            return null;

        switch (attribute) {
            case BERLINA:
                return "berlina";

            case CITYCAR:
                return "citycar";

            case CABRIOLET:
                return "cabriolet";

            case MONOVOLUME:
                return "monovolume";

            case SPORTIVA:
                return "sportiva";

            case SUV:
                return "suv";

            case FURGONE:
                return "furgone";

            case STATIONWAGON:
                return "stationwagon";

            default:
                throw new IllegalArgumentException(attribute + " not supported.");
        }
    }

    @Override
    public Tipologia.Tipologia_veicolo convertToEntityAttribute(String dbData) {
        if (dbData == null)
            return null;

        dbData.toLowerCase();

        switch (dbData) {
            case "berlina":
                return Tipologia.Tipologia_veicolo.BERLINA;

            case "sportiva":
                return Tipologia.Tipologia_veicolo.SPORTIVA;

            case "monovolume":
                return Tipologia.Tipologia_veicolo.MONOVOLUME;

            case "furgone":
                return Tipologia.Tipologia_veicolo.FURGONE;

            case "cabriolet":
                return Tipologia.Tipologia_veicolo.CABRIOLET;

            case "stationwagon":
                return  Tipologia.Tipologia_veicolo.STATIONWAGON;

            case "citycar":
                return Tipologia.Tipologia_veicolo.CITYCAR;

            case "suv":
                return Tipologia.Tipologia_veicolo.SUV;

            default:
                throw new IllegalArgumentException(dbData + " not supported.");
        }
    }

}