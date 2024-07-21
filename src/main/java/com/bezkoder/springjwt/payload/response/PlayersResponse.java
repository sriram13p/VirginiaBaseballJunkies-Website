package com.bezkoder.springjwt.payload.response;

import com.bezkoder.springjwt.models.Registration;

import java.util.List;

public class PlayersResponse {
    private List<Registration> availablePlayers;
    private List<Registration> registeredPlayers;

    // Constructors, getters, and setters
    public PlayersResponse(List<Registration> availablePlayers, List<Registration> registeredPlayers) {
        this.availablePlayers = availablePlayers;
        this.registeredPlayers = registeredPlayers;
    }

    public List<Registration> getAvailablePlayers() {
        return availablePlayers;
    }

    public void setAvailablePlayers(List<Registration> availablePlayers) {
        this.availablePlayers = availablePlayers;
    }

    public List<Registration> getRegisteredPlayers() {
        return registeredPlayers;
    }

    public void setRegisteredPlayers(List<Registration> registeredPlayers) {
        this.registeredPlayers = registeredPlayers;
    }
}
