package com.samic.samic.exceptions;

public class StorageException extends SamicException{
    public StorageException(String message){
        super(message);
    }

    public StorageException(String message, Throwable cause){
        super(message, cause);
    }
}
