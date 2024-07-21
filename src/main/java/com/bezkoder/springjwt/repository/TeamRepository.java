package com.bezkoder.springjwt.repository;

import com.bezkoder.springjwt.models.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeamRepository extends JpaRepository<Team,Long> {

    @Query("SELECT t.registration.id FROM Team t WHERE t.game.tournament.id = :tournamentId")
    List<Long> findRegistrationIdsByTournamentId(@Param("tournamentId") Long tournamentId);

}
