package com.bezkoder.springjwt.service;

import com.bezkoder.springjwt.models.Tournament;
import com.bezkoder.springjwt.repository.TournamentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TournamentService {
    @Autowired
    private TournamentRepo tournamentRepo;
    public String saveTournament(Tournament tournament){

        if(tournamentRepo.save(tournament)!=null){
            return "success";
        }
        else{
            return "failed";
        }
    }

    public List<Tournament> allTournments() {
        return tournamentRepo.findAll();
    }

    public List<Tournament> fetchTournament(String s, Long id) {
        List<Tournament> tournaments= tournamentRepo.findByEndDateAfterAndAgeAllowedContainingAndChildNotRegistered(s,id);
        return tournaments;
    }
}
