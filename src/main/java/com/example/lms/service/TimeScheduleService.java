package com.example.lms.service;

import com.example.lms.domain.timeschedule.TimeScheduleDTO;
import com.example.lms.domain.timeschedule.TimeScheduleRepository;
import com.example.lms.domain.timeschedule.TimeScheduleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TimeScheduleService {
    @Autowired
    private TimeScheduleRepository timeScheduleRepository;

    //시간표 저장
    public void saveTime(TimeScheduleDTO dto){
        TimeScheduleVO vo = new TimeScheduleVO(dto);
       /* System.out.println(vo.getSubcode());
        System.out.println(vo.getUsercode());
        System.out.println(vo.getSub_schedule());
        System.out.println(vo.getTitle());
        System.out.println(vo.getP_name());*/
        timeScheduleRepository.save(vo);
    }

    //시간표 삭제
    public void delTime(TimeScheduleDTO dto){
        timeScheduleRepository.deleteById(dto.getSubcode());
    }

}