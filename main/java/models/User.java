package models;

import java.io.Serializable;

public class User implements Serializable {
    private String firstName;
    private String lastName;
    private String email;
    private String gender;
    private String[] hobbies;
    private String sourceOfIncome;
    private int income;
    private String profilePicture;
    private int age;
    private String bio;

    // Constructor
    public User() {}

    // Getters and Setters
    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    
    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    
    public String[] getHobbies() { return hobbies; }
    public void setHobbies(String[] hobbies) { this.hobbies = hobbies; }
    
    public String getSourceOfIncome() { return sourceOfIncome; }
    public void setSourceOfIncome(String sourceOfIncome) { this.sourceOfIncome = sourceOfIncome; }
    
    public int getIncome() { return income; }
    public void setIncome(int income) { this.income = income; }
    
    public String getProfilePicture() { return profilePicture; }
    public void setProfilePicture(String profilePicture) { this.profilePicture = profilePicture; }
    
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
    
    public String getBio() { return bio; }
    public void setBio(String bio) { this.bio = bio; }
}