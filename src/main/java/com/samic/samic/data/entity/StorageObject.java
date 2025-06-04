package com.samic.samic.data.entity;


import com.samic.samic.data.constants.ConstantsDomain;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Table(name = "storage_objects")
public class StorageObject extends AbstractIdentityClass<Long> {

  /*
  relations
   */
  @ManyToOne(fetch = FetchType.EAGER,
      cascade = {CascadeType.MERGE})
  @JoinColumn(name = "fk_object_type",
      foreignKey = @ForeignKey(name = "fk_objectType_2_storageObject"))
  private ObjectType objectTypeName;

  @OneToOne(fetch = FetchType.EAGER,
      cascade = CascadeType.PERSIST,
      orphanRemoval = false)
  @JoinColumn(name = "fk_reservation"
      /*, referencedColumnName = "id"*/,
      foreignKey = @ForeignKey(name = "fk_reservation_2_storageObject"))
  private Reservation reservation;

  @ManyToOne(fetch = FetchType.EAGER,
      cascade = {CascadeType.MERGE, CascadeType.PERSIST})
  @JoinColumn(name = "fk_CPE",
      foreignKey = @ForeignKey(name = "fk_cpe_2_storageObject"))
  private CPE cpe;

  @ManyToOne(fetch = FetchType.EAGER,
      cascade = {CascadeType.MERGE, CascadeType.PERSIST})
  @JoinColumn(name = "fk_SFP",
      foreignKey = @ForeignKey(name = "fk_sfp_2_storageObject"))
  private SFP sfp;

  @ManyToOne(fetch = FetchType.EAGER,
      cascade = {CascadeType.MERGE, CascadeType.PERSIST})
  @JoinColumn(name = "fk_supply",
      foreignKey = @ForeignKey(name = "fk_supply_2_storageObject"))
  private Supply supply;

  @OneToMany(mappedBy = "storageObject",
      fetch = FetchType.LAZY,
      cascade = {CascadeType.PERSIST})
  private List<StorageObjectHistory> storageObjectHistory = new ArrayList<>();


  @Column(name = "stored_at_customer")
  private String verbindungsnummer;


  @ManyToOne(fetch = FetchType.EAGER,
      cascade = {CascadeType.MERGE})
  @JoinColumn(name = "fk_storaed_at_user",
      foreignKey = @ForeignKey(name = "fk_User_2_storageObject"))
  private User storedAtUser;

  @ManyToOne(fetch = FetchType.EAGER,
      cascade = {CascadeType.MERGE})
  @JoinColumn(name = "fk_storage",
      foreignKey = @ForeignKey(name = "fk_storage_2_storageObject"))
  private Storage storage;

  /*
  attributes
   */
  @Column(name = "remark",
      length = ConstantsDomain.DEFAULT_LENGTH)
  private String remark;

  @Enumerated(EnumType.STRING)
  @Column(name = "status"
      /*, length = 1*/
      /*,columnDefinition = "CHAR(1)CHECK (Status IN ('C','R','M','P','A'))"*/)
  private Status status;


  @Column(name = "project_device")
  private Boolean projectDevice;

  @Column(name = "processed")
  private Boolean processed;

  @Column
  private String trackingNo;



  @Override
  public int hashCode() {
    if (getId() != null) {
      return getId().hashCode();
    }
    return super.hashCode();
  }


  @Override
  public String toString() {
    return "StorageObject{" + "remark='" + remark + "\n" + '}';
  }
}

