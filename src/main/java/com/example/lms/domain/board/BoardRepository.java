package com.example.lms.domain.board;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.support.JpaRepositoryImplementation;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BoardRepository extends JpaRepositoryImplementation<BoardVO, Integer> {

    @Query(value = "select * from board where usercode = ?1", nativeQuery = true)
    public List<BoardVO> findByUsercode(int usercode);

}
