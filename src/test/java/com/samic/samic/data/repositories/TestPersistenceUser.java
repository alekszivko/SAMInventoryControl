package com.samic.samic.data.repositories;
import com.samic.samic.BaseIntegrationTest;

import com.samic.samic.data.entity.User;
import com.samic.samic.data.fixture.Fixtures;
import com.samic.samic.services.ServiceUser;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assertions.assertThat;

public class TestPersistenceUser extends BaseIntegrationTest {

    @Autowired
    private ServiceUser serviceUser;


    @Test
    void ensure_save_storageObject_into_DB(){

        //given
        User user = Fixtures.giveUser1();
        //when
        var saved = serviceUser.saveUser(user);

        //then
        assertThat(serviceUser.findUserByID(saved.getId()).getId())
                .isSameAs(user.getId());
    }

//    @Test
//    void ensure_save_then_delete_object_from_db(){
//
//        //given
//        User user = Fixtures.giveUser();
//        //when
//        var saved = serviceUser.saveUser(user);
//
//        //then
//        assertThat(saved).isNotNull().isSameAs(user);
//        serviceUser.deleteUserById(user.getId());
//        assertThat(serviceUser.doesObjectExistById(user.getId())).isFalse();
//
//    }

//    @Test
//    void ensure_save_and_delete_by_Object_and_check_if_exists(){
//        //given
//        User user = Fixtures.giveUser();
//
//        //when
//        var saved = serviceUser.saveUser(user);
//
//        //then
//        serviceUser.deleteByObject(saved);
//        assertThat(serviceUser.doesObjectExistById(user.getId())).isFalse();
//    }
}
