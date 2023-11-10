package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.memberDAO;

public class IdCheckServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		memberDAO cyMemberDAO = new memberDAO();
		int result = 0;
		
		try {
			result = cyMemberDAO.CheckDuplicateId(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		req.setAttribute("userId", id);
		req.setAttribute("result", result);
		req.getRequestDispatcher("idCheck.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
	}
}
