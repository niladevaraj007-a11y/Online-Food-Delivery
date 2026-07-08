package com.foodorder.model;

import java.io.Serializable;

public class CartItem implements Serializable {
    private int cartId;
    private int userId;
    private int menuId;
    private String itemName;
    private String imageUrl;
    private double price;
    private int quantity;

    public CartItem() {}

    public CartItem(MenuItem menuItem, int quantity) {
        this.cartId = menuItem.getMenuId();
        this.menuId = menuItem.getMenuId();
        this.itemName = menuItem.getItemName();
        this.imageUrl = menuItem.getImageUrl();
        this.price = menuItem.getPrice();
        this.quantity = quantity;
    }

    public int getCartId() { return cartId; }
    public void setCartId(int cartId) { this.cartId = cartId; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public int getMenuId() { return menuId; }
    public void setMenuId(int menuId) { this.menuId = menuId; }
    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public double getSubtotal() { return price * quantity; }
    public double getTotal() { return getSubtotal(); }
}
