package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService") //서비스와 동일해야 한다.
	private BoardService boardService;
	
	/* 홈페이지 */
	@RequestMapping("/main.do")
	public String main() {
		
		return "HsBoard/main";
	}
	
	/* 게시판 글쓰기 */
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		
		return "HsBoard/boardWrite";
	}
	
	/* 게시판 글 저장처리 */
	@RequestMapping("/boardWriteSave.do")
	@ResponseBody
	public String insertBoard(BoardVO vo) throws Exception {
		
		String result = boardService.insertBoard(vo);
		String msg = "";
		if(result == null) msg = "ok";
		else msg = "fail";
		
		return msg;
	}

	/* 게시판목록보기 */
	@RequestMapping("/boardList.do")
	public String selectBoard(BoardVO vo, ModelMap model) throws Exception{
		
		//보여줄 페이지  수
		int unit = 10;
		
		// total 갯수 가져오기
		int total = boardService.selectTotalBoard(vo);
		
		//12/10 = ceil(1.2) -> Integer(2.0) -> 2
		int totalPage = (int) Math.ceil((double)total/unit);
		
		int viewPage = vo.getViewPage();
		
		// 임의로 주소창에 viewPage를 건드렸을 때 상황을 대비 (1페이지를 출력하도록)
		if(viewPage > totalPage || viewPage < 1) {
			viewPage = 1;
		}
		
		// 페이지 시작 번호와 끝번호 설정
		int startIndex = (viewPage-1) * unit + 1;
		int endIndex = startIndex + (unit-1);
		
		// unq같은 rowNumber설정
		int startRowno = total - (viewPage - 1) * unit;
		
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		
		List<?> list = boardService.selectBoard(vo);
		
		
		//패이징 처리를 위한 처리
		model.addAttribute("rowNumber", startRowno);
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		
		
		model.addAttribute("resultList", list);
		
		return "HsBoard/boardList";
	}
	
	/* 게시판 상세보기 */
	@RequestMapping("/boardDetail.do")
	public String selectBoardDetail(BoardVO vo, ModelMap model) throws Exception{
		
		BoardVO boardVO = boardService.selectBoardDetail(vo.getUnq());
		
		// 줄 바꿈을 위한 처리-------------
		String content = boardVO.getContent();
		boardVO.setContent(content.replace("\n","<br>"));
		// 줄바꿈을 위한 처리 -------------
		
		//조회수 증가
		boardService.updateBoardHits(vo.getUnq());
		
		
		model.addAttribute("boardVO", boardVO);
		
		
		return "HsBoard/boardDetail";
	}
	
	/* 게시판 수정화면 */
	@RequestMapping("/boardModify.do")
	public String selectBoardModify(BoardVO vo, ModelMap model) throws Exception{
		
		BoardVO boardVO = boardService.selectBoardDetail(vo.getUnq());
		model.addAttribute("boardVO" ,boardVO);
		
		return "HsBoard/boardModify";
	}
	
	/* 게시판 수정처리 */
	@RequestMapping("/boardModifySave.do")
	@ResponseBody
	public String updateModify(BoardVO vo) throws Exception{
		
		//암호일치 검사
		int result = 0;
		int count =  boardService.selectBoardPass(vo); // 정상 : int count = 1;
		if(count == 1) {
			// boardWrite에서 했던 방식이랑 다르게 넘긴다. 바로 넘어가게
			result = boardService.updateBoard(vo); // 정상 : int result = 1;
		}else {
			result = -1;
		}
		
		return result + "";
	}
	/* 게시판 삭제화면  */
	@RequestMapping("passWrite.do")
	public String passWrite(int unq,ModelMap model) {
		
		model.addAttribute("unq", unq);
		
		return "HsBoard/passWrite";
	}
	
	
	/* 게시판 삭제처리 */
	@RequestMapping("boardDelete.do")
	@ResponseBody
	public String deleteBoard(BoardVO vo) throws Exception{
		
		int result = 0;
		// 암호일치 검사
		// 게시글에 등록된 암호와 같다면 삭제처리
		int count = boardService.selectBoardPass(vo);
		if(count== 1) {
			result = boardService.deleteBoard(vo);
		}else if(count == 0) {
			result = -1;
		}
		
		
		
		return result + "";
	}
	
	
}
