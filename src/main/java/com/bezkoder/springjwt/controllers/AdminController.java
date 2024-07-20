package com.bezkoder.springjwt.controllers;

import com.bezkoder.springjwt.models.Game;
import com.bezkoder.springjwt.models.Registration;
import com.bezkoder.springjwt.models.Tournament;
import com.bezkoder.springjwt.payload.request.AddGame;
import com.bezkoder.springjwt.payload.request.AddTournament;
import com.bezkoder.springjwt.payload.response.MessageResponse;
import com.bezkoder.springjwt.repository.TournamentRepo;
import com.bezkoder.springjwt.service.GameService;
import com.bezkoder.springjwt.service.RegistrationService;
import com.bezkoder.springjwt.service.TournamentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@PreAuthorize("hasRole('ADMIN')")
public class AdminController {

    @Autowired
    private TournamentService tournamentService;

    @Autowired
    private GameService gameService;

    @Autowired
    private TournamentRepo tournamentRepo;

    @Autowired
    private RegistrationService registrationService;

    @PostMapping("/tournament")
    @ResponseBody
    public ResponseEntity<?> addTournament(@RequestBody AddTournament addTournament) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate= formatter.parse(addTournament.getStartDate());
        Date endDate= formatter.parse(addTournament.getEndDate());
        Tournament tournament=new Tournament(addTournament.getTname(), addTournament.getLocation(),
                startDate,endDate,addTournament.getOrganizer(), addTournament.getLeague(),
                addTournament.getAgeAllowed().toString());

        String result=tournamentService.saveTournament(tournament);
        if (result.equals("success")) {
            return ResponseEntity.ok(new MessageResponse("Tournament Saved successfully!"));
        } else {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Error Try Again"));

        }
    }

    @PostMapping("/game")
    @ResponseBody
    public ResponseEntity<?> addGame(@RequestBody AddGame addGame) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date gameDate= formatter.parse(addGame.getGameDate());
        Tournament tournament=tournamentRepo.getReferenceById(addGame.getTid());
        Game game=new Game(addGame.getGname(), addGame.getLocation(), gameDate,tournament);

        String result=gameService.saveGame(game);
        if (result.equals("success")) {
            return ResponseEntity.ok(new MessageResponse("Tournament Saved successfully!"));
        } else {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Error Try Again"));

        }

    }


    @GetMapping("/tournament")
    @ResponseBody
    public List<Tournament> allTournments(){
        return tournamentService.allTournments();

    }

    @GetMapping("/game")
    @ResponseBody
    public ResponseEntity<?> getGames(@RequestParam Long id){
        try {
            List<Game> games =gameService.fetchGameByTournament(id);

            if (games != null) {
                return ResponseEntity.ok(games);
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Games not found");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to fetch Games");
        }
    }

    @GetMapping("/players")
    @ResponseBody
    public ResponseEntity<?> getPlayers(@RequestParam Long id){
        Game game = gameService.fetchGameById(id);

        List<Registration> registrations=
                registrationService.fetchRegisterationsByTournament(game.getTournament().getId());

        if (registrations != null) {
            return ResponseEntity.ok(registrations);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Players not found");
        }

    }

}
