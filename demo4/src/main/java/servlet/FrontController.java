package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.one") //url 매핑을 .one으로 끝나는 모든 요청명 처리로 함
public class FrontController extends HttpServlet {
  private static final long serialVersionUID = 1L;
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
          throws ServletException, IOException {

    String uri = req.getRequestURI(); //리퀘스트 내장객체에서 현재경로에서 호스트명을 제외한 나머지 부분을 아라냄
    int lastSlash = uri.lastIndexOf("/"); // 마지막 슬래시의 인덱스를 구함
    String commandStr = uri.substring(lastSlash); // 인덱스로 경로의 마지막 부분을 잘라서 얻어옴

    if (commandStr.equals("/regist.one")) //마지막 부분이 regist.one이면 해당 페이지로 처리(제목바꿈)
      registFunc(req);
    else if (commandStr.equals("/login.one"))
      loginFunc(req);
    else if (commandStr.equals("/freeboard.one"))
      freeboardFunc(req);

    req.setAttribute("uri", uri);
    req.setAttribute("commandStr", commandStr);
    req.getRequestDispatcher("/12Servlet/FrontController.jsp").forward(req, resp);
  }
  void registFunc(HttpServletRequest req){
    req.setAttribute("resultValue", "<h4>회원가입</h4>");
  }
  void loginFunc(HttpServletRequest req){
    req.setAttribute("resultValue", "<h4>로그인</h4>");
  }
  void freeboardFunc(HttpServletRequest req){
    req.setAttribute("resultValue", "<h4>자유게시판</h4>");
  }
}