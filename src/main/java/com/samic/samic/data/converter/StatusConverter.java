package com.samic.samic.data.converter;

import com.samic.samic.data.entity.Status;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

import java.util.Optional;


@Converter(autoApply = true)
public class StatusConverter implements AttributeConverter<Status, String>{

    @Override
    public String convertToDatabaseColumn(Status status){
        return (status == null) ? null :
                       switch(status){
                           case CUSTOMER -> "C";
                           case RESERVED -> "R";
                           case MISSING -> "M";
                           case PROJECT -> "P";
                           case AVAILABLE -> "A";

                       };
    }

    @Override
    public Status convertToEntityAttribute(String dbData){

        return Optional.ofNullable(dbData)
                       .map(v -> switch(v){
                           case "C" -> Status.CUSTOMER;
                           case "R" -> Status.RESERVED;
                           case "M" -> Status.MISSING;
                           case "P" -> Status.PROJECT;
                           case "A" -> Status.AVAILABLE;
                           default -> throw new IllegalArgumentException("Unknown value '%s' for Status!".formatted(dbData));
                       }).orElse(null);
    }
}
