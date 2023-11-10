package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.member;
import model.memberDAO;

public class RegisterServlet extends HttpServlet {
	
	private memberDAO cymemberDAO;
	
	public void init() {
		cymemberDAO = new memberDAO();
	}
	
	@Override
	public void destroy() {
		cymemberDAO.close();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String realFolder = req.getServletContext().getRealPath("/resources/img");
		String realFolder2 = "C:\\jsp\\CloneCyworld\\WebContent\\resources\\img";
		System.out.println(realFolder);
		resp.setContentType("text/html; charset=UTF-8");
		int maxSize = 5 * 1024 * 1024;
		String encType = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(req, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
		String id = mr.getParameter("id");
		String pw = mr.getParameter("pw");
		String email = mr.getParameter("email") + "@" + mr.getParameterValues("com")[0];
		String phone = mr.getParameterValues("phone-1")[0] +
				"-" + mr.getParameter("phone-2") + "-" + mr.getParameter("phone-3");
		String isAdmin = mr.getParameter("grant");
		
		Enumeration files = mr.getFileNames();
		String imgName = (String) files.nextElement();
		String fileName = mr.getFilesystemName(imgName);
		
		member cyMember = new member();
		cyMember.setId(id);
		cyMember.setPassword(pw);
		cyMember.setEmail(email);
		cyMember.setPhone(phone);
		cyMember.setIsAdmin(isAdmin);
		cyMember.setImgName(fileName);
		
		try {
			cymemberDAO.CreateMember(cyMember);
			req.getSession().setAttribute("id", id);
			resp.sendRedirect("RegisterSuccess.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("error.jsp");
		}
	}
}
