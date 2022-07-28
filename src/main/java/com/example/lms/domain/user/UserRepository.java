package com.example.lms.domain.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<UserVO, String> {

    @Query(value = "select * from student where id = ?1", nativeQuery = true)
    public List<UserVO> findByStringId(String id);

    @Query(value = "select * from student where id =?1, pw =?2", nativeQuery = true)
    public List<UserVO> findByStringIdPw(String id, String pw);
}
