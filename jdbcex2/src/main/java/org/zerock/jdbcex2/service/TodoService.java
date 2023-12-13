package org.zerock.jdbcex2.service;


import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.zerock.jdbcex2.dao.TodoDAO;
import org.zerock.jdbcex2.domain.TodoVO;
import org.zerock.jdbcex2.dto.TodoDTO;
import org.zerock.jdbcex2.util.MapperUtil;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
public enum TodoService {
  INSTANCE;

  private TodoDAO dao;
  private ModelMapper modelMapper;

  TodoService(){
    dao = new TodoDAO();
    modelMapper = MapperUtil.INSTANCE.get();
  }

  // 서비스에서는 전문용어 insert가 아닌 register로 메소드명이 비즈니스 지향으로 바뀜.
  //register는 컨트롤러 등에서 사용
  //등록
  public void register(TodoDTO todoDTO) throws Exception{
    TodoVO todoVO = modelMapper.map(todoDTO, TodoVO.class);
    //System.out.println("todoVO: " + todoVO);
    log.info(todoVO);
    dao.insert(todoVO);
  }

  //전체 목록
  public List<TodoDTO> listAll() throws Exception{
    List<TodoVO> voList = dao.selectAll();
    log.info("voList.....................");
    log.info(voList);

    List<TodoDTO> dtoList = voList.stream()
            .map(vo -> modelMapper.map(vo, TodoDTO.class))
            .collect(Collectors.toList());
    return dtoList;
  }

  //상세조회
  public TodoDTO get(Long tno)throws Exception{
    log.info("tno: "+ tno);
    TodoVO todoVO = dao.selectOne(tno);
    TodoDTO todoDTO = modelMapper.map(todoVO, TodoDTO.class);
    return todoDTO;
  }

  public void remove(Long tno) throws Exception{
    log.info("tno : " + tno);
    dao.deleteOne(tno);
  }

  public void modify(TodoDTO todoDTO)throws Exception{
    log.info("todoDTO: " + todoDTO);
    TodoVO todoVO = modelMapper.map(todoDTO, TodoVO.class);
    dao.updateOne(todoVO);
  }

}
