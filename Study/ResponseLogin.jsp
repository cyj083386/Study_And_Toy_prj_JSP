<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-11-02
  Time: 오후 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>내장 객체 - response</title>
</head>
<body>
    <h2>1. 로그인폼</h2>
    <%
        String id = request.getParameter("user_id");
        String pwd = request.getParameter("user_pw");
        if(id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")){
            response.sendRedirect("ResponseWelcome.jsp");
        }
        else {
            request.getRequestDispatcher("ResponseMain.jsp?loginErr=1")
                    .forward(request, response);
        }
    %>

</body>
</html>
