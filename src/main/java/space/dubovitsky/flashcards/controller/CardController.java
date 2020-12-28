package space.dubovitsky.flashcards.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import space.dubovitsky.flashcards.model.Card;
import space.dubovitsky.flashcards.service.CardService;

import javax.validation.Valid;
import java.io.*;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
    @GetMapping()
    public String findAll(Model model) {
        List<Card> all = cardService.findAll();

        model.addAttribute("cards", all);
        return "card";
    }

    /**
     * Create card from input data
     */
    @PostMapping("/text")
    public String addFromTextInput(
            @Valid Card card,
            BindingResult bindingResult,
            Model model
    ) {
        if (bindingResult.hasErrors()) {
            Map<String, String> errors = bindingResult.getAllErrors()
                    .stream()
                    .collect(Collectors.toMap(
                            objectError -> objectError.getObjectName() + Math.random() + "Error", //TODO Key duplicate!
                            objectError -> objectError.getDefaultMessage()
                            )
                    );
            model.addAttribute("errors", "Validation Error");
            this.findAll(model);
            return "parts/flash-cards"; //TODO Ошибка валидации пробрасывается, но нужно учесть ее на вью
        }
        cardService.save(card);

        this.findAll(model); //TODO Нужно поправить? Потому что он всю страницу перезагружает, а нужно только добавить 1 элемент
        return "parts/flash-cards";
    }

    /**
     * Create List of flashCards from input file.
     */
    @PostMapping("/file")
    public String addFromFile(
            @RequestParam(value = "file", required = false) MultipartFile file,
            Model model
    ) throws IOException {
        if (!file.isEmpty()) {
            cardService.createCardsFromTextFile(file);
            return "card";
        }

        model.addAttribute("cards", "File is empty, sorry"); //TODO Если файл пустой
        return "card";
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

    @PostMapping("/turn")
    public ResponseEntity<String> turnCards(@RequestParam("id") Card card) {
        return new ResponseEntity<>(card.getBack(), HttpStatus.OK);
    }

    @PostMapping("/edit")
    public ResponseEntity<Card> editCard(Card card) {
        Card saved = cardService.editCard(card);
        if (saved != null) {
            return new ResponseEntity<>(saved, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }
}
