package it.si2001.rentalcar.service;


import it.si2001.rentalcar.model.Mezzo;
import it.si2001.rentalcar.model.Prenotazione;
import it.si2001.rentalcar.repository.PrenotazioneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Repository
public class PrenotazioneService {


    @Autowired
    private PrenotazioneRepository prenotazioneRepository;

    public void savePrenotazione (Prenotazione prenotazione) { prenotazioneRepository.save(prenotazione);}

    public void deletePrenotazione (Prenotazione prenotazione) { prenotazioneRepository.delete(prenotazione);}

    public Prenotazione checkPrenotazione (Long idPrenotazione) { return  prenotazioneRepository.findById(idPrenotazione).get();}

    public List<Prenotazione> checkPrenotazioneByUser (Long idUtente) { return prenotazioneRepository.findByUser(idUtente);}

    public List<Prenotazione> checkPrenotazioneByMezzo (Mezzo mezzo) {return prenotazioneRepository.findByMezzo(mezzo);}

}
