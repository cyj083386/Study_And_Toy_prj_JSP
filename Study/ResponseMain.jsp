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
        String loginErr = request.getParameter("loginErr");
        if (loginErr != null) out.print("로그인 실패"); //최초로그인 이후에 중간에 실패해서 되돌아올때 필요한 코드
    %>
    <form action="./ResponseLogin.jsp" method="post">
        아이디 : <input type="text" name="user_id" /><br/>
        패스워드 : <input type="text" name="user_pw" /><br/>
        <input type="submit" value="로그인"/>
    </form>

    <h2>2. http 응답 헤더 설정하기</h2>
    <form action="./ResponseHeader.jsp" method="get">
        날짜형식: <input type="text" name="add_date" value="2021-10-25 09:00"/> <br/>
        숫자형식: <input type="text" name="add_int" value="8282"/> <br/>
        문자형식: <input type="text" name="add_str" value="홍길동"/> <br/>
        <input type="submit" value="응답 헤더설정&출력"/>
    </form>
</body>
</html>
