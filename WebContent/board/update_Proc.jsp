<%@page import="board.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("num");
	String pn = request.getParameter("pn");
%>
<jsp:useBean id="ndto" class="board.noticeDTO"/>	
<jsp:setProperty property="*" name="ndto"/>
<%
	noticeDAO ndao = noticeDAO.getInstance();
	int cnt = ndao.updateN(ndto);
	String msg =""; 
	if(cnt >0){
		msg="수정 성공";
	}else{
		msg="수정 실패";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="content.jsp?num=<%=num%>&pn=<%=pn%>";
</script>