<%@page import="rental.rentalDTO"%>
<%@page import="rental.rentalDAO"%>
<%@page import="admin.bookDAO"%>
<%@page import="reserve.reserveDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="reserve.reserveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../main/top.jsp"%>

<style type="text/css">
.list{
	padding : 5px;
	float : left;
	border : 1px solid orange;
	border-radius: 5px;
	background-color: #FFF2E6;
	width: 100%;
	text-align: left;
	margin-bottom : 10px;
}
.list_title{
	border : 1px solid orange;
	border-radius: 10px;
	background-color: #FFCC97;
	text-align : center;
	padding : 5px 10px;
	font-weight: bold;
}
.table_Extented a{
	text-decoration: none;
}
</style>
<script type="text/javascript">
	function delReserve(title){
		location.href="delReserve.jsp?title="+title;
	}
	function returnEx(title,func){
		location.href="returnEx.jsp?func="+func+"&title="+title;
	}
	function popup(title){
		var url = "detailView.jsp?title="+title;

		var winW = 520;
		var winH = 500;
		
		var winLeft = (screen.width - winW)/2;
		var winTop = (screen.height - winH)/2;
		var options = "width="+winW+",height="+winH+",left="+winLeft+",top="+winTop;

		window.open(url,'pop',options);
	}
</script>
<table class="table_Extented">
	<tr>
		<td valign="top" align="center">
			<div class="titleWrap">
				<span class="Title">도서 대출/반납</span>
			</div>	
		</td>
	</tr>
	<tr>
		<td align="center">
			<table border="1" width="80%">
				<caption>*예약 서비스</caption>
				<tr>
					<th width="5%"><input type="checkbox"></th>
					<th width="5%">No.</th>
					<th width="60%">책 제목</th>
					<th width="15%">대출 가능 여부</th>
					<th width="15%">예약 삭제</th>
				</tr>
				<%
					int no = 1;
					String p = "";
					reserveDAO rdao = reserveDAO.getInstance();
					ArrayList<reserveDTO> list = rdao.getReserve(id); 
					if(list.size()==0){%>
					<tr>
						<td colspan="5" align="center">예약한 도서 목록이 없습니다.</td>
					</tr>	
				<%	}else{
					for(reserveDTO rdto : list){
						bookDAO bdao = bookDAO.getInstance();
						p = bdao.poss(rdto.getTitle());
				%>
					<tr>
						<td align="center"><input type="checkbox"></td>
						<td align="center"><%=no %></td>
						<td><a href="" onclick="popup('<%=rdto.getTitle()%>')">&nbsp;<%= rdto.getTitle() %></a></td>
						<td align="center"><%= p %></td>
						<td align="center">
							<input type="button" value="삭제" onclick="delReserve('<%=rdto.getTitle()%>')">
						</td>
					</tr>
				<%	no++;
					}
				}%>
			</table>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td align="center">
			<table border="1" width="80%">
				<caption>*나의 도서 대출 현황</caption>
				<tr>
					<th width="5%"><input type="checkbox"></th>
					<th width="5%">No.</th>
					<th width="40%">책 제목</th>
					<th width="15%">대출일</th>
					<th width="15%">반납 예정일</th>
					<th width="10%">반납연장</th>
					<th width="10%">반납하기</th>
				</tr>
				<%
					int no2 = 1;
					rentalDAO rent = rentalDAO.getInstance();
					ArrayList<rentalDTO> rent_list = rent.getRental(id);
					if(rent_list.size()==0){%>
					<tr>
						<td colspan="7" align="center">대출한 도서 목록이 없습니다.</td>
					</tr>	
				<%	}else{
					for(rentalDTO rdto : rent_list){
				%>
					<tr>
						<td align="center"><input type="checkbox"></td>
						<td align="center"><%=no2 %></td>
						<td>&nbsp;<%= rdto.getTitle() %></td>
						<td align="center"><%= rdto.getRental_d() %></td>
						<td align="center"><%= rdto.getReturn_d() %></td>
						<td align="center"><input type="button" value="기간 연장" onclick="returnEx('<%=rdto.getTitle()%>',1)"></td>
						<td align="center"><input type="button" value="반납" onclick="returnEx('<%=rdto.getTitle()%>',2)"></td>
					</tr>
				<%	no2++;
					}
				}%>
					
			</table>
			<tr><td>&nbsp;</td></tr>
		</td>
	</tr>
</table>

<%@ include file="../main/bottom.jsp"%>