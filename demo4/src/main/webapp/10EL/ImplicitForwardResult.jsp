<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<head>
    <title>표현언어(EL) - 내장객체</title>
</head>
    <h2>ImplicitForwardResult 페이지</h2>
    <h3>각 영역에 저장된 속성 읽기</h3>
    <ul>
        <%--EL에서는 4가지 영역에 접근하기 위한 내장 객체가 다음과 같다. scopeValue는 Main에서 지정한 속성이름--%>
        <li>페이지 영역: ${pageScope.scopeValue}</li>
        <li>리퀘스트 영역: ${requestScope.scopeValue}</li>
        <li>세션 영역: ${sessionScope.scopeValue}</li>
        <li>애플리케이션 영역: ${applicationScope.scopeValue}</li>
    </ul>
    <h3>영역 지정없이 속성 읽기</h3>
    <ul>
        <%--영역을 따로 지정하지 않으면 가장 좁은 영역에서부터 속성을 찾음. 이때는 page 스코프내 scopeValue가 없으므로 request 영역에서 읽어옴--%>
        <li>${scopeValue}</li>
    </ul>

<body>

</body>
</html>
