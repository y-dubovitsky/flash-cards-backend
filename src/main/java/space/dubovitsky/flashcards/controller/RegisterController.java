package space.dubovitsky.flashcards.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import space.dubovitsky.flashcards.model.Card;

import java.util.List;

@Controller
public class RegisterController {

    @GetMapping("/login")
    public String login(Model model) {
        return "login";
    }

}
