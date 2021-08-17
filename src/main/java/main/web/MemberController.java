package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
	
	/* 우편번호 검색 1 */
	@RequestMapping("post1.do")
	public String post1(MemberVO vo) {
		
		return "HsMember/post1";
	}
	
	/* 우편번호 검색 결과 리스트 */
	@RequestMapping("/post2.do")
	public String post2(String dong, ModelMap model) throws Exception{
		
		List<?> list = memberService.selectPostList(dong);
		model.addAttribute("resultList", list);
		
		return "HsMember/post2";
	}
	
}
