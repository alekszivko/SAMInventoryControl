package com.samic.samic.services;

import com.samic.samic.data.entity.*;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static com.samic.samic.data.foundation.Guard.isNotNull;

@Service
@RequiredArgsConstructor
@Transactional
public class ServiceLagerObjectErfassen{

    private final Logger          log = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private final ServiceProducer serviceProducer;
    @Autowired
    private final ServiceSFP      serviceSFP;
    @Autowired
    private final ServiceCPE      serviceCPE;
    @Autowired
    private final ServiceSupply   serviceSupply;

    @Autowired
    private final ServiceStorage       serviceStorage;
    @Autowired
    private final ServiceStorageObject serviceStorageObject;
    @Autowired
    private final ServiceStorageObjectHistory serviceStorageObjectHistory;


    public StorageObject LagerOBjectErfassenCPE(StorageObject storageObject,
                                                Storage storage,
                                                Producer producer,
                                                CPE cpe){


        isNotNull(storageObject,
                  "storageObject in StorageObejectErfassen() | Backend ");
        isNotNull(storage,
                  "storage in StorageObejectErfassen() | Backend ");
        isNotNull(producer,
                  "producer in StorageObejectErfassen() | Backend ");
        isNotNull(cpe,
                  "cpe in StorageObejectErfassen() | Backend ");

        storageObject.setStorage(storage);
        var cpe2 = serviceCPE.saveCPEByObject(cpe);
        cpe2.setProducer(producer);
        storageObject.setCpe(cpe2);
        return serviceStorageObject.saveStorageObject(storageObject);

    }


    public StorageObject LagerOBjectErfassenSUPPLY(StorageObject storageObject,
                                                   Storage storage,
                                                   Supply supply){

        isNotNull(storageObject,
                  "storageObject in StorageObejectErfassen() | Backend ");
        isNotNull(storage,
                  "storage in StorageObejectErfassen() | Backend ");
        isNotNull(supply,
                  "supply in StorageObejectErfassen() | Backend ");

        storageObject.setStorage(storage);
        var supply1 = serviceSupply.saveSupplyByObject(supply);
        storageObject.setSupply(supply1);

        return serviceStorageObject.saveStorageObject(storageObject);


    }

    @Transactional
    public StorageObject LagerOBjectErfassenSFP(StorageObject storageObject,
                                                Storage storage,
                                                Producer producer,
                                                SFP sfp){
        isNotNull(storageObject,
                  "storageObject in StorageObejectErfassen() | Backend ");
        isNotNull(storage,
                  "storage in StorageObejectErfassen() | Backend ");
        isNotNull(producer,
                  "producer in StorageObejectErfassen() | Backend ");
        isNotNull(sfp,
                  "sfp in StorageObejectErfassen() | Backend ");

        var storageObject2 = serviceStorageObject.saveStorageObject(storageObject);
        var storageObject3 = serviceStorageObject.findStorageObjectById(storageObject2.getId());

        var storage2  = serviceStorage.saveStorageByObject(storage);
        var storage3 = serviceStorage.findStorageByID(storage2.getId());

        var producer2 = serviceProducer.saveProducerByObject(producer);
        var producer3 = serviceProducer.findProducerById(producer2.getId());


        storageObject3.setStorage(storage3);

        var sfp2 = serviceSFP.saveSFPByObject(sfp);
        var sfp3 = serviceSFP.findSFPById(sfp2.getId());

        sfp3.setProducer(producer3);

        storageObject3.setSfp(sfp3);

        return serviceStorageObject.saveStorageObject(storageObject3);
    }

}
