package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GuestbookDAO;

public class GuestbookDeleteServlet extends HttpServlet{
	
	private GuestbookDAO guestbookDAO;
	
	@Override
	public void init() throws ServletException {
		guestbookDAO = new GuestbookDAO();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 싸이월드 방명록 게시글 삭제 서블릿
		String id = req.getParameter("id");
		String deleteNo = req.getParameter("deleteNo");
		
		if(deleteNo != null && !deleteNo.isEmpty()) {
			int no = Integer.parseInt(deleteNo);
			guestbookDAO.deleteGuestbook(no);
		}
		
		resp.sendRedirect("guestbook.jsp?id=" + id);
		return;
		
	}
}
