package kr.board.entity;

import lombok.Data;

@Data
public class Customer {
	  private int id;
	  private String name;
	  private String company;
	  private String gender;
	  private String email;
	  private String phone;
	  private String address;
	  private int zonecode;
	  private String roadAddress;
	  private String address2;	
}
