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
    public List<TodoVO> getTodoList(@RequestBody TodoRequestDTO todoRequestDTO){
        System.out.println(todoRequestDTO.getUserCode());
        List<TodoVO> list = todoService.readTodoList(todoRequestDTO);
        if(list == null)
            System.out.println("NULL");
        return list;
    }
    @PostMapping("checkTodo")
    public void checkTodo(@RequestBody TodoRequestDTO todoRequestDTO){
        System.out.println("한번 보자 ");
        todoService.checkTodoList(todoRequestDTO);
    }
    @PostMapping("/addTodo")
    public void addTodoList(@RequestBody TodoRequestDTO todoRequestDTO){
        todoService.addTodoList(todoRequestDTO);
    }
}