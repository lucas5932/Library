<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../main/top.jsp"%>

<table class="table_w" border="1">
	<tr>
		<td height="500px" valign="top" align="center">
			<div class="titleWrap">
				<span class="Title">공지사항 작성</span>
			</div>	
			<form action="write_Proc.jsp" method="post">
			<table border ="1" width="90%" cellpadding="5px">
			<tr>
				<td align="center" width="20%">중요도</td>
				<td width="80%">
					<select name="important">
						<option value="1">중요
						<option value="2">보통
						<option value="3">지난
					</select>
				</td>
			</tr>
			<tr>
				<td align="center" width="20%">제목</td>
				<td width="80%">
					<input type="text" name="title" size="80">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">내용</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" cols="130" rows="30" style="resize: none"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="작성하기">
				</td>
			</tr>
			</table>
			</form>
		</td>
	</tr>
</table>

<%@ include file="../main/bottom.jsp"%>