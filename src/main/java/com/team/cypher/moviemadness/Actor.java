package com.team.cypher.moviemadness;

import java.util.ArrayList;

public class Actor {

    private int actorId;
    private String actorFullName;
    private String actorFistName;
    private String actorMiddleName;
    private String actorSurname;
    private int actorAge;
    private String actorGender;
    private String actorProfileImage;
    static InitialiseDB initDB = new InitialiseDB();


    public Actor(int actorId, String actorFullName, String actorFistName, String actorMiddleName, String actorSurname, int actorAge, String actorGender, String actorProfileImage) {
        this.actorId = actorId;
        this.actorFullName = actorFullName;
        this.actorFistName = actorFistName;
        this.actorMiddleName = actorMiddleName;
        this.actorSurname = actorSurname;
        this.actorAge = actorAge;
        this.actorGender = actorGender;
        this.actorProfileImage = actorProfileImage;
//        this.getAllActors();
    }

    public static void main(String[] args) {
        Actor actor = new Actor();
    }

    public Actor() {
    }

    public int getActorId() {
        return actorId;
    }

    public void setActorId(int actorId) {
        this.actorId = actorId;
    }

    public String getActorFullName() {
        return actorFullName;
    }

    public void setActorFullName(String actorFullName) {
        this.actorFullName = actorFullName;
    }

    public String getActorFistName() {
        return actorFistName;
    }

    public void setActorFistName(String actorFistName) {
        this.actorFistName = actorFistName;
    }

    public String getActorMiddleName() {
        return actorMiddleName;
    }

    public void setActorMiddleName(String actorMiddleName) {
        this.actorMiddleName = actorMiddleName;
    }

    public String getActorSurname() {
        return actorSurname;
    }

    public void setActorSurname(String actorSurname) {
        this.actorSurname = actorSurname;
    }

    public int getActorAge() {
        return actorAge;
    }

    public void setActorAge(int actorAge) {
        this.actorAge = actorAge;
    }

    public String getActorGender() {
        return actorGender;
    }

    public void setActorGender(String actorGender) {
        this.actorGender = actorGender;
    }

    public String getActorProfileImage() {
        return actorProfileImage;
    }

    public void setActorProfileImage(String actorProfileImage) {
        this.actorProfileImage = actorProfileImage;
    }

    public static ArrayList<Actor> actors = new ArrayList<>();
    public static ArrayList<Actor> cast = new ArrayList<>(actors);

    public ArrayList<Actor> getAllActors() {
        actors = initDB.getActors(initDB.getDBConnection());
        return actors;
    }

    public ArrayList<Actor> getCast() {
        cast = initDB.getCast(initDB.getDBConnection());
        return cast;
    }

    public Actor getActorById(Integer actorId) {

        this.getAllActors();

        Actor result = actors.stream()
                .filter(actor -> actorId == actor.getActorId())
                .findAny()
                .orElse(null);

        return result;
    }

    public void addNewActor(Actor actor) {
        initDB.addNewActor(initDB.getDBConnection(), actor);
    }

    public void updateActor(Actor actor) {
        initDB.updateActor(initDB.getDBConnection(), actor);
    }

    public void removeActor(Actor actor) {
        initDB.removeActor(initDB.getDBConnection(), actor);
    }
}