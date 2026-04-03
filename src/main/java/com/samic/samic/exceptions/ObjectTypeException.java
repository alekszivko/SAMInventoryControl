package com.samic.samic.exceptions;

public class ObjectTypeException extends SamicException  {
    public ObjectTypeException(String message){
        super(message);
    }

    public ObjectTypeException(String message, Throwable cause){
        super(message, cause);
    }
}
