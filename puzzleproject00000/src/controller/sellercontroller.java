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



public class sellercontroller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI= request.getRequestURI(); // 프로젝트와 파일경로 둘다가져옴
		String contextPath= request.getContextPath(); // 프로젝트만 가져옴
		String command=requestURI.substring(contextPath.length()); // 파일경로만 가져옴 
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//파일경로만 가져오기때문에 앞부분 자르고 *.product 가져올수 있음.
		if(command.equals("/addproduct.product")) { // 상품 등록처리
			addproduct(request, response);
		} else if(command.equals("/getAllproducts.product")){ // 상품목록 가져오기
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
		} else if(command.equals("/getproduct.product")){ // 상품 상세보기 가져오기
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
		}
	}


	
	
	//상품등록 메소드
	public void addproduct(HttpServletRequest request, HttpServletResponse response) {
		ServletContext application=getServletContext();
		String saveDirectory=application.getRealPath("/resources/images"); //저장할 디렉토리
//		String realFolder="C:\\jsp\\puzzleproject\\WebContent\\resources\\img"; // 실제 c:jsp 폴더에 저장
		
		int maxPostSize=1024*10000; // 파일 최대크기 (10MB)
		String encoding="utf-8"; 
		try {
		MultipartRequest mr=new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		
		String productId = mr.getParameter("productId");
		String productName = mr.getParameter("productName");
		int productUnitPrice = Integer.parseInt(mr.getParameter("productUnitPrice")); 
		String productDescription = mr.getParameter("productDescription");
		String productBrand = mr.getParameter("productBrand");
		String productCategory1 = mr.getParameter("productCategory1");
		String productCategory2 = mr.getParameter("productCategory2");
		int productInStock =Integer.parseInt(mr.getParameter("productInStock"));  
		String productImage = mr.getFilesystemName("productImage");
		
		
		productDTO productdto=new productDTO();
		productdto.setProductId(productId);
		productdto.setProductName(productName);
		productdto.setProductUnitPrice(productUnitPrice);
		productdto.setProductDescription(productDescription);
		productdto.setProductBrand(productBrand);
		productdto.setProductCategory1(productCategory1);
		productdto.setProductCategory2(productCategory2);
		productdto.setProductInStock(productInStock);
		productdto.setProductImage(productImage);
		
		productDAO productdao=new productDAO(); 
		int result =productdao.addProduct(productdto);
		if( result==1) {
			
			response.sendRedirect("./sellerpage_home.jsp");
		} else {
			request.setAttribute("warn", "등록에 실패하였습니다.");
			request.getRequestDispatcher("./sellerpage_addProduct.jsp").forward(request, response);
		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
}


