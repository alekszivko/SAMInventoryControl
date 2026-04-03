package com.samic.samic.data.repositories;
import com.samic.samic.BaseIntegrationTest;

import com.samic.samic.data.entity.SFP;
import com.samic.samic.data.fixture.Fixtures;
import com.samic.samic.services.ServiceSFP;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assertions.assertThat;

public class TestPersistenceSFP extends BaseIntegrationTest {

    @Autowired
    private ServiceSFP serviceSFP;


    @Test
    void ensure_save_cpe_into_DB_and_find(){

        //given
        SFP sfp = Fixtures.giveSFP1();

        //when
        var saved = serviceSFP.saveSFPByObject(sfp);

        //then
        assertThat(serviceSFP.findSFPById(saved.getId()).getId())
                .isSameAs(sfp.getId());
    }

    @Test
    void ensure_save_and_delete_by_id(){
        //given
        SFP sfp = Fixtures.giveSFP1();

        //when
        var saved = serviceSFP.saveSFPByObject(sfp);

        //then
        serviceSFP.deleteSFPById(saved.getId());
        assertThat(serviceSFP.doesObjectExistById(saved.getId())).isFalse();
    }

    @Test
    void ensure_save_and_delete_by_Object_and_check_if_exists(){
        //given
        SFP sfp = Fixtures.giveSFP1();

        //when
        var saved = serviceSFP.saveSFPByObject(sfp);

        //then
       serviceSFP.deleteByObject(saved);
       assertThat(serviceSFP.doesObjectExistById(saved.getId())).isFalse();
    }
}
