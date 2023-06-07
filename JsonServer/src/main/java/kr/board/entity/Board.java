package kr.board.entity;

import java.util.Date;

import lombok.Data;
// Lombok API : http://mvnrepository.com
@Data
public class Board {

	private int num; // 번호
	private String username; // 회원아이디
	private String title; // 제목
	private String content; // 내용
	private String writer; // 작성자
	private Date indate; // 작성일 java.util.Date
	private int count; // 조회수
	// 답변형 게시판에 필요한 멤버변수
	private int bgroup; // 원글(부모글)과 답글을 하나로 묶을때
	private int bseq; // 답글의 순서를 지정
	private int blevel; // 답글의 들여쓰기
    private int bdelete; // 게시글의 삭제여부(정상:0 --update--> 삭제:1)
}
