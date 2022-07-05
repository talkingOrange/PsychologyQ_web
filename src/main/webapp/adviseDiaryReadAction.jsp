<%@page import="java.io.PrintWriter"%>
<%@page import="adviseDiary.AdviseDiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String adviseDate = request.getParameter("adviseDate");
	 
	AdviseDiaryDAO adviseDiaryDAO = new AdviseDiaryDAO();
	
	Cookie[] cookies = request.getCookies() ;
	String user_id = "";
    if(cookies != null){
        for(int i=0; i < cookies.length; i++){
            Cookie c = cookies[i] ;
             
            // 저장된 쿠키 이름을 가져온다
            String cName = c.getName();
            
            // 쿠키값을 가져온다
            String cValue = c.getValue() ;
            if(cName.equals("user_id")){
            	user_id = cValue;
            } 
    	}
    }
	if(user_id.equals("")){
    	out.print("need_login");
	} else {
    	String result = adviseDiaryDAO.get(user_id, adviseDate);
 		out.print(result);
	}
		
		
	%>
</body>
</html>