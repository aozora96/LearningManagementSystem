package com.example.lms.service;

import com.example.lms.domain.board.BoardDTO;
import com.example.lms.domain.board.BoardRepository;
import com.example.lms.domain.board.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    private BoardRepository boardRepository;

    public void write(BoardDTO dto){
    BoardVO bd = new BoardVO(dto);
    boardRepository.save(bd);
    }

    public BoardVO readBoard(BoardDTO dto){
    List<BoardVO> result = boardRepository.findByUsercode(dto.getUsercode());
    if(result.isEmpty()) return null;
    System.out.println("야 너 유저코드야!? "+result.get(4));
    return result.get(4);
    }

    // to get Board List
    public List boardList(){
        List<BoardVO> boardList = boardRepository.findAll();
        return boardList;
    }

}
