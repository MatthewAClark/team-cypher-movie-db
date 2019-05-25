package com.team.cypher.moviemadness;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.sql.SQLException;

import org.springframework.web.bind.annotation.RequestParam;

import static com.team.cypher.moviemadness.Movie.movies;
import static com.team.cypher.moviemadness.Actor.actors;

@Controller
@RequestMapping("/admin")
public class AdminController {


    Actor actor = new Actor();
    Movie movie = new Movie();

    @GetMapping("")
    public String adminLogin(Model model) {

        User user = new User();

        model.addAttribute("user", user);

        return "AdminPortal/admin";
    }

    @GetMapping("/adminPortal")
    public String adminPortal(Model model) {

        model.addAttribute("pageTitle", "Admin landing page");


        return "AdminPortal/adminLandingPage";
    }

    @PostMapping("")
    public String signin(@ModelAttribute User user, Model model) {


        boolean userIsAdmin = user.authenticateAdmin(user);

        if (userIsAdmin) {
            return "AdminPortal/adminLandingPage";
        } else {
            model.addAttribute("message", "Please try again!");
            return "AdminPortal/admin";
        }
    }

    @GetMapping("/addActor")
    public String addActor(Model model) throws SQLException, ClassNotFoundException {

        actor.getAllActors();

        int nextID = actors.size() + 1;

        Actor actor = new Actor();
        actor.setActorId(nextID);

        model.addAttribute("actor", actor);

        return "AdminPortal/addActor";
    }

    @PostMapping("/actorAdded")
    public String actorAdded(@ModelAttribute Actor actor, Model model) throws SQLException, ClassNotFoundException {

        actor.addNewActor(actor);
        return updateActor(model);
    }

    @GetMapping("/updateActor")
    public String updateActor(Model model) {

        actor.getAllActors();
        model.addAttribute("actors", actors);
        String pageTitle = "Actors Admin Page";
        model.addAttribute("pageTitle", pageTitle);

        return "/AdminPortal/updateActorTable";
    }

    @GetMapping("/editActor")
    public String updateActor(@RequestParam(name = "actorId", defaultValue = "", required = false) Integer actorId, Model model) {
        actor = actor.getActorById(actorId);
        model.addAttribute("actor", actor);
        model.addAttribute("pageTitle", "Actor Edit");
        return "AdminPortal/updateActorForm";
    }

    @PostMapping("/actorDeleted")
    public String actorDeleted(@ModelAttribute Actor actor, Model model) {
        actor.removeActor(actor);
        return updateActor(model);
    }

    @PostMapping("/actorSaved")
    public String actorSaved(@ModelAttribute Actor actor, Model model) {
        actor.updateActor(actor);
        return updateActor(model);
    }

    //MOVIE CONTROLLERS

    @GetMapping("/addMovie")
    public String addMovie(Model model) throws SQLException, ClassNotFoundException {
        movie.getAllMovies();

        int nextID = Movie.movies.size() + 1;

        Movie movie = new Movie();
        movie.setMovieID(nextID);

        model.addAttribute("movie", movie);
        return "AdminPortal/addMovie";
    }

    @PostMapping("/movieAdded")
    public String movieAdded(@ModelAttribute Movie movie, Model model) throws SQLException, ClassNotFoundException {
        movie.addNewMovie(movie);
        return editMovie(movie, model);
    }

    @GetMapping("/editMovie")
    public String editMovie(@ModelAttribute Movie movie, Model model) {
        movie.getAllMovies();
        model.addAttribute("pageTitle", "Movie Edit");
        model.addAttribute("movies", movies);
        return "AdminPortal/updateMovieTable";
    }

    @GetMapping("/updateMovie")
    public String updateMovie(@RequestParam(name = "movieId", defaultValue = "", required = false) Integer movieId,
                              Model model) {
        Movie mov = movie.getMovieById(movieId);
        model.addAttribute("movie", mov);
        model.addAttribute("pageTitle", "Movie Edit");
        return "AdminPortal/updateMovieForm";
    }

    @PostMapping("/movieDeleted")
    public String movieDeleted(@ModelAttribute Movie movie, Model model) {
        movie.removeMovie(movie);
        return editMovie(movie, model);
    }

    @PostMapping("/movieSaved")
    public String movieSaved(@ModelAttribute Movie movie, Model model) {
        movie.updateMovie(movie);
        return editMovie(movie, model);
    }
}
