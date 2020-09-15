<%@page import="login.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	request.setCharacterEncoding("UTF-8");
        	String name = request.getParameter("name");
        	String phone = request.getParameter("phone");
        	String msg ="";
        	String url ="";
        	memberDAO rdao = memberDAO.getInstance();
        	String id = rdao.findId(name, phone); 
        	if(id == ""){
        		msg = "일치하는 정보가 없습니다.";
        		url = "findid.jsp";
        	}
        	else{
        		msg = "회원님의 아이디는 ["+id+"] 입니다.";
        		url = "login.jsp";
        	}
    %>
    <script type="text/javascript">
    	alert("<%=msg%>");
    	location.href="<%=url%>";
    </script>
    