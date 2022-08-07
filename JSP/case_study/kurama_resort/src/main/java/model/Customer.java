package model;

import java.time.LocalDate;

public class Customer extends Person{
    private int customerType;
    private String address;

    public Customer() {
    }

    public Customer(int customerType, String address) {
        this.customerType = customerType;
        this.address = address;
    }

    public Customer(int pId, String name, LocalDate birthday, int gender, String identifyCard, String phoneNumber, String email, int customerType, String address) {
        super(pId, name, birthday, gender, identifyCard, phoneNumber, email);
        this.customerType = customerType;
        this.address = address;
    }

    public int getCustomerType() {
        return customerType;
    }

    public void setCustomerType(int customerType) {
        this.customerType = customerType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "customerType='" + customerType + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
