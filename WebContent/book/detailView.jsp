<%@page import="admin.bookDTO"%>
<%@page import="admin.bookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String[] subject = {"소설", "시/에세이", "경제/경영", "자기계발", "인문", "역사/문화", "사회", "과학/공학", "예술/대중문화"
		, "종교", "유아", "어린이", "가정/생활/요리", "건강", "취미/레저", "여행/지도", "국어/외국어", "사전", "컴퓨터/IT",
		"청소년", "학습/참고서", "취업/수험서", "만화", "잡지"};
	
	String[] s_code = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X"};

	String title = request.getParameter("title");
	bookDAO bdao = bookDAO.getInstance();
	
	bookDTO bdto = bdao.getBookByTitle(title);
	String book_img = request.getContextPath()+"/images/"+bdto.getB_image();
	
	String s = (String)session.getAttribute("id");
	
%>
<script type="text/javascript"> 
	function rent(title,possible){
		if(possible == "가능"){
			opener.document.location.href='rent_proc.jsp?title='+title;
			window.close();
		}else if(possible == "불가능"){
			alert("대여 중인 도서는 대출이 불가능 합니다.");
		}
	}
</script>
    <table border="1" width="500px" cellpadding="5px"> 
    	<tr>
    		<th colspan="4"> 도서 상세보기 </th>
    	</tr>
    	<tr>
    		<td width="25%" align="center"> 분야  </td>
    		<td>
    			<% for(int i=0; i<s_code.length;i++){
    				if(s_code[i].equals(bdto.getS_code())){
    					out.print("["+subject[i]+"]");		
    					break;
    				};
    				
    			}%>
    		</td>
    		<td rowspan="4" colspan="2" width="30%" align="center"> 
    			<img src="<%= book_img %>" width="100px" height="150px">
    		</td>
    	</tr>
    	<tr>
    		<td align="center"> 책 제목  </td>
    		<td> <%= bdto.getTitle() %> </td>
    	</tr>
    	<tr>
    		<td align="center"> 저자   </td>
    		<td> <%= bdto.getWriter() %> </td>
    	</tr>
    	<tr>
    		<td align="center"> 출판사   </td>
    		<td> <%= bdto.getPublisher() %> </td>
    	</tr>
    	<tr>
    		<td align="center"> 페이지   </td>
    		<td colspan="3"> <%=bdto.getPage() %>쪽 </td>
    	</tr>
    	<tr>
    		<td align="center"> ISBN  </td>
    		<td colspan="3"> <%=bdto.getIsbn() %> </td>
    	</tr>
    	<tr>
    		<td align="left" colspan="4"> ※ 대출 가능 여부  : <%=bdto.getPossible() %></td>
    	</tr>
    	<tr>
    		<td align="left" colspan="4">  ※ 도서 위치 정보  : <%=bdto.getS_code() %>영역 &gt;&gt; <%=bdto.getH_code()+1 %>열 <%= bdto.getW_code() %>번째 칸 위치 </td>
    	</tr>
    	
    </table>
    <br>
    	<input type="button" value="대출하기" onclick="rent('<%=bdto.getTitle()%>','<%= bdto.getPossible() %>')">
    	<input type="button" value="창 닫기" onclick="javascript:window.close()">