package com.example.lms.controller;

import com.example.lms.domain.timeschedule.TimeScheduleDTO;
import com.example.lms.service.TimeScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class TimeScheduleController {
    @Autowired
    private TimeScheduleService timeScheduleService;

    @PostMapping("/saveTime")
    public void savaTime(@RequestBody TimeScheduleDTO dto){
        timeScheduleService.saveTime(dto);
    }

    @DeleteMapping("/delTime")
    public void  delTime(@RequestBody TimeScheduleDTO dto){
        timeScheduleService.delTime(dto);
    }

}