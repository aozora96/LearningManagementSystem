package com.example.lms.domain.board;

import com.example.lms.util.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Table(name = "board")
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class BoardVO extends Timestamp {
    @Id
    private int board_code;
    @Column
    private String title;
    @Column
    private String contents;
    @Column
    private int usercode;
    @Column
    private char grade;

    public BoardVO(BoardDTO dto){
        this.board_code = dto.getBoard_code();
        this.title = dto.getTitle();
        this.contents = dto.getContents();
        this.usercode = dto.getUsercode();
        this.grade = dto.getGrade();
    }
}

