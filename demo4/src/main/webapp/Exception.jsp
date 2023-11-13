<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-11-07
  Time: 오후 2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내장 객체 - exception</title>
</head>
<body>
    <%
        int status = response.getStatus();

        if(status == 404){
          out.print("404에러가 발생하였습니다");
          out.print("</br> 파일 경로를 확인해 주세요.");
        } else if (status == 405) {
          out.print("405에러가 발생하였습니다");
          out.print("</br> 파일 경로를 확인해 주세요.");
        } else if (status == 500) {
          out.print("500에러가 발생하였습니다");
          out.print("</br> 파일 경로를 확인해 주세요.");
        }
    %>
</body>
</html>
