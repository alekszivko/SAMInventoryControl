package com.samic.samic.data.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "sfps")
public class SFP extends AbstractIdentityClass<Long>{

    /*
    relations
     */
    @ManyToOne(fetch = FetchType.EAGER,
               cascade = {CascadeType.MERGE})
    @JoinColumn(name = "fk_producer",
                foreignKey = @ForeignKey(name = "fk_producer_2_sfp"))
    private Producer producer;

    @OneToMany(mappedBy = "sfp",
               fetch = FetchType.LAZY,
               cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    private List<StorageObject> storageObject = new ArrayList<>();
    /*
    attributes
     */
    @NotBlank
    @Column(name = "wavelength")
    private String              wavelength;

    @Min(0)
    @Column(name = "nic_speed")
    private Integer nicSpeed;

    @NotBlank
    @Column(name = "serialnumber")
    private String serialnumber;

    @Enumerated(EnumType.STRING)
    @Column(name = "type")
    private Type type;

    @Enumerated
    @Column(name = "type_SFP")
    private SFPType sfpType;

    @Override
    public String toString(){
        StringBuilder builder = new StringBuilder();
        builder.append("SFP:\n")
               .append("wavelength='")
               .append(wavelength)
               .append("\n")
               .append("nicSpeed=")
               .append(nicSpeed)
               .append("\n")
               .append("serialnumber='")
               .append(serialnumber);
        return builder.toString();
    }

}
