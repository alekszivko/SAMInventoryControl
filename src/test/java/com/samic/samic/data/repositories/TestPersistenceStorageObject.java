package com.samic.samic.data.repositories;
import com.samic.samic.BaseIntegrationTest;

import com.samic.samic.data.entity.ObjectType;
import com.samic.samic.data.entity.StorageObject;
import com.samic.samic.data.fixture.Fixtures;
import com.samic.samic.services.ServiceObjectType;
import com.samic.samic.services.ServiceStorageObject;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;

@Log4j2
public class TestPersistenceStorageObject extends BaseIntegrationTest {

    @Autowired
    private ServiceStorageObject serviceStorageObject;
    @Autowired
    private ServiceObjectType    serviceObjectType;

    @Test
    void ensure_save_storageObject_into_DB(){

        //given
        StorageObject storageObject = Fixtures.giveStorageObject1();

        //when
        var saved = serviceStorageObject.saveStorageObject(storageObject);

        //then
        assertThat(serviceStorageObject.findStorageObjectById(saved.getId())
                                       .getId()).isSameAs(storageObject.getId());
    }

    //    @Test
    //    void ensure_save_then_delete_object_from_db(){
    //
    //        //given
    //        StorageObject storageObject = Fixtures.giveStorageObject();
    //
    //        //when
    //        var saved = service.saveStorageObject(storageObject);
    //
    //        //then
    //        service.deleteStorageObjectById(saved.getId());
    //        assertThat(service.doesObjectExistById(storageObject.getId())).isFalse();
    //
    //    }
    //
    //    @Test
    //    void ensure_save_and_delete_by_Object_and_check_if_exists(){
    //        //given
    //        StorageObject storageObject = Fixtures.giveStorageObject();
    //
    //        //when
    //        var saved = service.saveStorageObject(storageObject);
    //
    //        //then
    //        service.deleteByObject(saved);
    //        assertThat(service.doesObjectExistById(saved.getId())).isFalse();
    //    }

    @Test
    void ensure_save_ObjectType_into_StorageObject(){
        //given
        ObjectType objectType1 = ObjectType.builder()
                                           .name("AABBCCDD112")
                                           .build();
        StorageObject storageObject = Fixtures.giveStorageObject1();
        storageObject.setObjectTypeName(objectType1);

        //when
        var saved = serviceStorageObject.saveStorageObject(storageObject);

        //then
        assertThat(serviceStorageObject.findStorageObjectById(storageObject.getId())
                                       .getObjectTypeName()).isSameAs(objectType1);
    }

    @Test
    void set_storageType_to_storageObject_and_save_to_DB_then_fetch(){

        //given
        ObjectType    objectType1   = Fixtures.giveObjectType1();
        StorageObject storageObject = Fixtures.giveStorageObject3();
        log.debug("declared and initiated {}, {} ".formatted(objectType1,
                                                             storageObject));

        storageObject.setObjectTypeName(objectType1);
        log.debug("set ObjectType:'%s' to storageObject: '%s' ".formatted(objectType1,
                                                                          storageObject));

        //when
        var saved = serviceStorageObject.saveStorageObject(storageObject);
        log.debug("saved ObjectType:'%s' composed wiht storageObject: '%s' into db ".formatted(objectType1,
                                                                                               storageObject));

        //then
        assertThat(serviceStorageObject.findStorageObjectById(saved.getId())).isSameAs(storageObject);
        log.debug("ensured fetching from db ObjectType:'%s' composed wiht storageObject: '%s' from db ".formatted(objectType1,
                                                                                                                  storageObject));

    }

    @Test
    void ensure_setting_objectType_to_storageObject_from_a_existing_objectType_in_DB(){
        /*
        1.Part: saving ObjectType into DB and ensuring existing.
         */
        //given 1.0 (Set up objectType via GUI)

        ObjectType objectType1 = Fixtures.giveObjectType1();

        //when 1.1 (save objectType set before into DB, should be visible on dopdown-menu)
        var saved = serviceObjectType.saveObjectTypeByObject(objectType1);

        //then 1.2 (just controlling availability, when saving into DB was successful before)
        if(serviceObjectType.doesObjectExistById(objectType1.getId())){
            //create storageObject (create storageObject in GUI)
            StorageObject storageObject1 = Fixtures.giveStorageObject3();
            //get ObjectType from DB to set (choose objectType from DB that is visible in dropdown-menu that was saved before)
            ObjectType objectType1Fetched = serviceObjectType.findObjectTypeByID(objectType1.getId());

            /*
            2. Part. Coupling storageObject with objectType and saving into DB plus ensure if its really saved and coupled together.
             */
            //ensure fetched objectType same as safed before (quick ensure if its really the saved objectType )
            if(objectType1Fetched.equals(objectType1)){
                //set the fetched objectType to storageObject
                //given 2.0 (when its choosable in dropdown-menu, then set it to the created storageObject)
                storageObject1.setObjectTypeName(objectType1Fetched);

                //save storageObject with bounded objectType to DB
                //when 2.1 (save the bounded couple into DB. objectType that exists before in DB and storageObject that is going to be creationg)
                var savedStorageObjectWitBoundedObjectType = serviceStorageObject.saveStorageObject(storageObject1);

                //ensure saving storageObject with objectType set on it
                //then 2.2 (gettin objectType from saved storageObject and ensure if its the same objectType that was choosen before for coupling together)
                assertThat(serviceStorageObject.findStorageObjectById(savedStorageObjectWitBoundedObjectType.getId())
                                               .getObjectTypeName()).isSameAs(objectType1);

            }
        }
    }

    @Test
    void ensure_setting_objectType_to_storageObject_from_several_existing_objectType_in_DB(){
        /*
        1.Part: saving ObjectType into DB and ensuring existing.
         */
        //given 1.0 (Set up objectType via GUI)

        ObjectType objectType1 = Fixtures.giveObjectType1();
        ObjectType objectType2 = Fixtures.giveObjectType2();
        ObjectType objectType3 = Fixtures.giveObjectType3();

        //when 1.1 (save objectType set before into DB, should be visible on dopdown-menu)
        var saved1 = serviceObjectType.saveObjectTypeByObject(objectType1);
        var saved2 = serviceObjectType.saveObjectTypeByObject(objectType2);
        var saved3 = serviceObjectType.saveObjectTypeByObject(objectType3);

        //then 1.2 (just controlling availability, when saving into DB was successful before)
        if(serviceObjectType.doesObjectExistById(objectType1.getId()) && serviceObjectType.doesObjectExistById(objectType2.getId()) && serviceObjectType.doesObjectExistById(objectType3.getId())){
            //create storageObject (create storageObject in GUI)
            StorageObject storageObject1 = Fixtures.giveStorageObject3();
            StorageObject storageObject2 = Fixtures.giveStorageObject4();
            StorageObject storageObject3 = Fixtures.giveStorageObject5();
            //get ObjectType from DB to set (choose objectType from DB that is visible in dropdown-menu that was saved before)
            ObjectType objectType1Fetched = serviceObjectType.findObjectTypeByID(objectType1.getId());
            ObjectType objectType2Fetched = serviceObjectType.findObjectTypeByID(objectType2.getId());
            ObjectType objectType3Fetched = serviceObjectType.findObjectTypeByID(objectType3.getId());

            /*
            2. Part. Coupling storageObject with objectType and saving into DB plus ensure if its really saved and coupled together.
             */
            //ensure fetched objectType same as safed before (quick ensure if its really the saved objectType )
            if(objectType1Fetched.equals(objectType1) && objectType2Fetched.equals(objectType2) && objectType3Fetched.equals(objectType3)){
                //set the fetched objectType to storageObject
                //given 2.0 (when its choosable in dropdown-menu, then set it to the created storageObject)
                storageObject1.setObjectTypeName(objectType1Fetched);
                storageObject2.setObjectTypeName(objectType2Fetched);
                storageObject3.setObjectTypeName(objectType3Fetched);

                //save storageObject with bounded objectType to DB
                //when 2.1 (save the bounded couple into DB. objectType that exists before in DB and storageObject that is going to be creationg)
                var savedStorageObjectWitBoundedObjectType1 = serviceStorageObject.saveStorageObject(storageObject1);
                var savedStorageObjectWitBoundedObjectType2 = serviceStorageObject.saveStorageObject(storageObject2);
                var savedStorageObjectWitBoundedObjectType3 = serviceStorageObject.saveStorageObject(storageObject3);

                //ensure saving storageObject with objectType set on it
                //then 2.2 (gettin objectType from saved storageObject and ensure if its the same objectType that was choosen before for coupling together)
                assertThat(serviceStorageObject.findStorageObjectById(savedStorageObjectWitBoundedObjectType1.getId())
                                               .getObjectTypeName()).isSameAs(objectType1);
                assertThat(serviceStorageObject.findStorageObjectById(savedStorageObjectWitBoundedObjectType2.getId())
                                               .getObjectTypeName()).isSameAs(objectType2);
                assertThat(serviceStorageObject.findStorageObjectById(savedStorageObjectWitBoundedObjectType3.getId())
                                               .getObjectTypeName()).isSameAs(objectType3);

            }
        }
    }


    @Test
    void find_free_storageObjects(){
        //given
        int           freeStorageObjects = 0;
        var savedOt1 = serviceObjectType.saveObjectTypeByObject(Fixtures.giveObjectType1());
        var savedOt2 = serviceObjectType.saveObjectTypeByObject(Fixtures.giveObjectType2());
        var savedOt3 = serviceObjectType.saveObjectTypeByObject(Fixtures.giveObjectType3());
        StorageObject storageObject1     = Fixtures.giveStorageObject1();
        StorageObject storageObject2     = Fixtures.giveStorageObject2();
        StorageObject storageObject3     = Fixtures.giveStorageObject3();
        StorageObject storageObject4     = Fixtures.giveStorageObject4();
        StorageObject storageObject5     = Fixtures.giveStorageObject5();
        storageObject1.setObjectTypeName(savedOt1);
        storageObject2.setObjectTypeName(savedOt1);
        storageObject3.setObjectTypeName(savedOt2);
        storageObject4.setObjectTypeName(savedOt2);
        storageObject5.setObjectTypeName(savedOt3);

        int baselineFree = serviceStorageObject.findNotReservedStorageObjects().size();

        //when
        var saved1 = serviceStorageObject.saveStorageObject(storageObject1);
        if(storageObject1.getReservation() == null){
            freeStorageObjects++;
        }
        var saved2 = serviceStorageObject.saveStorageObject(storageObject2);
        if(storageObject2.getReservation() == null){
            freeStorageObjects++;
        }
        var saved3 = serviceStorageObject.saveStorageObject(storageObject3);
        if(storageObject3.getReservation() == null){
            freeStorageObjects++;
        }
        var saved4 = serviceStorageObject.saveStorageObject(storageObject4);
        if(storageObject4.getReservation() == null){
            freeStorageObjects++;
        }
        var saved5 = serviceStorageObject.saveStorageObject(storageObject5);
        if(storageObject5.getReservation() == null){
            freeStorageObjects++;
        }


        List<StorageObject> res        = serviceStorageObject.findNotReservedStorageObjects();
        int                 freeAmount = res.size() - baselineFree;

        //then
        assertThat(freeAmount).isSameAs(freeStorageObjects);
    }

    @Test
    void find_reserved_storageObjects(){
        //given
        int           countReserved  = 0;
        var savedOt1 = serviceObjectType.saveObjectTypeByObject(Fixtures.giveObjectType1());
        var savedOt2 = serviceObjectType.saveObjectTypeByObject(Fixtures.giveObjectType2());
        var savedOt3 = serviceObjectType.saveObjectTypeByObject(Fixtures.giveObjectType3());
        StorageObject storageObject1 = Fixtures.giveStorageObject1();
        StorageObject storageObject2 = Fixtures.giveStorageObject2();
        StorageObject storageObject3 = Fixtures.giveStorageObject3();
        StorageObject storageObject4 = Fixtures.giveStorageObject4();
        StorageObject storageObject5 = Fixtures.giveStorageObject5();
        storageObject1.setObjectTypeName(savedOt1);
        storageObject2.setObjectTypeName(savedOt1);
        storageObject3.setObjectTypeName(savedOt2);
        storageObject4.setObjectTypeName(savedOt2);
        storageObject5.setObjectTypeName(savedOt3);

        int baselineReserved = serviceStorageObject.findReservedStorageObjects().size();

        //when
        var saved1 = serviceStorageObject.saveStorageObject(storageObject1);
        if(storageObject1.getReservation() != null){
            countReserved++;
        }
        var saved2 = serviceStorageObject.saveStorageObject(storageObject2);
        if(storageObject2.getReservation() != null){
            countReserved++;
        }
        var saved3 = serviceStorageObject.saveStorageObject(storageObject3);
        if(storageObject3.getReservation() != null){
            countReserved++;
        }
        var saved4 = serviceStorageObject.saveStorageObject(storageObject4);
        if(storageObject4.getReservation() != null){
            countReserved++;
        }
        var saved5 = serviceStorageObject.saveStorageObject(storageObject5);
        if(storageObject5.getReservation() != null){
            countReserved++;
        }


        List<StorageObject> res            = serviceStorageObject.findReservedStorageObjects();
        int                 reservedAmount = res.size() - baselineReserved;

        //then
        assertThat(reservedAmount).isSameAs(countReserved);
    }

    @Test
    void findStorageOBjectWitDetatched(){
        //given
        StorageObject storageObject1 = Fixtures.giveStorageObject1();
        StorageObject storageObject2 = Fixtures.giveStorageObject2();
        StorageObject storageObject3 = Fixtures.giveStorageObject3();
        StorageObject storageObject4 = Fixtures.giveStorageObject4();
        StorageObject storageObject5 = Fixtures.giveStorageObject5();

        //when
        var saved1 = serviceStorageObject.saveStorageObject(storageObject1);
        var saved2 = serviceStorageObject.saveStorageObject(storageObject2);
        var saved3 = serviceStorageObject.saveStorageObject(storageObject3);
        var saved4 = serviceStorageObject.saveStorageObject(storageObject4);
        var saved5 = serviceStorageObject.saveStorageObject(storageObject5);

        //then
        //        serviceStorageObject.findStorageObjectByID(saved1.getId());
        //        serviceStorageObject.findStorageObjectByID(saved2.getId());
        //            assertThat(serviceStorageObject.findStorageObjectByID(saved1.getId())).isSameAs(storageObject1);
    }

    @Test
    void countObjectTypes3(){       //ObjectTypes without supplies
        //given
        //        ObjectType    objectType1    = ObjectType.builder()
        //                                                 .name("C927")
        //                                                 .build();
        //        ObjectType    objectType2    = ObjectType.builder()
        //                                                 .name("C1111-4p")
        //                                                 .build();
        //        ObjectType    objectType3    = ObjectType.builder()
        //                                                 .name("ASR920-12SZ-IM")
        //                                                 .build();
        //        ObjectType    objectType4    = ObjectType.builder()
        //                                                 .name("C897VAB")
        //                                                 .build();
        //        ObjectType    objectType5    = ObjectType.builder()
        //                                                 .name("C897VAB")
        //                                                 .build();
        //        ObjectType    objectType6    = ObjectType.builder()
        //                                                 .name("C1117")
        //                                                 .build();
        //        ObjectType    objectType7    = ObjectType.builder()
        //                                                 .name("HP J9050A")
        //                                                 .build();
        //        StorageObject storageObject1 = Fixtures.giveStorageObject1();
        //        StorageObject storageObject2 = Fixtures.giveStorageObject1();
        //        StorageObject storageObject3 = Fixtures.giveStorageObject1();
        //        StorageObject storageObject4 = Fixtures.giveStorageObject1();
        //        StorageObject storageObject5 = Fixtures.giveStorageObject1();
        //        StorageObject storageObject6 = Fixtures.giveStorageObject1();
        //        StorageObject storageObject7 = Fixtures.giveStorageObject1();
        //        storageObject1.setObjectTypeName(objectType1);
        //        storageObject2.setObjectTypeName(objectType2);
        //        storageObject3.setObjectTypeName(objectType3);
        //        storageObject4.setObjectTypeName(objectType4);
        //        storageObject5.setObjectTypeName(objectType5);
        //        storageObject6.setObjectTypeName(objectType6);
        //        storageObject7.setObjectTypeName(objectType7);
        //        //when
        //        serviceObjectType.saveObjectTypeByObject(objectType1);
        //        serviceObjectType.saveObjectTypeByObject(objectType2);
        //        serviceObjectType.saveObjectTypeByObject(objectType3);
        //        serviceObjectType.saveObjectTypeByObject(objectType4);
        //        serviceObjectType.saveObjectTypeByObject(objectType5);
        //        serviceObjectType.saveObjectTypeByObject(objectType6);
        //        serviceObjectType.saveObjectTypeByObject(objectType7);
        //
        //        serviceStorageObject.saveStorageObject(storageObject1);
        //        serviceStorageObject.saveStorageObject(storageObject2);
        //        serviceStorageObject.saveStorageObject(storageObject3);
        //        serviceStorageObject.saveStorageObject(storageObject4);
        //        serviceStorageObject.saveStorageObject(storageObject5);
        //        serviceStorageObject.saveStorageObject(storageObject6);
        //        serviceStorageObject.saveStorageObject(storageObject7);
        //then

        Long amount = serviceStorageObject.findAmountOfObjectType2("C897VAB");
        amount += serviceStorageObject.findAmountOfObjectType2("C1111-4p");
        amount += serviceStorageObject.findAmountOfObjectType2("C927");
        amount += serviceStorageObject.findAmountOfObjectType2("ASR920-12SZ-IM");
        amount += serviceStorageObject.findAmountOfObjectType2("C1117-4p");
        amount += serviceStorageObject.findAmountOfObjectType2("HP J9050A");
        amount += serviceStorageObject.findAmountOfObjectType2("Aruba 2530 8-PoE+");
        amount += serviceStorageObject.findAmountOfObjectType2("M300");
        amount += serviceStorageObject.findAmountOfObjectType2("D865");
        amount += serviceStorageObject.findAmountOfObjectType2("D862");
        amount += serviceStorageObject.findAmountOfObjectType2("GLC-LH-SM");
        amount += serviceStorageObject.findAmountOfObjectType2("LC-SX-MM");
        amount += serviceStorageObject.findAll()
                                      .filter(a -> a.getSupply() != null)
                                      .count();
        Long amountSup = serviceStorageObject.findAll()
                                             .filter(a -> a.getSupply() != null)
                                             .count();

        System.out.println(amount);
        assertThat(amount).isEqualTo(serviceStorageObject.findAll()
                                                         .count());
    }


}



