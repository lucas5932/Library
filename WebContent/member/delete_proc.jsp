<%@page import="login.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	request.setCharacterEncoding("UTF-8");
        	String pwd = request.getParameter("pwd");
        	String id = (String)session.getAttribute("id");
        	
        	memberDAO rdao = memberDAO.getInstance();
        	boolean flag = rdao.getLogin(id, pwd);
        	
        	String msg ="";
        	String url = "";
        	if(flag){
        		int cnt = rdao.deleteData(id);
        		if(cnt>0){
        			msg ="삭제되었습니다.";
        			url ="../member/logout.jsp";
        		}else{
        			msg = "삭제 실패했습니다.";
        			url ="../member/delete_data.jsp";
        		}
        	}
    %>
   <script type="text/javascript">
   		alert("<%=msg%>");
   		location.href="<%=url%>";
   </script>