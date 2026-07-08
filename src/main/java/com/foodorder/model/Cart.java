package com.foodorder.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart implements Serializable {
    private final Map<Integer, CartItem> items = new LinkedHashMap<>();

    public void addItem(MenuItem menuItem, int quantity) {
        if (menuItem == null || quantity <= 0) {
            return;
        }

        CartItem existing = items.get(menuItem.getMenuId());
        if (existing == null) {
            items.put(menuItem.getMenuId(), new CartItem(menuItem, quantity));
        } else {
            existing.setQuantity(existing.getQuantity() + quantity);
        }
    }

    public void updateQuantity(int menuId, int quantity) {
        if (quantity <= 0) {
            removeItem(menuId);
            return;
        }

        CartItem item = items.get(menuId);
        if (item != null) {
            item.setQuantity(quantity);
        }
    }

    public void increaseQuantity(int menuId) {
        CartItem item = items.get(menuId);
        if (item != null) {
            item.setQuantity(item.getQuantity() + 1);
        }
    }

    public void decreaseQuantity(int menuId) {
        CartItem item = items.get(menuId);
        if (item != null) {
            updateQuantity(menuId, item.getQuantity() - 1);
        }
    }

    public void removeItem(int menuId) {
        items.remove(menuId);
    }

    public Collection<CartItem> getItems() {
        return new ArrayList<>(items.values());
    }

    public int getTotalItems() {
        int count = 0;
        for (CartItem item : items.values()) {
            count += item.getQuantity();
        }
        return count;
    }

    public double getGrandTotal() {
        double total = 0;
        for (CartItem item : items.values()) {
            total += item.getSubtotal();
        }
        return total;
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }
}
