package com.team.cypher.moviemadness;

import java.sql.SQLException;
import java.util.ArrayList;

public class Reviews {
    private int reviewID;
    private int userID;
    private int movieID;
    private String reviewComment;
    private int reviewRating;
    private String reviewDate;
    InitialiseDB initDB = new InitialiseDB();

    public Reviews(int reviewID, int userID, int movieID, String reviewComment, int reviewRating, String reviewDate) {
        this.reviewID = reviewID;
        this.userID = userID;
        this.movieID = movieID;
        this.reviewComment = reviewComment;
        this.reviewRating = reviewRating;
        this.reviewDate = reviewDate;
    }

    public Reviews() {

    }

    public int getReviewID() {
        return reviewID;
    }

    public void setReviewID(int reviewID) {
        this.reviewID = reviewID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public String getReviewComment() {
        return reviewComment;
    }

    public void setReviewComment(String reviewComment) {
        this.reviewComment = reviewComment;
    }

    public int getReviewRating() {
        return reviewRating;
    }

    public void setReviewRating(int reviewRating) {
        this.reviewRating = reviewRating;
    }

    public String getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(String reviewDate) {
        this.reviewDate = reviewDate;
    }

    ArrayList<Reviews> movieReview = new ArrayList<>();

    public ArrayList<Reviews> getReviews() throws SQLException, ClassNotFoundException {
        movieReview = initDB.getReviews(initDB.getDBConnection());
        return movieReview;
    }
}