package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GuestbookDAO;

public class GuestbookReplyDeleteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		int deleteR_no = Integer.parseInt(req.getParameter("deleteR_no"));
		
		GuestbookDAO dao = new GuestbookDAO();
		dao.ReplyDelete(deleteR_no);
		
		resp.sendRedirect("guestbook.jsp?id=" + id);
	}
}
