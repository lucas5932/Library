<%@page import="admin.bookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.bookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../main/top.jsp"%>
<%
	String[] subject = {"소설", "시/에세이", "경제/경영", "자기계발", "인문", "역사/문화", "사회", "과학/공학", "예술/대중문화"
			, "종교", "유아", "어린이", "가정/생활/요리", "건강", "취미/레저", "여행/지도", "국어/외국어", "사전", "컴퓨터/IT",
			"청소년", "학습/참고서", "취업/수험서", "만화", "잡지"};
	String[] s_code = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X"};
%>

<style type="text/css">
#all{
	float: left;
	width : 50px;
	font-size : 15px;
	padding : 5px;
}
#sub{
	float: left;
	width : 50px;
	font-size : 15px;
	padding : 5px;
}
.setBorder{
	border-width: 1px 1px 0px 1px;
	border-radius: 5px 5px 0px 0px;
	border-style: solid;
	border-color: black;
}
.subColor{
	background-color: #FAEBFF;
}
.allColor{
	background-color: #FFFFE4;
}
#all2{
	position : relative;
	top : 25px;
	background-color:#FFFFE4;
	border : 1px solid black;
	border-radius: 0px 5px 5px 5px;
	padding-bottom : 10px;
	width : 100%;
	height : 800px;
}
#sub2{
	position : relative;
	top : 25px;
	background-color:#FAEBFF;
	border : 1px solid black;
	border-radius: 5px;
	padding-bottom : 10px;
	width : 100%;
	height : 800px;
	display: none;
}
.table_head{
	width : 90%;
	margin : 0px;
}
.table_body{
	width : 90%;
	margin : 0px;
}
</style>

<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		var a = <%=request.getParameter("mode")%>
		if(a == 1){
			allClick();
		}else{
			subClick();
		}
		
	});
	function allClick(){
		$('#all').addClass('setBorder');
		$('#sub').removeClass('setBorder');
		$('#all2').show();
		$('#sub2').hide();
		
		
	}
	function subClick(){
		$('#sub').addClass('setBorder');
		$('#all').removeClass('setBorder');
		$('#sub2').show();
		$('#all2').hide();
	}

</script>
<%
	bookDAO bdao = bookDAO.getInstance();
%>
<table class="table_w" border="1">
	<tr>
		<td width="30%" valign="top"><%@ include file="admin_left.jsp"%></td>
		<td height="500px" valign="top" align="center">
			<div class="titleWrap">
				<span class="Title">도서 목록 관리</span>
			</div>

			<div class="ContentArea">
				<div id="all" class="setBorder allColor" onclick="allClick()">전체</div>
				<div id="sub" class="subColor" onclick="subClick()">분야</div>
				<div id="all2">
					<table border="1" class="table_head">
						<tr><td colspan="2">&nbsp;* 전체 등록된 책 : <%= bdao.countBook() %>권</td></tr>
						<tr>
							<th width="20%">분야</th>
							<th width="80%">책 제목</th>
						</tr>
					</table>
					<div style="width:100%; height : 700px; overflow : auto">
					<table border="1" class="table_body">					
						<%
							ArrayList<bookDTO> list = bdao.getBook();
							
							for(bookDTO bdto : list){
							String str = "";
								for(int i = 0; i<s_code.length;i++){
									if(s_code[i].equals(bdto.getS_code())){
										str = subject[i];
									}
								}
							%>
								<tr>
									<td align="center" width="20%"><%= str%></td>
									<td width="80%"><%= bdto.getTitle() %></td>
								</tr>	
						<% 	}
						%>
					</table>
					</div>
				</div>
				
				<div id="sub2">
					<table border="1" width="90%">
					<tr>
						<th colspan="4">* 분야별 확인 : 해당 분야 선택</th>
					</tr>
					<%	
						for(int i = 0; i<s_code.length;i++){
						int cnt2 = bdao.countBookBysub(s_code[i]);
						String url = "location.href='booklist.jsp?mode=2&s_code="+s_code[i]+"'";
						if(i%4==0) {
							out.print("<tr>");
							}%>
					<td align="center" height="25px" onclick="<%=url%>">
						<%= subject[i] %>[<%=cnt2 %>]
					</td>
					<%
						if(i%4==3) {
							out.print("</tr>");
							}
						}%>
					<tr>
				</table>
				<br>
				<table border = "1" class="table_head">
						<tr>
							<td align="center">책 제목</td>
						</tr>
				</table>
				<table border = "1" class="table_body">
					<%
						String s = request.getParameter("s_code");
						ArrayList<bookDTO> list2 = bdao.getBookBysub(s);
						for(bookDTO bdto : list2){%>
							<tr>
								<td>
									<%= bdto.getTitle() %>
								</td>
							</tr>
					<%	}
						
					%>
				</table>
				</div>
			</div>
		</td>
	</tr>
</table>



<%@ include file="../main/bottom.jsp"%>