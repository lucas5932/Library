<%@page import="login.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	memberDAO dao = memberDAO.getInstance();
	
	String userid = request.getParameter("userid");
	System.out.println("userid : "+userid);
	
	String str = "";
	
	boolean check  = dao.dupl_check(userid);
	
	if(check){
		str = "YES";
		out.print(str);
	}else{
		str = "NO";
		out.print(str);
	}
%>