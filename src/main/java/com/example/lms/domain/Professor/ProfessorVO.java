package com.example.lms.domain.Professor;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Table(name="pro_schedule")
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class ProfessorVO {
    @Id
    private int schedule_code;

    @Column(name="usercode", nullable = false)
    private int usercode;

    @Column(name="subcode", nullable = false)
    private int subcode;

    @Column(name="stucode", nullable = false)
    private int stucode;

    @Column(name="title", nullable = false)
    private String title;

    @Column(name="sub_schedule", nullable = false)
    private String sub_schedule;

    public ProfessorVO(ProfessorDTO dto){
        this.schedule_code = dto.getSchedule_code();
        this.usercode = dto.getUsercode();
        this.subcode = dto.getSubcode();
        this.stucode = dto.getStucode();
        this.title = dto.getTitle();
        this.sub_schedule = dto.getSub_schedule();
    }

}