package com.bezkoder.springjwt.controllers;

import com.bezkoder.springjwt.models.Child;
import com.bezkoder.springjwt.models.Tournament;
import com.bezkoder.springjwt.models.User;
import com.bezkoder.springjwt.payload.request.AddChildRequest;
import com.bezkoder.springjwt.payload.request.LoginRequest;
import com.bezkoder.springjwt.payload.response.MessageResponse;
import com.bezkoder.springjwt.repository.UserRepository;
import com.bezkoder.springjwt.security.services.UserDetailsImpl;
import com.bezkoder.springjwt.service.ChildService;
import com.bezkoder.springjwt.service.TournamentService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@PreAuthorize("hasRole('USER')")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ChildService childService;

    @Autowired
    private TournamentService tournamentService;

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
    public List<Tournament> fetchTounrnaments(){
        long id=2;
        Child child=childService.fetchChild(id);
        String dobString=child.getDob();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate dob = LocalDate.parse(dobString, formatter);

        int age = calculateAge(dob, LocalDate.now());
        int ageIncrement=age+1;
        List<Tournament> tournaments=tournamentService.fetchTournament(ageIncrement+"");
        return tournaments;
    }

    private int calculateAge(LocalDate dob, LocalDate currentDate) {
        if ((dob != null) && (currentDate != null)) {
            return Period.between(dob, currentDate).getYears();
        } else {
            return 0;
        }
    }


}
