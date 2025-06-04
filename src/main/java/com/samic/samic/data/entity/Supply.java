package com.samic.samic.data.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Positive;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "supplies")
public class Supply extends AbstractIdentityClass<Long>{

    /*
    relations
     */
    @Column(name = "supply")
    @OneToMany(mappedBy = "supply",
               fetch = FetchType.LAZY,
               cascade = {CascadeType.PERSIST})
    private List<StorageObject> storageObject = new ArrayList<>();

    /*
    attributes
     */
    @Column(name = "description")
    @NotBlank
    private String description;

    @Column(name = "amount")
    @Positive
    private int amount;

    @Override
    public String toString(){
        StringBuilder builder = new StringBuilder();
        builder.append("Supply:\n")
               .append("description='")
               .append(description)
               .append("\n")
               .append("amount=")
               .append(amount);
        return builder.toString();
    }
}
