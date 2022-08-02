package com.example.lms.domain.Professor;

import org.springframework.data.jpa.repository.support.JpaRepositoryImplementation;
import org.springframework.stereotype.Repository;

@Repository
public interface ProfessorRepository extends JpaRepositoryImplementation<ProfessorVO, Integer> {
}