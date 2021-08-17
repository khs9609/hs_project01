package main.serviceImpl;


import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.MemberVO;

@Repository("memberDAO")
public class MemberDAO extends EgovAbstractDAO{

	public String insertMember(MemberVO vo) {
		return (String) insert("memberDAO.insertMember",vo);
	}

	public int selectMemberIdcheck(MemberVO vo) {
		return (int) select("memberDAO.selectMemberIdcheck",vo);
	}

	public List<?> selectPostList(String dong) {
		return list("memberDAO.selectPostList", dong);
	}

}
