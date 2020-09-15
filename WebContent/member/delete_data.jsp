<%@page import="login.memberDTO"%>
<%@page import="login.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="../main/top.jsp"%>

<%
	memberDAO rdao = memberDAO.getInstance();
	memberDTO rdto = rdao.getData(id);
%>

<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="reg_chk.js"></script>

<table class="table_w" border="1">
	<tr>
		<td width="30%" valign="top"><%@ include file="login_left.jsp" %></td>
		<td height="500px" valign="top" align="center">
			<br>
			<div class="titleWrap">
				<span class="Title">회원 탈퇴</span>
			</div>	
				<div class="ContentArea">
					<form action="delete_proc.jsp" method="post">
					<table width="80%">
						<tr>
							<td align="center">
								<input type="password" name="pwd" class="del_input" placeholder="비밀번호를 입력하세요.">
							</td>
						</tr>
						<tr>
							<td align="center">
								<input type="submit" value="회원 탈퇴" class="delBtn">
							</td>
						</tr>
					</table>
					</form>
				</div>
		</td>
	</tr>
</table>
<%@ include file ="../main/bottom.jsp"%>