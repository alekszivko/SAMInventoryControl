package com.samic.samic.services;

import com.samic.samic.data.entity.ObjectType;
import com.samic.samic.data.entity.Reservation;
import com.samic.samic.data.entity.StorageObject;
import com.samic.samic.data.entity.User;
import com.samic.samic.data.repositories.RepositoryObjectType;
import com.samic.samic.data.repositories.RepositoryReservation;
import com.samic.samic.data.repositories.RepositoryStorageObject;
import com.samic.samic.data.repositories.RepositoryStorageObjectHistory;
import com.samic.samic.exceptions.ObjectTypeException;
import com.samic.samic.exceptions.ReservationException;
import com.samic.samic.exceptions.StorageObjectException;
import com.samic.samic.security.AuthenticatedUser;
import com.vaadin.flow.data.provider.Query;
import com.vaadin.flow.spring.data.VaadinSpringDataHelpers;
import jakarta.persistence.EntityManagerFactory;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Stream;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Log4j2
@Transactional
@RequiredArgsConstructor
@ComponentScan(basePackages = "com.samic.samic.data.services")
@ComponentScan(basePackages = {"com.samic.samic.security"})

public class ServiceStorageObject {

  @Autowired
  private final RepositoryStorageObject repositoryStorageObject;
  @Autowired
  private final RepositoryReservation repositoryReservation;
  @Autowired
  private final EntityManagerFactory emf;
  @Autowired
  private final RepositoryObjectType repositoryObjectType;
  @Autowired
  private final RepositoryStorageObjectHistory repositoryStorageObjectHistory;
  @Autowired
  private final ServiceStorageObjectHistory serviceStorageObjectHistory;
  @Autowired
  private final AuthenticatedUser authenticatedUser;

  @Transactional
  public StorageObject saveStorageObject(StorageObject storageObject) {


    if (storageObject.getStoredAtUser() != null) {
      if (storageObject.getReservation() != null) {
        if (storageObject.getReservation()
            .getReservedFrom() != null) {
          throw new ReservationException(("Storageobject is reserved by '%s'.".formatted(
              storageObject.getStoredAtUser().getProfile().getUsername())));
        }
      }
    }

    if (storageObject != null) {
      log.warn(
          "saveStorageObject() | ######################## USER1 ########################, {}: ",
          storageObject.getStoredAtUser());

      log.debug("saveStorageObject() | StorageObject is not null, {}: ------ , {}",
          storageObject,
          storageObject.getStoredAtUser());
      if (storageObject.getId() != null) {
        log.warn(
            "saveStorageObject() | ######################## USER2 ########################, {}: ",
            storageObject.getStoredAtUser());
        log.debug(
            "saveStorageObject() | StorageObject id is not null, StorageObject ID: {}, \nstorageObject: {}",
            storageObject.getId(),
            storageObject);
        if (doesObjectExistById(storageObject.getId())) {
          log.warn(
              "saveStorageObject() | ######################## USER3 ########################, {}: ",
              storageObject.getStoredAtUser());
          log.debug(
              "saveStorageObject() | StorageObject exists, StorageObject ID: {},\nstorageObject: {}",
              storageObject.getId(),
              storageObject);
          StorageObject fetchedStorageObject = findStorageObjectById(storageObject.getId());
          log.warn(
              "saveStorageObject() | ######################## USER4 ########################, {}: ",
              storageObject.getStoredAtUser());
          log.debug(
              "saveStorageObject() | StorageObject found with ID: {},\nFetched StorageObject{},",
              storageObject.getId(),
              fetchedStorageObject);
          if (fetchedStorageObject != null) {
            log.warn(
                "saveStorageObject() | ######################## USER5 ########################i, {}: ",
                storageObject.getStoredAtUser());
            log.debug(
                "saveStorageObject() | in if statement, fetchedStorageObject: {},\nStorageObject: {}",
                fetchedStorageObject.getId(),
                fetchedStorageObject);
            if (fetchedStorageObject.getId()
                .equals(storageObject.getId())) {
              log.warn(
                  "saveStorageObject() | ######################## USER6 ########################, {}: ",
                  storageObject.getStoredAtUser());
              log.debug(
                  "saveStorageObject() | fetched StorageObject equals given StorageObject, fetchedStorageObject: {},\nStorageObject: {}",
                  fetchedStorageObject.getId(),
                  storageObject);
              fetchedStorageObject = storageObject;
              log.debug(
                  "saveStorageObejct() | given StorageObject is set to fetched StorageObject, fetchedStorageObject: {},\n storageObject: {}",
                  fetchedStorageObject,
                  storageObject);
              serviceStorageObjectHistory.setStorageOBjectHistory(fetchedStorageObject);
              return repositoryStorageObject.save(fetchedStorageObject);
            } else {
              log.debug(
                  "saveStorageObject() | fetched StorageObject does not match with given StorageObject, fetchedStorageObject: {},\nStorageObject: {}",
                  fetchedStorageObject,
                  storageObject);
              throw new StorageObjectException(
                  "StorageObject with id1: '%s' and id2: '%s' does not match. Some error occoured while fetch!!".formatted(
                      fetchedStorageObject.getId(),
                      storageObject.getId()));
            }
          } else {
            log.debug(
                "saveStorageObject() | fetched StorageObject is null, fetchedStorageObject: {}",
                fetchedStorageObject);
            throw new StorageObjectException(
                "StorageObject with id: '%s' does not exist in DB".formatted(
                    storageObject.getId()));
          }
        } else {
          log.debug(
              "saveStorageObject() | StorageObject does not exist in DB, ID: {},\nStorageObject: {}",
              storageObject.getId());
          serviceStorageObjectHistory.setStorageOBjectHistory(storageObject);
          return repositoryStorageObject.save(storageObject);

        }
      } else {
        log.debug("saveStorageObject() | StorageObject id is null, Saving StorageObject: {}",
            storageObject);
        serviceStorageObjectHistory.setStorageOBjectHistory(storageObject);
        StorageObject saved = repositoryStorageObject.save(storageObject);
        return saved;
      }
    } else {
      log.debug("saveStorageObject() | StorageObject is null");
      throw new StorageObjectException("StorageObject is null!");
    }
  }

  @Transactional
  public StorageObject findStorageObjectById(Long id) {
    if (id != null) {
      log.debug("findStorageObjectById() | id is not null, id: {}",
          id);
      if (repositoryStorageObject.findById(id)
          .isPresent()) {
        return repositoryStorageObject.findById(id)
            .get();
      } else {
        throw new StorageObjectException(
            "Could not find StorageObject with id: '%s' in DB".formatted(id));
      }
    } else {
      throw new StorageObjectException("Given id is null!");
    }
  }


  @Transactional
  public Optional<StorageObject> findStorageObjectByIDOptional(Long id) {
    if (id != null) {
      if (repositoryStorageObject.findById(id)
          .isPresent()) {
        return repositoryStorageObject.findById(id);
      } else {
        throw new StorageObjectException(
            "Could not find StorageObject with id: '%s' in DB".formatted(id));
      }
    } else {
      throw new StorageObjectException("Given id is null!");
    }
  }

  public void deleteStorageObjectById(Long id) {
    if (id != null) {
      if (!repositoryStorageObject.findAll()
          .isEmpty()) {
        repositoryStorageObject.deleteById(id);
      } else {
        throw new StorageObjectException("StorageObject DB is empty!");
      }
    } else {
      throw new StorageObjectException("StorageObject id is null!");
    }
  }

  public void deleteByObject(StorageObject storageObject) {
    if (storageObject != null) {
      if (!repositoryStorageObject.findAll()
          .isEmpty()) {
        repositoryStorageObject.delete(storageObject);
      } else {
        throw new StorageObjectException("StorageObject DB is empty!");
      }
    } else {
      throw new StorageObjectException("StorageObject is null!");
    }
  }

  public boolean doesObjectExistById(Long id) {
    if (id != null) {
      return repositoryStorageObject.existsById(id);
    } else {
      throw new StorageObjectException("StorageObject id is null!");
    }
  }

  @Transactional
  public Optional<StorageObject> findStorageByNameOptional(ObjectType objectType) {
    if (objectType != null) {
      if (repositoryStorageObject.findStorageObjectByObjectTypeName(objectType)
          .isPresent()) {
        return repositoryStorageObject.findStorageObjectByObjectTypeName(objectType);
      } else {
        throw new StorageObjectException(
            "Could not find StorageObject with objectType: '%s' in DB".formatted(
                objectType.getName()));
      }
    } else {
      throw new StorageObjectException("Given name is null!");
    }
  }

  @Transactional
  public Stream<StorageObject> findAll() {
    if (repositoryStorageObject.findAll()
        .isEmpty()) {
      throw new StorageObjectException("StorageObject list is empty!");
    } else {
      return repositoryStorageObject.findAll()
          .stream();
    }
  }

  @Transactional
  public List<StorageObject> findNotReservedStorageObjects() {
    List<StorageObject> freeStorageObjects = new ArrayList<>();
    if (!repositoryStorageObject.findAll()
        .isEmpty()) {
      List<StorageObject> storageObjectList = repositoryStorageObject.findAll();
      Iterator<StorageObject> iter = storageObjectList.iterator();
      while (iter.hasNext()) {
        StorageObject TempstorageObject = iter.next();
        if (TempstorageObject.getReservation() == null) {
          freeStorageObjects.add(TempstorageObject);
        }
      }
    } else {
      throw new StorageObjectException("StorageObject list is empty!");
    }
    if (freeStorageObjects.isEmpty()) {
      throw new StorageObjectException("There are no Free StorageObjects in DB!");
    }
    return freeStorageObjects;
  }

  @Transactional
  public List<StorageObject> findReservedStorageObjects() {
    List<StorageObject> reservedStorageObjects = repositoryStorageObject.findAll();
    if (!reservedStorageObjects.isEmpty()) {
      Iterator<StorageObject> iter = reservedStorageObjects.iterator();
      while (iter.hasNext()) {
        StorageObject TempstorageObject = iter.next();
        if (TempstorageObject.getReservation() != null) {
          reservedStorageObjects.add(TempstorageObject);
        }
      }
    } else {
      throw new StorageObjectException("StorageObject list is empty!");
    }
    if (reservedStorageObjects.isEmpty()) {
      throw new StorageObjectException("There are no Free StorageObjects in DB!");
    }
    return reservedStorageObjects;
  }


  @Transactional
  public void deleteAll() {
    if (repositoryStorageObject.count() > 0) {
      repositoryStorageObject.deleteAll();
    } else {
      throw new StorageObjectException("StorageObject DB is empty!");
    }
  }


  public Stream<StorageObject> findAllStorageObjectByUserId(Long id,
      PageRequest request) {
    if (id != null) {
      return repositoryStorageObject.findAllByStoredAtUser_Id(id,
              request)
          .stream();
    } else {
      throw new StorageObjectException("Given id is null!");
    }
  }

  public Stream<StorageObject> findAllStorageObjectByUserIdStream(Long id) {
    if (id != null) {
      return repositoryStorageObject.findStorageObjectsByStoredAtUser_Id(id);
    } else {
      throw new StorageObjectException("Given id is null!");
    }
  }


  public StorageObject findStorageObjectByReservationID(Long id) {
    if (id != null) {
      return repositoryStorageObject.findStorageObjectByReservation_Id(id);
    } else {
      throw new StorageObjectException("Given id is null!");
    }
  }

  public Stream<StorageObject> findAllStoageObjectBySFPID(Long id,
      PageRequest request) {
    if (id != null) {
      return repositoryStorageObject.findStorageObjectsBySfp_Id(id,
              request)
          .stream();
    } else {
      throw new StorageObjectException("Given id is null!");
    }
  }

  public Stream<StorageObject> findAllStoageObjectBySFPIDStream(Long id) {
    if (id != null) {
      return repositoryStorageObject.findStorageObjectsBySfp_Id(id);
    } else {
      throw new StorageObjectException("Given id is null!");
    }
  }

  public Stream<StorageObject> findAllStorageObjectByCPEID(Long id,
      PageRequest request) {
    if (id != null) {
      return repositoryStorageObject.findStorageObjectByCpe_Id(id,
              request)
          .stream();
    } else {
      throw new StorageObjectException("Given id is null!");
    }
  }

  public Stream<StorageObject> findAllStorageObjectByCPEIDStream(Long id) {
    if (id != null) {
      return repositoryStorageObject.findStorageObjectByCpe_Id(id);
    } else {
      throw new StorageObjectException("Given id is null!");
    }
  }

  public Stream<StorageObject> findStorageObjectsByStorageId(Long id,
      PageRequest request) {
    if (id != null) {
      return repositoryStorageObject.findStorageObjectsByStorage_Id(id,
              request)
          .stream();
    } else {
      throw new StorageObjectException("Given id is null!");
    }
  }

  public Stream<StorageObject> findStorageObjectsByStorageIdStream(Long id) {
    if (id != null) {
      return repositoryStorageObject.findStorageObjectsByStorage_Id(id);
    } else {
      throw new StorageObjectException("Given id is null!");
    }
  }

  public Stream<StorageObject> findStorageObjectsBySupplyId(Long id,
      PageRequest request) {
    if (id != null) {
      return repositoryStorageObject.findStorageObjectsBySupply_Id(id,
              request)
          .stream();
    } else {
      throw new StorageObjectException("Given id is null!");
    }
  }

  public Stream<StorageObject> findStorageObjectsBySupplyIdStream(Long id) {
    if (id != null) {
      return repositoryStorageObject.findStorageObjectsBySupply_Id(id);
    } else {
      throw new StorageObjectException("Given id is null!");
    }
  }

  public Stream<StorageObject> findFreeStorageObjects() {
    Stream<StorageObject> freeStorageObjects = repositoryStorageObject.findAll()
        .stream();
    return freeStorageObjects.filter(storageObject -> storageObject.getReservation() == null)
        .filter(storageObject -> storageObject.getStoredAtUser() == null);
  }

  public Stream<StorageObject> findReservedStorageObjectsAsStream() {
    Stream<StorageObject> reservedStorageObjects = repositoryStorageObject.findAll()
        .stream();
    return reservedStorageObjects.filter(storageObject -> storageObject.getReservation() != null)
        .filter(storageObject -> storageObject.getStoredAtUser() == null);
  }

  public Stream<StorageObject> findStorageObjectByGivenUser(User user) {
    Stream<StorageObject> storageObjectOnUser = repositoryStorageObject.findAll()
        .stream();
    return storageObjectOnUser.filter(stor -> stor.getStoredAtUser() != null)
        .filter(storageObject -> storageObject.getStoredAtUser()
            .getId()
            .equals(user.getId()));
  }



  public Stream<StorageObject> searchSto(String filterString,
      Pageable pageable,
      Long id) {
    return repositoryStorageObject.filterStorageObjectsByObjectTypeNameName(filterString,
            pageable,
            Optional.of(id))
        .stream();
  }

  public Stream<StorageObject> searchTempo(String filter,
      Pageable pageable) {
    return repositoryStorageObject.findAll()
        .stream()
        .filter(f -> f.getObjectTypeName()
            .equals(filter));
  }

  public <T, F> Pageable toPageable(Query<T, F> query) {
    return PageRequest.of(query.getPage(),
        query.getPageSize(),
        VaadinSpringDataHelpers.toSpringDataSort(query));
  }

  public Map<String, Long> findAmountOfObjectType1() {

    Map<String, Long> mapList = new HashMap<>();

    List<StorageObject> all = repositoryStorageObject.findAll();

    if (all.isEmpty()) {
      throw new ObjectTypeException("Map is empty!");
    }

    long c927 = all.stream()
        .filter(a -> a.getObjectTypeName() != null)
        .filter(b -> b.getObjectTypeName()
            .getName()
            .equals("C927"))
        .count();

    long C1111 = all.stream()
        .filter(a -> a.getObjectTypeName() != null)
        .filter(b -> b.getObjectTypeName()
            .getName()
            .equals("C1111-4p"))
        .count();

    long asr920 = all.stream()
        .filter(a -> a.getObjectTypeName() != null)
        .filter(b -> b.getObjectTypeName()
            .getName()
            .equals("ASR920-12SZ-IM"))
        .count();

    long C897VAB = all.stream()
        .filter(a -> a.getObjectTypeName() != null)
        .filter(b -> b.getObjectTypeName()
            .getName()
            .equals("C897VAB"))
        .count();

    long C1117 = all.stream()
        .filter(a -> a.getObjectTypeName() != null)
        .filter(b -> b.getObjectTypeName()
            .getName()
            .equals("C1117-4p"))
        .count();
    long HP = all.stream()
        .filter(a -> a.getObjectTypeName() != null)
        .filter(b -> b.getObjectTypeName()
            .getName()
            .equals("HP J9050A"))
        .count();

    long Aruba = all.stream()
        .filter(a -> a.getObjectTypeName() != null)
        .filter(b -> b.getObjectTypeName()
            .getName()
            .equals("Aruba 2530 8-PoE+"))
        .count();
    long M300 = all.stream()
        .filter(a -> a.getObjectTypeName() != null)
        .filter(b -> b.getObjectTypeName()
            .getName()
            .equals("M300"))
        .count();
    long D865 = all.stream()
        .filter(a -> a.getObjectTypeName() != null)
        .filter(b -> b.getObjectTypeName()
            .getName()
            .equals("D865"))
        .count();
    long D862 = all.stream()
        .filter(a -> a.getObjectTypeName() != null)
        .filter(b -> b.getObjectTypeName()
            .getName()
            .equals("D862"))
        .count();
    long GLC = all.stream()
        .filter(a -> a.getObjectTypeName() != null)
        .filter(b -> b.getObjectTypeName()
            .getName()
            .equals("GLC-LH-SM"))
        .count();
    long LC = all.stream()
        .filter(a -> a.getObjectTypeName() != null)
        .filter(b -> b.getObjectTypeName()
            .getName()
            .equals("LC-SX-MM"))
        .count();

    mapList.put("C927",
        c927);
    mapList.put("C1111",
        C1111);
    mapList.put("asr920",
        asr920);
    mapList.put("C897VAB",
        C897VAB);
    mapList.put("C1117",
        C1117);
    mapList.put("HP J9050A",
        HP);
    mapList.put("Aruba 2530 8-PoE+",
        Aruba);
    mapList.put("M300",
        M300);
    mapList.put("D865",
        D865);
    mapList.put("D862",
        D862);
    mapList.put("GLC-LH-SM",
        GLC);
    mapList.put("LC-SX-MM",
        LC);

    return mapList;

  }

  public Map<String, Long> findAmountOfObjectType2() {
    Map<String, Long> maxValues = new HashMap<>();

    List<StorageObject> all = repositoryStorageObject.findAll();

    if (all.isEmpty()) {
      throw new ObjectTypeException("Map is empty!");
    }

    maxValues.put("C927",
        all.stream()
            .filter(a -> a.getObjectTypeName() != null)
            .filter(b -> b.getObjectTypeName()
                .getName()
                .equals("C927"))
            .count());
    maxValues.put("C1111-4p",
        all.stream()
            .filter(a -> a.getObjectTypeName() != null)
            .filter(b -> b.getObjectTypeName()
                .getName()
                .equals("C1111-4p"))
            .count());
    maxValues.put("ASR920-12SZ-IM",
        all.stream()
            .filter(a -> a.getObjectTypeName() != null)
            .filter(b -> b.getObjectTypeName()
                .getName()
                .equals("ASR920-12SZ-IM"))
            .count());
    maxValues.put("C897VAB",
        all.stream()
            .filter(a -> a.getObjectTypeName() != null)
            .filter(b -> b.getObjectTypeName()
                .getName()
                .equals("C897VAB"))
            .count());
    maxValues.put("C1117-4p",
        all.stream()
            .filter(a -> a.getObjectTypeName() != null)
            .filter(b -> b.getObjectTypeName()
                .getName()
                .equals("C1117-4p"))
            .count());
    maxValues.put("HP J9050A",
        all.stream()
            .filter(a -> a.getObjectTypeName() != null)
            .filter(b -> b.getObjectTypeName()
                .getName()
                .equals("HP J9050A"))
            .count());
    maxValues.put("Aruba 2530 8-PoE+",
        all.stream()
            .filter(a -> a.getObjectTypeName() != null)
            .filter(b -> b.getObjectTypeName()
                .getName()
                .equals("Aruba 2530 8-PoE+"))
            .count());
    maxValues.put("M300",
        all.stream()
            .filter(a -> a.getObjectTypeName() != null)
            .filter(b -> b.getObjectTypeName()
                .getName()
                .equals("M300"))
            .count());
    maxValues.put("D865",
        all.stream()
            .filter(a -> a.getObjectTypeName() != null)
            .filter(b -> b.getObjectTypeName()
                .getName()
                .equals("D865"))
            .count());
    maxValues.put("D862",
        all.stream()
            .filter(a -> a.getObjectTypeName() != null)
            .filter(b -> b.getObjectTypeName()
                .getName()
                .equals("D862"))
            .count());
    maxValues.put("GLC-LH-SM",
        all.stream()
            .filter(a -> a.getObjectTypeName() != null)
            .filter(b -> b.getObjectTypeName()
                .getName()
                .equals("GLC-LH-SM"))
            .count());
    maxValues.put("LC-SX-MM",
        all.stream()
            .filter(a -> a.getObjectTypeName() != null)
            .filter(b -> b.getObjectTypeName()
                .getName()
                .equals("LC-SX-MM"))
            .count());
    return maxValues;
  }

  public Long findAmountOfObjectType2(String objectType) {
    return repositoryStorageObject.findAll()
        .stream()
        .filter(a -> a.getObjectTypeName() != null)
        .filter(b -> b.getObjectTypeName()
            .getName()
            .equals(objectType))
        .count();
  }


  public Stream<Reservation> findStorageObjectByUserId(Long id,
      PageRequest request) {
    return repositoryReservation.findAllByReservedFrom_Id(id,
            request)
        .stream();
  }

  public void moveFromReservationToMeineHardware(Reservation reservation) {
    if (reservation != null) {
      if (reservation.getReservedFrom().getId() == authenticatedUser.getUser()
          .get().getId()) {
        if (reservation.getId() != null && repositoryReservation.existsById(reservation.getId())) {
          Reservation reservationById = repositoryReservation.findById(reservation.getId())
              .get();

          StorageObject storageObjectByReservationId = repositoryStorageObject.findStorageObjectByReservation_Id(
              reservationById.getId());
          storageObjectByReservationId.setRemark(reservationById.getReservedDescription());
          storageObjectByReservationId.setStoredAtUser(authenticatedUser.getUser().get());

          reservationById.setReservedFrom(null);
          storageObjectByReservationId.setReservation(null);
          repositoryReservation.deleteById(Objects.requireNonNull(reservationById.getId()));

          serviceStorageObjectHistory.setStorageOBjectHistory(storageObjectByReservationId);
          saveStorageObject(storageObjectByReservationId);

        } else {
          throw new StorageObjectException(reservation.getId() == null ? "Reservation ID is null!"
              : "Reservation doesn't exist in DB!");
        }
      } else {
        throw new StorageObjectException("User does not match with the logged-in User!");
      }
    } else {
      throw new StorageObjectException("Given Reservation is null!");
    }
  }
}
