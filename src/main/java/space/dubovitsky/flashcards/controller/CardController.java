package space.dubovitsky.flashcards.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import space.dubovitsky.flashcards.model.Card;
import space.dubovitsky.flashcards.service.CardService;

import java.util.List;

@RestController
@RequestMapping("/card")
@CrossOrigin(origins = "http://localhost:4200")
public class CardController {

    private final CardService cardService;

    public CardController(CardService cardService) {
        this.cardService = cardService;
    }

    @GetMapping("/all")
    public ResponseEntity<List<Card>> findAll() {
        List<Card> all = cardService.findAll();
        return new ResponseEntity<>(all, HttpStatus.OK);
    }

    @GetMapping("/id/{id}")
    public ResponseEntity<Card> getById(@PathVariable long id) {
        Card byId;
        try {
            byId = cardService.findById(id);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(byId, HttpStatus.OK);
    }

    @PostMapping("/add")
    public void save(@RequestBody Card card) {
        this.cardService.save(card);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<HttpStatus> deleteById(@PathVariable long id) {
        this.cardService.delete(id);
        return ResponseEntity.ok(HttpStatus.OK);
    }
}
