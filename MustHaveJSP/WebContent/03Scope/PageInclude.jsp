<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="common.Person"%>
<%
	int pInteger2 = (Integer) (pageContext.getAttribute("pageInteger"));
	String pString2 = pageContext.getAttribute("pageString").toString();
	Person nPerson2 = (Person) (pageContext.getAttribute("pagePerson"));
%>

<ul>
	<li>Integer 객체 : <%=pInteger2%></li>
	<li>String 객체 : <%=pString2%></li>
	<li>Person 객체 : <%=nPerson2.getName()%></li>
</ul>