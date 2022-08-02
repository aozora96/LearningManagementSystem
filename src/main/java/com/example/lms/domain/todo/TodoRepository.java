package com.example.lms.domain.todo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TodoRepository extends JpaRepository<TodoVO, Integer> {
    @Query(value = "select * from todo where user_code = ?1", nativeQuery = true)
    public List<TodoVO> findByCode(int code);

}
