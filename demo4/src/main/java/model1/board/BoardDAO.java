package model1.board;

import common.JDBConnect;

import javax.servlet.ServletContext;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class BoardDAO extends JDBConnect {
  //application 내장 객체를 통해 JDBConnect 생성자에서 web.xml에 정의해둔 mariadb 접속정보를 직접 가져와 DB에 연결
  public BoardDAO(ServletContext application) {
    super(application);
  }

  //검색 조건에 맞는 게시물의 개수를 반환합니다.
  public int selectCount(Map<String, Object> map) {
    int totalCount = 0; // 결과(게시물 수)를 담을 변수

    //게시물 수를 얻어오는 쿼리문 작성
    String query = "SELECT COUNT(*) FROM board";
    if (map.get("searchWord") != null) {
      query += " WHERE " + map.get("searchField") + " "
              + " LIKE '%" + map.get("searchWord") + "%'";
    }

    try {
      stmt = con.createStatement(); // 쿼리문 생성
      rs = stmt.executeQuery(query); //쿼리실행
      rs.next(); //커서를 첫번째 행으로 이동
      totalCount = rs.getInt(1); //select절에 명시된 컬럼의 인덱스, 1부터 시작이므로 첫번째 컬럼 값을 가져옴
    } catch (Exception e) { //jdbc 프로그래밍은 기본적으로 예외처리를 해야됨
      System.out.println("게시물 수를 구하는 중 예외 발생");
      e.printStackTrace();
    }
    return totalCount;
  }

  public List<BoardDTO> selectList(Map<String, Object> map) {
    //결과(게시물 목록을 담을 변수)
    // 테이블에서 레코드를 가져올때는 항상 List 계열의 컬렉션에 저장. 순서대로 저장되어 있어 인덱스를 통해 가져올수 있기때문
    //Vector 이외에도 List 계열의 컬렉션(ArrayList, LinkedList)이라면 모두 사용 가능
    List<BoardDTO> bbs = new Vector<BoardDTO>();

    String query = "SELECT * FROM board ";
    if (map.get("searchWord") != null) {
      query += " WHERE " + map.get("searchField") + " "
              + " LIKE '%" + map.get("searchWord") + "%' ";
    }
    query += " ORDER BY num DESC ";

    try {
      stmt = con.createStatement(); // 쿼리문 생성
      rs = stmt.executeQuery(query); // 쿼리실행

      while (rs.next()) { //결과 result set순회
        BoardDTO dto = new BoardDTO();

        dto.setNum(rs.getString("num")); //일련번호
        dto.setTitle(rs.getString("title")); //제목
        dto.setContent(rs.getString("content")); //내용
        dto.setPostdate(rs.getDate("postdate")); //작성일
        dto.setId(rs.getString("id")); //작성자 아이디
        dto.setVisitcount(rs.getString("visitcount")); //조회수

        bbs.add(dto); // 결과 목록에 저장
      }
    } catch (Exception e) {
      System.out.println("게시물 조회 중 예외 발생");
      e.printStackTrace();
    }
    return bbs;
  }


  // 게시글 데이터를 받아 DB에 추가합니다.
  public int insertWrite(BoardDTO dto) { //BoardDTO 타입의 매개변수를 받음
    int result = 0;

    try {
      // 데이터 INSERT 쿼리문 작성
      String query = "INSERT INTO board ( "
              + " title,content,id,visitcount) "
              + " VALUES ( "
              + " ?, ?, ?, 0)";

      psmt = con.prepareStatement(query);  // 동적 쿼리
      psmt.setString(1, dto.getTitle());
      psmt.setString(2, dto.getContent());
      psmt.setString(3, dto.getId());

      result = psmt.executeUpdate(); //insert 성공한 행의 개수를 정수로 반환
    } catch (Exception e) {
      System.out.println("게시물 입력 중 예외 발생");
      e.printStackTrace();
    }

    return result;
  }








}