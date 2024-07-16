package com.bezkoder.springjwt.payload.request;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotBlank;

import java.util.List;

public class AddTournament {

    @NotBlank
    private String tname;
    @NotBlank
    private String location;
    @NotBlank
    private String startDate;
    @NotBlank
    private String endDate;
    @NotBlank
    private String organizer;
    @NotBlank
    private String league;


    private List<String> ageAllowed;

    public @NotBlank String getLeague() {
        return league;
    }

    public void setLeague(@NotBlank String league) {
        this.league = league;
    }


    public List<String> getAgeAllowed() {
        return ageAllowed;
    }

    public void setAgeAllowed(List<String> ageAllowed) {
        this.ageAllowed = ageAllowed;
    }

    public AddTournament() {
    }

    public AddTournament(String tname, String location, String startDate, String endDate, String organizer,
                         String league, List<String> ageAllowed) {
        this.tname = tname;
        this.location = location;
        this.startDate = startDate;
        this.endDate = endDate;
        this.organizer = organizer;
        this.league = league;
        this.ageAllowed = ageAllowed;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getOrganizer() {
        return organizer;
    }

    public void setOrganizer(String organizer) {
        this.organizer = organizer;
    }

    @Override
    public String toString() {
        return "Tournament{" +
                ", tname='" + tname + '\'' +
                ", location='" + location + '\'' +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", organizer='" + organizer + '\'' +
                ", league='" + league + '\'' +
                ", ageAllowed=" + ageAllowed +
                '}';
    }
}
