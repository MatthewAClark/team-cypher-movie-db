package com.team.cypher.moviemadness;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;

public class Movie {


    private int movieID;
    private String movieTitle;
    private String movieSummary;
    private String movieDuration;
    private String movieGenre;
    private String movieReleaseDate;
    private String movieCoverImage;
    private String movieTrailer;
    private float movieRating;
    InitialiseDB initDB = new InitialiseDB();
    public static ArrayList<Movie> movies = new ArrayList<>();

    public Movie() {
    }

    public Movie(int movieID, String movieTitle, String movieSummary, String movieDuration, String movieGenre, String movieReleaseDate, String movieCoverImage, String movieTrailer, float movieRating) {
        this.movieID = movieID;
        this.movieTitle = movieTitle;
        this.movieSummary = movieSummary;
        this.movieDuration = movieDuration;
        this.movieGenre = movieGenre;
        this.movieReleaseDate = movieReleaseDate;
        this.movieCoverImage = movieCoverImage;
        this.movieTrailer = movieTrailer;
        this.movieRating = movieRating;
    }


    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public String getMovieTitle() {
        return movieTitle;
    }

    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    public String getMovieSummary() {
        return movieSummary;
    }

    public void setMovieSummary(String movieSummary) {
        this.movieSummary = movieSummary;
    }

    public String getMovieDuration() {
        return movieDuration;
    }

    public void setMovieDuration(String movieDuration) {
        this.movieDuration = movieDuration;
    }

    public String getMovieGenre() {
        return movieGenre;
    }

    public void setMovieGenre(String movieGenre) {
        this.movieGenre = movieGenre;
    }

    public String getMovieReleaseDate() {
        return movieReleaseDate;
    }

    public void setMovieReleaseDate(String movieReleaseDate) {
        this.movieReleaseDate = movieReleaseDate;
    }

    public String getMovieCoverImage() {
        return movieCoverImage;
    }

    public void setMovieCoverImage(String movieCoverImage) {
        this.movieCoverImage = movieCoverImage;
    }

    public String getMovieTrailer() {

        return movieTrailer;

    }

    public String getEmbedMovieTrailer() {
        String embedMovieTrailer = movieTrailer.replace("https://www.youtube.com/watch?v=", "");
        return embedMovieTrailer;

    }


    public void setMovieTrailer(String movieTrailer) {
        this.movieTrailer = movieTrailer;
    }

    public float getMovieRating() {
        return movieRating;
    }

    public void setMovieRating(float movieRating) {
        this.movieRating = movieRating;
    }


    public ArrayList<Movie> getAllMovies() {
        movies = initDB.getRatings(initDB.getDBConnection());
        return movies;
    }


   /* public ArrayList<Movie> getRecentMovies(){
        ArrayList<Movie> movies = getAllMovies();
        movies = initDB.getMovies(initDB.getDBConnection());
        ArrayList<Movie> recentMovies = new ArrayList<>();
        for(Movie mo: movies){
            if(mo.getMovieReleaseDate().contains("2019") || (mo.getMovieReleaseDate().contains("2018"))){
                recentMovies.add(mo);
            }
        }
        return recentMovies;
    }
        public void addNewmovie(Movie movie) {
            initDB.addNewMovie(initDB.getDBConnection(), movie);
        }
<<<<<<< HEAD
=======



>>>>>>> 2854957859d873334b38dbc2db5bcd724e9062fe
        public void removeMovie(movie movie) {
            initDB.removemovie(initDB.getDBConnection(), movie);
        }*/

    public Movie getMovieById(Integer movieId) {

        this.getAllMovies();

        Movie result = movies.stream()
                .filter(movie -> movieId == movie.getMovieID())
                .findAny()
                .orElse(null);

        return result;
    }

    public ArrayList<String> getMovieGenreList() {
        this.getAllMovies();

        // Create an ArrayList with all the genres
        ArrayList<String> genreList = new ArrayList<>();

        // for each movie
        movies.forEach((mov) -> {
            // fetch the list of genres
            String genresByMovie[] = mov.getMovieGenre().split(", ");

            // and add to the list if it is not there (i.e. indexOf returns -1)
            for (int i = 0; i < genresByMovie.length; i++) {
                if (genreList.indexOf(genresByMovie[i]) < 0) {
                    genreList.add(genresByMovie[i]);
                }
            }
        });

        // sort list in alphabetical order
        Collections.sort(genreList);
        return genreList;
    }

    public HashMap<String, ArrayList<Movie>> getMovieGenres() {
        this.getAllMovies();

        // Create new hashmap for all the different genres, and group movies into those genres
        HashMap<String, ArrayList<Movie>> genres = new HashMap<>();


        movies.forEach((mov) -> {
            // Fetch movie genres from movie
            String movieGenreList[] = mov.getMovieGenre().split(", ");

            // For each movie genre, check and see if the genre exists in the hashmap. If it doesn't, create it.
            for (int i = 0; i < movieGenreList.length; i++) {
                ArrayList<Movie> genre = new ArrayList<>();
                if (genres.get(movieGenreList[i]) == null) {
                    genres.put(movieGenreList[i], genre);
                }

                // Fetch genre, add movie to genre and then put it back
                genre = genres.get(movieGenreList[i]);
                genre.add(mov);
                genres.put(movieGenreList[i], genre);

            }
        });
        return genres;
    }

    public void addNewMovie(Movie movie) {
        initDB.addNewMovie(initDB.getDBConnection(), movie);
    }

    public void updateMovie(Movie movie) {
        initDB.updateMovie(initDB.getDBConnection(), movie);
    }

    public ArrayList<Movie> getMovieReleaseDates() {
        this.getAllMovies();
        ArrayList<Date> releaseDates = new ArrayList<>();
        HashMap<Date, ArrayList<Movie>> moviesByDates = new HashMap<>();


        movies.forEach((mov) -> {

            // Fetch and convert to date format
            String movieReleaseDate = mov.getMovieReleaseDate();
            String[] movieDate = movieReleaseDate.split(" ");
            String day = movieDate[0];
            String month;
            switch (movieDate[1]) {
                case ("January"):
                    month = "01";
                    break;
                case ("February"):
                    month = "02";
                    break;
                case ("March"):
                    month = "03";
                    break;
                case ("April"):
                    month = "04";
                    break;
                case ("May"):
                    month = "05";
                    break;
                case ("June"):
                    month = "06";
                    break;
                case ("July"):
                    month = "07";
                    break;
                case ("August"):
                    month = "08";
                    break;
                case ("September"):
                    month = "09";
                    break;
                case ("October"):
                    month = "10";
                    break;
                case ("November"):
                    month = "11";
                    break;
                case ("December"):
                    month = "12";
                    break;
                case ("Jan"):
                    month = "01";
                    break;
                case ("Feb"):
                    month = "02";
                    break;
                case ("Mar"):
                    month = "03";
                    break;
                case ("Apr"):
                    month = "04";
                    break;
                case ("Jun"):
                    month = "06";
                    break;
                case ("Jul"):
                    month = "07";
                    break;
                case ("Aug"):
                    month = "08";
                    break;
                case ("Sep"):
                    month = "09";
                    break;
                case ("Oct"):
                    month = "10";
                    break;
                case ("Nov"):
                    month = "11";
                    break;
                case ("Dec"):
                    month = "12";
                    break;
                default:
                    month = "";
                    break;
            }
            String year = movieDate[2];
            Date date1;
            try {
                // convert to date
                date1 = new SimpleDateFormat("dd/MM/yyyy").parse(day + "/" + month + "/" + year);
                ArrayList<Movie> addMovies;

                // Add date and movie to hashmap
                if (moviesByDates.get(date1) == null) {
                    addMovies = new ArrayList<>();
                    releaseDates.add(date1);
                } else {
                    addMovies = moviesByDates.get(date1);
                }
                addMovies.add(mov);
                moviesByDates.put(date1, addMovies);

            } catch (Exception e) {

            }


        });

        // Sort out date of released in order
        Collections.sort(releaseDates);
        Collections.reverse(releaseDates);

        ArrayList<Movie> recentMovies = new ArrayList<>();


        // Fetch release date from HashMap using sorted date list releaseDates and add movies to date according to
        // their release
        for (Date movieDate : releaseDates) {
            for (Movie mov : moviesByDates.get(movieDate)) {
                recentMovies.add(mov);

                // Set number of movies per carousel to 8
                if (recentMovies.size() == 8) break;
            }
            if (recentMovies.size() == 8) break;
        }
        return recentMovies;
    }

    public ArrayList<ArrayList<Movie>> makeCarousel(ArrayList<Movie> allMovies) {

        // Create nested arraylist
        ArrayList<ArrayList<Movie>> slides = new ArrayList<>();
        slides.add(new ArrayList<>());

        for (Movie mov : allMovies) {
            // Fetch slide for movie
            ArrayList<Movie> slide = slides.get(slides.size() - 1);

            // Check to see if it is full. Create a new one if so
            if (slide.size() >= 4) {
                slides.add(new ArrayList<>());
                slide = slides.get(slides.size() - 1);
            }

            // Add movie to slide
            slide.add(mov);

            // Add slide back to slides
            slides.set(slides.size() - 1, slide);
        }
        return slides;
    }

    public ArrayList<Movie> getMovieMostRated() {
        this.getAllMovies();
        ArrayList<Float> ratingsList = new ArrayList<>();
        HashMap<Float, ArrayList<Movie>> ratings = new HashMap<>();
        ArrayList<Movie> mostRated = new ArrayList<>();

        for (Movie mov : movies) {
            if (ratingsList.indexOf(mov.getMovieRating()) < 0) {
                ratingsList.add(mov.getMovieRating());
                ratings.put(mov.getMovieRating(), new ArrayList<Movie>());
            }
            ArrayList<Movie> thisRating = ratings.get(mov.getMovieRating());
            thisRating.add(mov);
            ratings.put(mov.getMovieRating(), thisRating);
        }

        Collections.sort(ratingsList);
        Collections.reverse(ratingsList);

        for (Float rating : ratingsList) {
            ArrayList<Movie> thisMovieRating = ratings.get(rating);
            for (Movie mov : thisMovieRating) {
                mostRated.add(mov);
                if (mostRated.size() == 6) break;
            }
            if (mostRated.size() == 6) break;
        }

        return mostRated;
    }

    public void removeMovie(Movie movie) {
        initDB.removeMovie(initDB.getDBConnection(), movie);
    }
}