package com.team.cypher.moviemadness;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;

import static com.team.cypher.moviemadness.Actor.actors;
import static com.team.cypher.moviemadness.Actor.cast;
import static com.team.cypher.moviemadness.Movie.movies;

@Controller
public class MovieApplicationController {

    Actor actor = new Actor();
    Movie movie = new Movie();

    @GetMapping("/actors")
    public String viewActors(Model model) {
        actor.getAllActors();
        model.addAttribute("actors", actors);
        String pageTitle = "Actors Page";
        model.addAttribute("pageTitle", pageTitle);
        return "actors";
    }

    @GetMapping("/actor")
    public String actorById(@RequestParam(name = "actorId", defaultValue = "", required = false) Integer name, Model model) {
        actor = actor.getActorById(name);
        String pageTitle = actor.getActorFullName() + " Page";
        model.addAttribute("actor", actor);
        model.addAttribute("pageTitle", pageTitle);

        return "actor";
    }



    @GetMapping("/ratings")
    public String viewRatings(Model model) {
        movie.getAllMovies();
        model.addAttribute("movies", movies);
        model.addAttribute("pageTitle", "Ratings Page");
        return "ratings";
    }

    @GetMapping("/") // whenever you type local host 8080 this function gets called
    public String viewHomePage(Model model) { //in spring framework its our database- way to send data to front end

//        ArrayList<ArrayList<Movie>> recentMovies = movie.makeCarousel(movie.getMovieReleaseDates()); //nesting array list- passing it two arrays
//        ArrayList<Movie> mostRated = movie.getMovieMostRated();
//        model.addAttribute("recentMovies", recentMovies); //sending recent movies array to front end
//
//        model.addAttribute("movies", movies);
//        model.addAttribute("mostRated", mostRated);
//        model.addAttribute("pageTitle", "Home Page");

        return "index2";
    }


    @GetMapping("/genres")

    public String viewGenres(Model model) {
        ArrayList<String> genreList = movie.getMovieGenreList();
        HashMap<String, ArrayList<Movie>> genres = movie.getMovieGenres();

        HashMap<String, ArrayList<ArrayList<Movie>>> carousels = new HashMap<>();

        genreList.forEach((genre) -> {
            ArrayList<Movie> slides = genres.get(genre);
            carousels.put(genre, movie.makeCarousel(slides));
        });

        model.addAttribute("genreList", genreList);
        model.addAttribute("genres", carousels);
        model.addAttribute("pageTitle", "Genres Page");
        return "genres";
    }


    @GetMapping("/movies")
    public String movieById(@RequestParam(name = "movieId", defaultValue = "", required = false) Integer name, Model model) {
        movie = movie.getMovieById(name);
        cast = actor.getCast();


//        ArrayList<Actor> cast = movie.getCast();

        model.addAttribute("cast", actor);
        model.addAttribute("movie", movie);
        return "movies";
    }
}