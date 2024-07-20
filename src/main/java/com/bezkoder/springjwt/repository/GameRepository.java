package com.bezkoder.springjwt.repository;


import com.bezkoder.springjwt.models.Game;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GameRepository extends JpaRepository<Game, Long> {
}
