package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberDTO;



public class loginCheck extends HttpServlet {
	
	MemberDAO dao;
	
	
	@Override
	public void init() throws ServletException {
		
		dao = new MemberDAO();
	}

	@Override
	public void destroy() {
		dao.close();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		
		MemberDTO dto = dao.getMemberDTO(id, pass);
		
		String memberName = dto.getName();
		
		if(memberName != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user_id",dto.getId());
			session.setAttribute("user_name",dto.getName());
			session.setAttribute("user_pw",dto.getPass());
			request.getRequestDispatcher("login.jsp?error=1").forward(request,response);
		} else {
			request.getRequestDispatcher("login.jsp?error=2").forward(request,response);
		}
	}

}












