<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="" UTF-8"">
    <title>PsychologyQ</title>
</head>

<body>

    <%

String user_id = request.getParameter("user_id");
UserDAO userDAO = new UserDAO();
int result = userDAO.checkDuplicate(user_id);

if (result == 1) {
	out.print("success");
} else if (result == 0) {
	out.print("duplicate");
} else if (result == -1) {
	out.print("unknown");
}

%>

</body>

</html>
