package com.bezkoder.springjwt.repository;

import com.bezkoder.springjwt.models.Tournament;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TournamentRepo extends JpaRepository<Tournament, Long> {

    @Query("SELECT t FROM Tournament t LEFT JOIN Registration r ON t.id = r.tournament.id AND r.child.id = :childId " +
            "WHERE t.endDate > CURRENT_DATE AND t.ageAllowed LIKE %:age% AND r.child.id IS NULL")
    List<Tournament> findByEndDateAfterAndAgeAllowedContainingAndChildNotRegistered(
            @Param("age") String age, @Param("childId") Long childId);
}
