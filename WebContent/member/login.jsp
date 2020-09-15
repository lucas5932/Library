<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- login.jsp -->
<%@ include file ="../main/top.jsp"%>

<link rel="stylesheet" type="text/css" href="login.css">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="login_area.js"></script>

<table class="table_w" border="1">
	<tr>
		<td width="30%" valign="top"><%@ include file="login_left.jsp" %></td>
		<td height="500px" valign="top" align="center">
			<div class="titleWrap">
				<span class="Title">로그인</span>
			</div>	
			<form action="login_chk.jsp" method="post">
				<div class="ContentArea">
					<table id="login_table" width="60%">
						<tr>
							<td>
								<input type="text" name="id" class="log_input" placeholder="아이디">
								<input type="password" name="pwd" class="log_input" placeholder="비밀번호">
							</td>
							<td>
								<input type="submit" value="로그인" class="loginBtn" onclick="return id_pw_chk()">
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<a href="findid.jsp">아이디 찾기</a> |
								<a href="findpwd.jsp">비밀번호 찾기</a> |
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
