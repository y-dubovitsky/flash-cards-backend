package space.dubovitsky.flashcards.service;

import org.springframework.stereotype.Service;
import space.dubovitsky.flashcards.model.Card;
import space.dubovitsky.flashcards.model.builder.CardBuilder;
import space.dubovitsky.flashcards.repository.CardRepository;

import java.util.List;
import java.util.Optional;

@Service
public class CardService {

    private final CardRepository cardRepository;

    public CardService(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    public List<Card> findAll() {
        return cardRepository.findAll();
    }

    public Card findById(long id) throws Exception{
        Optional<Card> byId = cardRepository.findById(id);
        return byId.orElseThrow(Exception::new); // TODO ?
    }

    public void save(Card card) {
        this.cardRepository.save(card);
    }

    public void delete(long id) {
        this.cardRepository.delete(CardBuilder.create().withId(id).build());
    }

    public Card findByFront(String front) {
        Card byFront = this.cardRepository.findByFront(front);
        return byFront;
    }
}
