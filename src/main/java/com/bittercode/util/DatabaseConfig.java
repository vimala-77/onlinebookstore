package com.bittercode.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

class DatabaseConfig {

    static Properties prop = new Properties();
    static {

        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        InputStream input = classLoader.getResourceAsStream("application.properties");

        try {
            prop.load(input);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public final static String DRIVER_NAME = "com.mysql.jdbc.Driver";
    public final static String DB_HOST = "jdbc:mysql://sql-container";
    public final static String DB_PORT = "3307";
    public final static String DB_NAME = "onlinebookstore";
    public final static String DB_USER_NAME = "root";
    public final static String DB_PASSWORD = "root";
    public final static String CONNECTION_STRING = DB_HOST + ":" + DB_PORT + "/" + DB_NAME;

}
