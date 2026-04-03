package com.samic.samic.exceptions;

public class SFPException extends SamicException{
      public SFPException(String message){
            super(message);
      }

      public SFPException(String message, Throwable cause){
            super(message, cause);
      }
}
