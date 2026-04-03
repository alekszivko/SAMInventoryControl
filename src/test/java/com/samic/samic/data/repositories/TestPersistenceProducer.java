package com.samic.samic.data.repositories;
import com.samic.samic.BaseIntegrationTest;

import com.samic.samic.data.entity.Producer;
import com.samic.samic.data.fixture.Fixtures;
import com.samic.samic.services.ServiceProducer;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assertions.assertThat;


public class TestPersistenceProducer extends BaseIntegrationTest {

    @Autowired
    private ServiceProducer serviceProducer;



    @Test
    void ensure_save_cpe_into_DB_and_find(){

        //given
        Producer producer = Fixtures.giveProducer1();

        //when
        var saved = serviceProducer.saveProducerByObject(producer);

        //then
        assertThat(serviceProducer.findProducerById(producer.getId()))
                .isSameAs(saved);
    }

    @Test
    void ensure_save_and_delete_by_id(){
        //given
        Producer producer = Fixtures.giveProducer1();


        //when
        var saved = serviceProducer.saveProducerByObject(producer);

        //then
        serviceProducer.deleteProducerById(saved.getId());
        assertThat(serviceProducer.doesObjectExistById(producer.getId())).isFalse();
    }

    @Test
    void ensure_save_and_delete_by_Object_and_check_if_exists(){
        //given
        Producer producer = Fixtures.giveProducer1();


        //when
        var saved = serviceProducer.saveProducerByObject(producer);

        //then
        serviceProducer.deleteByObject(saved);
        assertThat(serviceProducer.doesObjectExistById(saved.getId())).isFalse();
    }

}
