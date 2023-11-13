<%@ page import="common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <title>page 영역</title>
</head>
<body>
    <h2>a 태그로 이동후 page 영역의 속성값 읽기</h2>
    <%
        //형변환은 하지 않는다. null값이 들어오므로 null pointer exception 발생
        Object pInteger = pageContext.getAttribute("pageInteger");
        Object pString = pageContext.getAttribute("pageString");
        Object pPerson = pageContext.getAttribute("pagePerson");
    %>
    <ul>
        <!-- a태그를 통한 이동은 새로운 페이지를 요청하는 것이므로 page 영역은 공유되지 않는다.-->
        <li>Integer 객체 : <%= (pInteger == null)? "값 없음" : pInteger %></li>
        <li>String 객체 : <%= (pString == null)? "값 없음" : pString %></li>
        <li>Person 객체 : <%= (pPerson == null)? "값 없음" : ((Person)pPerson).getName() %></li>
    </ul>
</body>
</html>
