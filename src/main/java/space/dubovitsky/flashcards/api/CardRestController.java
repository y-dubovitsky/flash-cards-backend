//package space.dubovitsky.flashcards.api;
//
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.validation.FieldError;
//import org.springframework.web.bind.MethodArgumentNotValidException;
//import org.springframework.web.bind.annotation.*;
//import space.dubovitsky.flashcards.model.Card;
//import space.dubovitsky.flashcards.service.CardService;
//
//import javax.validation.Valid;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//@RestController
//@RequestMapping("/api/card")
//@CrossOrigin(origins = "http://localhost:4200")
//public class CardRestController {
//
//    private final CardService cardService;
//
//    public CardRestController(CardService cardService) {
//        this.cardService = cardService;
//    }
//
//    @GetMapping("/all")
//    public ResponseEntity<List<Card>> findAll() {
//        List<Card> all = cardService.findAll();
//        return new ResponseEntity<>(all, HttpStatus.OK);
//    }
//
//    @GetMapping("/id/{id}")
//    public ResponseEntity<Card> getById(@PathVariable long id) {
//        Card byId;
//        try {
//            byId = cardService.findById(id);
//        } catch (Exception e) {
//            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//        }
//        return new ResponseEntity<>(byId, HttpStatus.OK);
//    }
//
//    @PostMapping("/add")
//    public ResponseEntity<String> save(@Valid @RequestBody Card card) {
//        this.cardService.save(card);
//        return ResponseEntity.ok("Card was created");
//    }
//
//    @DeleteMapping("{id}")
//    public ResponseEntity<HttpStatus> deleteById(@PathVariable long id) {
//        this.cardService.delete(id);
//        return ResponseEntity.ok(HttpStatus.OK);
//    }
//
//    /**
//     * The method stores the name and post-validation error message of each invalid field in a Map.
//     * Next it sends the Map back to the client as a JSON representation for further processing.
//     * @param ex
//     * @return
//     */
//    @ResponseStatus(HttpStatus.BAD_REQUEST)
//    @ExceptionHandler(MethodArgumentNotValidException.class)
//    public Map<String, String> handleValidationExceptions(
//            MethodArgumentNotValidException ex
//    ) {
//        Map<String, String> errors = new HashMap<>();
//        ex.getBindingResult().getAllErrors().forEach((error) -> {
//            String fieldName = ((FieldError) error).getField();
//            String errorMessage = error.getDefaultMessage();
//            errors.put(fieldName, errorMessage);
//        });
//        return errors;
//    }
//}
