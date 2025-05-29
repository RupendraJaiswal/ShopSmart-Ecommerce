package com.cart.ecom_proj.model;

import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Embeddable
public class BillingInfo {
    private String firstName;
    private String lastName;
    private String email;
    private String address;
    private String address2;
    private String country;
    private String state;
    private String zip;
    private String ccName;
    private String ccNumber;
    private String ccExpiration;
    private String ccCvv;
}
