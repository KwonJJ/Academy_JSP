<%@page import="common.JSFunction"%>
<%@page import="dao.ProductRepository"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pid = request.getParameter("pid");

	ProductRepository dao = new ProductRepository();
	int result=dao.deleteProduct(pid);
	dao.close();
	
	if(result==1) {	
		JSFunction.alertLocation("상품이 삭제되었습니다.", 
				"products.jsp", out);
	} else {
		request.getRequestDispatcher("deleteProduct.jsp?error=1")
		.forward(request,response);
	}	
%>    