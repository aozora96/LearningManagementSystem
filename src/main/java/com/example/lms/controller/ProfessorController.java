package com.example.lms.controller;

import com.example.lms.domain.Professor.ProfessorDTO;
import com.example.lms.domain.Professor.ProfessorVO;
import com.example.lms.service.ProfessorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ProfessorController {

    @Autowired
    private ProfessorService professorService;

    @PostMapping("/savePro")
    public boolean savePro(@RequestBody ProfessorDTO dto){
        boolean save = professorService.saveProTime(dto);
        return save;
    }

    @PostMapping("/delPro")
    public boolean delPro(@RequestBody ProfessorDTO dto){
        List<ProfessorVO> temp = professorService.getProTime();
        for(int i=0; i<temp.size(); i++){
            if(temp.get(i).getStucode() == dto.getStucode() && temp.get(i).getSubcode() == dto.getSubcode()){
                professorService.delProTime(temp.get(i).getSchedule_code());
            }
        }
        boolean del =true;
        return del;
    }

}