package com.samic.samic.services;

import com.samic.samic.BaseIntegrationTest;
import com.samic.samic.data.entity.Reservation;
import com.samic.samic.data.entity.StorageObject;
import com.samic.samic.data.entity.User;
import com.samic.samic.data.fixture.Fixtures;
import com.samic.samic.data.foundation.Guard;
import com.samic.samic.exceptions.SamicException;
import lombok.extern.log4j.Log4j2;
import org.junit.Before;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;

@Log4j2
class TestServiceReservation extends BaseIntegrationTest{

    private User savedTestUser;

    @BeforeEach
    void setUp(){
        serviceReservation.deleteAll();
        serviceStorageObject.deleteAll();
        serviceUser.deleteAll();
        savedTestUser = serviceUser.saveUser(Fixtures.giveUser1());
    }

    @Autowired
    private ServiceReservation   serviceReservation;
    @Autowired
    private ServiceUser          serviceUser;
    @Autowired
    private ServiceStorageObject serviceStorageObject;

    private Reservation withUser(Reservation reservation) {
        reservation.setReservedFrom(savedTestUser);
        return reservation;
    }

    @Test
    void throw_exception_when_given_null_instead_reservation(){
        Reservation reservation = null;
        //when
        var exc = assertThrows(SamicException.class, () -> Guard.ensureNotNull(serviceReservation.saveReservationByObject(null)));

        //then
        assertThat(exc).hasMessageContaining("Reservation is null!");
    }

    @Test
    void throw_exception_when_reservation_already_exists(){

        //given
        Reservation reservation1 = withUser(Fixtures.giveReservation1());
        Reservation reservation2 = reservation1;
        //when
        serviceReservation.saveReservationByObject(reservation1);
        var exc = assertThrows(SamicException.class, () -> Guard.ensureNotNull(serviceReservation.saveReservationByObject(reservation2)));

        //then
        assertThat(exc).hasMessageContaining("Reservation with id: '%s' already exists in DB".formatted(reservation2.getId()));
    }

    @Test
    void save_reservation_is_valid_then_save(){
        //given
        Reservation reservation = withUser(Fixtures.giveReservation1());

        //when
        var saved = serviceReservation.saveReservationByObject(reservation);

        //then
        assertThat(saved).isSameAs(reservation);

    }


    @Test
    void thorw_exeption_when_id_null(){
        //given
        Reservation reservation1 = withUser(Fixtures.giveReservation1());
        Reservation reservation2 = withUser(Fixtures.giveReservation2());
        Reservation reservation3 = withUser(Fixtures.giveReservation3());

        //when
        serviceReservation.saveReservationByObject(reservation1);
        serviceReservation.saveReservationByObject(reservation2);
        var exc = assertThrows(SamicException.class, () -> serviceReservation.findReservationById(reservation3.getId()));

        //then
        assertThat(exc).hasMessageContaining("Given id is null!");

    }

    //    @Test // setID in AbstractIdentiryClass manipulated to public for this thest
    //    void thorw_exeption_when_id_is_not_present(){
    //        //given
    //        Reservation reservation1 = Fixtures.giveReservation1();
    //        Reservation reservation2 = Fixtures.giveReservation2();
    //        Reservation reservation3 = Fixtures.giveReservation3();
    //
    //        //when
    //        serviceReservation.saveReservationByObject(reservation1);
    //        serviceReservation.saveReservationByObject(reservation2);
    //        reservation3.setId(444L);
    //        var exc = assertThrows(SamicException.class, () -> serviceReservation.findReservationById(reservation3.getId()));
    //
    //        //then
    //        assertThat(exc).hasMessageContaining("Could not find Reservation with id: '%s' in DB".formatted(reservation3.getId()));
    //
    //    }

    @Test
    void find_reservation_by_id(){

        //given
        Reservation reservation1 = withUser(Fixtures.giveReservation1());
        Reservation reservation2 = withUser(Fixtures.giveReservation2());
        Reservation reservation3 = withUser(Fixtures.giveReservation3());

        //when
        var saved1 = serviceReservation.saveReservationByObject(reservation1);
        var saved2 = serviceReservation.saveReservationByObject(reservation2);
        var saved3 = serviceReservation.saveReservationByObject(reservation3);

        //then
        assertThat(saved1.getId()).isSameAs(reservation1.getId());
        assertThat(saved2.getId()).isSameAs(reservation2.getId());
        assertThat(saved3.getId()).isSameAs(reservation3.getId());

    }

    @Test
    void find_id_optional_throw_exception_null(){
        //given
        Reservation reservation3 = withUser(Fixtures.giveReservation3());

        //when
        var exc = assertThrows(SamicException.class, () -> serviceReservation.findReservationByIDOptional(null));

        //then
        assertThat(exc).hasMessageContaining("Given id is null!");
    }


    @Test
    void find_id_optional(){
        //given
        Reservation reservation1 = withUser(Fixtures.giveReservation3());

        //when
        var saved = serviceReservation.saveReservationByObject(reservation1);
        //then
        assertThat(saved.getId()).isSameAs(reservation1.getId());
    }

    @Test
    void delete_Reservation_By_Id(){
        //given
        Reservation reservation1 = withUser(Fixtures.giveReservation1());
        Reservation reservation2 = withUser(Fixtures.giveReservation2());
        Reservation reservation3 = withUser(Fixtures.giveReservation3());

        //when
        var saved1 = serviceReservation.saveReservationByObject(reservation1);
        var saved2 = serviceReservation.saveReservationByObject(reservation2);
        var saved3 = serviceReservation.saveReservationByObject(reservation3);

        serviceReservation.deleteReservationById(saved1.getId());
        serviceReservation.deleteReservationById(saved2.getId());
        serviceReservation.deleteReservationById(saved3.getId());

        //then
        assertThat(serviceReservation.doesObjectExistById(saved1.getId())).isFalse();
        assertThat(serviceReservation.doesObjectExistById(saved2.getId())).isFalse();
        assertThat(serviceReservation.doesObjectExistById(saved3.getId())).isFalse();
    }

    @Test
    void delete_by_object(){
        //given
        Reservation reservation1 = withUser(Fixtures.giveReservation1());
        Reservation reservation2 = withUser(Fixtures.giveReservation2());
        Reservation reservation3 = withUser(Fixtures.giveReservation3());

        //when
        var saved1 = serviceReservation.saveReservationByObject(reservation1);
        var saved2 = serviceReservation.saveReservationByObject(reservation2);
        var saved3 = serviceReservation.saveReservationByObject(reservation3);

        serviceReservation.deleteByObject(saved1);
        serviceReservation.deleteByObject(saved2);
        serviceReservation.deleteByObject(saved3);


        //then
        assertThat(serviceReservation.doesObjectExistById(saved1.getId())).isFalse();
        assertThat(serviceReservation.doesObjectExistById(saved2.getId())).isFalse();
        assertThat(serviceReservation.doesObjectExistById(saved3.getId())).isFalse();
    }

    @Test
    void delete_by_object_id_throw_null(){
        //given

        //when


        //then
        var exc = assertThrows(SamicException.class, () -> serviceReservation.deleteByObject(null));
        assertThat(exc).hasMessageContaining("Given Reservation is null!");
    }

    @Test
    void throw_exception_in_does_object_exist_by_id_when_id_is_null(){
        //given

        //when

        //then
        var exc = assertThrows(SamicException.class, () -> serviceReservation.doesObjectExistById(null));
        assertThat(exc).hasMessageContaining("Given id is null!");
    }

    @Test
    void ensure_does_object_exist(){
        //given
        Reservation reservation1 = withUser(Fixtures.giveReservation1());
        Reservation reservation2 = withUser(Fixtures.giveReservation2());
        Reservation reservation3 = withUser(Fixtures.giveReservation3());

        //when
        var saved1 = serviceReservation.saveReservationByObject(reservation1);
        var saved2 = serviceReservation.saveReservationByObject(reservation2);
        var saved3 = serviceReservation.saveReservationByObject(reservation3);

        //then
        assertThat(serviceReservation.doesObjectExistById(saved1.getId())).isTrue();
        assertThat(serviceReservation.doesObjectExistById(saved2.getId())).isTrue();
        assertThat(serviceReservation.doesObjectExistById(saved3.getId())).isTrue();
    }

//    @Test
//    void findReservationsByNameOptional(){
//        //given
//
//        User user1      = Fixtures.giveUser1();
//        var  savedUser  = serviceUser.saveUser(user1);
//        User user2      = Fixtures.giveUser2();
//        var  savedUser2 = serviceUser.saveUser(user2);
//
//        StorageObject storageObject1 = Fixtures.giveStorageObject1();
//        StorageObject storageObject2 = Fixtures.giveStorageObject2();
//        StorageObject storageObject3 = Fixtures.giveStorageObject3();
//        StorageObject storageObject4 = Fixtures.giveStorageObject4();
//        StorageObject storageObject5 = Fixtures.giveStorageObject5();
//
//        serviceStorageObject.saveStorageObject(storageObject1);
//        serviceStorageObject.saveStorageObject(storageObject2);
//        serviceStorageObject.saveStorageObject(storageObject3);
//        serviceStorageObject.saveStorageObject(storageObject4);
//        serviceStorageObject.saveStorageObject(storageObject5);
//
//
//        Reservation reservation1 = Fixtures.giveReservation1();
//        reservation1.setReservedFrom(user1);
//        Reservation reservation2 = Fixtures.giveReservation2();
//        reservation2.setReservedFrom(user1);
//        Reservation reservation3 = Fixtures.giveReservation3();
//        reservation3.setReservedFrom(user1);
//        Reservation reservation4 = Fixtures.giveReservation4();
//        reservation4.setReservedFrom(user2);
//        Reservation reservation5 = Fixtures.giveReservation5();
//        reservation5.setReservedFrom(user2);
//
//        storageObject1.setReservation(reservation1);
//        storageObject2.setReservation(reservation2);
//        storageObject3.setReservation(reservation3);
//        storageObject4.setReservation(reservation4);
//        storageObject5.setReservation(reservation5);
//
//        //when
//        var saved1 = serviceReservation.saveReservationByObject(reservation1);
//        var saved2 = serviceReservation.saveReservationByObject(reservation2);
//        var saved3 = serviceReservation.saveReservationByObject(reservation3);
//        var saved4 = serviceReservation.saveReservationByObject(reservation4);
//        var saved5 = serviceReservation.saveReservationByObject(reservation5);
//
//        //then
//        int resAmount = serviceReservation.findReservationListByUserOptional(reservation1.getReservedFrom()).size();
//        assertThat(serviceReservation.findReservationListByUserOptional(reservation1.getReservedFrom()).stream().count() == resAmount).isTrue();
//
//    }

    @Test
    void findAll(){
            //given
            Reservation reservation1 = withUser(Fixtures.giveReservation1());
            Reservation reservation2 = withUser(Fixtures.giveReservation2());
            Reservation reservation3 = withUser(Fixtures.giveReservation3());

            //when
            var saved1 = serviceReservation.saveReservationByObject(reservation1);
            var saved2 = serviceReservation.saveReservationByObject(reservation2);
            var saved3 = serviceReservation.saveReservationByObject(reservation3);

            //then
            assertThat(serviceReservation.findAll().count()).isSameAs(3L);
    }

    @Test
    void find_all_user_as_list(){
            //given
            Reservation reservation1 = withUser(Fixtures.giveReservation1());
            Reservation reservation2 = withUser(Fixtures.giveReservation2());
            Reservation reservation3 = withUser(Fixtures.giveReservation3());

            //when
            var saved1 = serviceReservation.saveReservationByObject(reservation1);
            var saved2 = serviceReservation.saveReservationByObject(reservation2);
            var saved3 = serviceReservation.saveReservationByObject(reservation3);

            //then
            assertThat(serviceReservation.findAllasList().size()).isSameAs(3);
    }
}
