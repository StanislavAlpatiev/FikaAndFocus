
package com.dsv.pvt.fikafocus;

import java.sql.*;

public class Database {

    public static void main(String[] args) {
        try {

            //connection to database
            Connection myConn = DriverManager.getConnection("jdbc:mariadb://mysql.dsv.su.se:3306/test_data", "axda2670", "Ua5rah6eengu");

            //create statement
            Statement myStmt = myConn.createStatement();

            //exectue SQL-query on reviews(table) in test_data(database)
            ResultSet myRs = myStmt.executeQuery("select * from reviews");

            //show result
            while (myRs.next()) {
                System.out.println(myRs.getString("name") + "   " + myRs.getString("content"));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}


