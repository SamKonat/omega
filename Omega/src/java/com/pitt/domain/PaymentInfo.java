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
public class PaymentInfo {
    private Long id;
    private String cardName;
    private String cardNo;
    private String cardExpiry;
    private String cardCvv;
    private Long orderId;

    public PaymentInfo() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getCardExpiry() {
        return cardExpiry;
    }

    public void setCardExpiry(String cardExpiry) {
        this.cardExpiry = cardExpiry;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getCardCvv() {
        return cardCvv;
    }

    public void setCardCvv(String cardCvv) {
        this.cardCvv = cardCvv;
    }
    
    @Override
    public String toString() {
        return "PaymentInfo{" + "id=" + id + ", cardName=" + cardName + 
                ", cardNo=" + cardNo + ", cardExpiry=" + cardExpiry + 
                ", cardCvv=" + cardCvv + ", orderId=" + orderId + '}';
    } 
}
