package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import model.member;
import model.memberDAO;

public class RegisterServlet extends HttpServlet {
	
	private memberDAO cymemberDAO;
	
	public void init() {
		cymemberDAO = new memberDAO();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String saveDirectory = req.getSession().getServletContext().getRealPath("./resources/image");
		int maxPostSize = 1024 * 1024 * 5;
		String encoding = "utf-8";
		
		MultipartRequest mr = new MultipartRequest(req, saveDirectory, maxPostSize, encoding);
		
		String id = mr.getParameter("id");
		String pw = mr.getParameter("pw");
		String email = mr.getParameter("email") + "@" + mr.getParameterValues("com")[0];
		String phone = mr.getParameterValues("phone-1")[0] + "-" + mr.getParameter("phone-2") + "-" + mr.getParameter("phone-3");
		String isAdmin = mr.getParameter("grant");
		String imgName = mr.getOriginalFileName("imgName");
		
		member cyMember = new member();
		
		cyMember.setId(id);
		cyMember.setPassword(pw);
		cyMember.setEmail(email);
		cyMember.setPhone(phone);
		cyMember.setIsAdmin(isAdmin);
		cyMember.setImgName(imgName);
		
		try {
			cymemberDAO.CreateMember(cyMember);
			req.getSession().setAttribute("id", id);
			resp.sendRedirect("RegisterSuccess.jsp");
			
		} catch(Exception e) {
			e.printStackTrace();
			resp.sendRedirect("error.jsp");
		}
	}
	
	
}
