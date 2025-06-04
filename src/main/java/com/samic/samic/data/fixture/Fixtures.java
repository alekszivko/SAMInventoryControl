package com.samic.samic.data.fixture;

import com.samic.samic.data.entity.*;
import com.samic.samic.data.foundation.DateTimeFactory;

public class Fixtures{


    public static Producer giveProducer1(){
        return Producer.builder()
                       .shortname("Cisco")
                       .name("langerCiscoName")
                       .build();
    }

    public static Producer giveProducer2(){
        return Producer.builder()
                       .shortname("Juniper")
                       .name("langerJuniperName")
                       .build();
    }

    public static Producer giveProducer3(){
        return Producer.builder()
                       .shortname("Huawei")
                       .name("langerHuaweiName")
                       .build();
    }

    public static Producer giveProducer4(){
        return Producer.builder()
                       .shortname("Dell")
                       .name("langerDellName")
                       .build();
    }

    public static Producer giveProducer5(){
        return Producer.builder()
                       .shortname("HP")
                       .name("langerHPName")
                       .build();
    }

    public static SFP giveSFP1(){
        return SFP.builder()
                  .wavelength("111nm")
                  .nicSpeed(123)
                  .serialnumber("921jlh31")
                  .type(Type.IP_PHONE)
                  .sfpType(SFPType.MM)
                  .build();
    }

    public static SFP giveSFP2(){
        return SFP.builder()
                  .wavelength("222nm")
                  .nicSpeed(9999)
                  .serialnumber("921jlh31")
                  .type(Type.IP_PHONE)
                  .sfpType(SFPType.MM)
                  .build();
    }

    public static SFP giveSFP3(){
        return SFP.builder()
                  .wavelength("333nm")
                  .nicSpeed(9999)
                  .serialnumber("921jlh31")
                  .type(Type.IP_PHONE)
                  .sfpType(SFPType.MM)
                  .build();
    }

    public static SFP giveSFP4(){
        return SFP.builder()
                  .wavelength("444m,")
                  .nicSpeed(9999)
                  .serialnumber("921jlh31")
                  .type(Type.IP_PHONE)
                  .sfpType(SFPType.MM)
                  .build();
    }

    public static SFP giveSFP5(){
        return SFP.builder()
                  .wavelength("555nm")
                  .nicSpeed(9999)
                  .serialnumber("921jlh31")
                  .type(Type.IP_PHONE)
                  .sfpType(SFPType.MM)
                  .build();
    }


    public static CPE giveCPE1(){
        return CPE.builder()
                  .macAddress("FF-FF-FF-FF-FF-FF")
                  .serialnumber("123456")
                  .producer(giveProducer1())
                  .type(Type.IP_PHONE)
                  .build();
    }

    public static CPE giveCPE2(){
        return CPE.builder()
                  .macAddress("00-00-00-00-00-00")
                  .serialnumber("33333")
                  .producer(giveProducer1())
                  .type(Type.SUPPLY)
                  .build();
    }


    public static CPE giveCPE3(){
        return CPE.builder()
                  .macAddress("aa-bb-cc-dd-ff-11")
                  .serialnumber("654321")
                  .producer(giveProducer1())
                  .type(Type.SWITCH)
                  .build();
    }

    public static CPE giveCPE4(){
        return CPE.builder()
                  .macAddress("aa-bb-cc-dd-ff-22")
                  .serialnumber("654321")
                  .producer(giveProducer1())
                  .type(Type.IP_PHONE)
                  .build();
    }

    public static CPE giveCPE5(){
        return CPE.builder()
                  .macAddress("aa-bb-cc-dd-ff-33")
                  .serialnumber("654321")
                  .producer(giveProducer1())
                  .type(Type.IP_PHONE)
                  .build();
    }


    public static User giveUser1(){

        return User.builder()
                   .createdAt(DateTimeFactory.now_minus_one_year())
                   .lastLogin(DateTimeFactory.now_minus_one_week())
                   .profile(giveProfile1())
                   .mail("AAA.toccafondi@viipo.ae")
                   .role(Role.MANAGMENT)
                   .activated(true)
                   .build();
    }

    public static User giveUser2(){
        return User.builder()
                   .createdAt(DateTimeFactory.now_minus_one_year())
                   .lastLogin(DateTimeFactory.now_minus_one_week())
                   .profile(giveProfile2())
                   .mail("BBB.toccafondi@viipo.ae")
                   .hashedPassword("$2a$10$xdbKoM48VySZqVSU/cSlVeJn0Z04XCZ7KZBjUBC00eKo5uLswyOpe")
                   .role(Role.SUPPORT)
                   .activated(true)
                   .build();
    }

    public static User giveUser3(){
        return User.builder()
                   .createdAt(DateTimeFactory.now_minus_one_year())
                   .lastLogin(DateTimeFactory.now_minus_one_week())
                   .profile(giveProfile3())
                   .mail("CCC.toccafondi@viipo.ae")
                   .hashedPassword("$2a$10$xdbKoM48VySZqVSU/cSlVeJn0Z04XCZ7KZBjUBC00eKo5uLswyOpe")
                   .role(Role.ORDERFULLFILLMENT)
                   .activated(true)
                   .build();
    }

    public static User giveUser4(){
        return User.builder()
                   .createdAt(DateTimeFactory.now_minus_one_year())
                   .lastLogin(DateTimeFactory.now_minus_one_week())
                   .profile(giveProfile4())
                   .mail("DDD.toccafondi@viipo.ae")
                   .hashedPassword("$2a$10$xdbKoM48VySZqVSU/cSlVeJn0Z04XCZ7KZBjUBC00eKo5uLswyOpe")
                   .profile(Profile.builder()
                                   .phone("44444444")
                                   .build())
                   .role(Role.STORAGEADMIN)
                   .activated(true)
                   .build();
    }

    public static User giveUser5(){
        return User.builder()
                   .createdAt(DateTimeFactory.now_minus_one_year())
                   .lastLogin(DateTimeFactory.now_minus_one_week())
                   .profile(giveProfile5())
                   .mail("EEE.toccafondi@viipo.ae")
                   .hashedPassword("$2a$10$xdbKoM48VySZqVSU/cSlVeJn0Z04XCZ7KZBjUBC00eKo5uLswyOpe")
                   .role(Role.FIELDSERVICETECHNICIAN)
                   .activated(true)
                   .build();
    }


    private static Profile giveProfile1(){
        return Profile.builder()
                      .firstName("Peter")
                      .lastName("Hardworker")
                      .username("PeHa")
                      .phone("004367755223315")
                      .build();
    }

    private static Profile giveProfile2(){
        return Profile.builder()
                       .firstName("Susan")
                       .lastName("Installer")
                       .username("SusIns")
                       .phone("00436601235689")
                       .build();
    }

    private static Profile giveProfile3(){
        return Profile.builder()

                       .firstName("Andreas")
                       .lastName("Protocol")
                       .username("AndPro")
                       .phone("00436645698426")
                       .build();
    }

    private static Profile giveProfile4(){
        return Profile.builder()
                .firstName("Max")
                .lastName("Technician")
                .username("MaxTec")
                .phone("00436503568965")
                .build();
    }

    private static Profile giveProfile5(){
        return Profile.builder()
                .firstName("Caroline")
                .lastName("Fastforward")
                .username("CaFa")
                .phone("00436769965482")
                .build();
    }


    public static Storage giveStorage1(){
        return Storage.builder()
                      .name("Hauptlager")
                      .address(Address.builder()
                                      .street("Spengergasse")
                                      .houseNo(10)
                                      .doorNo(4)
                                      .zipCode(1050)
                                      .city("Wien")
                                      .build())
                      .build();
    }

    public static Storage giveStorage2(){
        return Storage.builder()
                      .name("Projektlager")
                      .address(Address.builder()
                                      .street("Lagerstraße")
                                      .houseNo(11)
                                      .doorNo(1)
                                      .zipCode(1100)
                                      .city("Wien")
                                      .build())
                      .build();
    }

    public static Storage giveStorage3(){
        return Storage.builder()
                      .name("Lager STMK")
                      .address(Address.builder()
                                      .street("Herrengasse")
                                      .houseNo(100)
                                      .doorNo(6)
                                      .zipCode(8020)
                                      .city("Graz")
                                      .build())
                      .build();
    }

    public static Storage giveStorage4(){
        return Storage.builder()
                      .name("Lager KTN")
                      .address(Address.builder()
                                      .street("Lindwurmstraße")
                                      .houseNo(23)
                                      .doorNo(4)
                                      .zipCode(9020)
                                      .city("Klagenfurt")
                                      .build())
                      .build();
    }

    public static Storage giveStorage5(){
        return Storage.builder()
                .name("Lager SBG")
                .address(Address.builder()
                        .street("Ignaz Rieder Kai")
                        .houseNo(7)
                        .doorNo(1)
                        .zipCode(5020)
                        .city("Salzburg")
                        .build())
                .build();
    }



    public static Supply giveSupply1(){
        return Supply.builder()
                     .description("this is a description")
                     .amount(4)
                     .build();
    }

    public static Supply giveSupply2(){
        return Supply.builder()
                     .description("this is a description")
                     .amount(4)
                     .build();
    }

    public static Supply giveSupply3(){
        return Supply.builder()
                     .description("this is a description")
                     .amount(4)
                     .build();
    }

    public static Supply giveSupply4(){
        return Supply.builder()
                     .description("this is a description")
                     .amount(4)
                     .build();
    }

    public static Supply giveSupply5(){
        return Supply.builder()
                     .description("this is a description")
                     .amount(4)
                     .build();
    }

    public static StorageObject giveStorageObject1(){
        return StorageObject.builder()
                            .remark("remark1")
                            .objectTypeName(giveObjectType1())
                            .projectDevice(false)
                            .status(Status.AVAILABLE)
                            .build();

    }

    public static StorageObject giveStorageObject2(){
        return StorageObject.builder()
                            .remark("remark1")
                            .objectTypeName(giveObjectType2())

                            .projectDevice(false)
                            .status(Status.AVAILABLE)
                            .build();

    }

    public static StorageObject giveStorageObject3(){
        return StorageObject.builder()
                            .remark("remark1")
                            .objectTypeName(giveObjectType3())

                            .projectDevice(false)
                            .status(Status.AVAILABLE)
                            .build();

    }

    public static StorageObject giveStorageObject4(){
        return StorageObject.builder()
                            .remark("remark1")
                            .objectTypeName(giveObjectType4())

                            .projectDevice(false)
                            .status(Status.AVAILABLE)
                            .build();

    }

    public static StorageObject giveStorageObject5(){
        return StorageObject.builder()
                            .remark("remark1")
                            .objectTypeName(giveObjectType5())

                            .projectDevice(false)
                            .status(Status.AVAILABLE)
                            .build();

    }


    public static Reservation giveReservation1(){
        return Reservation.builder()
                          .reservedDescription("need special tools to install")
                          .build();
    }

    public static Reservation giveReservation2(){
        return Reservation.builder()
                          .reservedDescription("need special tools to install")
                          .build();
    }

    public static Reservation giveReservation3(){
        return Reservation.builder()
                          .reservedAt(DateTimeFactory.plus_one_week())
                          .reservedDescription("need special tools to install")
                          .build();
    }

    public static Reservation giveReservation4(){
        return Reservation.builder()
                          .reservedAt(DateTimeFactory.plus_one_week())
                          .reservedDescription("need special tools to install")
                          .build();
    }

    public static Reservation giveReservation5(){
        return Reservation.builder()
                          .reservedAt(DateTimeFactory.plus_one_week())
                          .reservedDescription("need special tools to install")
                          .build();
    }


    public static ObjectType giveObjectType1(){
        return ObjectType.builder()
                         .name("AAA-CB183LKNO")
                         .build();
    }

    public static ObjectType giveObjectType2(){
        return ObjectType.builder()
                         .name("BBB-CB183LKNO")
                         .build();
    }

    public static ObjectType giveObjectType3(){
        return ObjectType.builder()
                         .name("CCC-CB183LKNO")
                         .build();
    }

    public static ObjectType giveObjectType4(){
        return ObjectType.builder()
                         .name("CB183LKNO")
                         .build();
    }

    public static ObjectType giveObjectType5(){
        return ObjectType.builder()
                         .name("CB183LKNO")
                         .build();
    }

}
