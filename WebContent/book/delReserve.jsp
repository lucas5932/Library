<%@page import="reserve.reserveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String title = request.getParameter("title");
	String msg = "";
	reserveDAO rdao = reserveDAO.getInstance();
	int cnt = rdao.delReserve(id, title);
	if(cnt > 0) {
		response.sendRedirect("info.jsp");
	}else{
		msg = "삭제 오류";
	}
%>
<script type="text/javascript">
	alert('<%=msg%>');
</script>