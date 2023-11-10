package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Guestbook;
import model.GuestbookDAO;

public class GuestbookServlet extends HttpServlet {
	
	private GuestbookDAO guestbookDAO;
	
	@Override
	public void init() throws ServletException {
		guestbookDAO = new GuestbookDAO();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = req.getSession();
		String loginUserId = (String) session.getAttribute("loginUserId");
		String owner_id = req.getParameter("owner_id");
		System.out.println(owner_id);
		String content = req.getParameter("content");
		
		Guestbook guestbook = new Guestbook();
		guestbook.setId(loginUserId);
		guestbook.setOwner_id(owner_id);
		guestbook.setContent(content);
		
		guestbookDAO.InsertGuestbook(guestbook, loginUserId);
		resp.sendRedirect("guestbook.jsp?id=" + owner_id);
		
	}
}
