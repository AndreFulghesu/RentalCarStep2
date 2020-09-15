package it.si2001.rentalcar.repository;

import it.si2001.rentalcar.model.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends CrudRepository<User,Long> {


    @Query("select u from User u where u.email= :custEmail")
    public User getUserByEmail (@Param("custEmail") String email);


    @Query("select u from User u where u.email <> :custEmail")
    public List<User> listAll (@Param("custEmail")String email);


    @Query("select u from User u where u.idUtente= :custId")
    public User getUserById (@Param("custId") Long idUtente);





}
