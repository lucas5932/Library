<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="../main/top.jsp"%>
<link rel="stylesheet" type="text/css" href="login.css">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="login_area.js"></script>

<table class="table_w" border="1">
	<tr>
		<td width="30%" valign="top"><%@ include file="login_left.jsp" %></td>
		<td height="500px" valign="top" align="center">
			<div class="titleWrap">
				<span class="Title">비밀번호 찾기</span>
			</div>
			<form action="findpwd_proc.jsp" method="post">
				<div class="ContentArea">
				<table width="60%">
					<tr>
						<td align="center" width="70%">
							<input type="text" name="id" class="log_input" placeholder="아이디">
							<input type="text" name="phone" class="log_input" placeholder="핸드폰번호(-없이 입력)">
						</td>
						<td>
							<input type="submit" value="검색" class="loginBtn" onclick="return findpwd_chk1()">
						</td>
					</tr>
					<tr>
						<td align="right">
							<a href="findid.jsp">아이디 찾기</a> |
							<a href="register.jsp">회원 가입</a>
						</td>
					</tr>
				</table>
				</div>
			</form>
		</td>
	</tr>
</table>

<%@ include file ="../main/bottom.jsp"%>