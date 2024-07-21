package com.bezkoder.springjwt.controllers;

import com.bezkoder.springjwt.models.*;
import com.bezkoder.springjwt.payload.request.AddChildRequest;

import com.bezkoder.springjwt.payload.request.RegistrationDTO;
import com.bezkoder.springjwt.payload.response.MessageResponse;
import com.bezkoder.springjwt.repository.ChildRepository;
import com.bezkoder.springjwt.repository.TournamentRepo;
import com.bezkoder.springjwt.repository.UserRepository;
import com.bezkoder.springjwt.security.services.UserDetailsImpl;
import com.bezkoder.springjwt.service.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@PreAuthorize("hasRole('USER')")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ChildService childService;

    @Autowired
    private TournamentService tournamentService;

    @Autowired
    private ChildRepository childRepository;

    @Autowired
    private TournamentRepo tournamentRepo;

    @Autowired
    private RegistrationService registrationService;

    @Autowired
    private TeamService teamService;

    @Autowired
    private GameService gameService;

    @PostMapping("/addChild")
    @ResponseBody
    public  ResponseEntity<?> addChild(@RequestBody AddChildRequest addChildRequest){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetailsImpl userDetails = (UserDetailsImpl) auth.getPrincipal();
        Long userID = userDetails.getId();
        User user=userRepository.getReferenceById(userID);
        Child child =new Child(
                addChildRequest.getCname(),
                addChildRequest.getDob(),
                addChildRequest.getPosition(),
                addChildRequest.getGender(),
                addChildRequest.getJerseyNo(),
                user
        );

        String result=childService.addChild(child);

        if (result.equals("success")) {
            return ResponseEntity.ok(new MessageResponse("Tournament Saved successfully!"));
        } else {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Error Try Again"));

        }

    }

    @GetMapping("/children")
    @ResponseBody
    public List<Child> children(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetailsImpl userDetails = (UserDetailsImpl) auth.getPrincipal();
        Long userID = userDetails.getId();

        return childService.getChildren(userID);

    }

    @GetMapping("/tournaments")
    @ResponseBody
    public ResponseEntity<?> fetchTounrnaments(@RequestParam Long id){
        Child child=childService.fetchChild(id);
        String dobString=child.getDob();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate dob = LocalDate.parse(dobString, formatter);
        int age = calculateAge(dob, LocalDate.now());

        try {
            List<Tournament> tournaments=tournamentService.fetchTournament(age+"",id);
            if (tournaments != null) {
                return ResponseEntity.ok(tournaments);
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Tournament not found");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to fetch tournament");
        }
    }

    @PostMapping("/registration")
    @ResponseBody
    public ResponseEntity<?> registration(@RequestBody RegistrationDTO registrationDTO){

        Child child = childRepository.getReferenceById(registrationDTO.getCid());
        Tournament tournament = tournamentRepo.getReferenceById(registrationDTO.getTid());

        Registration registration=new Registration(child,tournament, registrationDTO.isWillingToPlayUp());

        String result = registrationService.save(registration);
        if(result.equals("success")){
            return ResponseEntity.ok(new MessageResponse("Registration Saved successfully!"));
        }else{
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse(result));
        }

    }

    @GetMapping("/registrations")
    @ResponseBody
    public ResponseEntity<?> fetchRegistrations(@RequestParam Long id){
        try {
            List<Registration> registrations=registrationService.fetchRegisterationByChild(id);

            if (registrations != null) {
                return ResponseEntity.ok(registrations);
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Registrations not found");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to fetch Registrations");
        }
    }

    private int calculateAge(LocalDate dob, LocalDate currentDate) {
        if ((dob != null) && (currentDate != null)) {
            return Period.between(dob, currentDate).getYears();
        } else {
            return 0;
        }
    }

    @GetMapping("/games")
    @ResponseBody
    public ResponseEntity<?> fetchGames(@RequestParam Long id) {
        try {
            // Fetch registrations by child ID
            List<Registration> registrations = registrationService.fetchRegisterationByChild(id);

            // Extract registration IDs from registrations
            List<Long> registrationIds = registrations.stream()
                    .map(Registration::getId)
                    .collect(Collectors.toList());

            // Fetch teams by registration IDs
            List<Team> teamsByRegistrationIds = teamService.findTeamsByRegistrationIds(registrationIds);

            // Extract game IDs from the fetched teams
            List<Long> gameIds = teamsByRegistrationIds.stream()
                    .map(team -> team.getGame().getId())
                    .distinct()
                    .collect(Collectors.toList());

            // Fetch teams by game IDs
            List<Team> teamsByGameIds = teamService.findTeamsByGameIds(gameIds);

            // Combine both sets of teams
            Set<Team> combinedTeams = new HashSet<>(teamsByRegistrationIds);
            combinedTeams.addAll(teamsByGameIds);

            // Group teams by game ID
            Map<Long, List<Team>> teamsByGameMap = combinedTeams.stream()
                    .collect(Collectors.groupingBy(team -> team.getGame().getId()));

            // Fetch game details based on game IDs
            List<Game> games = gameService.findGamesByIds(new ArrayList<>(teamsByGameMap.keySet()));

            // Prepare the final response structure
            List<Map<String, Object>> response = games.stream().map(game -> {
                Map<String, Object> gameMap = new HashMap<>();
                gameMap.put("id", game.getId());
                gameMap.put("gname", game.getGname());
                gameMap.put("location", game.getLocation());
                gameMap.put("gameDate", game.getGameDate());
                gameMap.put("tournament", game.getTournament());

                // Get the teams for this game
                List<Team> teams = teamsByGameMap.get(game.getId());
                gameMap.put("teams", teams);

                return gameMap;
            }).collect(Collectors.toList());

            return ResponseEntity.ok(response);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to fetch data, try again later");
        }


    }

}
