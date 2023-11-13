<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <title>CookieResult.jsp</title>
</head>
<body>
    <h2>쿠키값 확인하기(쿠키가 생성된 이후의 페이지)</h2>
    <%
        Cookie[] cookies = request.getCookies(); //요청 헤더의 모든 쿠키 얻기
        if(cookies!=null){
            for (int i = 0; i<cookies.length; i++) {//cookies내 쿠키 각각 출력
                String cookieName = cookies[i].getName();
                String cookieValue = cookies[i].getValue();
                out.println(String.format("쿠키명 : %s - 쿠키값 : %s<br/>", cookieName, cookieValue));
            }
        }
    %>
</body>
</html>