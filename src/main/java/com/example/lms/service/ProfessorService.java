package com.example.lms.service;

import com.example.lms.domain.Professor.ProfessorDTO;
import com.example.lms.domain.Professor.ProfessorRepository;
import com.example.lms.domain.Professor.ProfessorVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProfessorService {

    @Autowired
    private ProfessorRepository professorRepository;

    //수강신청한 학생코드 교수테이블에 추가
    public boolean saveProTime(ProfessorDTO dto){
        ProfessorVO vo= new ProfessorVO(dto);
        professorRepository.save(vo);
        return true;
    }

    //수강신청 취소 교수테이블에 반영
    public void delProTime(int schedule_code){
        professorRepository.deleteById(schedule_code);
    }

    //schedule_code GET
    public List getProTime(){
        List<ProfessorVO> temp = professorRepository.findAll();
        return temp;
    }
}