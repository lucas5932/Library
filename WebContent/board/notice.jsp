<%@page import="board.noticeDTO"%>
<%@page import="board.noticeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../main/top.jsp"%>

<table class="table_w" border="1">
	<tr>
		<td height="500px" valign="top" align="center">
			<div class="titleWrap">
				<span class="Title">공지사항</span>
			</div>	
			<table border ="1" width="90%">
			<tr>
				<th width="10%">중요도</th>
				<th width="10%">번호</th>
				<th width="45%">제목</th>
				<th width="25%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
			<%
				int pageSize = 10;
				
				String pn = request.getParameter("pn");
				if(pn == null){
					pn = "1";
				}
				
				int currentPage = Integer.parseInt(pn);
		    	int startRow = (currentPage-1) * pageSize +1;
		    	int endRow = currentPage * pageSize;
		    	int count = 0;
		    	int number = 0;
		    	
		    	ArrayList<noticeDTO> list = null;
				noticeDAO ndao = noticeDAO.getInstance();
				count = ndao.countN();
				number = count - (currentPage-1)*pageSize;
				if(count > 0){
					list = ndao.getAllN(startRow, endRow); 
					for(noticeDTO ndto : list){%>
						<tr>
							<td align="center"><%= ndto.getImportant() %></td>
							<td align="center"><%= number--%></td>
							<td>&nbsp;<a href="content.jsp?num=<%=ndto.getNum()%>&pn=<%=pn%>"><%= ndto.getTitle() %></a></td>
							<td align="center"><%= ndto.getReg_date() %></td>
							<td align="center"><%= ndto.getReadcount() %></td>
						</tr>
					<%}
				}else if(count == 0){%>
					<tr>
						<td colspan="5" align="center">게시글 없음</td>
					</tr>
			<%	}	%>
			<tr>
				<td colspan="5" align="right">
				<%if(status){ %>
					<input type="button" value="글작성" onclick="location.href='writeForm.jsp'">
					<%}else { %>
					&nbsp;
					<%} %>
				</td>
			</tr>
			</table><%
					if(count > 0){
						int pageCount = count / pageSize + (count % pageSize == 0? 0:1);
						int pageBlock = 10;
						int startPage = ((currentPage - 1) / pageBlock * pageBlock) +1;
						int endPage = startPage + pageBlock - 1;
						
						if(endPage > pageCount) endPage = pageCount;
						if(startPage > 10) {%>
							<a href="notice.jsp?pn=<%=startPage-10 %>">[이전]</a>
						<%}
						for(int i=startPage;i<=endPage;i++){%>
							<a href="notice.jsp?pn=<%= i %>">[<%= i %>]</a>
						<%}
						if(endPage < pageCount) {%>
							<a href="notice.jsp?pn=<%=startPage+10 %>">[다음]</a>
						<%
						}
					}//페이지 생성 	%>
		</td>
	</tr>
</table>

<%@ include file="../main/bottom.jsp"%>