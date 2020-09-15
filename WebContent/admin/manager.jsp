<%@page import="java.text.SimpleDateFormat"%>
<%@page import="login.memberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="login.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../main/top.jsp"%>
<link rel ="stylesheet" type="text/css" href="adminForm.css">

<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	function search_id(){
		$('input[name=search]').attr("placeholder","아이디검색");
	}
	function search_name(){
		$('input[name=search]').attr("placeholder","이름검색");
	}
	function popup(id){
		var url = "detailView.jsp?id="+id;

		var winW = 500;
		var winH = 700;
		
		var winLeft = (screen.width - winW)/2;
		var winTop = (screen.height - winH)/2;
		var options = "width="+winW+",height="+winH+",left="+winLeft+",top="+winTop;

		window.open(url,'pop',options);
	}
</script>
<table class="table_w" border="1">
	<tr>
		<td width="30%" valign="top"><%@ include file="admin_left.jsp" %></td>
		<td height="500px" valign="top" align="center">
			<div class="titleWrap">
				<span class="Title">회원 관리</span>
				<div class="searchBar">
				<form>
				<table>
					<tr>
						<td align="center">
							검색 방법 : 
							<input type="radio" name="s_type" value="id" checked onclick="search_id()">아이디
							<input type="radio" name="s_type" value="name" onclick="search_name()"> 이름
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="search" class="searchInput" placeholder="아이디 검색">
							<input type="button" value="검색" class="searchBtn">
						</td>
					</tr>
				</table>
				</form>
				</div>
			</div>	
			<div class="ContentArea">
				
				<table border="1" width="100%">
					<tr> 
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>전화번호</th>
					</tr>
					<%
						memberDAO rdao = memberDAO.getInstance();
												ArrayList<memberDTO> list = rdao.getAllData(); 
												for(memberDTO rdto : list){
					%>
					<tr>
						<td align="center"><a href="" onclick="popup('<%=rdto.getId()%>')"><%= rdto.getId() %></a></td>
						<td align="center"><%= rdto.getPwd() %></td>
						<td align="center"><%= rdto.getName() %></td>
						<td align="center"><%= rdto.getPhone() %></td>
					</tr>
					<% } %>
				</table>
			</div>
		</td>
	</tr>
</table>

<%@ include file="../main/bottom.jsp"%>