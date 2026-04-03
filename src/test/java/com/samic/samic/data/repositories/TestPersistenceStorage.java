package com.samic.samic.data.repositories;
import com.samic.samic.BaseIntegrationTest;

import com.samic.samic.data.entity.Storage;
import com.samic.samic.data.fixture.Fixtures;
import com.samic.samic.data.foundation.Guard;
import com.samic.samic.exceptions.SamicException;
import com.samic.samic.services.ServiceStorage;
import com.samic.samic.services.ServiceStorageObject;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;


@Log4j2
public class TestPersistenceStorage extends BaseIntegrationTest {

    @Autowired
    private ServiceStorage       serviceStorage;
    @Autowired
    private RepositoryStorage    repositoryStorage;
    @Autowired
    private ServiceStorageObject serviceStorageObject;

    @BeforeEach
    void setUp() {
        serviceStorageObject.deleteAll();
        repositoryStorage.deleteAll();
    }

    //given
    @Test
    void ensure_save_and_reload_storage_by_id(){

        //given
        Storage storage = Fixtures.giveStorage1();

        //when
        var saved = serviceStorage.saveStorageByObject(storage);


        //then
        assertThat(serviceStorage.findStorageByID(saved.getId())).isSameAs(storage);
    }

    @Test
    void ensure_save_and_reload_storage_by_id_optional(){

        //given
        Storage storage = Fixtures.giveStorage1();

        //when
        var saved = serviceStorage.saveStorageByObject(storage);


        //then
        assertThat(serviceStorage.findStorageByIDOptional(saved.getId()).get()).isSameAs(storage);
    }

    @Test
    void try_save_same_object_twice_and_throw_Samic_exception(){

        //given
        Storage storage = Fixtures.giveStorage1();

        //when
        var saved = serviceStorage.saveStorageByObject(storage);


        //then
        var saved2 = assertThrows(SamicException.class, () -> serviceStorage.saveStorageByObject(saved));
        assertThat(saved2).hasMessageContaining("Storage with id: '%s' already exists in DB".formatted(storage.getId()));
        //        assertThat(serviceStorage.findStorageByID(saved.getId())).isSameAs(storage);
    }

    @Test
    void ensure_save_and_ensure_exist_by_id(){

        //given
        Storage storage = Fixtures.giveStorage1();

        //when
        var saved = serviceStorage.saveStorageByObject(storage);

        //then
        assertThat(serviceStorage.doesObjectExistById(storage.getId())).isTrue();
    }

    @Test
    void ensure_save_and_deletion_by_id_and_try_find_by_id_and_throw_SAMICException(){
        //given
        Storage storage = Fixtures.giveStorage1();

        //when
        var saved = serviceStorage.saveStorageByObject(storage);
        repositoryStorage.deleteAll();
        //then
        var exc = assertThrows(SamicException.class, ()
                                                             -> serviceStorage.deleteStoragetById(storage.getId()));
        assertThat(exc).hasMessageContaining("Storage DB is empty!");

        //        assertThat(serviceStorage.findStorageByIDOptional(saved.getId()).isEmpty()).isTrue();

    }

    @Test
    void ensure_save_and_deletion_by_object_and_try_with_findById_and_throw_SAMICException(){
        //given
        Storage storage = Fixtures.giveStorage1();

        //when
        var saved = serviceStorage.saveStorageByObject(storage);
        serviceStorage.deleteByObject(storage);

        var exc = assertThrows(SamicException.class, ()
                                                             -> Guard.ensureNotNull(serviceStorage.findStorageByID(storage.getId())));

        //then
        assertThat(exc).hasMessageContaining("Could not find Storage with id: '%s' in DB".formatted(storage.getId()));

        //        assertThat(serviceStorage.findStorageByIDOptional(saved.getId()).isEmpty()).isTrue();

    }

    @Test
    void ensure_save_and_find_by_name_and_throw_exception_null(){
        //given
        Storage storage = Fixtures.giveStorage1();

        //when
        var exc = assertThrows(SamicException.class, ()
                                                             -> Guard.ensureNotNull(serviceStorage.findStorageByNameOptional(null)));

        //then
        assertThat(exc).hasMessageContaining("Given name is null!");

    }

    @Test
    void ensure_save_and_find_by_name_and_throw_exception_not_find(){
        //given
        Storage storage1 = Fixtures.giveStorage1();
        Storage storage2 = Fixtures.giveStorage2();
        Storage storage3 = Fixtures.giveStorage3();


        //when
        serviceStorage.saveStorageByObject(storage1);
        serviceStorage.saveStorageByObject(storage2);

        var exc = assertThrows(SamicException.class, ()
                                                             -> Guard.ensureNotNull(serviceStorage.findStorageByNameOptional(storage3.getName())));

        //then
        assertThat(exc).hasMessageContaining("Could not find Storage with name: '%s' in DB".formatted(storage3.getName()));
    }

    @Test
    void ensure_save_and_find_by_name(){
        //given
        Storage storage1 = Fixtures.giveStorage1();
        Storage storage2 = Fixtures.giveStorage2();
        Storage storage3 = Fixtures.giveStorage3();
        Storage storage4 = Fixtures.giveStorage4();


        //when
        var saved1 = serviceStorage.saveStorageByObject(storage1);
        var saved2 = serviceStorage.saveStorageByObject(storage2);
        var saved3 = serviceStorage.saveStorageByObject(storage3);
        var saved4 = serviceStorage.saveStorageByObject(storage4);

        //then
        assertThat(serviceStorage.findStorageByNameOptional(storage1.getName()).get()).isSameAs(saved1);
        assertThat(serviceStorage.findStorageByNameOptional(storage2.getName()).get()).isSameAs(saved2);
        assertThat(serviceStorage.findStorageByNameOptional(storage3.getName()).get()).isSameAs(saved3);
        assertThat(serviceStorage.findStorageByNameOptional(storage4.getName()).get()).isSameAs(saved4);
    }

    @Test
    void ensure_save_and_find_all_through_count(){
        //given
        //        counting objects listed in DB (DB is empty after @BeforeEach)
        Long stgSize1 = 0L;
        log.debug("stgSize1: {}", stgSize1);
        Storage storage1 = Fixtures.giveStorage1();
        Storage storage2 = Fixtures.giveStorage2();
        Storage storage3 = Fixtures.giveStorage3();
        Storage storage4 = Fixtures.giveStorage4();

        //when
        var saved1 = serviceStorage.saveStorageByObject(storage1);
        stgSize1++;
        var saved2 = serviceStorage.saveStorageByObject(storage2);
        stgSize1++;
        var saved3 = serviceStorage.saveStorageByObject(storage3);
        stgSize1++;
        var saved4 = serviceStorage.saveStorageByObject(storage4);
        stgSize1++;

        //then
        Long stgSize2 = serviceStorage.findAll().count();
        log.debug("stgSize2: {}", stgSize2);
        assertThat(stgSize2).isEqualTo(stgSize1);
    }

    @Test
    void ensure_save_and_try_to_find_all_but_throw_exception(){
            //given
            Storage storage1 = Fixtures.giveStorage1();
            repositoryStorage.deleteAll();

            //when


            //then
            var exc = assertThrows(SamicException.class, () -> serviceStorage.findAll());

            assertThat(exc).hasMessageContaining("Storage list is empty!");
    }

}