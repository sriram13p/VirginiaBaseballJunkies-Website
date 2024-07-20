package com.bezkoder.springjwt.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "Tournaments")
public class Tournament {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String tname;

    @NotBlank
    private String location;

    private Date startDate;

    private Date endDate;
    @NotBlank
    private String organizer;
    @NotBlank
    private String league;
    @NotBlank
    private String ageAllowed;

    public Tournament() {
    }

    public Tournament(String tname, String location, Date startDate, Date endDate, String organizer, String league, String ageAllowed) {

        this.tname = tname;
        this.location = location;
        this.startDate = startDate;
        this.endDate = endDate;
        this.organizer = organizer;
        this.league = league;
        this.ageAllowed = ageAllowed;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public @NotBlank String getTname() {
        return tname;
    }

    public void setTname(@NotBlank String tname) {
        this.tname = tname;
    }

    public @NotBlank String getLocation() {
        return location;
    }

    public void setLocation(@NotBlank String location) {
        this.location = location;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public @NotBlank String getOrganizer() {
        return organizer;
    }

    public void setOrganizer(@NotBlank String organizer) {
        this.organizer = organizer;
    }

    public @NotBlank String getLeague() {
        return league;
    }

    public void setLeague(@NotBlank String league) {
        this.league = league;
    }

    public @NotBlank String getAgeAllowed() {
        return ageAllowed;
    }

    public void setAgeAllowed(@NotBlank String ageAllowed) {
        this.ageAllowed = ageAllowed;
    }

    @Override
    public String toString() {
        return "Tournament{" +
                "id=" + id +
                ", tname='" + tname + '\'' +
                ", location='" + location + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", organizer='" + organizer + '\'' +
                ", league='" + league + '\'' +
                ", ageAllowed='" + ageAllowed + '\'' +
                '}';
    }
}
