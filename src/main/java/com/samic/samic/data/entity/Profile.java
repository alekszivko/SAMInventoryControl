package com.samic.samic.data.entity;


import com.samic.samic.data.constants.ConstantsDomain;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Embeddable
public class Profile {

    /*
     relations
     */
    @Column(name = "user_name", length = ConstantsDomain.DEFAULT_LENGTH)
    @NotBlank
    private String username;

    @Column(name = "first_name", length = ConstantsDomain.DEFAULT_LENGTH)
    @NotBlank
    private String firstName;

    @Column(name = "last_name", length = ConstantsDomain.DEFAULT_LENGTH)
    @NotBlank
    private String lastName;

    @Column(name = "phone")
    @NotBlank
    private String phone;


}
