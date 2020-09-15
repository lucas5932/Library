<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table id="left_table" cellpadding="10px">
	<tr>
		<td class="td_title">회원 정보</td>
	</tr>
	<%if(id==null || id == "guest"){ %>
	<tr>
		<td class="td_sub">
			<a href="register.jsp">회원가입</a>
		</td>
	</tr>
	<tr>
		<td class="td_sub">
			<a href="login.jsp">로그인</a>
		</td>
	</tr>
	<tr>
		<td class="td_sub">
			<a href="findid.jsp">아이디 찾기</a>
		</td>
	</tr>
	<tr>
		<td class="td_sub">
			<a href="findpwd.jsp">비밀번호 찾기</a>
		</td>
	</tr>
	<%}else{ %>
	<tr>
		<td class="td_sub"><a href="modify_data.jsp">정보수정</a></td>
	</tr>
	<tr>
		<td class="td_sub"><a href="delete_data.jsp">회원 탈퇴</a></td>
	</tr>
	<%} %>
</table>