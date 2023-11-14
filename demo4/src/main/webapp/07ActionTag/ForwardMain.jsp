<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%
    //page 영역과 request 영역에 속성 저장
    pageContext.setAttribute("pAttr", "김유신");
    request.setAttribute("rAttr", "계백");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>액션태그 forward</title>
</head>
<body>
    <h2>액션태그를 이용한 포워딩</h2>
    <jsp:forward page="/07ActionTag/ForwardSub.jsp"/>
</body>
</html>
