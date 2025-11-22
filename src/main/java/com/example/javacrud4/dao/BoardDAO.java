package com.example.javacrud4.dao;

import com.example.javacrud4.util.JDBCUtil;
import com.example.javacrud4.vo.BoardVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// DB에 접근하고, 데이터를 다루는 모든 코드(조회, 추가, 수정, 삭제)
public class BoardDAO {
    private final String Board_LIST = "select * from Board order by id ASC"; // 오름차순 정렬로 들고오기
    private final String Board_INSERT = "INSERT INTO Board (title, writer, content) values (?,?,?)";
    private final String Board_UPDATE = "";
    private final String Board_DELETE = "delete from Board where id =?";
    private final String Board_SEARCH = "select * from Board where title like ? or writer like ? or content like ?";


    // 데이터 추가하기
    public int insertList(BoardVO vo){

        try(Connection conn = JDBCUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(Board_INSERT);
        ){
            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getWriter());
            pstmt.setString(3, vo.getContent());
            pstmt.executeUpdate(); // 결과 저장
            
            return 1;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return 0;  // 실패한 경우 return 0으로 cnt 증가 안하도록
    }

    // 전체 목록 조회하기
    public List<BoardVO> getList(){
        List<BoardVO> list = new ArrayList<BoardVO>();

        // 연결, sql 준비 및 실행 (조회)
        try(Connection conn = JDBCUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(Board_LIST);
            ResultSet rs = pstmt.executeQuery()){

                // DB에서 데이터 들고와서 VO에 넣기
                while(rs.next()){
                    BoardVO info = new BoardVO();
                    info.setId(rs.getInt("id"));
                    info.setTitle(rs.getString("title"));
                    info.setWriter(rs.getString("writer"));
                    info.setContent(rs.getString("content"));
                    info.setRegdate(rs.getTimestamp("regdate"));
                    info.setCnt(rs.getInt("cnt"));
                    list.add(info); // 데이터 저장
                }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    // 목록 삭제하기
    public int deleteList(int id){
        try(Connection conn = JDBCUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(Board_DELETE)
        ){
            pstmt.setInt(1, id);
            return pstmt.executeUpdate(); // 성공하면 1 반환, 실패하면 0 반환

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return 0;
    }

    public List<BoardVO> search(String keyword){
        List<BoardVO> list = new ArrayList<>();

        try(Connection conn = JDBCUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(Board_SEARCH)
        ){
            String searchWord = "%"+keyword+"%";

            pstmt.setString(1, searchWord);
            pstmt.setString(2, searchWord);
            pstmt.setString(3, searchWord);

            ResultSet rs = pstmt.executeQuery();

            while(rs.next()){
                BoardVO info = new BoardVO();
                info.setId(rs.getInt("id"));
                info.setTitle(rs.getString("title"));
                info.setWriter(rs.getString("writer"));
                info.setContent(rs.getString("content"));
                info.setRegdate(rs.getTimestamp("regdate"));
                info.setCnt(rs.getInt("cnt"));
                list.add(info);
            }

        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return list;
    }
}
