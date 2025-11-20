package com.example.javacrud4.vo;

import java.sql.Timestamp;

public class BoardVO {
    private int id;
    private String title;
    private String writer;
    private String content;
    private Timestamp regdate;
    private int cnt;

    // 생성자
    public BoardVO(){}

    // 전체 생성자
    public BoardVO(int id, String title, String writer, String content, Timestamp regdate, int cnt) {
        this.id = id;
        this.title = title;
        this.writer = writer;
        this.content = content;
        this.regdate = regdate;
        this.cnt = cnt;
    }

    // getter/setter
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public String getWriter() {
        return writer;
    }
    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getRegdate() {
        return regdate;
    }
    public void setRegdate(Timestamp regdate) {
        this.regdate = regdate;
    }

    public int getCnt() {
        return cnt;
    }
    public void setCnt(int cnt) {
        this.cnt = cnt;
    }
}
