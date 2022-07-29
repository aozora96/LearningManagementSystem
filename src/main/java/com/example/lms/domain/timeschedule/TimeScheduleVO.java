package com.example.lms.domain.timeschedule;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Table(name="timeschedule")
@NoArgsConstructor
//@AllArgsConstructor
@Entity
public class TimeScheduleVO {
    @Id
    private int subcode;

    private int usercode;
    private String title,sub_schedule,p_name;

    public TimeScheduleVO(TimeScheduleDTO dto){
        this.subcode = dto.getSubcode();
        this.usercode = dto.getUsercode();
        this.title = dto.getTitle();
        this.sub_schedule = dto.getSub_schedule();
        this.p_name = dto.getP_name();
    }
}