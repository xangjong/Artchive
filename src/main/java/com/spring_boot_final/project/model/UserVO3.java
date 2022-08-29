package com.spring_boot_final.project.model;

import com.spring_boot_final.project.state.RollState;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@ToString
public class UserVO3 {
    private String userId;
    private String userPw;
    private String userEmail;
    private String userNickname;
    private String userGender;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date userBirth;
    private RollState userRoll;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;

    public UserVO3() {
    }

    public UserVO3(String userId, String userPw, String userEmail, String userNickname, String userGender, Date userBirth) {
        this.userId = userId;
        this.userPw = userPw;
        this.userEmail = userEmail;
        this.userNickname = userNickname;
        this.userGender = userGender;
        this.userBirth = userBirth;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public Date getUserBirth() {
        return userBirth;
    }

    public void setUserBirth(Date userBirth) {
        this.userBirth = userBirth;
    }

    public RollState getUserRoll() {
        return userRoll;
    }

    public void setUserRoll(RollState userRoll) {
        this.userRoll = userRoll;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}
