package com.example.lms.domain.timeschedule;

import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class TimeScheduleDTO {
    private int subcode;
    private int usercode;
    private String title,sub_schedule,p_name;
}