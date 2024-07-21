package com.bezkoder.springjwt.models;

import jakarta.persistence.*;

@Entity
@Table(name = "Team",uniqueConstraints = {@UniqueConstraint(columnNames = {"game_id", "registration_id"})})
public class Team {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "game_id", nullable = false)
    private Game game;

    @ManyToOne
    @JoinColumn(name = "registration_id", nullable = false)
    private Registration registration;

    public Team() {
    }

    public Team(Game game, Registration registration) {
        this.game = game;
        this.registration = registration;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Game getGame() {
        return game;
    }

    public void setGame(Game game) {
        this.game = game;
    }

    public Registration getRegistration() {
        return registration;
    }

    public void setRegistration(Registration registration) {
        this.registration = registration;
    }

    @Override
    public String toString() {
        return "Team{" +
                "id=" + id +
                ", game=" + game +
                ", registration=" + registration +
                '}';
    }
}
