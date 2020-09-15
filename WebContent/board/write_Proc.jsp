<%@page import="board.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ndto" class="board.noticeDTO"/>	
<jsp:setProperty property="*" name="ndto"/>
<%
	noticeDAO ndao = noticeDAO.getInstance();
	int cnt = ndao.insertN(ndto);
	String msg ="";
	String url ="";
	if(cnt >0){
		msg="작성 성공";
		url ="notice.jsp";
	}else{
		msg="작성 실패";
		url ="writeForm.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
	