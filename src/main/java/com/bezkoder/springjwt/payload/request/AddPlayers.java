package com.bezkoder.springjwt.payload.request;

import java.util.List;

public class AddPlayers {
    private long gameID;
    private List<Long> playersRegistrationIDs;

    public AddPlayers() {
    }

    public AddPlayers(long gameID, List<Long> playersRegistrationIDs) {
        this.gameID = gameID;
        this.playersRegistrationIDs = playersRegistrationIDs;
    }

    public long getGameID() {
        return gameID;
    }

    public void setGameID(long gameID) {
        this.gameID = gameID;
    }

    public List<Long> getPlayersRegistrationIDs() {
        return playersRegistrationIDs;
    }

    public void setPlayersRegistrationIDs(List<Long> playersRegistrationIDs) {
        this.playersRegistrationIDs = playersRegistrationIDs;
    }

    @Override
    public String toString() {
        return "addPlayers{" +
                "gameID=" + gameID +
                ", playersRegistrationIDs=" + playersRegistrationIDs +
                '}';
    }
}
