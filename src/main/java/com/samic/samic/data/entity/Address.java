package com.samic.samic.data.entity;


import com.samic.samic.data.constants.ConstantsDomain;
import jakarta.persistence.*;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Embeddable
public class Address{

    @Column(name = "street", length = ConstantsDomain.OBJECTNAME_LENGTH)
    @NotBlank
    private String street;

    @Column(name = "house_no")
    @Min(1)
    @Max(1000)
    private Integer houseNo;

    @Column(name = "door_no")
    @Positive()
    @Min(1)
    @Max(1000)
    private Integer doorNo;

    @Column(name = "zip_code")
    @Positive()
    @Min(1)
    @Max(99999)
    private Integer zipCode;

    @Column(name = "city", length = ConstantsDomain.OBJECTNAME_LENGTH)
    private String city;


}
