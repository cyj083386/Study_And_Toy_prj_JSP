<%@ page import="common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //jsp는 내장객체
    request.setAttribute("requestString", "request 영역의 문자열");
    //DTO Person 객체 생성
    request.setAttribute("requestPerson", new Person("안중근",31));
%>
<html>
<head>
    <title>request 영역</title>
</head>
<body>
    <h2>request 영역의 속성값 삭제하기</h2>
    <%
        request.removeAttribute("requestString");
        //없는값을 지우라고 했으나 에러가 발생하지 않는다. javax.servlet.jsp 제공 객체이므로 이런식으로 에러를 못잡는 경우가생김. 주의
        request.removeAttribute("requestInteger");
    %>
    <h2>request 영역의 속성값 읽기</h2>
    <%
        Person rPerson = (Person)request.getAttribute("requestPerson");
    %>
    <ul>
        <li>String 객체 : <%= request.getAttribute("requestString")%></li>
        <li>Person 객체 : <%= rPerson.getName() %>, <%=rPerson.getAge() %></li>
    </ul>
    <h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
    <%
        request.getRequestDispatcher(
                "RequestForward.jsp?paramHan=한글&paramEng=English")
                .forward(request,response);
    %>


</body>
</html>
