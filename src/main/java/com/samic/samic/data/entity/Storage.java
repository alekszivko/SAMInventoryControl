package com.samic.samic.data.entity;

import com.samic.samic.data.constants.ConstantsDomain;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity(name = "storages")
public class Storage extends AbstractIdentityClass<Long>{


    /*
    relations
    */
    @OneToMany(mappedBy = "storage",
               fetch = FetchType.LAZY,
               cascade = {CascadeType.PERSIST})
    private List<StorageObject> storageObject = new ArrayList<>();

    @Column(name = "storage_Objekt_history")
    @OneToMany(mappedBy = "storage",
               fetch = FetchType.LAZY,
               cascade = {CascadeType.PERSIST})
    private List<StorageObjectHistory> storageObjectHistory;

    /*
    attributes
     */
    @Embedded
    private Address address;

    @Column(name = "storage_name",
            length = ConstantsDomain.OBJECTNAME_LENGTH)
    @NotBlank
    private String name;


    @Override
    public String toString(){
        StringBuilder builder = new StringBuilder();
        builder.append("Storage:\n")
                .append("name='")
               .append(name);
        return builder.toString();
    }
}
