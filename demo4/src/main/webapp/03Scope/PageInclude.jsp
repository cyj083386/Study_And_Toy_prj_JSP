<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<h4>Include 페이지</h4>
<%
    // include 지시어로 표함시킨 jsp 파일은 원본 그대로 삽입된 후 컴파일이 진행되므로 결국 하나의 페이지. page 영역이 공유된다.
    int pInteger2 = (Integer)(pageContext.getAttribute("pageInteger"));
    // String pString2 = pageContext.getAttribute("pageString").toString();
    Person pPerson2 = (Person)(pageContext.getAttribute("pagePerson"));
%>
<ul>
    <li>Integer 객체 : <%= pInteger2%></li>
    <!--저장한 객체가 문자열이거나 기본타입의 래퍼 클래스라면 직접 호출할수도 있다.-->
    <li>String 객체 : <%=  pageContext.getAttribute("pageString")%></li>
    <li>Person 객체 : <%= pPerson2.getName() %>, <%=pPerson2.getAge() %></li>
</ul>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
