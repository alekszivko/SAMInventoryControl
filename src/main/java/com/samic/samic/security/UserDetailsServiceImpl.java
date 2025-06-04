package com.samic.samic.security;

import com.samic.samic.data.entity.Role;
import com.samic.samic.data.entity.User;
import com.samic.samic.data.repositories.RepositoryUser;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@AllArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {

  @Autowired
  private final RepositoryUser repositoryUser;

  @Autowired
  private final PasswordEncoder passwordEncoder;
  @Autowired
  private final AuthenticatedUser authenticatedUser;

  private static List<GrantedAuthority> getAuthorities(User user) {
    Role userRole = user.getRole();
    return Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + userRole));
  }


  @Override
  @Transactional
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    User user1 = repositoryUser.findByProfile_Username(username);

    if (user1 == null) {
      throw new UsernameNotFoundException("No user present with username: " + username);
    } else if (!user1.getActivated()) {
      throw new UsernameNotFoundException("User is not activated");
    } else {
      user1.setLastLogin(LocalDateTime.now());
      return new org.springframework.security.core.userdetails.User(
          user1.getProfile().getUsername(), user1.getHashedPassword(),
          getAuthorities(user1));
    }
  }

  public void register(User user) {
    var hashedPassword = passwordEncoder.encode(user.getHashedPassword());
    System.out.println(hashedPassword);
    user.setHashedPassword(hashedPassword);
    System.out.println(user.getHashedPassword());
    repositoryUser.save(user);
  }

  public Boolean oldPasswordMatches(String oldPassword) {
    return passwordEncoder.matches(oldPassword,
        repositoryUser.findById(authenticatedUser.getUser().get().getId()).get()
            .getHashedPassword());
  }

  public void changePassword(String value) {
    repositoryUser.findById(authenticatedUser.getUser().get().getId()).ifPresent(user -> {
      user.setHashedPassword(passwordEncoder.encode(value));
      repositoryUser.save(user);
    });
  }
}
