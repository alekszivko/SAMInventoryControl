package com.samic.samic.services;

import com.samic.samic.data.entity.Reservation;
import com.samic.samic.data.entity.StorageObject;
import com.samic.samic.data.entity.User;
import com.samic.samic.data.repositories.RepositoryReservation;
import com.samic.samic.exceptions.ReservationException;
import com.samic.samic.security.AuthenticatedUser;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

@Log4j2
@Service
@Transactional
@RequiredArgsConstructor
@ComponentScan(basePackages = {"com.samic.samic.security"})
public class ServiceReservation{

    @Autowired
    private final RepositoryReservation repositoryReservation;
    @Autowired
    private final ServiceStorageObject  serviceStorageObject;
    @Autowired
    private final AuthenticatedUser     authenticatedUser;
    @Autowired
    private final ServiceStorageObjectHistory serviceStorageObjectHistory;

    @Transactional
    public Reservation saveReservationByObject(Reservation reservation){
        if(reservation != null){
            if(reservation.getId() == null){
                if(reservation.getReservedFrom() != null){
                    if(reservation.getCustomer() != null){
                        reservation.setCustomer(reservation.getCustomer());
                    }


                    return repositoryReservation.save(reservation);

                }else{
                    throw new ReservationException("Reservation with id: '%s' does not have a user".formatted(reservation.getId()));
                }
            }else{
                throw new ReservationException("Reservation with id: '%s' already exists in DB".formatted(reservation.getId()));
            }
        }else{
            throw new ReservationException("Reservation is null!");
        }
    }

    public Reservation updateReservation(Reservation reservation){
        if(reservation != null){
            if(reservation.getId() != null && reservation.getReservedFrom().getId()
                                                         .equals(authenticatedUser.getUser()
                                                                                  .get().getId())){
                return repositoryReservation.save(reservation);
            }else{
                throw new ReservationException(reservation.getId() == null ? "Reservation ID is not set!" : "User does not match with Logged-in user!");
            }
        }else{
            throw new ReservationException("Given Reservation is null");
        }
    }

    @Transactional
    public Reservation findReservationById(Long id){
        if(id != null){
            if(repositoryReservation.findById(id)
                                    .isPresent()){
                return repositoryReservation.findById(id)
                                            .get();
            }else{
                throw new ReservationException("Could not find Reservation with id: '%s' in DB".formatted(id));
            }
        }else{
            throw new ReservationException("Given id is null!");
        }
    }

    @Transactional
    public Optional<Reservation> findReservationByIDOptional(Long id){
        if(id != null){
            if(repositoryReservation.findById(id)
                                    .isPresent()){
                return repositoryReservation.findById(id);
            }else{
                throw new ReservationException("Could not find Reservation with id: '%s' in DB".formatted(id));
            }
        }else{
            throw new ReservationException("Given id is null!");
        }
    }

    public void deleteReservationById(Long id){
        if(id != null){
            repositoryReservation.deleteById(id);
        }else{
            throw new ReservationException("Given id is null!");
        }
    }

    public void deleteByObject(Reservation reservation){
        if(reservation != null){
            if(repositoryReservation.findById(reservation.getId())
                                    .isPresent()){
                StorageObject storageObjectByReservationID = serviceStorageObject.findStorageObjectByReservationID(reservation.getId());
                reservation.setReservedFrom(null);
                StorageObject tempSto = serviceStorageObject.findStorageObjectByReservationID(reservation.getId());
                tempSto.setReservation(null);
                storageObjectByReservationID.setReservation(null);
                serviceStorageObjectHistory.setStorageOBjectHistory(tempSto);
                repositoryReservation.deleteById(reservation.getId());

            }
        }else{
            throw new ReservationException("Given Reservation is null!");
        }
    }

    public boolean doesObjectExistById(Long id){
        if(id != null){
            return repositoryReservation.existsById(id);
        }else{
            throw new ReservationException("Given id is null!");
        }
    }

    @Transactional
    public Stream<Reservation> findAll(){
        return repositoryReservation.findAll()
                                    .stream();
    }

    @Transactional
    public List<Reservation> findAllasList(){
        return repositoryReservation.findAll();
    }


    public void deleteAll(){
        repositoryReservation.deleteAll();
    }

    public List<Reservation> findAllReservationByUserId(Long id){
        if(id != null){
            return repositoryReservation.findAllByReservedFromId(id);
        }else{
            throw new ReservationException("Given id is null!");
        }
    }

    @Transactional
    public Stream<Reservation> findAllReservationByUserIdStream(Long id){
        if(id != null){
            return repositoryReservation.findAllByReservedFrom_Id(id)
                                        .stream();
        }else{
            throw new ReservationException("Given id is null!");
        }
    }

    @Transactional
    public List<Reservation> findAllReservationByGivenUser(User user){
        Stream<Reservation> reservationOnUser = repositoryReservation.findReservationsByReservedFrom(user)
                                                                     .filter(a -> a.getStorageObject() != null)
                                                                     .filter(u -> u.getReservedFrom() != null)
                /*.filter(c -> c.getCustomer() != null)*/;

        return reservationOnUser.filter(reservation -> reservation.getReservedFrom()
                                                                  .getId()
                                                                  .equals(user.getId()))
                                .toList();
    }
}
