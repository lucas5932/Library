<%@page import="reserve.reserveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	request.setCharacterEncoding("UTF-8");
    	String title = request.getParameter("title");
    	String id = (String)session.getAttribute("id");
    	
    	String msg = "";
    	reserveDAO rdao = reserveDAO.getInstance();
    	int total = rdao.countReserve(id); 
	    	boolean p = rdao.duplReserve(id,title);
	    	if(!p){//중복 체크
    			if(total < 10){//최대 예약 체크
	    			int cnt = rdao.addReserve(id, title);
		        	if(cnt > 0) {
		        		response.sendRedirect("info.jsp");
		        	}
	    		}else{
	    			msg="예약은 최대 10권까지 입니다.";
	    		}
	    	}else{
	    		msg="이미 예약된 도서 입니다.";
	    	}
    %>
    <script type="text/javascript">
    	alert("<%=msg%>");
    	history.back();
    </script>