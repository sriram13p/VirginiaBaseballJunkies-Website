package com.bezkoder.springjwt.service;

import com.bezkoder.springjwt.models.Game;
import com.bezkoder.springjwt.repository.GameRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
