package com.foodorder.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String HOST =
            System.getenv().getOrDefault("MYSQLHOST", "localhost");

    private static final String PORT =
            System.getenv().getOrDefault("MYSQLPORT", "3306");

    private static final String DATABASE =
            System.getenv().getOrDefault("MYSQLDATABASE", "food_delivery_db");

    private static final String USER =
            System.getenv().getOrDefault("MYSQLUSER", "root");

    private static final String PASSWORD =
            System.getenv().getOrDefault("MYSQLPASSWORD", "root");

    private static final String URL =
            "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE
            + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}