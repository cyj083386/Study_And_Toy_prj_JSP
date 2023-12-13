package org.zerock.jdbcex2.controller;

import lombok.extern.log4j.Log4j2;
import org.zerock.jdbcex2.dto.TodoDTO;
import org.zerock.jdbcex2.service.TodoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name="todoRegisterController", urlPatterns = "/todo/register")
@Log4j2
public class TodoRegisterController extends HttpServlet {
  private TodoService todoService = TodoService.INSTANCE;
  private final DateTimeFormatter DATEFORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");



  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    log.info("/todo/register GET..............");
    req.getRequestDispatcher("/WEB-INF/todo/register.jsp").forward(req, resp);

  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    TodoDTO todoDTO = TodoDTO.builder()
            .title(req.getParameter("title"))
            .dueDate(LocalDate.parse(req.getParameter("dueDate"), DATEFORMATTER ))
            .build();
    log.info("todo/register Post......");
    log.info(todoDTO);

    try {
      todoService.register(todoDTO);
    }catch (Exception e){
      e.printStackTrace();
    }
    resp.sendRedirect("/todo/list");
  }

}
