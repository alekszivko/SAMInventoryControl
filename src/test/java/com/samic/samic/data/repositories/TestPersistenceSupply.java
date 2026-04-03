package com.samic.samic.data.repositories;
import com.samic.samic.BaseIntegrationTest;

import com.samic.samic.data.entity.Supply;
import com.samic.samic.data.fixture.Fixtures;
import com.samic.samic.services.ServiceSupply;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assertions.assertThat;

public class TestPersistenceSupply extends BaseIntegrationTest {

    @Autowired
    private ServiceSupply serviceSupply;



    @Test
    void ensure_save_supply_into_DB_and_find_by_id(){

        //given
        Supply supply = Fixtures.giveSupply1();
        Supply supply1 = Supply.builder()
                                 .description("this is a desc")
                                 .amount(55)
                                 .build();

        //when
        var saved = serviceSupply.saveSupplyByObject(supply);

        //then
        assertThat(serviceSupply.findSupplyByID(supply.getId())).isSameAs(saved);
//        assertThat(saved).isSameAs(supply);
    }

    @Test
    void ensure_save_and_delete_by_id(){
        //given
        Supply supply = Fixtures.giveSupply1();


        //when
        var saved = serviceSupply.saveSupplyByObject(supply);

        //then
        serviceSupply.deleteSupplyById(saved.getId());
        assertThat(serviceSupply.doesObjectExistById(supply.getId())).isFalse();
    }

    @Test
    void ensure_save_and_delete_by_Object_and_check_if_exists(){
        //given
        Supply supply = Fixtures.giveSupply1();


        //when
        var saved = serviceSupply.saveSupplyByObject(supply);

        //then
        serviceSupply.deleteByObject(saved);
        assertThat(serviceSupply.doesObjectExistById(saved.getId())).isFalse();
    }

}
