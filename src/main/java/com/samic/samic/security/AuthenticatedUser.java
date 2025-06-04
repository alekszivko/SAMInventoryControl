package com.samic.samic.security;

import com.samic.samic.data.entity.User;
import com.samic.samic.data.repositories.RepositoryUser;
import com.vaadin.flow.spring.security.AuthenticationContext;
import java.util.Optional;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@AllArgsConstructor
public class AuthenticatedUser {



    @Autowired
    private final AuthenticationContext authenticationContext;
    @Autowired
    private final RepositoryUser repositoryUser;



    @Transactional
    public Optional<User> getUser(){
        return authenticationContext.getAuthenticatedUser(UserDetails.class)
                       .map(userDetails -> repositoryUser.findByProfile_Username(userDetails.getUsername()));
    }

    public void logout() {
        authenticationContext.logout();
    }

}
