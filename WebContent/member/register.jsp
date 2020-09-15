<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../main/top.jsp"%>
<link rel="stylesheet" type="text/css" href="register.css">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="reg_chk.js"></script>
	
<table class="table_w" border="1">
	<tr>
		<td width="30%" valign="top"><%@ include file="login_left.jsp" %></td>
		<td valign="top" align="center">
			<div class="titleWrap">
				<span class="Title">회원가입</span>
			</div>	
			<form action="register_proc.jsp" method="post">
				<div class="ContentArea">
					<table class="table_form">
						<tr>
							<th colspan="2" class="line_solid_bot" bgcolor="#C4AA9E">로그인 정보 입력</th>
						</tr>
						<tr>
							<td rowspan="2" class="input_name line_solid_right line_solid_bot"> 아이디 </td>
							<td class="input_data">
								<input type="text" name="id" maxlength="12" placeholder="소문자, 숫자를 포함한 8~12자" class="input_75" onkeyup="id_check()">
								
							</td>
						</tr>
						<tr>
							<td class="line_solid_bot input_data"><span id="id_msg"></span></td>
						</tr>
						<tr>
							<td rowspan="2" class="input_name line_solid_right line_solid_bot"> 비밀번호 </td>
							<td class="input_data"> <input type="text" name="pwd" maxlength="12" placeholder="소문자, 숫자를 포함한 8~12자" class="input_75" onkeyup="pwd_check()"> </td>
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
							<td rowspan="2" class="input_name line_solid_right line_solid_bot"> 이름 </td>
							<td class="input_data"> <input type="text" name="name" class="input_75" onkeyup="name_check()"> </td>
						</tr>
						<tr>
							<td class="line_solid_bot input_data"><span id="name_msg"></span></td>
						</tr>
						<tr>
							<td rowspan="2" class="input_name line_solid_right line_solid_bot"> 생년월일 </td>
							<td class="input_data"> <input type="text" name="b_year" placeholder="2020"maxlength="4" size="4" onkeyup="year_check()">년
								<select name="b_month">
									<% String[] month = {"1","2","3","4","5","6","7","8","9","10","11","12"};
										for(int i=0;i<month.length;i++){
										out.print("<option value="+month[i]+">"+month[i]+"</option>");
										}
									%>
								</select>월
								<input type="text" name="b_day" placeholder="1" maxlength="2" size="2" onkeyup="day_check()">일
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
									<option value="남자">남자</option>
									<option value="여자">여자</option>
								</select> 
							</td>
						</tr>
						<tr>
							<td class="line_solid_bot input_data"><span id="gender_msg"></span></td>
						</tr>
					
						<tr>
							<td rowspan="2" class="input_name line_solid_right line_solid_bot"> 연락처 </td>
							<td class="input_data">
								<input type="text" name="phone1" placeholder="010" maxlength="3" size="3" onkeyup="ph1_next()">-
								<input type="text" name="phone2" placeholder="1234" maxlength="4" size="4" onkeyup="ph2_next()">-
								<input type="text" name="phone3" placeholder="1234" maxlength="4" size="4" onkeyup="ph3_check()">
							</td>
						</tr>
						<tr>
							<td class="line_solid_bot input_data"><span id="phone_msg"></span></td>
						</tr>
						<tr>
							<td colspan="2" align="right" bgcolor="#FFFFF8">
								<input type="submit" value="회원가입" onclick="return reg_area()">
								<input type="button" value="홈으로" onclick="location.href='../main/main.jsp'">
							</td>
						</tr>
					</table>
				</div>
			</form>
		</td>
	</tr>
</table>

<%@ include file="../main/bottom.jsp"%>