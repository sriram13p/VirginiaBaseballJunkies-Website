package com.bezkoder.springjwt.service;

import com.bezkoder.springjwt.models.Registration;
import com.bezkoder.springjwt.models.Tournament;
import com.bezkoder.springjwt.repository.RegistrationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegistrationService {

    @Autowired
    private RegistrationRepository registrationRepository;

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
        registrations.forEach(registration -> registration.setChild(null));
        return registrations;
    }

    public List<Registration> fetchRegisterationsByTournament(Long id) {
        return registrationRepository.findByTournamentId(id);
    }
}
