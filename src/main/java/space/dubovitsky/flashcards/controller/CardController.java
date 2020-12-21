package space.dubovitsky.flashcards.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import space.dubovitsky.flashcards.model.Card;
import space.dubovitsky.flashcards.service.CardService;

import java.util.List;

@Controller
@RequestMapping("/card")
public class CardController {

    private final CardService cardService;

    public CardController(CardService cardService) {
        this.cardService = cardService;
    }

    @GetMapping("/all")
    public String findAll(Model model) {
        List<Card> all = cardService.findAll();

        model.addAttribute("cards", all);
        return "cards";
    }

    @GetMapping("/login")
    public String login(Model model) {
        List<Card> all = cardService.findAll();

        model.addAttribute("cards", all);
        return "login";
    }
}
