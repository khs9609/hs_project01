package main.service;

import java.util.List;

public interface BoardService {
	
	//게시판 저장처리
	public String insertBoard(BoardVO vo) throws Exception;
	
	// 게시판 보기
	public List<?> selectBoard(BoardVO vo) throws Exception;
	
	//게시판 Total 개수
	public int selectTotalBoard(BoardVO vo) throws Exception;
	
	//게시판 상세보기 화면
	public BoardVO selectBoardDetail(int unq) throws Exception;
	
	//조회수 증가
	public int updateBoardHits(int unq) throws Exception;
	
	//게시판 수정처리
	public int updateBoard(BoardVO vo) throws Exception;
	
	//암호일치검사
	public int selectBoardPass(BoardVO vo) throws Exception;
	
	//게시글 삭제
	public int deleteBoard(BoardVO vo) throws Exception;
	
}
