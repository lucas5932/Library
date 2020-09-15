<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>

<style type="text/css">
.main_table{
	border-top : 5px double #FFA7A7;
	border-bottom : 5px double #FFA7A7;
}
</style>
<table class="table_w main_table">
	<tr>
		<td colspan="2" height="100px" align="center">
			<%@ include file = "search_form.jsp" %>
		</td>
	</tr>
	<tr>
		<td height="150px" width="70%" valign="top"><%@ include file="noticeForm.jsp" %></td>
		<td height="150px" width="30%" align="center"><%@ include
				file="loginForm.jsp"%></td>
	</tr>
</table>

<%@ include file="bottom.jsp"%>