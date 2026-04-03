package com.samic.samic.exceptions;

public class ProducerException extends SamicException  {
    public ProducerException(String message){
        super(message);
    }

    public ProducerException(String message, Throwable cause){
        super(message, cause);
    }
}
