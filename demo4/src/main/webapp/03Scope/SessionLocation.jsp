<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Session 영역</title>
</head>
<body>
    <h2>페이지 이동 후  Session 영역의 속성 읽기</h2>
    <%
        ArrayList<String> lists = (ArrayList<String>)session.getAttribute("list");
        for (String str: lists)
          out.println(str + "<br/>");
    %>
</body>
</html>
