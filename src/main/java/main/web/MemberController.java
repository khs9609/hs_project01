package main.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.MemberService;
import main.service.MemberVO;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	public MemberService memberService;
	
	/* 회원가입 화면 */
	@RequestMapping("/memberWrite.do")
	public String memberWrite() {
		
		return "HsMember/memberWrite";
	}
	
	/* 회원가입 처리 */
	@RequestMapping("/memberWriteSave.do")
	@ResponseBody
	public String insertMember(MemberVO vo) throws Exception{
		
		String msg = "";
		String result = memberService.insertMember(vo);
		if(result == null) {
			msg = "ok";
		}
		
		return msg;
	}
	
	/* 아이디 중복체크 */
	@RequestMapping("/idcheck.do")
	@ResponseBody
	public String selectMemberIdcheck(MemberVO vo) throws Exception {
		
		String msg = "";
		int count = memberService.selectMemberIdcheck(vo);
		if(count == 0) {
			msg = "ok";
		}
		
		return msg;
	}
	
}
