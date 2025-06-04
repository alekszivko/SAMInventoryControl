package com.samic.samic.data.repositories;

import com.samic.samic.data.entity.Storage;
import lombok.Builder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RepositoryStorage extends JpaRepository<Storage, Long>{


     Optional<Storage> findStorageByName(String name);
}
