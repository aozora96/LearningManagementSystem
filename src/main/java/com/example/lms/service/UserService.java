package com.example.lms.service;
import com.example.lms.domain.user.UserRepository;
import com.example.lms.domain.user.UserRequestDTO;
import com.example.lms.domain.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired // 서비스 repository 에 자동으로 연동해주는 것
    private UserRepository userRepository;

    // CRUD
    // 1. Create
    public void createUser(UserRequestDTO userRequestDto){
        UserVO user = new UserVO(userRequestDto);
        userRepository.save(user);
    }

    //check pw
//    public UserVO checkPw(UserRequestDTO dto){
//        UserVO temp;
//        String code = dto.getUsercode()+"";
//        Optional<UserVO> xx = userRepository.findById(code);
//        if(xx.isPresent()){
//            temp =  xx.get();
//        }else{
//            temp = null;
//        }
//        return temp;
//    }

     //Delete
//    @Transactional
//    public boolean deleteUser(UserRequestDTO userRequestDto){
//        UserVO check = checkPw(userRequestDto);
//        String code = userRequestDto.getUsercode()+"";
//        if(check.getPw().equals(userRequestDto.getPw())){
//            userRepository.deleteById(code);
//            return true;
//        }
//        return false;
//    }

    @Transactional
    public void deleteUser(UserRequestDTO dto){
//        userRepository.deleteById(dto.getId());
//        System.out.println("deleteUser: "+dto.getUsercode());
        UserVO vo = new UserVO(dto);
        userRepository.delete(vo);
    }

    public UserVO readUser(UserRequestDTO userRequestDto){
        List<UserVO> result = userRepository.findByStringId(userRequestDto.getId());
       if(result.isEmpty())
           return null;
       return result.get(0);
    }

    public UserVO readUserPw(UserRequestDTO userRequestDto){
        System.out.println("UserService: "+userRequestDto.getUsercode());
        System.out.println("USER PASS: "+userRequestDto.getPw());

        List<UserVO> result = userRepository.findByStringCodePw(userRequestDto.getUsercode(), userRequestDto.getPw());

        if(result.isEmpty())
            return null;
        return result.get(0);
    }
}
