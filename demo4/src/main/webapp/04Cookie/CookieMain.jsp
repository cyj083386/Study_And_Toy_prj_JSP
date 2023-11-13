<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <title>Cookie</title>
</head>
<body>
    <h2>1. 쿠키(Cookie)설정</h2>
    <%
    Cookie cookie = new Cookie("myCookie", "쿠키맛나요");
    cookie.setPath(request.getContextPath());
    cookie.setMaxAge(3600); // 유지시간을 1시간으로 설정
    response.addCookie(cookie);// 재방문시 응답헤더에 쿠키추가
    %>
    <h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
    <%
        Cookie[] cookies = request.getCookies(); //요청 헤더의 모든 쿠키 얻기
        if(cookies!=null){
            for (Cookie c:cookies) {//cookies내 쿠키 각각 출력
                String cookieName = c.getName();
                String cookieValue = c.getValue();
                out.println(String.format("%s : %s<br/>", cookieName, cookieValue));
            }
        }
    %>
    <h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
    <a href="CookieResult.jsp">
        다음페이지에서 쿠키값 확인하기
    </a>
</body>
</html>
