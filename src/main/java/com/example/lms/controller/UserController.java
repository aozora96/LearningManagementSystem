package com.example.lms.controller;

import com.example.lms.domain.user.UserRequestDTO;
import com.example.lms.domain.user.UserVO;
import com.example.lms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

    // CRUD

    // 1.create
    @PostMapping("/join")
    public String joinUser(@RequestBody UserRequestDTO userRequestDto){
        // readUser 메소드를 활용하여 입력한 ID가 db에 있는지 확인 후 -> 중복이 아니면 createUser()-> 회원가입 성공!
        if(userService.readUser(userRequestDto)==null){
        userService.createUser(userRequestDto);
         return userRequestDto.getId();
        }
        return null;
    }

    @DeleteMapping("/delete")
    public boolean delete(@RequestBody UserRequestDTO dto){
        System.out.println("UserController : "+dto.getUsercode());
        if(userService.readUserPw(dto) != null){
            userService.deleteUser(dto);
            System.out.println("회원정보 일치 -> 회원탈퇴 성공");
            return true;
        }
        System.out.println("회원정보 불일치 -> 회원탈퇴 실패");
        return false;

    }

    @PostMapping("/user")
    public UserVO getUser(@RequestBody UserRequestDTO userRequestDto){
        // 여기서
        System.out.println("getUser들어옴");
        UserVO user =  userService.readUser(userRequestDto);
        System.out.println(user);
        if(user == null)
            System.out.println("NULL");
        return user;
    }

    @PostMapping("/login")
    public void login(@RequestBody UserRequestDTO userRequestDto, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserVO user = getUser(userRequestDto);
        String url = "";
        if(user.getPw().equals(userRequestDto.getPw())){
            System.out.println("로그인성공");
            url ="/";
        }
        else {
            System.out.println(user.getPw());
            System.out.println(userRequestDto.getPw());
            url ="/login";
        }

        HttpSession session = request.getSession();
        session.setAttribute("log",user.getUsercode());
    }
}
