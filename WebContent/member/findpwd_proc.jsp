<%@page import="login.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	request.setCharacterEncoding("UTF-8");
        	String id = request.getParameter("id");
        	String phone = request.getParameter("phone");
        	
        	memberDAO rdao = memberDAO.getInstance();
        	String pwd = rdao.findPwd(id, phone);
        	
        	String msg = "";
        	String url = "";
        	
        	if(pwd == ""){
        		msg ="일치하는 아이디가 없습니다.";
        		url ="findpwd.jsp";
        	}else{
        		msg ="회원님의 비밀번호는 ["+pwd+"] 입니다.";
        		url ="login.jsp";
        	}
    %>
    <script type="text/javascript">
    	alert("<%=msg%>");
    	location.href="<%=url%>";
    </script>