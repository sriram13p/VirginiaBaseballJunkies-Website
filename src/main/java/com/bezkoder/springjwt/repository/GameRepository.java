package com.bezkoder.springjwt.repository;


import com.bezkoder.springjwt.models.Game;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.ArrayList;
import java.util.List;

public interface GameRepository extends JpaRepository<Game, Long> {

    List<Game> findByTournamentId(Long id);

    List<Game> findByTournamentIdIn(List<Long> tournamentIds);

    List<Game> findByIdIn(ArrayList<Long> gameIds);
}
