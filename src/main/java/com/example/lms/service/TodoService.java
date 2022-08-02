package com.example.lms.service;

import com.example.lms.domain.todo.TodoRepository;
import com.example.lms.domain.todo.TodoRequestDTO;
import com.example.lms.domain.todo.TodoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class TodoService {
    @Autowired
    private TodoRepository todoRepository;

    public List<TodoVO> readTodoList(@RequestBody TodoRequestDTO todoRequestDTO){
        System.out.println(todoRequestDTO.getUserCode());
        List<TodoVO> result = todoRepository.findByCode(todoRequestDTO.getUserCode());
        //List<TodoVO> result = todoRepository.findByCode(1005);
        if(result.isEmpty()){
            System.out.println("결과없음");
            return null;
        }
        else {
            System.out.println("가져옴");
        }
        return result;
    }

    public void addTodoList(@RequestBody TodoRequestDTO todoRequestDTO){
        TodoVO todoVO = new TodoVO(todoRequestDTO);
        todoRepository.save(todoVO);
    }
    @Transactional
    public void checkTodoList(@RequestBody TodoRequestDTO todoRequestDTO){
        TodoVO todoVO = new TodoVO(todoRequestDTO);
        System.out.println(todoVO.getTodoCode());
        todoRepository.updateTodoChecked(todoVO.getTodoCode());
    }


}