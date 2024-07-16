package com.bezkoder.springjwt.payload.request;

import jakarta.validation.constraints.NotBlank;

public class AddChildRequest {
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

    public void setPostion(@NotBlank String postion) {
        this.position = postion;
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

    @Override
    public String toString() {
        return "AddChildRequest{" +
                "cname='" + cname + '\'' +
                ", dob='" + dob + '\'' +
                ", postion='" + position + '\'' +
                ", gender='" + gender + '\'' +
                ", jerseyNo='" + jerseyNo +
                '}';
    }
}
