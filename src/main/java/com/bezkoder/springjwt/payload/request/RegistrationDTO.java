package com.bezkoder.springjwt.payload.request;

public class RegistrationDTO {
    private long tid;
    private long cid;
    private boolean willingToPlayUp;

    public RegistrationDTO() {
    }

    public RegistrationDTO(long tid, long cid, boolean willingToPlayUp) {
        this.tid = tid;
        this.cid = cid;
        this.willingToPlayUp = willingToPlayUp;
    }

    public long getTid() {
        return tid;
    }

    public void setTid(long tid) {
        this.tid = tid;
    }

    public long getCid() {
        return cid;
    }

    public void setCid(long cid) {
        this.cid = cid;
    }

    public boolean isWillingToPlayUp() {
        return willingToPlayUp;
    }

    public void setWillingToPlayUp(boolean willingToPlayUp) {
        this.willingToPlayUp = willingToPlayUp;
    }

    @Override
    public String toString() {
        return "RegistrationDTO{" +
                "tid=" + tid +
                ", cid=" + cid +
                ", willingToPlayUp=" + willingToPlayUp +
                '}';
    }
}
