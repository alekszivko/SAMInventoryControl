package com.samic.samic.exceptions;

public class UserException extends SamicException{
      public UserException(String message){
            super(message);
      }

      public UserException(String message, Throwable cause){
            super(message, cause);
      }
}
