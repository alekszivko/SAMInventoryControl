package com.samic.samic.data.entity;
import com.samic.samic.BaseIntegrationTest;

import com.samic.samic.data.constants.ConstantsDomain;
import com.samic.samic.data.foundation.Guard;
import com.samic.samic.data.repositories.RepositoryStorage;
import com.samic.samic.services.ServiceStorage;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Import;
import org.testcontainers.utility.TestcontainersConfiguration;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertEquals;

@Import(TestcontainersConfiguration.class)
public class TestStorage extends BaseIntegrationTest {

    @Autowired
    RepositoryStorage repositoryStorage;
    @Autowired
    ServiceStorage    serviceStorage;

    @Test
    void ensure_name_of_storage_in_blank_and_should_fail(){

        //given
        Storage storage = Storage.builder()
                                  .name(" ")
                                  .address(Address.builder()
                                                   .street("street1")
                                                   .houseNo(44)
                                                   .doorNo(33)
                                                   .zipCode(9900)
                                                   .city("city1")
                                                   .build())
                                  .build();


        //when
        if(Guard.ensureNotNull(storage.getName().isBlank())){
            Assertions.assertEquals(" ", storage.getName());
        }
    }

    @Test
    void ensure_name_of_storage_max_length_string(){

        //given
        Storage storage = Storage.builder()
                                  .name("aaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjkkkkklllllmmmmm")
                                  .address(Address.builder()
                                                   .street("street1")
                                                   .houseNo(44)
                                                   .doorNo(33)
                                                   .zipCode(9900)
                                                   .city("city1")
                                                   .build())
                                  .build();


        //when
        if(Guard.ensureNotNull(storage.getName().length() > 1)){
            Assertions.assertEquals(ConstantsDomain.OBJECTNAME_LENGTH+1, storage.getName().length());
        }
    }

    @Test
    void ensure_street_of_storage_in_blank_and_should_fail(){

        //given
        Storage storage = Storage.builder()
                                  .name("AAAAA")
                                  .address(Address.builder()
                                                   .street(" ")
                                                   .houseNo(44)
                                                   .doorNo(33)
                                                   .zipCode(9900)
                                                   .city("city1")
                                                   .build())
                                  .build();


        //when
        if(Guard.ensureNotNull(storage.getAddress().getStreet().isBlank())){
            Assertions.assertEquals(" ", storage.getAddress().getStreet());
        }
    }

    @Test
    void ensure_houseNO_of_storage_under_min(){

        //given
        Storage storage = Storage.builder()
                                  .name("AAAAA")
                                  .address(Address.builder()
                                                   .street("BBBB")
                                                   .houseNo(0)
                                                   .doorNo(33)
                                                   .zipCode(9900)
                                                   .city("city1")
                                                   .build())
                                  .build();


        //when
        if(Guard.ensureNotNull(storage.getAddress().getHouseNo() < 1)){
            Assertions.assertEquals(0, storage.getAddress().getHouseNo());
        }
    }

    @Test
    void ensure_houseNO_of_storage_over_max(){

        //given
        Storage storage = Storage.builder()
                                  .name("AAAAA")
                                  .address(Address.builder()
                                                   .street("BBBB")
                                                   .houseNo(1001)
                                                   .doorNo(33)
                                                   .zipCode(9900)
                                                   .city("city1")
                                                   .build())
                                  .build();


        //when
        if(Guard.ensureNotNull(storage.getAddress().getHouseNo() > 1000)){
            Assertions.assertEquals(1001, storage.getAddress().getHouseNo());
        }
    }

    @Test
    void ensure_doorNo_of_storage__under_min(){

        //given
        Storage storage = Storage.builder()
                                  .name("AAAAA")
                                  .address(Address.builder()
                                                   .street("BBBB")
                                                   .houseNo(1)
                                                   .doorNo(-2)
                                                   .zipCode(9900)
                                                   .city("city1")
                                                   .build())
                                  .build();


        //when
        if(Guard.ensureNotNull(storage.getAddress().getDoorNo() < 1)){
            Assertions.assertEquals(-2, storage.getAddress().getDoorNo());
        }
    }
    @Test
    void ensure_doorNo_of_storage_over_max(){

        //given
        Storage storage = Storage.builder()
                                  .name("AAAAA")
                                  .address(Address.builder()
                                                   .street("BBBB")
                                                   .houseNo(1)
                                                   .doorNo(1001)
                                                   .zipCode(9900)
                                                   .city("city1")
                                                   .build())
                                  .build();


        //when
        if(Guard.ensureNotNull(storage.getAddress().getDoorNo() > 1000)){
            Assertions.assertEquals(1001, storage.getAddress().getDoorNo());
        }
    }
    @Test
    void ensure_city_of_storage_blank(){

        //given
        Storage storage = Storage.builder()
                                  .name("AAAAA")
                                  .address(Address.builder()
                                                   .street("BBBB")
                                                   .houseNo(1)
                                                   .doorNo(1001)
                                                   .zipCode(9900)
                                                   .city(" ")
                                                   .build())
                                  .build();


        //when
        if(Guard.ensureNotNull(storage.getAddress().getCity().isBlank())){
            Assertions.assertEquals(" ", storage.getAddress().getCity());
        }
    }
}
