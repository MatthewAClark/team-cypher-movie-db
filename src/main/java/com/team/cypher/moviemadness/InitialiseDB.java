package com.team.cypher.moviemadness;

import org.sqlite.SQLiteConfig;

import java.sql.*;
import java.util.ArrayList;


@SuppressWarnings("Duplicates")
public class InitialiseDB {

    public static void main(String[] args) {
        InitialiseDB initDB = new InitialiseDB();
        Connection con = initDB.connectDB();
    }


    private Connection connectDB() {
        Connection con = null;

        try {
            Class.forName("org.sqlite.JDBC");
            SQLiteConfig config = new SQLiteConfig();
            config.enforceForeignKeys(true);
            con = DriverManager.getConnection("jdbc:sqlite:" + "lib/MovieMadnessDB.db", config.toProperties());

        } catch (Exception e) {
            System.out.println(e.getClass());
            e.printStackTrace();
        }
        return con;
    }


    public Connection getDBConnection() {
        Connection con = connectDB();
        return con;
    }


    public ArrayList<Movie> getMovies(Connection con) {
        Statement stmnt = null;
        ArrayList<Movie> movies = new ArrayList<Movie>();
        try {

            String getMoviesQuery = "SELECT * FROM tblMovies";
            stmnt = con.createStatement();
            ResultSet rs = stmnt.executeQuery(getMoviesQuery);
            while (rs.next()) {
                Movie movie = new Movie();
                movie.setMovieID(rs.getInt("movie_id"));
                movie.setMovieTitle(rs.getString("movie_title"));
                movie.setMovieSummary(rs.getString("movie_summary"));
                movie.setMovieDuration(rs.getString("movie_duration"));
                movie.setMovieGenre(rs.getString("movie_genre"));
                movie.setMovieReleaseDate(rs.getString("movie_release_date"));
                movie.setMovieCoverImage(rs.getString("movie_cover_image"));
                movie.setMovieTrailer(rs.getString("movie_trailer"));


                movies.add(movie);
            }
        } catch (Exception ex) {
            System.out.println(ex.getClass());
            ex.printStackTrace();
        } finally {
            try {
                stmnt.close();
                con.close();
            } catch (Exception ex) {

                System.out.println(ex.getClass());
                ex.printStackTrace();
            }
        }
        return movies;
    }

    public ArrayList<Movie> getRatings(Connection con) {
        Statement stmnt = null;
        float rating;
        ArrayList<Movie> movies = getMovies(getDBConnection());
        try {
            String getRatingsQuery = "SELECT * FROM tblReviews";
            stmnt = con.createStatement();
            for (Movie m : movies) {
                ResultSet rs = stmnt.executeQuery(getRatingsQuery);
                rating = 0;
                int counter = 0;
                while (rs.next()) {
                    if (rs.getInt("movie_id") == m.getMovieID()) {
                        counter++;
                        if (rating != 0) {
                            rating += rs.getInt("review_rating");
                            m.setMovieRating(rating / counter);
                        } else {
                            rating = rs.getInt("review_rating");
                            m.setMovieRating(rating / counter);
                        }
                    }
                }
            }
        } catch (Exception ex) {
            System.out.println(ex.getClass());
            ex.printStackTrace();
        } finally {
            try {
                stmnt.close();
                con.close();
            } catch (Exception ex) {

                System.out.println(ex.getClass());
                ex.printStackTrace();
            }
        }
        return movies;
    }

    //Non functional method to display cast on movies page
    public ArrayList<Actor> getCast(Connection con) {
        Statement stmt = null;
        ArrayList<Actor> cast = new ArrayList<>();
        ArrayList<Movie> movies = getMovies(getDBConnection());
        try {
            String getCastQuery = "SELECT movie_id, tblMovieCast.actor_id, actor_name, actor_profile_image " +
                    "FROM tblMovieCast " +
                    "JOIN tblActors " +
                    "ON tblMovieCast.actor_id = tblActors.actor_id";
            stmt = con.createStatement();

            for (Movie m : movies) {
                ResultSet rs = stmt.executeQuery(getCastQuery);

                while (rs.next()) {
                    if (rs.getInt("movie_id") == m.getMovieID()) {
                        Actor actor = new Actor();
                        actor.setActorId(rs.getInt("actor_id"));
                        actor.setActorProfileImage(rs.getString("actor_profile_image"));
                        actor.setActorFullName(rs.getString("actor_name"));

                        cast.add(actor);
                    }
                }
            }
        } catch (Exception ex) {
            System.out.println(ex.getClass());
            ex.printStackTrace();
        } finally {
            try {
                stmt.close();
                con.close();
            } catch (Exception ex) {

                System.out.println(ex.getClass());
                ex.printStackTrace();
            }
        }

        return cast;
    }

    //Non functional method to display reviews, rating and date of review on movies page
    public ArrayList<Reviews> getReviews(Connection con) {
        Statement stmt = null;
        ArrayList<Reviews> movieReview = new ArrayList<>();
        ArrayList<Movie> movies = getMovies(getDBConnection());
        try {
            String getCastQuery = "SELECT * FROM tblReviews";
            stmt = con.createStatement();

            for (Movie m : movies) {
                ResultSet rs = stmt.executeQuery(getCastQuery);

                while (rs.next()) {
                    if (rs.getInt("movie_id") == m.getMovieID()) {
                        Reviews review = new Reviews();
                        review.setMovieID(rs.getInt("movie_id"));
                        review.setUserID(rs.getInt("user_id"));
                        review.setReviewComment(rs.getString("review_comment"));
                        review.setReviewDate(rs.getString("review_date"));
                        review.setReviewRating(rs.getInt("review_rating"));

                        movieReview.add(review);
                    }
                }
            }
        } catch (Exception ex) {
            System.out.println(ex.getClass());
            ex.printStackTrace();
        } finally {
            try {
                stmt.close();
                con.close();
            } catch (Exception ex) {

                System.out.println(ex.getClass());
                ex.printStackTrace();
            }
        }

        return movieReview;
    }

//    //Non functional method to find review author name to display on movies page
//    public ArrayList<User> getReviewAuthor(Connection con){
//        Statement stmt = null;
//        ArrayList<User> movieReviewAuthor = new ArrayList<>();
//        ArrayList<Movie> movies = getMovies(getDBConnection());
//        try{
//            String getCastQuery = "SELECT review_id, movie_id, review_comment, review_rating, review_date, tblUsers.user_id, user_name" +
//                    " FROM tblUsers " +
//                    "JOIN tblReviews " +
//                    "ON tblUsers.user_id = tblReviews.user_id";
//            stmt = con.createStatement();
//
//            for (Movie m : movies) {
//                ResultSet rs = stmt.executeQuery(getCastQuery);
//
//                while (rs.next()) {
//                    if (rs.getInt("movie_id") == m.getMovieID()) {
//                        User author = new User();
//                        author.setUserId(rs.getInt("user_id"));
//                        author.setUserName(rs.getString("user_name"));
//
//                        movieReviewAuthor.add(author);
//                    }
//                }
//            }
//        } catch (Exception ex) {
//            System.out.println(ex.getClass());
//            ex.printStackTrace();
//        } finally {
//            try {
//                stmt.close();
//                con.close();
//            } catch (Exception ex) {
//
//                System.out.println(ex.getClass());
//                ex.printStackTrace();
//            }
//        }
//
//        return movieReviewAuthor;
//    }


    public ArrayList<Actor> getActors(Connection con) {
        Statement stmnt = null;
        ArrayList<Actor> actors = new ArrayList<>();
        try {
            String getActorsQuery = "SELECT * FROM tblActors";
            stmnt = con.createStatement();
            ResultSet rs = stmnt.executeQuery(getActorsQuery);

            while (rs.next()) {
                Actor actor = new Actor();
                actor.setActorId(rs.getInt("actor_id"));
                actor.setActorFullName(rs.getString("actor_name"));
                actor.setActorFistName(getIndividualNames(rs.getString("actor_name"))[0]);
                actor.setActorMiddleName(getIndividualNames(rs.getString("actor_name"))[1]);
                actor.setActorSurname(getIndividualNames(rs.getString("actor_name"))[2]);
                actor.setActorAge(rs.getInt("actor_age"));
                actor.setActorGender(rs.getString("actor_gender"));
                actor.setActorProfileImage(rs.getString("actor_profile_image"));
                actors.add(actor);
            }
        } catch (Exception ex) {
            System.out.println(ex.getClass());
            ex.printStackTrace();
        } finally {
            try {
                stmnt.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return actors;
    }


    private String[] splitFullName(String fullName) {

        String[] fullNameList = fullName.split("\\s");

        return fullNameList;
    }

    private boolean checkMiddleName(String[] splitFullName) {

        boolean middleNameExists = false;
        switch (splitFullName.length) {
            case 2:
                middleNameExists = false;
                break;
            case 3:
                middleNameExists = true;
                break;
            default:

        }
        return middleNameExists;
    }

    private String[] getIndividualNames(String fullName) {

        String[] splitFullName = splitFullName(fullName);

        boolean middleNameExists = checkMiddleName(splitFullName);

        if (middleNameExists) {

            return splitFullName;

        } else {
            String[] middleNameEmpty = {splitFullName[0], " ", splitFullName[1]};
            return middleNameEmpty;
        }
    }

    public ArrayList<User> getUsers(Connection con) {
        Statement stmnt = null;
        ArrayList<User> users = new ArrayList<>();
        try {
            String getUsersQuery = "SELECT * FROM tblUsers";
            stmnt = con.createStatement();
            ResultSet rs = stmnt.executeQuery(getUsersQuery);

            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setUserFullName(rs.getString("user_name"));
                user.setUserAge(rs.getInt("user_age"));
                user.setUserEmail(rs.getString("user_email"));
                user.setUserJoinDate(rs.getString("user_join_date"));
                user.setIsAdmin(rs.getString("Admin"));
                users.add(user);
            }

        } catch (Exception ex) {
            System.out.println(ex.getClass());
            ex.printStackTrace();
        } finally {
            try {
                stmnt.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return users;
    }

    public void addNewMovie(Connection con, Movie movie) {
        try {
            String addMovie = "INSERT INTO tblMovies (movie_title, movie_summary, movie_duration, movie_genre, " +
                    "movie_release_date, movie_cover_image, movie_trailer)" +
                    " " +
                    "VALUES " + "(?,?,?,?,?,?, ?)";
            PreparedStatement pst = con.prepareStatement(addMovie);
            pst.setString(1, movie.getMovieTitle());
            pst.setString(2, movie.getMovieSummary());
            pst.setString(3, movie.getMovieDuration());
            pst.setString(4, movie.getMovieGenre());
            pst.setString(5, movie.getMovieReleaseDate());
            pst.setString(6, movie.getMovieCoverImage());
            pst.setString(7, movie.getMovieTrailer());


            pst.executeUpdate();
            pst.close();

        } catch (Exception ex) {
            System.out.println(ex.getClass());
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public void removeMovie(Connection con, Movie movie) {
        try {
            String removeMovieReview = "DELETE FROM tblReviews WHERE movie_id = ?";
            String removeMovieCast = "DELETE FROM tblMovieCast WHERE movie_id = ?";
            String removeMovie = "DELETE FROM tblMovies WHERE movie_id = ?";

            PreparedStatement pst1 = con.prepareStatement(removeMovieReview);
            PreparedStatement pst2 = con.prepareStatement(removeMovieCast);
            PreparedStatement pst3 = con.prepareStatement(removeMovie);
            pst1.setInt(1, movie.getMovieID());
            pst2.setInt(1, movie.getMovieID());
            pst3.setInt(1, movie.getMovieID());
            pst1.executeUpdate();
            pst2.executeUpdate();
            pst3.executeUpdate();
            pst1.close();
            pst2.close();
            pst3.close();


        } catch (Exception ex) {
            System.out.println(ex.getClass());
            ex.printStackTrace();
        } finally {
            try {

                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }


    public void updateMovie(Connection con, Movie movie) {
        try {
            String addMovie = "UPDATE tblMovies SET movie_title = ?, movie_summary = ?, movie_duration = ?, " +
                    "movie_genre = ?, " +
                    "movie_release_date = ?, movie_cover_image = ?, movie_trailer = ?" +

                    " WHERE movie_id = ?";

            PreparedStatement pst = con.prepareStatement(addMovie);
            pst.setString(1, movie.getMovieTitle());
            pst.setString(2, movie.getMovieSummary());
            pst.setString(3, movie.getMovieDuration());
            pst.setString(4, movie.getMovieGenre());
            pst.setString(5, movie.getMovieReleaseDate());
            pst.setString(6, movie.getMovieCoverImage());
            pst.setString(7, movie.getMovieTrailer());
            pst.setInt(8, movie.getMovieID());


            pst.executeUpdate();
            pst.close();

        } catch (Exception ex) {
            System.out.println(ex.getClass());
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void addNewActor(Connection con, Actor actor) {

        try {
            String addActor = "INSERT INTO tblActors(actor_name, actor_age, actor_gender, actor_profile_image)" +
                    " " +
                    "VALUES " + "(?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(addActor);
            pst.setString(1, actor.getActorFullName());
            pst.setInt(2, actor.getActorAge());
            pst.setString(3, actor.getActorGender());
            pst.setString(4, actor.getActorProfileImage());

            pst.executeUpdate();
            pst.close();

        } catch (Exception ex) {
            System.out.println(ex.getClass());
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void updateActor(Connection con, Actor actor) {

        try {
            String addMovie = "UPDATE tblActors SET actor_name = ?, actor_age = ?, actor_gender = ?, actor_profile_image = ?" +

                    " WHERE actor_id = ?";

            PreparedStatement pst = con.prepareStatement(addMovie);
            pst.setString(1, actor.getActorFullName());
            pst.setInt(2, actor.getActorAge());
            pst.setString(3, actor.getActorGender());
            pst.setString(4, actor.getActorProfileImage());
            pst.setInt(5, actor.getActorId());

            pst.executeUpdate();
            pst.close();

        } catch (Exception ex) {
            System.out.println(ex.getClass());
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    public void removeActor(Connection con, Actor actor) {
        try {
            String removeActor = "DELETE FROM tblActors WHERE actor_id = ?";
            String removeMovieCast = "DELETE FROM tblMovieCast WHERE actor_id = ?";
            int actorId = actor.getActorId();
            PreparedStatement pst1 = con.prepareStatement(removeActor);
            PreparedStatement pst2 = con.prepareStatement(removeMovieCast);
            pst1.setInt(1, actorId);
            pst2.setInt(1, actorId);
            pst1.executeUpdate();
            pst2.executeUpdate();
            pst1.close();
            pst2.close();


        } catch (Exception ex) {
            System.out.println(ex.getClass());
            ex.printStackTrace();
        } finally {
            try {

                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}


