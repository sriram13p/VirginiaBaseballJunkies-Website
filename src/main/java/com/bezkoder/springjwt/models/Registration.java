package com.bezkoder.springjwt.models;

import jakarta.persistence.*;

@Entity
@Table(name = "Registrations",uniqueConstraints = {@UniqueConstraint(columnNames = {"child_id", "tournament_id"})})
public class Registration {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "child_id", nullable = false)
    private Child child;

    @ManyToOne
    @JoinColumn(name = "tournament_id", nullable = false)
    private Tournament tournament;

    private boolean willingToPlayUp;

    public Registration() {
    }

    public Registration(Child child, Tournament tournament, boolean willingToPlayUp) {

        this.child = child;
        this.tournament = tournament;
        this.willingToPlayUp = willingToPlayUp;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Child getChild() {
        return child;
    }

    public void setChild(Child child) {
        this.child = child;
    }

    public Tournament getTournament() {
        return tournament;
    }

    public void setTournament(Tournament tournament) {
        this.tournament = tournament;
    }

    public boolean isWillingToPlayUp() {
        return willingToPlayUp;
    }

    public void setWillingToPlayUp(boolean willingToPlayUp) {
        this.willingToPlayUp = willingToPlayUp;
    }
}
