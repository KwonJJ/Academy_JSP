package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import memberDAO.memberDAO;
import memberDTO.memberDTO;
import productDAO.productDAO;
import productDTO.productDTO;



public class productsearchcontroller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI= request.getRequestURI(); // 프로젝트와 파일경로 둘다가져옴
		String contextPath= request.getContextPath(); // 프로젝트만 가져옴
		String command=requestURI.substring(contextPath.length()); // 파일경로만 가져옴 
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//파일경로만 가져오기때문에 앞부분 자르고 *.search 가져올수 있음.
		if(command.equals("/leftmenu.search")) { // 상품카테고리 찾기 메소드
			leftmenusearch(request, response);
			request.getRequestDispatcher("./welcome_top.jsp").forward(request, response);
		} else if(command.equals("/view.search")) { // 상품 상세페이지
			productview(request, response);
			request.getRequestDispatcher("./items_info.jsp").forward(request, response);
		} 
	}


	
	
	//상품카테고리 찾기 메소드
	public void leftmenusearch(HttpServletRequest request, HttpServletResponse response) {
		
		String productCategory1 = request.getParameter("productCategory1");
		String productCategory2 = request.getParameter("productCategory2");
		if(productCategory1==null) {
			productCategory1="0";
		}
		if(productCategory2==null) {
			productCategory2="0";
		}
		
		
		productDTO productdto=new productDTO();
		productDAO productdao=new productDAO(); 
		ArrayList<productDTO> productlist = new ArrayList<productDTO>();
		productlist=productdao.getcategoryProduct(productCategory1, productCategory2);
		
			request.setAttribute("productlist", productlist);
	}
	
	//상품카테고리 찾기 메소드
	public void productview(HttpServletRequest request, HttpServletResponse response) {
		
		String productId = request.getParameter("productId");
		
		productDTO productdto=new productDTO();
		productDAO productdao=new productDAO(); 
		productdto=productdao.detailProduct(productId);
		
		request.setAttribute("productdto", productdto);
	}
}

	
	


