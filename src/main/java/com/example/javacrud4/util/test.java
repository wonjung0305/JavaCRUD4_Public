package com.example.javacrud4.util;

import java.sql.Connection;

public class test {
    public static void main(String[] args) {

        Connection conn = JDBCUtil.getConnection();

        if (conn != null) {
            System.out.println("DB 연결 테스트 성공!");
        } else {
            System.out.println("DB 연결 테스트 실패...");
        }
    }
}
