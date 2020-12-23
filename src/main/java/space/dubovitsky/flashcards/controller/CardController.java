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

    /**
     * Return all flashCards
     */
    @GetMapping("/all")
    public String findAll(Model model) {
        List<Card> all = cardService.findAll();

        model.addAttribute("cards", all);
        return "cards";
    }

    /**
     * Create card from input data
     */
    @PostMapping("/text")
    public String addFromTextInput(
            @RequestParam(required = false) String front,
            @RequestParam(required = false) String back,
            Model model
    ) {
        Card card = new Card(front, back); //TODO Добавить в модель количество или сами созданные карточки?
        cardService.save(card);

        this.findAll(model); //TODO Нужно поправить? Потому что он всю страницу перезагружает, а нужно только добавить 1 элемент
        return "parts/flash-cards";
    }

    /**
     * Create List of flasCards from input file.
     */
    @PostMapping("/file")
    public String addFromFile(
            @RequestParam(value = "file", required = false) MultipartFile file,
            Model model
    ) throws IOException {
        if (!file.isEmpty()) {
            cardService.createCardsFromTextFile(file);
            return "cards";
        }

        model.addAttribute("cards", "File is empty, sorry"); //TODO Если файл пустой
        return "cards";
    }

    /**
     * Delete flash card by Id.
     */
    @DeleteMapping()
    public String delete(@RequestParam Long id, Model model) {
        cardService.delete(id);

        this.findAll(model);
        return "parts/flash-cards";
    }
}
