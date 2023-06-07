package kr.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.board.entity.Member;
import kr.board.mapper.BoardMapper;

@Controller
public class LoginController {

	@Autowired
	private BoardMapper mapper;
	
	@RequestMapping("/login.do")  // username, password
	public String login(Member vo, HttpSession session) {
		Member mvo=mapper.login(vo);
		if(mvo!=null) { // 로그인 성공
			// 객체바인딩(HttpSession)
			session.setAttribute("mvo", mvo);
		}
		return "redirect:/list.do"; // left.jsp(인증여부를 확인)
	}
	 @RequestMapping("/logout.do")
	 public String logout(HttpSession session) {
		 session.invalidate(); // 세션무효화(로그아웃)
		 //session.removeAttribute("mvo");
		 return "redirect:/list.do";
	 }	 
}












