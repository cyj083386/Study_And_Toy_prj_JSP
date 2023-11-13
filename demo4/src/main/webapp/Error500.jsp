<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8"
%>


<html>
<head>
    <title>page 지시어 - errorPage, is ErrorPage 속성</title>
</head>
<meta charset="UTF-8">
<body>
<%
    int myAge = Integer.parseInt(request.getParameter("age"))+10;
    out.println("10년 후 당신의 나이는 "+ myAge+ "입니다.");

//  잘 안쓰는 방법
//  try { // 예외 발생 부분을 try/catch로 감쌉니다.
//      int myAge = Integer.parseInt(request.getParameter("age"))+10;
//      out.println("10년 후 당신의 나이는 "+ myAge+ "입니다.");
//  }
//  catch (Exception e){
//      out.println("예외발생: 매개변수 age가 null입니다.");
//  }

%>
</body>
</html>