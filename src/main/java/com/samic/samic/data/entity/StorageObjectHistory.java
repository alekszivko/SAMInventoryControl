package com.samic.samic.data.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.PastOrPresent;
import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.LocalDateTime;

@EqualsAndHashCode(callSuper = true)
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
@Table(name = "storage_object_histories")
public class StorageObjectHistory extends AbstractIdentityClass<Long>{

    /*
    relations
     */
    @ManyToOne(fetch = FetchType.EAGER,
               cascade = {CascadeType.MERGE})
    @JoinColumn(name = "fk_storageObject_history",
                foreignKey = @ForeignKey(name = "fk_storageObject_2_storageObjectHistory"))
    private StorageObject storageObject;

    @Column(name = "until_Date_Time")
    @PastOrPresent
    private LocalDateTime untilDateTime;

    @JoinColumn(name = "fk_storage",
                foreignKey = @ForeignKey(name = "fk_storage_2_storageObjectHistory"))
    @ManyToOne(fetch = FetchType.EAGER,
               cascade = {CascadeType.MERGE})
    private Storage storage;

    @JoinColumn(name = "fk_reservation",
                foreignKey = @ForeignKey(name = "fk_reservation_2_storageObjectHistory"))
    @ManyToOne( fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    private Reservation reservation;

    /*
    attributes
     */
    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private Status status;

    @Column(name = "inser_date_time")
    @PastOrPresent
    private LocalDateTime insertDateTime;

    @Override
    public String toString(){
        StringBuilder builder = new StringBuilder();
        builder.append("StorageObjectHistory:\n")
               .append("storageObject=")
               .append(storageObject.getObjectTypeName())
               .append("\n")
               .append("untilDateTime=")
               .append(untilDateTime)
               .append("\n")
               .append("storage=")
               .append(storage.getName())
               .append("\n")
               .append("status=")
               .append(status)
               .append("\n")
               .append("insertDateTime=")
               .append(insertDateTime);
        return builder.toString();
    }
}
