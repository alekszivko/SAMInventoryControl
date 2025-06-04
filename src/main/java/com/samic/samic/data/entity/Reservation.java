package com.samic.samic.data.entity;

import com.samic.samic.data.constants.ConstantsDomain;
import com.samic.samic.exceptions.SamicException;
import jakarta.persistence.*;
import jakarta.validation.constraints.PastOrPresent;
import lombok.*;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@Builder
@Entity
@Table(name = "reservations")
@NoArgsConstructor
@AllArgsConstructor
@Transactional
public class Reservation extends AbstractIdentityClass<Long>{

    /*
    relations
     */
    @OneToOne(mappedBy = "reservation",
              fetch = FetchType.EAGER) //Shared Primary Key
    private StorageObject storageObject;

    @OneToMany(mappedBy = "reservation",
               fetch = FetchType.LAZY,
               cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
    private List<StorageObjectHistory> storageObjectHistory = new ArrayList<>();

    @JoinColumn(name = "fk_user",
                foreignKey = @ForeignKey(name = "fk_user_2_reservation"))
    @ManyToOne(fetch = FetchType.EAGER,
               cascade = {CascadeType.MERGE})
    private User reservedFrom;

    /*
    attributes
    */
    @Embedded
    @Column(name = "reserved_For")
    private Customer      customer;
    @PastOrPresent
    private LocalDateTime reservedAt;

    @Column(name = "reserved_description",
            length = ConstantsDomain.DEFAULT_LENGTH)
    private String reservedDescription;


    @Column(name = "completed")
    private Boolean completed;

    @Column(name = "last_modified")
    private LocalDateTime lastModified;



    @Override
    public int hashCode() {
        if (getId() != null) {
            return getId().hashCode();
        }
        return super.hashCode();
    }


    @Override
    public String toString(){
        StringBuilder builder = new StringBuilder();
        builder.append("Reservation:\n")
               .append("reservedDescription='")
               .append(reservedDescription)
               .append("\n")
               .append("completed=")
               .append((completed != null)?builder.append(completed):builder.append("not set"));
        return builder.toString();
    }
}


