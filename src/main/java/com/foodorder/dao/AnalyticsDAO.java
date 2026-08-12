package com.foodorder.dao;

import java.util.Map;

public interface AnalyticsDAO {

    int getTotalOrders();

    double getTotalRevenue();

    int getPendingOrders();

    int getDeliveredOrders();

    Map<String,Integer> getMonthlyOrders();

    Map<String,Double> getMonthlyRevenue();

    Map<String,Integer> getPaymentStatistics();

}