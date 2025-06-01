package com.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    // JDBC URL, username, and password of MySQL server
    private static final String URL = "jdbc:mysql://localhost:3306/ebook_app ?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String USER = "root";
    private static final String PASSWORD = "Password420";

    // JDBC variable for Connection
    private static Connection connection = null;

    // Private constructor to prevent instantiation
    private DBConnection() {}

    /**
     * Returns the singleton connection to the database.
     */
    public static Connection getConnection() {
        if (connection == null) {
            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the connection
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
                System.out.println(" Successfully connected to the database.");
            } catch (ClassNotFoundException e) {
                System.err.println(" MySQL JDBC Driver not found.");
                e.printStackTrace();
            } catch (SQLException e) {
                System.err.println("❌ Connection to the database failed.");
                System.err.println("SQLState: " + e.getSQLState());
                System.err.println("ErrorCode: " + e.getErrorCode());
                e.printStackTrace();
            }
        }
        return connection;
    }

    /**
     * Closes the database connection if open.
     */
    public static void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("🔒 Database connection closed.");
                connection = null;
            } catch (SQLException e) {
                System.err.println("⚠️ Failed to close the database connection.");
                e.printStackTrace();
            }
        }
    }
}
