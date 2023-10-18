package model2.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPage;


public class ListController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MVCBoardDAO dao = new MVCBoardDAO(); // 데이터베이스 접속
		
		Map<String, Object> map = new HashMap<>();
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		
		int totalCount = dao.selectCount(map); // 전체 게시물 개수 저장
		
		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		int pageNum = 1; // 페이지 번호 초기값 설정
		String pageTemp = request.getParameter("pageNum");
		// 사용자가 클릭한 페이지 번호를 가져와 pageNum에 저장함
		if(pageTemp!=null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);
		
		// 각 페이지의 시작 번호와 끝 번호를 설정
		int start = (pageNum-1) * pageSize + 1;
		int end = pageNum * pageSize;
		map.put("start",start);
		map.put("end",end);
		
		List<MVCBoardDTO> boardLists = dao.selectList(map);
		
		dao.close();
		
		String pagingImg =  BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../mvcboard/list.do");
		map.put("pagingImg",pagingImg);
		map.put("totalCount",totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		request.setAttribute("boardLists", boardLists);
		request.setAttribute("map",map);
		request.getRequestDispatcher("/14MVCBoard/List.jsp").forward(request, response);
		
	}

}











