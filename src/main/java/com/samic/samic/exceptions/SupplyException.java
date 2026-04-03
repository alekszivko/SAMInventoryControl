package com.samic.samic.exceptions;

public class SupplyException extends SamicException{
      public SupplyException(String message){
            super(message);
      }

      public SupplyException(String message, Throwable cause){
            super(message, cause);
      }
}
