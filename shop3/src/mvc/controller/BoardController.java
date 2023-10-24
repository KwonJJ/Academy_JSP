package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static final int LISTCOUNT=5;   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		if(command.equals("/BoardListAction.do")) {   //등록된 글 출력하기
			requestBoard(request);
			request.getRequestDispatcher("./board/list.jsp").forward(request, response);
			
		} else if(command.equals("/BoardWriteForm.do")) {   // 글 등록 페이지 출력
			request.getRequestDispatcher("./board/write.jsp").forward(request, response);
		
		} else if(command.equals("/BoardWriteAction.do")) { // 서버에 새로운 글 등록
			requestBoardWrite(request);
			request.getRequestDispatcher("/BoardListAction.do").forward(request, response);
			
		} else if(command.equals("/BoardViewAction.do")) { // 게시판 세부내용 출력
			requestBoardView(request);
			request.getRequestDispatcher("./board/View.jsp").forward(request, response);
		}
	
	}
	
	
	public void requestBoard(HttpServletRequest request) {  // 등록된 글 목록 가져오기
		BoardDAO dao = new BoardDAO();  // DB 연결
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
	  	int pageNum=1;
		int limit=LISTCOUNT;   // 한 페이지당 표시할 게시물 개수 (상수값으로 5로 설정함)
		
		if(request.getParameter("pageNum")!=null)
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
				
		String items = request.getParameter("items");  //검색 항목
		String text = request.getParameter("text");    //검색 내용
		
		int total_record=dao.getListCount(items, text); //조건에 맞는 행 개수
		boardlist = dao.getBoardList(pageNum, limit, items, text); 
		dao.close();
		// 페이지개수, 한 화면에 표시할 행 개수, 검색 항목, 검색 내용을 boardlist에 대입 
		
		int total_page;   // 전체 페이지
		if (total_record % limit == 0){    
		// 전체 게시물 개수에서 한 페이지당 표시할 개수를 나눈 나머지가 0과 같으면
		// 예) 한 페이지당 10개씩 게시물을 표시함, 전체 게시물이 100개
		// 100 / 10 ->  나머지 0   전체 페이지수는 10으로 표시함
	     	total_page =total_record/limit;
	     	Math.floor(total_page);  
		}
		else{
		// 예) 한 페이지당 10개씩 표시, 전체 게시물이 105개이면
		// 전체 페이지 수는 10개에 더하기 1을 추가하여 11페이지가 나와야 함
		   total_page =total_record/limit;
		   Math.floor(total_page); 
		   total_page =  total_page + 1; 
		}		
   
   		request.setAttribute("pageNum", pageNum);		  
   		request.setAttribute("total_page", total_page);   
		request.setAttribute("total_record",total_record); 
		request.setAttribute("boardlist", boardlist);
	}
	
	public void requestBoardWrite(HttpServletRequest request) {
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		dto.setId(request.getParameter("id"));
		dto.setName(request.getParameter("name"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));

		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
		
		String regist_day = formatter.format(new java.util.Date());
		
		dto.setHit(0); // 조회수 0으로 초기값 설정
		dto.setRegist_day(regist_day); // 오늘 날짜를 등록 일자로 입력
		dto.setIp(request.getRemoteAddr()); // ip주소는 현재 컴퓨터 ip주소 입력
		
		dao.boardWrite(dto); // boardDAO호출해서 삽입 구문 처리
		dao.close();
	}
	
	public void requestBoardView(HttpServletRequest request) {
		BoardDAO dao = new BoardDAO();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDTO board = new BoardDTO();
		board = dao.BoardByNum(num); // dao의 메소드 이용해서 상세 내용 가져오기
		dao.close();
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board", board);
		
	}
}








