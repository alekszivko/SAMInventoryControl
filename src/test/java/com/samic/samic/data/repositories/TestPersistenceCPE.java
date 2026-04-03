package com.samic.samic.data.repositories;
import com.samic.samic.BaseIntegrationTest;


import com.samic.samic.data.entity.CPE;
import com.samic.samic.data.fixture.Fixtures;
import com.samic.samic.exceptions.ValidationException;
import com.samic.samic.services.ServiceCPE;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assertions.assertThat;
import static org.jsoup.helper.Validate.ensureNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;

public class TestPersistenceCPE extends BaseIntegrationTest {

    @Autowired
    private ServiceCPE serviceCP;

    @Test
    void ensure_save_cpe_into_DB_and_find() throws ValidationException{

        //given
        CPE cpe = Fixtures.giveCPE1();
        CPE cpe2 = Fixtures.giveCPE1();

        //when
        var saved = serviceCP.saveCPEByObject(cpe);
//        var saved2 = service.saveCPEByObject(cpe);


        //then
        assertThat(serviceCP.findCPEByID(saved.getId()).getId())
                .isSameAs(cpe.getId());
    }

    @Test
    void ensure_save_and_delete_by_id() throws ValidationException{

        //given
        CPE cpe = Fixtures.giveCPE1();
        CPE cpe2 = Fixtures.giveCPE2();

        //when
        var saved = serviceCP.saveCPEByObject(cpe);

        //then
        serviceCP.deleteCPEtById(saved.getId());
        assertThat(serviceCP.doesObjectExistById(saved.getId())).isFalse(); //TODO 1 , check producer to
    }

    @Test
    void ensure_save_and_delete_by_Object_and_check_if_exists() throws ValidationException{
        //given
        CPE cpe = Fixtures.giveCPE1();

        //when
        var saved = serviceCP.saveCPEByObject(cpe);

        //then
        if(serviceCP.findCPEByID(saved.getId()).equals(cpe.getId())){
            serviceCP.deleteByObject(saved);
            assertThat(serviceCP.doesObjectExistById(cpe.getId())).isFalse();
        }
    }

//    @Test // should fail, is ok
//    void abort_if_data_already_exist_in_db() throws ValidationException{
//        //given
//        CPE cpe = Fixtures.giveCPE1();
//        CPE cpe2 = cpe;
//        //when //then
//
//            var saved = service.saveCPEByObject(cpe2);
//
//            assertThat(service.saveCPEByObject(cpe2)).isNull();
//
//
//
//
//
//    }
//
//    @Test //should fail to
//    void abort_if_data_already_exist_in_db2() throws ValidationException{
//        //given
//        CPE cpe1 = Fixtures.giveCPE1();
//        CPE cpe2 = cpe1;
//        CPE cpe3 = Fixtures.giveCPE3();
//        //when
//        var saved = service.saveCPEByObject(cpe1);
//        var saved3 = service.saveCPEByObject(cpe3);
//        var saved2 = service.saveCPEByObject(cpe2); //already in DB
//
//        //then
//        assertThat(service.saveCPEByObject(saved3)).isSameAs(cpe3);
//    }



}
