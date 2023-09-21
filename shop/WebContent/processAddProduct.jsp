<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "dto.Product" %>
<%@ page import = "dao.ProductRepository" %>

<% 
	request.setCharacterEncoding("utf-8");
	String productId = request.getParameter("productId");
	String pname = request.getParameter("pname");
	// String unitPirce = request.getParameter("unitPirce");
	int unitPrice = Integer.parseInt(request.getParameter("unitPirce")); //price의 int 형태
	String description = request.getParameter("description");
	String Manufacturer = request.getParameter("Manufacturer");
	String category = request.getParameter("category");
	// String unitsInStock = request.getParameter("unitsInStock");
	long unitsInStock = Long.parseLong(request.getParameter("unitsInStock"));
	String condition = request.getParameter("condition");
	
	ProductRepository pr = new ProductRepository().getInstance();
	Product newProduct = new Product(); 
	newProduct.setProductId(productId);
	newProduct.setPname(pname);
	newProduct.setUnitPrice(unitPrice);
	newProduct.setDescription(description);
	newProduct.setManufacturer(Manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(unitsInStock);
	newProduct.setCondition(condition);
	
	
	
	pr.addProduct(newProduct);
	response.sendRedirect("products.jsp");
%>