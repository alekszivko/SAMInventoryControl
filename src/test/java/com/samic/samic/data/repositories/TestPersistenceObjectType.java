package com.samic.samic.data.repositories;
import com.samic.samic.BaseIntegrationTest;

import com.samic.samic.data.entity.ObjectType;
import com.samic.samic.data.fixture.Fixtures;
import com.samic.samic.services.ServiceObjectType;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assertions.assertThat;

public class TestPersistenceObjectType extends BaseIntegrationTest {


    @Autowired
    private ServiceObjectType serviceObjectType;

    @Test
    void ensure_objectType_save_and_reload(){

        //given
        ObjectType objectType = Fixtures.giveObjectType1();

        //when
        var saved = serviceObjectType.saveObjectTypeByObject(objectType);

        //then
        assertThat(serviceObjectType.findObjectTypeByID(saved.getId())).isSameAs(objectType);

    }

    @Test
    void ensure_object_save_and_deleteObject(){

        //given
        ObjectType objectType = Fixtures.giveObjectType1();

        //when
        var saved = serviceObjectType.saveObjectTypeByObject(objectType);
        serviceObjectType.deleteByObject(saved);

        //then
        assertThat(serviceObjectType.doesObjectExistById(saved.getId())).isFalse();

    }

    @Test
    void ensure_object_save_and_delete_by_id(){

        //given
        ObjectType objectType = Fixtures.giveObjectType1();

        //when
        var saved = serviceObjectType.saveObjectTypeByObject(objectType);
        serviceObjectType.deleteObjectTypeById(saved.getId());

        //then
        assertThat(serviceObjectType.doesObjectExistById(saved.getId())).isFalse();

    }

    @Test
    void ensure_object_save_and_find_all(){

        //given
        ObjectType objectType = Fixtures.giveObjectType1();

        //when
        var saved = serviceObjectType.saveObjectTypeByObject(objectType);

        //then
        assertThat(serviceObjectType.findAll()).isNotNull();

    }


}