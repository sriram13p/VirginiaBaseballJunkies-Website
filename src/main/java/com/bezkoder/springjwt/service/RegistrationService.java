package com.bezkoder.springjwt.service;

import com.bezkoder.springjwt.models.Registration;
import com.bezkoder.springjwt.models.Team;
import com.bezkoder.springjwt.models.Tournament;
import com.bezkoder.springjwt.payload.response.PlayersResponse;
import com.bezkoder.springjwt.repository.RegistrationRepository;
import com.bezkoder.springjwt.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class RegistrationService {

    @Autowired
    private RegistrationRepository registrationRepository;

    @Autowired
    private TeamRepository teamRepository;

    public String save(Registration registration) {
        try{
            if(registrationRepository.save(registration)!=null){
                return "success";
            }else{
                return "failed";
            }
        }catch(Exception e){
            return "Error Occured while saving, Try Again Later";
        }
    }

    public List<Registration> fetchRegisterationByChild(Long id) {
        List<Registration> registrations = registrationRepository.findByChildId(id);
        registrations.forEach(registration -> registration.getChild().setUser(null));
        return registrations;
    }

    public PlayersResponse fetchRegistrationsByTournament(Long gid, Long id) {

        List<Team> teams=teamRepository.findByGameId(gid);
        // Retrieve all players registered for the game
        List<Registration> registeredPlayers = new ArrayList<>();
        for(Team team:teams){
            registeredPlayers.add(team.getRegistration());
        }


        // Retrieve all registrations for the tournament
        List<Registration> allRegistrations = registrationRepository.findByTournamentId(id);

        // Separate available players (those not registered for the game)
        List<Registration> availablePlayers = new ArrayList<>();

        // Create a set of registered player IDs for faster lookup
        Set<Long> registeredPlayerIds = registeredPlayers.stream()
                .map(reg -> reg.getChild().getId())
                .collect(Collectors.toSet());

        for (Registration registration : allRegistrations) {
            if (!registeredPlayerIds.contains(registration.getChild().getId())) {
                availablePlayers.add(registration);
            }
        }

        // Remove sensitive or unnecessary data from available players
        for (Registration registration : availablePlayers) {
            registration.getChild().setUser(null);
            registration.setTournament(null);
        }

        // Remove sensitive or unnecessary data from registered players
        for (Registration registration : registeredPlayers) {
            registration.getChild().setUser(null);
            registration.setTournament(null);
        }

        // Return the players response
        return new PlayersResponse(availablePlayers, registeredPlayers);
    }

    public List<Registration> fetchRegistrationsByIDs(List<Long> ids){
        return registrationRepository.findByIdIn(ids);
    }
}
