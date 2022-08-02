package com.example.lms.controller;

import com.example.lms.domain.timeschedule.TimeScheduleDTO;
import com.example.lms.domain.timeschedule.TimeScheduleVO;
import com.example.lms.service.TimeScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

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
    @PostMapping("/showTime")
    public ArrayList shoeTime(@RequestBody TimeScheduleDTO dto){
        ArrayList<TimeScheduleVO> schedule = new ArrayList<>();
        List<TimeScheduleVO> temp = timeScheduleService.showTime();
        for(int i=0; i<temp.size(); i++){
            if(dto.getUsercode() == temp.get(i).getUsercode()){
                schedule.add(temp.get(i));
            }
        }
        return schedule;
    }


}