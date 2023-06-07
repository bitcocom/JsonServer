package kr.board.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.board.entity.Board;
import kr.board.entity.Criteria;
import kr.board.entity.PageMaker;
import kr.board.mapper.BoardMapper;

// Controller
@Controller
public class BoardController { // new BoardController();

	@Autowired
	private BoardMapper mapper;
	// 요청-->처리메서드 : 핸들러매핑(HandlerMapping)
	// [게시판리스트보기 요청]이 오면 처리하는 [메서드]를 만들자
	@RequestMapping("/list.do")
	public String list(Criteria cri, Model model) {
		List<Board> list=mapper.getLists(cri); //page=3, perPageNum=3
		model.addAttribute("list", list);// 객체바인딩
		// list.jsp 넘겨주는것(ViewResolver)
		// 페이징처리에 필요한 PageMaker를 생성하기
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount());
		model.addAttribute("pm", pm);
		
		return "board/list"; // /WEB-INF/views/board/list.jsp
	}
	
	@RequestMapping("/register.do")
	public String register() {
		return "board/register"; // register.jsp : forward
	}
	
	@RequestMapping("/insert.do")
	public String insert(Board vo) {// 파라메터수집(VO)
		mapper.insert(vo); // 등록성공
		// 등록후 다시 리스트페이지로 전환(redirect)
		return "redirect:/list.do";
	}
	
	@RequestMapping("/get.do")  // ?num=5
	public String get(@RequestParam("num") int num, Model model,@ModelAttribute("cri") Criteria cri) {
	    Board vo=mapper.get(num);
		model.addAttribute("vo",vo); //객체바인딩
		//model.addAttribute("cri", cri);
		//조회수 누적
		mapper.count(num);
		return "board/get"; // get.jsp : forward
	}
	
	@RequestMapping("/remove.do") // ?num="20"
	public String remove(int num) {
        mapper.remove(num);        
		return "redirect:/list.do";
	}
	
	@GetMapping("/update.do") // ?num=10
	public String update(int num, Model model) {
		Board vo=mapper.get(num);
		model.addAttribute("vo", vo);
		return "board/update"; // update.jsp
	}
	@PostMapping("/update.do") // num, title, content : VO(파라메터수집)
	public String update(Board vo, RedirectAttributes rttr) {
		mapper.update(vo);
		// 수정후 다시 리스트페이지로 이동(/list.do)
		// 수정후 다시 상세보기페이지로 이동(/get.do?num=10)
		rttr.addAttribute("num", vo.getNum()); // ?num=10
		return "redirect:/get.do"; // ?num=10
	}
	@GetMapping("/reply.do")
	public String reply(int num, Model model) { // num=>원글(부모글)의 번호
		Board vo=mapper.get(num);
		model.addAttribute("vo", vo);
		return "board/reply"; // reply.jsp
	}
	@PostMapping("/reply.do")
	public String reply(Board vo) { //num(부모의),username, title, content, writer, bgroup, bseq, blevel
		// 1. 부모의 정보 가져오기
		Board parent=mapper.get(vo.getNum());
		// 2. 부모의 bgroup값을->답글의 bgroup
		vo.setBgroup(parent.getBgroup());
		// 3. 부모의 bseq값에+1->답글의 bseq에 
		vo.setBseq(parent.getBseq()+1);
		// 4. 부모의 blevel값에+1->답글의 blevel에
		vo.setBlevel(parent.getBlevel()+1);
		// 5. 부모의 bgroup과 같고 부모의 bseq보다 큰 답글들을 모두 bseq+1
		mapper.replyUpdate(parent);
		// 6. 만들어진 답글을 저장
		mapper.replyInsert(vo);
		return "redirect:/list.do";
	}
	
}





