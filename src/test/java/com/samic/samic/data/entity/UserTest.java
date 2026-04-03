package com.samic.samic.data.entity;
import com.samic.samic.BaseIntegrationTest;

import com.samic.samic.data.fixture.Fixtures;
import com.samic.samic.data.foundation.DateTimeFactory;
import com.samic.samic.data.repositories.RepositoryUser;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertNotNull;

        //@Import(TestcontainersConfiguration.class)
class UserTest extends BaseIntegrationTest {
    //
    //    @Autowired
    //    private RepositoryUser repository;
    //    @Autowired
    //    private ServiceUser serviceUser;

    @Autowired
    private RepositoryUser repositoryUser;

    @Test
    void ensureSaveAndReadWork(){
        //given
        User user = User.builder()
                            .role(Role.MANAGMENT)
                            //                            .hashedPassword("$2a$10$xdbKoM48VySZqVSU/cSlVeJn0Z04XCZ7KZBjUBC00eKo5uLswyOpe")
                            .profile(Profile.builder().username("management").build()).build();

        User user2 = new User();
        //when

        //        var saved = repository.saveAndFlush(user);
        //        var saved = repositoryUser.findByProfile_Username("management");
        //        var saved2 = serviceUser.findUser("management");
        var saved2 = repositoryUser.save(user);
        //        assertThat(saved).isNotNull().isSameAs(user);

        //        assertThat(saved2.getProfile().getUsername()).isEqualTo("management");
        assertThat(saved2).isNotNull();
        //        assertThat(saved2).isNotNull().isSameAs(user2);
    }
    //    @Autowired
    //    private ServiceUser    ServiceUser;

    @Test
    void test(){
        User user = new User();

        //        var saved = ServiceUser.save(user);
        var saved = repositoryUser.save(user);

        assertNotNull(saved.getId());
        //        assertEquals(user, saved);
    }

    @Test
    void test_ensure_db_value(){
        //                  given
        User user = User.builder()
                            .createdAt(DateTimeFactory.now_minus_one_year())
                            .lastLogin(DateTimeFactory.now_minus_one_week())
                            .profile(Profile.builder()
                                             .firstName("Eula")
                                             .lastName("Lane")
                                             .username("management")

                                             .build())
                            .mail("agnes.toccafondi@viipo.ae")
                            .hashedPassword("$2a$10$xdbKoM48VySZqVSU/cSlVeJn0Z04XCZ7KZBjUBC00eKo5uLswyOpe")
                            .profile(Profile.builder().phone("(762) 526-5961").build())
                            .role(Role.MANAGMENT).build();

        //                  when
        var saved = repositoryUser.save(user);

        //                  then

        assertThat(saved).isNotNull();
    }

    @Test
    void ensure_attributes_from_user_that_are_provided_by_profile_are_not_null(){
        //                  given
        User user = Fixtures.giveUser1();
        user.getProfile().setUsername("AAAAA");

        assertThat(user.getProfile().getUsername()).isSameAs("AAAAA");

    }

}