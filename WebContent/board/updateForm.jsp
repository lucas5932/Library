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
	int[] i_number = {1,2,3};
	String[] i_value = {"중요","보통","지난"};
	
	noticeDTO ndto = ndao.getNoticeByNo(num);
%>
<table class="table_w" border="1">
	<tr>
		<td height="500px" valign="top" align="center">
			<div class="titleWrap">
				<span class="Title">공지사항 내용수정</span>
			</div>	
			<form action="update_Proc.jsp" method="post">
			<table border ="1" width="90%" cellpadding="5px">
			<tr>
				<td align="center" width="20%">중요도</td>
				<td width="80%">
					<input type="hidden" name="num" value="<%=num%>">
					<input type="hidden" name="pn" value="<%=pn%>">
					<select name="important">
						<% for(int i=0; i<i_number.length;i++){%>
							<option value="<%=i_number[i]%>" <% if(i_number[i]==ndto.getImportant()) {%>selected<%} %>><%=i_value[i] %>
						<%}%>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center" width="20%">제목</td>
				<td width="80%">
					<input type="text" name="title" size="80" value="<%= ndto.getTitle()%>">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">내용</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" cols="130" rows="30" style="resize: none"><%= ndto.getContent() %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정하기">
					<input type="button" value="돌아가기" onclick="location.href='content.jsp?num=<%=num%>&pn=<%=pn%>'">
				</td>
			</tr>
			</table>
			</form>
		</td>
	</tr>
</table>

<%@ include file="../main/bottom.jsp"%>