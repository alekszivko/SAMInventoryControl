package com.samic.samic.exceptions;

public class ReservationException extends SamicException{
      public ReservationException(String message){
            super(message);
      }

      public ReservationException(String message, Throwable cause){
            super(message, cause);
      }
}
