package com.bezkoder.springjwt.controllers;

import com.bezkoder.springjwt.models.Tournament;
import com.bezkoder.springjwt.payload.request.AddTournament;
import com.bezkoder.springjwt.payload.response.MessageResponse;
import com.bezkoder.springjwt.service.TournamentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

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


    @GetMapping("/tournament")
    @ResponseBody
    public List<Tournament> allTournments(){
        return tournamentService.allTournments();

    }

}
