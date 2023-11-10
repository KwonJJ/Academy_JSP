package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GuestbookDAO;

public class GuestbookReplyServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 싸이월드 방명록 댓글 작성 서블릿
		String id = req.getParameter("id");
		int b_no = Integer.parseInt(req.getParameter("b_no"));
		String content = req.getParameter("content");
		
		GuestbookDAO dao = new GuestbookDAO();
		dao.addGuestbookReply(b_no, id, content);
		
		resp.sendRedirect("guestbook.jsp?id=" + id);
	}
}
