<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%
    String chkVal =request.getParameter("inactiveToday");

    if(chkVal != null && chkVal.equals("1")){
      Cookie cookie =new Cookie("PopupClose","off");
      cookie.setMaxAge(60*60*24);
      response.addCookie(cookie);
      out.println("쿠키 : 하루동안 열지 않음");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
