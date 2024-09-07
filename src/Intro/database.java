package Intro;

import java.sql.*;

public class database {
    Connection connection;
    Statement statement;
    database(){
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/edb","root","");
            statement = connection.createStatement();
            System.out.println("Connect successfull");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/edb","root","");
    }
    public static void main(String[] args) {
		database c=new database();
	}
}


