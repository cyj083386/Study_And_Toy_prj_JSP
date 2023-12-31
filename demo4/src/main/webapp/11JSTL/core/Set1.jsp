<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JSTL - set 1</title>
</head>
<body>
<%--변수선언--%>
    <c:set var="directVar" value="100" />
    <c:set var="elVar" value= "${directVar mod 5}" />
    <c:set var="expVar" value= "<%= new Date()%>" />
    <c:set var="betweenVar">변수값 요렇게 설정</c:set>
<%--변수출력--%>
<h4>EL을 이용해 변수 출력</h4>
<ul>
    <li>directVar: ${pageScope.directVar}</li>
    <li>elVar: ${elVar}</li>
    <li>expVar: ${expVar}</li>
    <li>betweenVar: ${betweenVar}</li>
</ul>
</body>
</html>
