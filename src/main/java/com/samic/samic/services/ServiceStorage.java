package com.samic.samic.services;

import com.samic.samic.data.entity.Storage;
import com.samic.samic.data.entity.StorageObject;
import com.samic.samic.data.foundation.Guard;
import com.samic.samic.data.repositories.RepositoryStorage;
import com.samic.samic.exceptions.SamicException;
import com.samic.samic.exceptions.StorageException;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

import static java.util.spi.ToolProvider.findFirst;
@Log4j2
@Service
@Transactional
@RequiredArgsConstructor
public class ServiceStorage{

    @Autowired
    private final RepositoryStorage repositoryStorage;


    @Transactional
    public Storage saveStorageByObject(Storage storage){
        if(storage != null){
            if(storage.getId() != null){
                if(doesObjectExistById(storage.getId())){
                    Storage objectById = findStorageByID(storage.getId());
                    if(objectById != null){
                        if(objectById.getId().equals(storage.getId())){
                            objectById = storage;
                            return repositoryStorage.save(objectById);
                        }else{
                            throw new StorageException("Storage with id1: '%s' and id2: '%s' does not match. Some error occoured while fetch!!".formatted(objectById.getId(), storage.getId()));
                        }
                    }else{
                        throw new StorageException("Storage with id: '%s' does not exist in DB".formatted(storage.getId()));
                    }
                }else{
                    throw new StorageException("Storage with id: '%s' does not exist in DB but does have a id: ".formatted(storage.getId()));
                }
            }else{
                Storage saved = repositoryStorage.save(storage);
                return saved;
            }
        }else{
            throw new StorageException("Storage is null!");
        }

    }


    @Transactional
    public Storage findStorageByID(Long id){
        if(id != null){
            if(repositoryStorage.findById(id).isPresent()){
                return repositoryStorage.findById(id).get();
            }else{
                throw new StorageException("Could not find Storage with id: '%s' in DB".formatted(id));
            }
        }else{
            throw new StorageException("Given id is null!");
        }
    }

    @Transactional
    public Optional<Storage> findStorageByIDOptional(Long id){
        if(id != null){
            if(repositoryStorage.findById(id).isPresent()){
                return repositoryStorage.findById(id);
            }else{
                throw new StorageException("Could not find Storage with id: '%s' in DB".formatted(id));
            }
        }else{
            throw new StorageException("Given id is null!");
        }
    }

    @Transactional
    public void deleteStoragetById(Long id){
        if(id != null){
            if(!repositoryStorage.findAll().isEmpty()){
                repositoryStorage.deleteById(id);
            }else{
                throw new StorageException("Storage DB is empty!");
            }
        }else{
            throw new StorageException("Given id is null!");
        }
    }

    @Transactional
    public void deleteByObject(Storage storage){
        if(storage != null){
            if(!repositoryStorage.findAll().isEmpty()){
                repositoryStorage.delete(storage);
            }else{
                throw new StorageException("Storage DB is empty!");
            }
        }else{
            throw new StorageException("Given Storage is null!");
        }
    }

    @Transactional
    public boolean doesObjectExistById(Long id){
        if(id != null){
            return repositoryStorage.existsById(id);
        }else{
            throw new StorageException("Given id is null!");
        }
    }

    @Transactional
    public Optional<Storage> findStorageByNameOptional(String name){
        if(name != null){
            if(repositoryStorage.findStorageByName(name).isPresent()){
                return repositoryStorage.findStorageByName(name);
            }else{
                throw new StorageException("Could not find Storage with name: '%s' in DB".formatted(name));
            }
        }else{
            throw new StorageException("Given name is null!");
        }
    }

    @Transactional
    public Stream<Storage> findAll(){
            return repositoryStorage.findAll().stream();
    }
}
