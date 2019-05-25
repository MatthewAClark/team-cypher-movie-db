package com.team.cypher.moviemadness;

import java.util.ArrayList;

public class User {
    private int userId;
    private String username;
    private String password;
    private String userFullName;
    private int userAge;
    private String userEmail;
    private String userJoinDate;
    private String isAdmin;
    static InitialiseDB initDB = new InitialiseDB();

    public User() {

    }

    public User(int userId, String username, String password, String userFullName, int userAge, String userEmail, String userJoinDate, String isAdmin) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.userFullName = userFullName;
        this.userAge = userAge;
        this.userEmail = userEmail;
        this.userJoinDate = userJoinDate;
        this.isAdmin = isAdmin;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserFullName() {
        return userFullName;
    }

    public void setUserFullName(String userFullName) {
        this.userFullName = userFullName;
    }

    public int getUserAge() {
        return userAge;
    }

    public void setUserAge(int userAge) {
        this.userAge = userAge;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserJoinDate() {
        return userJoinDate;
    }

    public void setUserJoinDate(String userJoinDate) {
        this.userJoinDate = userJoinDate;
    }

    public static ArrayList<User> users = new ArrayList<>();

    public static ArrayList<User> movieReviewAuthor = new ArrayList<>(users);

    public ArrayList<User> getAllUsers() {
        users = initDB.getUsers(initDB.getDBConnection());
        return users;
    }


    public String getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(String isAdmin) {
        this.isAdmin = isAdmin;
    }

    public boolean authenticateAdmin(User user) {

        ArrayList<User> users = user.getAllUsers();
        boolean result = true;

        String checkUsername = user.getUsername();
        String checkPassword = user.getPassword();


        for (User u : users) {

            boolean username = u.getUsername().equals(user.getUsername());
            boolean password = u.getPassword().equals(user.getPassword());
            boolean admin = u.getIsAdmin().equalsIgnoreCase("yes");

            if (u.getUsername().equals(user.getUsername()) && u.getPassword().equals(user.getPassword()) && u.getIsAdmin().equalsIgnoreCase("yes")) {
                result = true;
                break;
            } else {
                result = false;
            }
        }

        return result;


    }

}
