package model;

import java.time.LocalDate;

public abstract class Person {
    private int pId;
    private String name;
    private LocalDate birthday;
    private int gender;
    private String identifyCard;
    private  String phoneNumber;
    private  String email;

    public Person() {
    }

    public Person(int pId, String name,
                  LocalDate birthday, int gender,
                  String identifyCard, String phoneNumber,
                  String email) {
        this.pId = pId;
        this.name = name;
        this.birthday = birthday;
        this.gender = gender;
        this.identifyCard = identifyCard;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getIdentifyCard() {
        return identifyCard;
    }

    public void setIdentifyCard(String identifyCard) {
        this.identifyCard = identifyCard;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Person{" +
                "pId='" + pId + '\'' +
                ", name='" + name + '\'' +
                ", birthday=" + birthday +
                ", gender='" + gender + '\'' +
                ", identifyCard='" + identifyCard + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
