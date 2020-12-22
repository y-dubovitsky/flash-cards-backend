package space.dubovitsky.flashcards.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import space.dubovitsky.flashcards.model.Card;
import space.dubovitsky.flashcards.service.CardService;

import java.io.*;
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

    @PostMapping("/add")
    public String addFromFile(
            @RequestParam(value = "file", required = false) MultipartFile file,
            @RequestParam(required = false) String front,
            @RequestParam(required = false) String back,
            Model model
    ) throws IOException {
        if (!file.isEmpty()) {
            cardService.createCardsFromTextFile(file);
            return "redirect:/card/all";
        }
        Card card = new Card(front, back); //TODO Добавить в модель количество или сами созданные карточки?
        cardService.save(card);

        return "redirect:/card/all";
    }

    @DeleteMapping()
    public String delete(@RequestParam Long id) {
        cardService.delete(id);

        return "cards";
    }


}
