package main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("/memberWrite.do")
	public String memberWrite() {
		
		return "HsMember/memberWrite";
	}
	
	
}