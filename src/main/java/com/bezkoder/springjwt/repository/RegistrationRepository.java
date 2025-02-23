package com.bezkoder.springjwt.repository;

import com.bezkoder.springjwt.models.Registration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RegistrationRepository extends JpaRepository<Registration, Long> {

    List<Registration> findByChildId(Long id);

    List<Registration> findByTournamentId(Long id);

    List<Registration> findByIdIn(List<Long> ids);
}
