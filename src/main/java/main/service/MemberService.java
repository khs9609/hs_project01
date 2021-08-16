package main.service;

import org.springframework.stereotype.Service;

public interface MemberService {
	
	//회원가입 저장처리
	public String insertMember(MemberVO vo) throws Exception;
}
