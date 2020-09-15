package it.si2001.rentalcar.service;

import it.si2001.rentalcar.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Set;

@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {


    @Autowired
    private UserService userService;



    @Override
    @Transactional
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {


        User customer = userService.getUserByEmail(email);
        org.springframework.security.core.userdetails.User.UserBuilder builder = null;

        if (customer == null)
        {
            throw  new UsernameNotFoundException("Utente non trovato");
        }

        Set<GrantedAuthority> grantedAuthorities = new HashSet< >();
        grantedAuthorities.add(new SimpleGrantedAuthority("USER"));
        grantedAuthorities.add(new SimpleGrantedAuthority("ADMIN"));

        builder = org.springframework.security.core.userdetails.User.withUsername(email);
        builder.password(customer.getPassword());
        builder.authorities(grantedAuthorities);

        return builder.build();

    }
}
