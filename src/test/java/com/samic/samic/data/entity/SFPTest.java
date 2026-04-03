package com.samic.samic.data.entity;
import com.samic.samic.BaseIntegrationTest;

import com.samic.samic.data.repositories.RepositorySFP;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Import;
import org.testcontainers.utility.TestcontainersConfiguration;

import static org.assertj.core.api.Assertions.assertThat;

@Import(TestcontainersConfiguration.class)
public class SFPTest extends BaseIntegrationTest {

    @Autowired
    private RepositorySFP repositorySFP;

    @Test
    void ensure_sfp_fetch_into_db(){
        //given
        Producer producer = Producer.builder()
                                    .shortname("Cisco")
                                    .name("langerCiscoName")
                                    .build();
        SFP sfp = SFP.builder()
                          .wavelength("fuchzig_meta")
                          .nicSpeed(9999)
                          .serialnumber("921jlh31")
                          .type(Type.IP_PHONE)
                          .sfpType(SFPType.MM)
                          .producer(producer)
                          .build();
        //when
        var saved = repositorySFP.save(sfp);

        //then
//        assertThat(repositorySFP.findById(saved.getId())).isSameAs(sfp.getId());
        assertThat(repositorySFP.findById(saved.getId()).get()).isSameAs(sfp);
    }
}
