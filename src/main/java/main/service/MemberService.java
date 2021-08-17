package main.service;


public interface MemberService {
	
	//회원가입 저장처리
	public String insertMember(MemberVO vo) throws Exception;
	
	//아이디 중복체크
	public int selectMemberIdcheck(MemberVO vo) throws Exception;
}
