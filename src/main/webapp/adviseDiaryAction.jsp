<%@page import="java.io.PrintWriter"%>
<%@page import="adviseDiary.AdviseDiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="adviseDiary" class="adviseDiary.AdviseDiary"
	scope="page" />
<jsp:setProperty name="adviseDiary" property="content" />
<jsp:setProperty name="adviseDiary" property="adviseDate" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
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
        	PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('로그인 해주세요.')");
 			script.println("history.back()");
 			script.println("</script>");
         }else{
        	 int result = adviseDiaryDAO.save(adviseDiary.getContent(),user_id,adviseDiary.getAdviseDate());
     		if(result == 1){
     			PrintWriter script = response.getWriter();
     			script.println("<script>");
     			script.println("alert('저장 성공')");
     			script.println("location.href='myPage.jsp'");
     			script.println("</script>");
     		}else if(result == 0){
     			PrintWriter script = response.getWriter();
     			script.println("<script>");
     			script.println("alert('저장 실패')");
     			script.println("history.back()");
     			script.println("</script>");
     		}else if(result == -1){
     			PrintWriter script = response.getWriter();
     			script.println("<script>");
     			script.println("alert('데이터베이스 오류입니다')");
     			script.println("history.back()");
     			script.println("</script>");
     		}	 
         }
		
		
	%>
</body>
</html>