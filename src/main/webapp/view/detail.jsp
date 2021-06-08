<%@page import="com.ict.db.VO"%>
<%@page import="com.ict.db.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("idx");
	
	VO vo = DAO.getInstance().getDetail(id);		
	request.setAttribute("vo2", vo); 
	
	// onelist가 vo2로 찍기때문에 이름을 vo2로 보냄	
%>
	<!-- 페이지 이동하면서 request 정보를 사용하려면 forward 사용 -->
	<jsp:forward page="onelist.jsp" />