package it.si2001.rentalcar.service;


import it.si2001.rentalcar.model.Mezzo;
import it.si2001.rentalcar.repository.MezzoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Repository
public class MezzoService {

    @Autowired
    private MezzoRepository mezzoRepository;

    public List<Mezzo> getAllVeicles() { return   (List<Mezzo>)mezzoRepository.findAll();}

    public void saveMezzo (Mezzo mezzo) { mezzoRepository.save(mezzo);}

    public void deleteMezzo (String targa) { mezzoRepository.deleteById(targa);}

    public Mezzo get (String targa) { return mezzoRepository.findById(targa).get();}

}
