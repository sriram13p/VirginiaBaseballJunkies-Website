package com.bezkoder.springjwt.service;

import com.bezkoder.springjwt.models.Game;
import com.bezkoder.springjwt.models.Registration;
import com.bezkoder.springjwt.repository.GameRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GameService {

    @Autowired
    private GameRepository gameRepository;

    public String saveGame(Game game) {
        if(gameRepository.save(game)!=null){
            return "success";
        }
        else{
            return "failed";
        }
    }

    public List<Game> fetchGameByTournament(Long id) {
        List<Game> games = gameRepository.findByTournamentId(id);
        return games;
    }

    public Game fetchGameById(Long id) {
        return gameRepository.getReferenceById(id);
    }
}
