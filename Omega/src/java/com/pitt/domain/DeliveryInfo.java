/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pitt.domain;

/**
 *
 * @author Sohini Palit
 */
public class DeliveryInfo {
    private Long id;
    private String destAddress;
    private String destCity;
    private String destState;
    private String destZip;
    private String status;
    private String expectedDate;
    private String deliveredDate;
    private Long orderId;

    public DeliveryInfo() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDestAddress() {
        return destAddress;
    }

    public void setDestAddress(String destAddress) {
        this.destAddress = destAddress;
    }

    public String getDestCity() {
        return destCity;
    }

    public void setDestCity(String destCity) {
        this.destCity = destCity;
    }

    public String getDestState() {
        return destState;
    }

    public void setDestState(String destState) {
        this.destState = destState;
    }

    public String getDestZip() {
        return destZip;
    }

    public void setDestZip(String destZip) {
        this.destZip = destZip;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getExpectedDate() {
        return expectedDate;
    }

    public void setExpectedDate(String expectedDate) {
        this.expectedDate = expectedDate;
    }
    
    public String getDeliveredDateDate() {
        return deliveredDate;
    }

    public void setDeliveredDateDate(String deliveredDate) {
        this.deliveredDate = deliveredDate;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }
    
    @Override
    public String toString() {
        return "DeliveryInfo{" + "id=" + id + ", destAddress=" + destAddress + 
                ", destCity=" + destCity + ", destState=" + destState + 
                ", destZip=" + destZip + ", status=" + status 
                + ", expectedDate=" 
                + expectedDate + ", deliveredDate=" + deliveredDate 
                + ", orderId=" + orderId + '}';
    } 
}
