package com.example.javacrud4.util;


import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil {
    // 기본 접속 정보 (전역, 변경 불가)
    private static final String driver = "org.mariadb.jdbc.Driver";

    private static final String url = "jdbc:mariadb://walab.handong.edu:3306/W25_22200145";
    private static final String user = "W25_22200145";
    private static final String password = "So7Naj";

    // DB 연결
    public static Connection getConnection() {
        Connection conn = null;

        try{
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Driver 연결 성공 => 주석처리하기");
            
        } catch (Exception e){
            System.out.println("Driver 연결 실패" + e.getMessage());
        }

        return conn;
    }

    // Connection 닫기
    public static void closeConnection(Connection conn){
        if(conn != null){
            try{
                if (!conn.isClosed()){
                    conn.close();
                }
            }catch(Exception e){
                System.out.println("닫기 오류 - " + e.getMessage());
            }
        }
    }
}
