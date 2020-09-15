<%@page import="java.text.SimpleDateFormat"%>
<%@page import="login.memberDTO"%>
<%@page import="login.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="../main/top.jsp"%>

<%
	memberDAO rdao = memberDAO.getInstance();
	memberDTO rdto = rdao.getData(id);
%>
<link rel="stylesheet" type="text/css" href="register.css">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="reg_chk.js"></script>

<table class="table_w" border="1">
	<tr>
		<td width="30%" valign="top"><%@ include file="login_left.jsp" %></td>
		<td height="500px" valign="top" align="center">
			<div class="titleWrap">
				<span class="Title">정보 수정</span>
			</div>	
			<form action="modify_proc.jsp" method="post">
				<div class="ContentArea">
				<table class="table_form">
						<tr>
							<th colspan="2" class="line_solid_bot" bgcolor="#C4AA9E">로그인 정보 입력</th>
						</tr>
						<tr>
							<td height="50px" class="input_name line_solid_right line_solid_bot"> 아이디 </td>
							<td class="input_data line_solid_bot">
								<span class="fix_data"><%= id %></span>
								<input type="hidden" name="id" value="<%=id%>">
							</td>
						</tr>
						<tr>
							<td rowspan="2" class="input_name line_solid_right line_solid_bot"> 비밀번호 </td>
							<td class="input_data"> <input type="text" name="pwd" maxlength="12" value="<%= rdto.getPwd() %>" placeholder="소문자, 숫자를 포함한 8~12자" class="input_75" onkeyup="pwd_check()"> </td>
						</tr>
						<tr>
							<td class="line_solid_bot input_data"><span id="pwd_msg"></span></td>
						</tr>
						<tr>
							<td rowspan="2" class="input_name line_solid_right line_solid_bot"> 비밀번호 확인 </td>
							<td class="input_data"> <input type="text" name="pwdchk" maxlength="12" class="input_75" onkeyup="pwdchk_check()"> </td>
						</tr>
						<tr>
							<td class="line_solid_bot input_data"><span id="pwdchk_msg"></span></td>
						</tr>
						<tr>
							<th colspan="2" class="line_solid_bot" bgcolor="#C4AA9E">개인정보 입력</th>
						</tr>
						<tr>
							<td height="50px"  class="input_name line_solid_right line_solid_bot"> 이름 </td>
							<td class="input_data line_solid_bot">
								<span class="fix_data"><%= rdto.getName() %></span>
							</td>
						</tr>
						<tr>
							<td rowspan="2" class="input_name line_solid_right line_solid_bot"> 생년월일 </td>
							<td class="input_data"> 
							<% 
								String[] split_= rdto.getBirth().substring(0,11).split("-");
								if(Integer.parseInt(split_[1])<10) split_[1] = split_[1].substring(1);
							%>
							<input type="text" name="b_year" value="<%= split_[0] %>" maxlength="4" size="4" onkeyup="year_check()">년
								<select name="b_month">
									<% String[] month = {"1","2","3","4","5","6","7","8","9","10","11","12"};
										for(int i=0;i<month.length;i++){%>
										<option value="<%=month[i] %>" <%if(split_[1].equals(month[i])){ %>selected<%} %>><%= month[i]%></option>
									<% 	}
									%>
								</select>월
								<input type="text" name="b_day" value="<%= split_[2]%>" maxlength="2" size="2" onkeyup="day_check()">일
							</td>
						</tr>
						<tr>
							<td class="line_solid_bot input_data"><span id="birth_msg"></span></td>
						</tr>
						<tr>
							<td rowspan="2" class="input_name line_solid_right line_solid_bot"> 성별 </td>
							<td class="input_data"> 
								<select id="gender" name="gender">
									<option value="선택">선택</option>
									<option value="남자" <%if(rdto.getGender().equals("남자")) {%>selected<%} %>>남자</option>
									<option value="여자" <%if(rdto.getGender().equals("여자")) {%>selected<%} %>>여자</option>
								</select> 
							</td>
						</tr>
						<tr>
							<td class="line_solid_bot input_data"><span id="gender_msg"></span></td>
						</tr>
					
						<tr>
							<td rowspan="2" class="input_name line_solid_right line_solid_bot"> 연락처 </td>
							<td class="input_data">
								<input type="text" name="phone1" value="<%= rdto.getPhone().substring(0, 3) %>" maxlength="3" size="3" onkeyup="ph1_next()">-
								<input type="text" name="phone2" value="<%= rdto.getPhone().substring(3, 7) %>" maxlength="4" size="4" onkeyup="ph2_next()">-
								<input type="text" name="phone3" value="<%= rdto.getPhone().substring(7, 11) %>" maxlength="4" size="4" onkeyup="ph3_check()">
							</td>
						</tr>
						<tr>
							<td class="line_solid_bot input_data"><span id="phone_msg"></span></td>
						</tr>
						<tr>
							<td colspan="2" align="right" bgcolor="#FFFFF8">
								<input type="submit" value="정보수정" onclick="return reg_area()">
								<input type="button" value="홈으로">
							</td>
						</tr>
					</table>
				</div>
			</form>
		</td>
	</tr>
</table>
<%@ include file ="../main/bottom.jsp"%>