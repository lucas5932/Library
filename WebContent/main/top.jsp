<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../style.css">

<%
	String id = (String)session.getAttribute("id");
	if(id==null) {
		session.setAttribute("status", false);
	}
	boolean status = (boolean)session.getAttribute("status");
%>
<header>
<table class="table_w">
	<tr>
		<td class="border_u">
			<span class="right">
				<a href="../main/main.jsp">홈</a> |
				<% if(id== null){		%>
				<a href="../member/login.jsp">로그인</a> |
				<a href="../member/register.jsp">회원가입</a>
				<%}	else{	%>
				<a href="../member/logout.jsp">로그아웃</a>
				<%} %>
			</span>
		</td>
	</tr>
</table>
</header>

<nav>
<table class="table_w">
	<tr>	
		<td>
			<div class="home">
				<a href="../main/main.jsp"><img src="../images/home.png" width="100px" height="60px"></a>
			</div>
			
			<div class="menu_title">
				<a href="../book/info.jsp">도서 대출/반납</a>
			</div>

			<div class="menu_title">
				<a href="../search/search_title.jsp?title=all">도서 검색</a>
			</div>
			<div class="menu_title">
				<a href="../board/notice.jsp">공지사항</a>
			</div>
		</td>
	</tr>
</table>
</nav>

<br><br>