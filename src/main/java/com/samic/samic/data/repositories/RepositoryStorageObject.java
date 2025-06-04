package com.samic.samic.data.repositories;

import com.samic.samic.data.entity.Customer;
import com.samic.samic.data.entity.ObjectType;
import com.samic.samic.data.entity.StorageObject;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

@Qualifier("storageObject")
@Repository
public interface RepositoryStorageObject extends JpaRepository<StorageObject, Long>{


    Optional<StorageObject> findStorageObjectByObjectTypeName(ObjectType objectType);

    Page<StorageObject> findAllByStoredAtUser_Id(Long id, Pageable pageable);

    Stream<StorageObject> findStorageObjectsByStoredAtUser_Id(Long id);

    StorageObject findStorageObjectByReservation_Id(Long id);

    Page<StorageObject> findStorageObjectsBySfp_Id(Long id, PageRequest request);

    Stream<StorageObject> findStorageObjectsBySfp_Id(Long id);



    Page<StorageObject> findStorageObjectsByStorage_Id(Long id, PageRequest request);

    Stream<StorageObject> findStorageObjectsByStorage_Id(Long id);

    Page<StorageObject> findStorageObjectsBySupply_Id(Long id, PageRequest request);

    Stream<StorageObject> findStorageObjectsBySupply_Id(Long id);

    Page<StorageObject> findStorageObjectByCpe_Id(Long id, PageRequest request);

    Stream<StorageObject> findStorageObjectByCpe_Id(Long id);


    List<StorageObject> findAllByObjectTypeName_Name(String filterString, Pageable pageable);

    List<StorageObject> findAllByRemarkIsLikeIgnoreCase(String filterString, Pageable pageable);

    StorageObject findStorageObjectsByReservationId(Long id);


    @Query(value = "select s from StorageObject s join fetch s.objectTypeName where lower(s.objectTypeName.name) LIKE lower(:name)" +
                           " AND s.reservation = null AND s.storage != null AND lower(s.storage.name) != lower('Kunde' ) AND s.storage.id = :id")
    List<StorageObject> filterStorageObjectsByObjectTypeNameName(
            @Param("name")
            String filterString, Pageable pageable, @Param("id") Optional<Long> storageID);

}
