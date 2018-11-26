
package com.pitt.domain;

/**
 *
 * @author dilis
 */
public class OrderInfo {
    private Long id;
    private Long productId;
    private Long userId;
    private Float price;
    private String orderStatus;
    private String deliveryStatus;
    private String transactionType;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.setPrice((Float) price);
    }

    public String getDeliveryStatus() {
        return deliveryStatus;
    }

    public void setDeliveryStatus(String deliveryStatus) {
        this.deliveryStatus = deliveryStatus;
    }

    @Override
    public String toString() {
        return "Transaction{" + "id=" + id + ", productId=" + productId + 
                ", userId=" + userId + ", price=" + price + ", status=" + 
                getOrderStatus() + ", deliveryStatus=" + deliveryStatus + ", type=" 
                + getTransactionType() + '}';
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }
    
}
