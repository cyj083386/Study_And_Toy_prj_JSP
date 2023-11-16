<%@ page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<meta charset="UTF-8">
<head><title>표현 언어(EL) - 객체 매개변수</title></head>
<body>
  <%-- 전송할 대상이 객체라면 영역을 사용해야 한다. 아래와 같이 Person, String, Integer객체를 생성한후 request영역에 저장 --%>
  <%
    request.setAttribute("personObj", new Person("홍길동", 33));
    request.setAttribute("stringObj", "나는 문자열");
    request.setAttribute("integerObj", new Integer(99));
  %>
  <%--  10과 20도 포워드 페이지로 같이 전달 --%>
  <jsp:forward page="ObjectResult.jsp">
    <jsp:param value="10" name="firstNum" />
    <jsp:param value="20" name="secondNum" />
  </jsp:forward>
</body>
</html>