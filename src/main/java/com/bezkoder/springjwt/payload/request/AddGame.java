package com.bezkoder.springjwt.payload.request;

import jakarta.validation.constraints.NotBlank;

public class AddGame {

    @NotBlank
    private String gname;
    @NotBlank
    private String location;
    @NotBlank
    private String gameDate;
    @NotBlank
    private long tid;

    public AddGame() {
    }

    public AddGame(String gname, String location, String gameDate, long tid) {
        this.gname = gname;
        this.location = location;
        this.gameDate = gameDate;
        this.tid = tid;
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

    public @NotBlank String getGameDate() {
        return gameDate;
    }

    public void setGameDate(@NotBlank String gameDate) {
        this.gameDate = gameDate;
    }

    @NotBlank
    public long getTid() {
        return tid;
    }

    public void setTid(@NotBlank long tid) {
        this.tid = tid;
    }

    @Override
    public String toString() {
        return "AddGame{" +
                "gname='" + gname + '\'' +
                ", location='" + location + '\'' +
                ", gameDate='" + gameDate + '\'' +
                ", tid=" + tid +
                '}';
    }
}
