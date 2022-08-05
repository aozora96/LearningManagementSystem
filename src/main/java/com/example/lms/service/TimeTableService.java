package com.example.lms.service;

import com.example.lms.domain.TimeTable.TimeTableDTO;
import com.example.lms.domain.TimeTable.TimeTableRepository;
import com.example.lms.domain.TimeTable.TimeTableVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@Service
public class TimeTableService {
    @Autowired
    private TimeTableRepository timeTableRepository;

    //시간표 저장
    public void saveTime(TimeTableDTO dto){
        TimeTableVO vo = new TimeTableVO(dto);
       /* System.out.println(vo.getSubcode());
        System.out.println(vo.getUsercode());
        System.out.println(vo.getSub_schedule());
        System.out.println(vo.getTitle());
        System.out.println(vo.getP_name());*/
        timeTableRepository.save(vo);
    }

    //시간표 삭제
    public void delTime(int time_code){
        timeTableRepository.deleteById(time_code);
    }

    //시간표 불러오기
    public List showTime(){
        List<TimeTableVO> temp = timeTableRepository.findAll();
        return temp;
    }

    public List<TimeTableVO> getScore(@RequestBody TimeTableDTO dto){
        System.out.println("ss: "+dto.getUsercode());
        List<TimeTableVO> list = timeTableRepository.findByCode(dto.getUsercode());
        return list;
    }
}