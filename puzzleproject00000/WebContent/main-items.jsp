<%@page import="productDTO.productDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="productDAO.productDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	productDAO productdao= new productDAO();
	ArrayList<productDTO> productlist = new ArrayList<productDTO>();
	productlist=productdao.getAllProduct();
	session.setAttribute("productlist", productlist);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main-items</title>
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/main-items.css">
</head>
<body>
	<div class="container">
      <div class="container-subject">
        <div>
          <h2>Hot Items</h2>
        </div>
      </div>
      <ul class="items-wrapper">
   		<c:forEach var="productlist" items="${productlist }">
	        <li class="items">
	          <div>
	          	<div class="item-box">
	            	<a href="./view.search?productId=${productlist.productId }"><img src="resources/images/${productlist.productImage }" alt="item" /></a>
	          	</div>
	          		<p class="brand">${productlist.productBrand }</p>
	          		<p class="item-name"><a href="./view.search?productId=${productlist.productId }">${productlist.productName }</a></p>
	            	<p class="item-price">${productlist.productUnitPrice }원</p>
	          </div>
	        </li>
		</c:forEach>
      </ul>
    </div>
</body>
</html>