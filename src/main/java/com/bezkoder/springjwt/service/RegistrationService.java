package com.bezkoder.springjwt.service;

import com.bezkoder.springjwt.models.Registration;
import com.bezkoder.springjwt.repository.RegistrationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
