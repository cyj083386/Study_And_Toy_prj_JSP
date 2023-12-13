package org.zerock.dao.service;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.zerock.jdbcex2.dto.TodoDTO;
import org.zerock.jdbcex2.service.TodoService;

import java.time.LocalDate;

//특정부분만 로그를 찝어 보고싶은경우 AOP 사용
@Log4j2
public class TodoServiceTests {

  private TodoService todoService;

  @BeforeEach
  public void ready(){
    todoService = TodoService.INSTANCE;
  }

  @Test
  public void testRegister() throws Exception{
    TodoDTO todoDTO = TodoDTO.builder()
            .title("JDBC Test Title")
            .dueDate(LocalDate.now())
            .build();
    log.info("------------------------");
    log.info(todoDTO);

    todoService.register(todoDTO);
  }


}
