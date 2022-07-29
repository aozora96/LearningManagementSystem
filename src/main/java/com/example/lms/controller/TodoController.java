package com.example.lms.controller;

import com.example.lms.domain.todo.TodoRequestDTO;
import com.example.lms.domain.todo.TodoVO;
import com.example.lms.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TodoController {
    @Autowired
    private TodoService todoService;

    @PostMapping("/getTodo")
    public List<TodoVO> getTodoList(){
        List<TodoVO> list = todoService.readTodoList();
        if(list == null)
            System.out.println("NULL");
        for(int i = 0; i<list.size(); i++){
            System.out.println("사용자 코드: "+list.get(i).getUserCode());
            System.out.println("TODO NO: "+list.get(i).getTodoCode());
            System.out.println("TODO 내용: "+list.get(i).getContents());
        }
        return list;
    }
}