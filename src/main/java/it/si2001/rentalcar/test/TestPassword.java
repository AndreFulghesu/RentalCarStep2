package it.si2001.rentalcar.test;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class TestPassword {



    private static PasswordEncoder passwordEncoder;



    public static PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


    public static void main (String[] args){

        passwordEncoder = passwordEncoder();
        String password = passwordEncoder.encode("1234");

        System.out.println("Password:   "+password);


    }

}
