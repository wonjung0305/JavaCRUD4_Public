package com.example.javacrud4.util;

import com.example.javacrud4.dao.BoardDAO;
import com.example.javacrud4.vo.BoardVO;

import java.sql.Connection;
import java.util.List;

public class test {
    public static void main(String[] args) {

        Connection conn = JDBCUtil.getConnection();

        if (conn != null) {
            System.out.println("DB 연결 테스트 성공!");
        } else {
            System.out.println("DB 연결 테스트 실패...");
        }

        // 리스트 조회
        BoardDAO dao = new BoardDAO();
        List<BoardVO> list = dao.getList();

        for (BoardVO vo : list) {
            System.out.println(vo.getId() + " / " + vo.getTitle());
        }
    }
}
