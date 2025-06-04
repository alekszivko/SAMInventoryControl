package com.samic.samic.data.repositories;

import com.samic.samic.data.entity.Role;
import com.samic.samic.data.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.ListCrudRepository;
import org.springframework.data.repository.ListPagingAndSortingRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.stream.Stream;

@Repository
public interface RepositoryUser extends JpaRepository<User, Long>, JpaSpecificationExecutor<User>, ListCrudRepository<User, Long>, ListPagingAndSortingRepository<User, Long>, QueryByExampleExecutor<User>{


    User findByProfile_Username(String username);
    User save(User user);

    Stream<User> findByRole(Role role);
}