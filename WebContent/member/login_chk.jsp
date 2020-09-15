<%@page import="login.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	if(id.equals("admin77") && pwd.equals("admin77")){
		session.setAttribute("id",id);
		session.setAttribute("status", true);
		response.sendRedirect("../main/main.jsp");
	}
	
	memberDAO rdao = memberDAO.getInstance();
	boolean flag = rdao.getLogin(id, pwd);
	String msg ="";
	String url ="";
	if(flag){
		msg ="로그인 성공";
		session.setAttribute("id", id);
		session.setAttribute("status", false);
		url ="../main/main.jsp";
	}else{
		msg ="존재하지 않는 아이디거나 비밀번호가 틀립니다.";
		url ="login.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
