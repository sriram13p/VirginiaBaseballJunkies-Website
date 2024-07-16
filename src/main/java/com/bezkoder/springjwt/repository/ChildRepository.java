package com.bezkoder.springjwt.repository;

import com.bezkoder.springjwt.models.Child;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChildRepository extends JpaRepository<Child, Long> {
    List<Child> findByUserId(Long userId);
}
