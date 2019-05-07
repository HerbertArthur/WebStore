package com.webstore.domain;

public class FpgResult {
    private Long id;

    private Long userId;

    private String associateItems;

    private Double value;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getAssociateItems() {
        return associateItems;
    }

    public void setAssociateItems(String associateItems) {
        this.associateItems = associateItems == null ? null : associateItems.trim();
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }
}