<%@page import="board.noticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
.recomWrap{
	padding : 10px;
	margin : 10px;
	border-top : 2px solid orange;
	border-bottom : 2px solid orange;
	font-size : 20px;
	font-weight: bold;
}
.border_{
	border-top : 2px solid orange;
}
.border_ a{
	text-decoration: none;
}
.underBold{
	border-bottom: 2px solid orange;
}
.under{
	border-bottom : 1px dotted orange;
} 
</style>


<div class="recomWrap">
&lt;공지사항&gt;
	<div class="border_">
		<table width="100%" cellpadding="5px">
			<tr>
				<td align="center" width="20%" class="underBold">글번호</td>
				<td align="center" class="underBold">제목</td>
			</tr>
			<%
				noticeDAO ndao = noticeDAO.getInstance();
				ArrayList<noticeDTO> list = ndao.getNotice();
				if(list.size()==0){%>
					<tr>
						<td colspan="2"> 공지사항 없음 </td>
					</tr>
				<%}else{
					for(noticeDTO ndto : list){%>
						<tr>
							<td align="center" class="under"><%= ndto.getNum() %></td>
							<td align="left" class="under">
								<a href='<%="../board/content.jsp?num="+ndto.getNum()%>'>
								<%= ndto.getTitle() %>
								</a>
							</td>
						</tr>	
				<%	}
				}
			%>	
		</table>
	</div>    
</div>    