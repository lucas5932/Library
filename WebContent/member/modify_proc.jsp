<%@page import="login.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rdto" class="login.memberDTO"/>
<jsp:setProperty property="*" name="rdto"/>
<%
	String b_year = request.getParameter("b_year");
	String b_month = request.getParameter("b_month");
	String b_day = request.getParameter("b_day");
	
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");

	rdto.setBirth(b_year+"-"+b_month+"-"+b_day);
	rdto.setPhone(phone1+phone2+phone3);
	
	memberDAO rdao = memberDAO.getInstance();
	int cnt = rdao.modifyData(rdto); 
	String msg = "";
	String url = "";
	if(cnt > 0){
		msg = "성공적으로 수정되었습니다.";
		url = "../main/main.jsp";
	}else{
		msg = "수정 실패했습니다.";
		url ="../modify_data.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>