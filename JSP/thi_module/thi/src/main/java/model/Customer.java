package model;

import java.time.LocalDate;

public class Customer {
    private int cId;
    private String name;
    private LocalDate birthday;
    private String identifyCard;
    private int customerType;

    public Customer() {
    }

    public Customer(String name, LocalDate birthday, String identifyCard, int customerType) {
        this.name = name;
        this.birthday = birthday;
        this.identifyCard = identifyCard;
        this.customerType = customerType;
    }

    public Customer(int cId, String name, LocalDate birthday, String identifyCard, int customerType) {
        this.cId = cId;
        this.name = name;
        this.birthday = birthday;
        this.identifyCard = identifyCard;
        this.customerType = customerType;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
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

    public String getIdentifyCard() {
        return identifyCard;
    }

    public void setIdentifyCard(String identifyCard) {
        this.identifyCard = identifyCard;
    }

    public int getCustomerType() {
        return customerType;
    }

    public void setCustomerType(int customerType) {
        this.customerType = customerType;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "cId=" + cId +
                ", name='" + name + '\'' +
                ", birthday=" + birthday +
                ", identifyCard='" + identifyCard + '\'' +
                ", customerType=" + customerType +
                '}';
    }
}
