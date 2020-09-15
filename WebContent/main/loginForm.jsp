<%@page import="rental.rentalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="loginForm.css">

<% 
if(id== null){ %>
<table id="login_form" cellpadding="10px" width="100%" height="100%">
	<tr>
		<td align="center">
			<input type="button" value="로그인" onclick="location.href='../member/login.jsp'">
			<input type="button" value="회원가입" onclick="location.href='../member/register.jsp'">
		</td>
	</tr>
	<tr>
		<td align ="center">
			<a href="../member/findid.jsp">아이디 찾기</a> | 
			<a href="../member/findpwd.jsp">비밀번호 찾기</a>
		</td>
	</tr>
	
</table>

<% } else if(id.equals("admin77")){	%>
<table id="login_form" width="100%" height="100%" cellpadding="10px">
	<tr>
		<td> 관리자님 </td>
		<td align="center"><a href="../member/logout.jsp">로그아웃</a></td>
	</tr>
	<tr>
		<td colspan="2" align="left">
		 	<span>[바로가기]</span><br>
			<a href="../admin/manager.jsp">▶ 회원 관리</a><br>
			<a href="">▶ 메뉴 수정/추가</a><br>
			<a href="../board/notice.jsp">▶ 공지사항 수정</a>
		</td>
	</tr>
</table>

<% }else { 
	rentalDAO rental = rentalDAO.getInstance();
	int cnt = rental.countRentById(id);
%>
<table id="login_form" width="100%" height="100%" cellpadding="10px">
	<tr>
		<td rowspan="2"> <%= id %>님 </td>
		<td align="right"><a href="../member/logout.jsp">로그아웃</a></td>
	</tr>
	<tr>
		<td align="right"><a href="../member/modify_data.jsp">정보수정</a></td>
	</tr>
	<tr>
		<td colspan="2" align="left">
			<span>
			▶ 대출한 도서 : <%=cnt %>권 <br>
		</td>
	</tr>
</table>
<% } %>