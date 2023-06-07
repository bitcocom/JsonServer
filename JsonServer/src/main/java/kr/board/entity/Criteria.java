package kr.board.entity;

import lombok.Data;

@Data
public class Criteria {
   private int page; // 4, 5
   private int perPageNum; // 10
   public Criteria() {
	   this.page=1;
	   this.perPageNum=3; // ?
   }
   // 시작페이지 번호를 구하는 메서드 : limit , 
   public int getPageStart() {
	   return (page-1)*perPageNum; //1page->0~9 , 2page->10~19, 3page->20~29
   }
}
