package com.bezkoder.springjwt.repository;


import com.bezkoder.springjwt.models.Game;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GameRepository extends JpaRepository<Game, Long> {

    List<Game> findByTournamentId(Long id);
}
