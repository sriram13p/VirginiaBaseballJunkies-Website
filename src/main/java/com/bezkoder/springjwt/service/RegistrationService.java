package com.bezkoder.springjwt.service;

import com.bezkoder.springjwt.models.Registration;
import com.bezkoder.springjwt.models.Tournament;
import com.bezkoder.springjwt.payload.response.PlayersResponse;
import com.bezkoder.springjwt.repository.RegistrationRepository;
import com.bezkoder.springjwt.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
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

    public PlayersResponse fetchRegisterationsByTournament(Long id) {
        List<Registration> allRegistrations = registrationRepository.findByTournamentId(id);

        // Fetch all registration IDs that are already in the Teams table for the given tournament ID
        List<Long> registrationIdsInTeams = teamRepository.findRegistrationIdsByTournamentId(id);

        // Separate available and registered players
        List<Registration> availablePlayers = new ArrayList<>();
        List<Registration> registeredPlayers = new ArrayList<>();

        for (Registration registration : allRegistrations) {
            if (registrationIdsInTeams.contains(registration.getId())) {
                registeredPlayers.add(registration);
            } else {
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
