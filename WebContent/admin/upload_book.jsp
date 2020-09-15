<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../main/top.jsp"%>

<%
	String[] subject = { "소설", "시/에세이", "경제/경영", "자기계발", "인문", "역사/문화", "사회", "과학/공학", "예술/대중문화", "종교", "유아",
			"어린이", "가정/생활/요리", "건강", "취미/레저", "여행/지도", "국어/외국어", "사전", "컴퓨터/IT", "청소년", "학습/참고서", "취업/수험서",
			"만화", "잡지" };
	String[] s_code = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X"};
%>

<style type="text/css">
.subject_Area {
	position: relative;
	float: left;
	border: 2px solid green;
	border-radius: 10px;
	padding: 5px;
}

.info_Area {
	float: left;
	border: 2px solid green;
	border-radius: 10px;
	padding: 5px;
	margin-left: 30px;
}

.td_info {
	text-align: center;
	background-color: white;
}

.td_input {
	width: 80%;
}
</style>

<table class="table_w" border="1">
	<tr>
		<td width="30%" valign="top"><%@ include file="admin_left.jsp"%></td>
		<td height="500px" valign="top" align="center">
			<div class="titleWrap">
				<span class="Title">도서 등록</span>
			</div>

			<form action="upload_book_proc.jsp" method="post"
				enctype="multipart/form-data">
			<div class="ContentArea">
				<div class="subject_Area">
					<table border="1">
						<tr>
							<th bgcolor="#FFFFD2">[분야 선택]</th>
						</tr>
						<tr>
							<td bgcolor="#FFFFFF">
								<%
									for (int i = 0; i < subject.length; i++) {
								%> <input type="radio"	name="s_code" value="<%=s_code[i]%>"><%=subject[i]%>
								   <input type="hidden"	name="h_code" value="0">
								   <input type="hidden"	name="w_code" value="0">
								<br>
								<%
									}
								%>
							</td>
						</tr>
					</table>
				</div>

				<div class="info_Area">
					<table border="1" width="400px">
						<tr>
							<th colspan="2" bgcolor="#FFFFD2">도서 정보 입력</th>
						</tr>
						<tr>
							<td class="td_info">제목</td>
							<td class="td_info"><input type="text" name="title"
								class="td_input"></td>
						</tr>
						<tr>
							<td class="td_info">저자</td>
							<td class="td_info"><input type="text" name="writer"
								class="td_input"></td>
						</tr>
						<tr>
							<td class="td_info">출판사</td>
							<td class="td_info"><input type="text" name="publisher"
								class="td_input"></td>
						</tr>
						<tr>
							<td class="td_info">출판일</td>
							<td class="td_info"><input type="text" name="p_date"
								class="td_input"></td>
						</tr>
						<tr>
							<td class="td_info">페이지</td>
							<td class="td_info"><input type="text" name="page"
								class="td_input"></td>
						</tr>
						<tr>
							<td class="td_info">ISBN</td>
							<td class="td_info"><input type="text" name="isbn"
								class="td_input"></td>
						</tr>
						<tr>
							<th colspan="2" bgcolor="#FFFFD2">이미지 등록</th>
						</tr>
						<tr>
							<td colspan="2" height="200px" align="center" class="td_info">이미지</td>
						</tr>
						<tr>
							<td colspan="2" height="30px" bgcolor="white"><input
								type="file" name="b_image"></td>
						</tr>
						<tr>
							<td colspan="2" bgcolor="#FFFFD2" align="right" height="30px">
								<input type="submit" value="도서 추가">
							</td>
						</tr>
					</table>
				</div>
			</div>
			</form>
		</td>
	</tr>
</table>

<%@ include file="../main/bottom.jsp"%>