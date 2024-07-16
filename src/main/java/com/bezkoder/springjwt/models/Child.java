package com.bezkoder.springjwt.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name = "children")
public class Child {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String cname;

    @NotBlank
    private String dob;

    @NotBlank
    private String position;

    @NotBlank
    private String gender;

    @NotBlank
    private String jerseyNo;


    @ManyToOne
    private User user;

    public Child(){}

    public Child(String cname, String dob, String position, String gender, String jerseyNo, User user) {

        this.cname = cname;
        this.dob = dob;
        this.position = position;
        this.gender = gender;
        this.jerseyNo = jerseyNo;
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public @NotBlank String getCname() {
        return cname;
    }

    public void setCname(@NotBlank String cname) {
        this.cname = cname;
    }

    public @NotBlank String getDob() {
        return dob;
    }

    public void setDob(@NotBlank String dob) {
        this.dob = dob;
    }

    public @NotBlank String getPosition() {
        return position;
    }

    public void setPostion(@NotBlank String position) {
        this.position = position;
    }

    public @NotBlank String getGender() {
        return gender;
    }

    public void setGender(@NotBlank String gender) {
        this.gender = gender;
    }

    public @NotBlank String getJerseyNo() {
        return jerseyNo;
    }

    public void setJerseyNo(@NotBlank String jerseyNo) {
        this.jerseyNo = jerseyNo;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Child{" +
                "id=" + id +
                ", cname='" + cname + '\'' +
                ", dob='" + dob + '\'' +
                ", position='" + position + '\'' +
                ", gender='" + gender + '\'' +
                ", jerseyNo='" + jerseyNo + '\'' +
                ", user=" + user +
                '}';
    }
}

