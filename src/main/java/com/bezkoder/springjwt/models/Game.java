package com.bezkoder.springjwt.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

import java.util.Date;

@Entity
@Table(name = "Games")
public class Game {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String gname;

    @NotBlank
    private String location;

    private Date gameDate;

    @ManyToOne
    private Tournament tournament;

    public Game() {
    }

    public Game(String gname, String location, Date gameDate, Tournament tournament) {
        this.gname = gname;
        this.location = location;
        this.gameDate = gameDate;
        this.tournament = tournament;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public @NotBlank String getGname() {
        return gname;
    }

    public void setGname(@NotBlank String gname) {
        this.gname = gname;
    }

    public @NotBlank String getLocation() {
        return location;
    }

    public void setLocation(@NotBlank String location) {
        this.location = location;
    }

    public Date getGameDate() {
        return gameDate;
    }

    public void setGameDate(Date gameDate) {
        this.gameDate = gameDate;
    }

    public Tournament getTournament() {
        return tournament;
    }

    public void setTournament(Tournament tournament) {
        this.tournament = tournament;
    }

    @Override
    public String toString() {
        return "Game{" +
                "id=" + id +
                ", gname='" + gname + '\'' +
                ", location='" + location + '\'' +
                ", gameDate=" + gameDate +
                ", tournament=" + tournament +
                '}';
    }
}
