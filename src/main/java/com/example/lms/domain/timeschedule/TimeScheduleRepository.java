package com.example.lms.domain.timeschedule;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TimeScheduleRepository extends JpaRepository<TimeScheduleVO, Integer> {

}