package com.foodorder.model;

public class Restaurant {
    private int restaurantId;
    private String name;
    private String cuisineType;
    private String deliveryTime;
    private double rating;
    private String imageUrl;

    public Restaurant() {}
    public Restaurant(int restaurantId, String name, String cuisineType, String deliveryTime, double rating, String imageUrl) {
        this.restaurantId = restaurantId;
        this.name = name;
        this.cuisineType = cuisineType;
        this.deliveryTime = deliveryTime;
        this.rating = rating;
        this.imageUrl = imageUrl;
    }
    public int getRestaurantId() { return restaurantId; }
    public void setRestaurantId(int restaurantId) { this.restaurantId = restaurantId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getCuisineType() { return cuisineType; }
    public void setCuisineType(String cuisineType) { this.cuisineType = cuisineType; }
    public String getDeliveryTime() { return deliveryTime; }
    public void setDeliveryTime(String deliveryTime) { this.deliveryTime = deliveryTime; }
    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
}
