package com.example.lms.service;

import com.example.lms.domain.todo.TodoRepository;
import com.example.lms.domain.todo.TodoRequestDTO;
import com.example.lms.domain.todo.TodoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TodoService {
    @Autowired
    private TodoRepository todoRepository;

    public List<TodoVO> readTodoList(){
        List<TodoVO> result = todoRepository.findAll();
        if(result.isEmpty()){
            System.out.println("결과 없넹");
            return null;
        }
        else System.out.println("1개 이상 가져왔엉");
        return result;
    }

}