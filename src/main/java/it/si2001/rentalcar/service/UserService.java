package it.si2001.rentalcar.service;

import it.si2001.rentalcar.model.User;
import it.si2001.rentalcar.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@Repository
public class UserService {

    @Autowired
    private UserRepository userRepository;


    public List<User> getUser () { return (List<User>) userRepository.findAll();}

    public User getUserById (Long idUtente) {return userRepository.getUserById(idUtente);}

    public List<User> listAll (String email) { return  userRepository.listAll(email);}

    public User getUserByEmail (String email) {return userRepository.getUserByEmail(email);}

    public void delete (Long id) { userRepository.deleteById(id);}

    public User get(Long id) {
        return userRepository.findById(id).get();
    }

    public void save (User user) { userRepository.save(user);}


}
