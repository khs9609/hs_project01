package main.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.BoardVO;

@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO {

	public String insertBoard(BoardVO vo) {
		return (String) insert("boardDAO.insertBoard", vo);
	}

	public List<?> selectBoard(BoardVO vo) {
		return list("boardDAO.selectBoard", vo);
	}

	public int selectTotalBoard(BoardVO vo) {
		return (int) select("boardDAO.selectTotalBoard", vo);
	}
	
	//게시판 상세보기
	public BoardVO selectBoardDetail(int unq) {
		return (BoardVO)select("boardDAO.selectBoardDetail", unq);
	}

	public int updateBoardHits(int unq) {
		return (int) update("boardDAO.updateBoardHits", unq);
	}

	public int updateBoard(BoardVO vo) {
		return (int) update("boardDAO.updateBoard", vo);
	}

	public int selectBoardPass(BoardVO vo) {
		return (int) select("boardDAO.selectBoardPass", vo);
	}

	public int deleteBoard(BoardVO vo) {
		return delete("boardDAO.deleteBoard",vo);
	}

	
}
