package it.si2001.rentalcar.repository;


import it.si2001.rentalcar.model.Mezzo;
import it.si2001.rentalcar.model.Prenotazione;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PrenotazioneRepository extends CrudRepository<Prenotazione,Long> {


    @Query("select u from Prenotazione u where u.utenteRichiedente= :custId")
    public List<Prenotazione> findByUser(@Param("custId") Long idUtente);


    @Query("select u from Prenotazione u where u.mezzoUtilizzato= :custMezzo")
    public List<Prenotazione> findByMezzo (@Param("custMezzo") Mezzo mezzo);

}
