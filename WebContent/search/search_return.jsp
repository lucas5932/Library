<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String[] sub = request.getParameterValues("sub");
	String subs = "";
	for(String a : sub){
		out.print(a+"<br>");
	}
%>
	
	<input type="button" value="돌아가기" onclick="javascript:history.back()">
	