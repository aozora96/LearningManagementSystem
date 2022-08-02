package com.example.lms.domain.Professor;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class ProfessorDTO {
    private int schedule_code;
    private int usercode;

    private int subcode,stucode;
    private String title,sub_schedule;
}