package com.samic.samic.data.entity;

import com.samic.samic.BaseIntegrationTest;
import com.samic.samic.data.repositories.RepositoryCPE;
import com.samic.samic.exceptions.SamicException;
import com.samic.samic.services.ServiceCPE;
import com.samic.samic.services.ServiceProducer;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assertions.assertThat;

class CPETest extends BaseIntegrationTest{

    @Autowired
    private RepositoryCPE repository;
    @Autowired
    private ServiceCPE serviceCPE;
    @Autowired
    private ServiceProducer serviceProducer;


    //    private final Logger LOGGER = LoggerFactory.getLogger(CPETest.class);
    @Test
    void ensue_CPE_fetch_into_db(){


        //given
        Producer savedProducer = serviceProducer.saveProducerByObject(
                Producer.builder().shortname("Cisco").name("Cisco").build());

        CPE cpe = new CPE.CPEBuilder()
                          .macAddress("FF-FF-FF-FF-FF-FF")
                          .serialnumber("123456")
                          .producer(savedProducer)
                          .type(Type.IP_PHONE).build();


        //when

        var saved = repository.saveAndFlush(cpe);

        //then

        assertThat(repository.findById(cpe.getId()).get()).isSameAs(saved);

    }

    @Test
    public void testToStringOutput(){
        try{
            //given
            CPE cpe = new CPE.CPEBuilder()
                              .macAddress("FF-FF-FF-FF-FF-FF")
                              .serialnumber("123456")
                              .producer(Producer.builder().shortname("Cisco").name("Cisco").build())
                              .type(Type.IP_PHONE)
                              .build();

            //when
            System.out.println(cpe.toString());
            assertThat(cpe.toString()).isNotNull();
            //then
        }catch(SamicException e){
            throw new SamicException("Throwing exception in testToStringOutput", e);
        }
    }

    @Test
    public void ensureDetatchedEntitiesAreSet(){

        //given
        CPE cpe = serviceCPE.findCPEByID(1L);

        //when


        //then
    }
}
