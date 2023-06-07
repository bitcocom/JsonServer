package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.board.entity.Customer;
import kr.board.entity.Member;
import kr.board.mapper.BoardMapper;

@Controller
public class JsonController {
    
	@Autowired
	private BoardMapper mapper;
	
	@GetMapping("/customers")	
    public @ResponseBody List<Customer> customers(){
		return mapper.getMembers();
	}
	// 상세보기 요청
	@GetMapping("/customers/{id}")	
    public String getCustomer(@PathVariable String id, Model model){
		Customer cus=mapper.detailMember(id);
		model.addAttribute("cus",cus);
		return "json/dom_crud_detail"; //dom_crud_detail.jsp 
	}	
	// 등록하기 
	@PostMapping("/customers")	
    public @ResponseBody int registerCustomers(@RequestBody Customer member){
		//System.out.println(member);
		//mapper.insMember(member);
		return mapper.insMember(member); // mapper.insMember(member)
	}
	
	@PutMapping("/customers/{id}")	
    public @ResponseBody int modifycustomers(@RequestBody Customer member, @PathVariable int id){
		//mapper.InsMember(member);
		//mapper.modifyMember(member);
		member.setId(id);
		System.out.println(id);
		return mapper.modifyMember(member);
	}
	
	@DeleteMapping("/customers/{id}")	
    public @ResponseBody int deleteCustomers(@PathVariable String id){
		//mapper.InsMember(member);
		//mapper.deleteMember(id);
		System.out.println(id);
		return mapper.deleteMember(id);
	}	
	//시작요청
	@RequestMapping("/index")
	public String index() {
		return "json/dom_crud_list"; // dom_crud_list.jsp
	}
	
	//시작요청
	@RequestMapping("/multi")
	public String multi() {
		return "json/dom_crud_multiple"; // dom_crud_list.jsp
	}
		
	// 등록요청
	@RequestMapping("/create")
	public String create() {
		return "json/dom_crud_create"; // dom_crud_create.jsp
	}
	
	// 수정화면요청
	@GetMapping("/modify/{id}")
	public String modify(@PathVariable String id, Model model) {
		Customer cus=mapper.detailMember(id);
		model.addAttribute("cus", cus);
		return "json/dom_crud_update"; // dom_crud_update.jsp		
	}
}
