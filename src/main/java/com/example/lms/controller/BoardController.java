package com.example.lms.controller;

import com.example.lms.domain.board.BoardDTO;
import com.example.lms.domain.board.BoardVO;
import com.example.lms.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class BoardController {

    @Autowired
    private BoardService boardService;

    // CRUD
    // 1. 게시글 작성 (create)
    @PostMapping("/boardWrite")
    public void write(@RequestBody BoardDTO dto){
        System.out.println("얍");
        boardService.write(dto);
    }
    // 2. 게시글 조회 (read)
    @PostMapping("/boardList")
   public List getBoard(){
        List<BoardVO> temp = boardService.boardList();
        if(temp.size()==0) System.out.println("등록된 게시글 없음");
        return temp;
    }
    // 3. 게시글 수정 (update)
    // 4. 게시글 삭제 (delete)



}
