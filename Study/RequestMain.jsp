<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-11-02
  Time: 오전 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>내장 객체 - request</title>
</head>
<body>
<h2>1. 클라이언트와 서버의 환경정보 열기</h2>
<a href="RequestWebInfo.jspng=Hello&han=안녕">
    GET 방식 전송
</a>
<br/>
<form action="RequestWebInfo.jsp" method="post">
    영어 : <input type="text" name="eng" value="by"/>
    한글 : <input type="text" name="han" value="잘가"/>
    <input type="submit" value="POST 방식 전송"/>
</form>

<h2>2. 클라이언트와 요청 매개변수 읽기</h2>

<form action="RequestWebInfo.jsp" method="post">
    아이디 : <input type="text" name="id" value=""/><br/>
    성별 :
    <input type="radio" name="sex" value="main"/> 남자
    <input type="radio" name="sex" value="woman" checked="checked"/> 여자
    <br/>
    관심사항 :
    <input type="checkbox" name="favo" value="eco"/> 경제
    <input type="checkbox" name="favo" value="pol" checked="checked"/> 정치
    <input type="checkbox" name="favo" value="ent"/> 연애  <br/>
    자기소개:
    <textarea name="intro" cols="30" rows="4"></textarea>
    <input type="submit" value="전송하기" />
</form>

<h2>3.HTTP 요청헤더 정보 읽기</h2>
<a href="RequestWebInfo.jsp">
    요청헤더 정보 읽기
</a>
</body>
</html>