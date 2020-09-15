<%@page import="board.noticeDTO"%>
<%@page import="board.noticeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../main/top.jsp"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pn = request.getParameter("pn");
	noticeDAO ndao = noticeDAO.getInstance();
	noticeDTO ndto = ndao.getNoticeByNo(num); 

%>
<table class="table_w" border="1">
	<tr>
		<td height="500px" valign="top" align="center">
			<div class="titleWrap">
				<span class="Title">내용보기</span>
			</div>	
			<table border ="1" width="90%" cellpadding="5px">
			<tr>
				<td align="center" width="20%">중요도</td>
				<td width="30%"> <%= ndto.getImportant() %>
				</td>
				<td align="center" width="20%">조회수</td>
				<td width="30%"> <%= ndto.getReadcount() %>
				</td>
			</tr>
			<tr>
				<td align="center" width="20%">제목</td>
				<td width="80%" colspan="3"> <%= ndto.getTitle() %>			
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">내용</td>
			</tr>
			<tr>
				<td colspan="4">
					<%= ndto.getContent() %>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="right">
				<%if(status){ %>
					<input type="button" value="수정하기" onclick="location.href='updateForm.jsp?num=<%=num%>&pn=<%=pn%>'">
					<%} %>
					<input type="button" value="돌아가기" onclick="location.href='notice.jsp?pn=<%=pn%>'">
				</td>
			</tr>
			</table>
		</td>
	</tr>
</table>

<%@ include file="../main/bottom.jsp"%>