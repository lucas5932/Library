<%@page import="java.text.SimpleDateFormat"%>
<%@page import="login.memberDTO"%>
<%@page import="login.memberDAO"%>
<%@page import="rental.rentalDTO"%>
<%@page import="rental.rentalDAO"%>
<%@page import="admin.bookDAO"%>
<%@page import="reserve.reserveDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="reserve.reserveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	String id = request.getParameter("id");
	memberDAO member = memberDAO.getInstance();
	memberDTO mdto = member.getData(id);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>


  <table border="1" width="500px" cellpadding="5px"> 
    	<tr>
    		<th colspan="7"> 회원 정보 상세보기 </th>
    	</tr>
    	<tr>
    		<th colspan="7">신상 정보</th>
    	</tr>
    	<tr>
    		<td align="center" width="20%"> 아이디  </td>
    		<td colspan="6"><%= mdto.getId() %> </td>
    	</tr>
    	<tr>
    		<td align="center"> 비밀번호  ㅁ </td>
    		<td colspan="6"> <%= mdto.getPwd() %> </td>
    	</tr>
    	<tr>
    		<td align="center"> 이름   </td>
    		<td colspan="6"> <%= mdto.getName() %> </td>
    	</tr>
    	<tr>
    		<td align="center"> 전화번호   </td>
    		<td colspan="6"> <%= mdto.getPhone() %> </td>
    	</tr>
    	<tr>
    		<td align="center"> 생년월일  </td>
    		<td colspan="6"> <%= mdto.getBirth() %> </td>
    	</tr>
    	<tr>
    		<th colspan="7">도서 예약 정보</th>
    	</tr>
    	<tr>
    		<th colspan="5">책 제목</th>
    		<th colspan="2">대출 가능여부</th>
    	</tr>
    	<%
					
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
						<td colspan="5" width="75%">&nbsp;<%= rdto.getTitle() %></td>
						<td align="center" colspan="2"><%= p %></td>
					</tr>
				<%	
					}
				}%>
    	<tr>
    		<th colspan="7">도서 대출 정보</th>
    	</tr>
    	<tr>
    		<th colspan="3" width="50%">책 제목</th>
    		<th colspan="2" width="25%">대출일</th>
    		<th colspan="2" width="25%">반납일</th>
    	</tr>
    	<%
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
						<td colspan="3"  width="50%">&nbsp;<%= rdto.getTitle() %></td>
						<td colspan="2"align="center" width="25%"><%= rdto.getRental_d() %></td>
						<td colspan="2"align="center" width="25%"><%= rdto.getReturn_d() %></td>
					</tr>
				<%	
					}
				}%>
    </table><br>
    <input type="button" value="창 닫기" onclick="javascript:window.close()">