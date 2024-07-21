package com.bezkoder.springjwt.service;

import com.bezkoder.springjwt.models.Team;
import com.bezkoder.springjwt.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeamService {

    @Autowired
    private TeamRepository teamRepository;

    public String saveAll(List<Team> teams) {
        try{
            if(teamRepository.saveAll(teams)!=null){
                return "success";
            }else{
                return "failed";
            }
        }catch(Exception e){
            return "Error Occured while saving, Try Again Later";
        }
    }

    public List<Team> findTeamsByGameIds(List<Long> gameIds) {
        return teamRepository.findByGameIdIn(gameIds);
    }

    public List<Team> findTeamsByRegistrationIds(List<Long> registrationIds) {
        return teamRepository.findByRegistrationIdIn(registrationIds);
    }
}
