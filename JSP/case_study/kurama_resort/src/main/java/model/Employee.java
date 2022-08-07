package model;

import java.time.LocalDate;

public class Employee extends Person{
    private String educationDegree;
    private String position;
    private double salary;
    private String division;

    public Employee() {
    }

    public Employee(String educationDegree, String position, double salary, String division) {
        this.educationDegree = educationDegree;
        this.position = position;
        this.salary = salary;
        this.division = division;
    }

    public Employee(int pId, String name, LocalDate birthday, int gender, String identifyCard, String phoneNumber, String email, String educationDegree, String position, double salary, String division) {
        super(pId, name, birthday, gender, identifyCard, phoneNumber, email);
        this.educationDegree = educationDegree;
        this.position = position;
        this.salary = salary;
        this.division = division;
    }

    public String getEducationDegree() {
        return educationDegree;
    }

    public void setEducationDegree(String educationDegree) {
        this.educationDegree = educationDegree;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    @Override
    public String toString() {
        return "Employee{" + super.toString() +
                "educationDegree='" + educationDegree + '\'' +
                ", position='" + position + '\'' +
                ", salary=" + salary +
                ", division='" + division + '\'' +
                '}';
    }
}
