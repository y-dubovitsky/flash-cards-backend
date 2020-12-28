package space.dubovitsky.flashcards.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import space.dubovitsky.flashcards.model.Card;
import space.dubovitsky.flashcards.model.builder.CardBuilder;
import space.dubovitsky.flashcards.repository.CardRepository;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class CardService {

    private final CardRepository cardRepository;

    public CardService(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    /**
     * SEarch all cards
     * @return
     */
    public List<Card> findAll() {
        return cardRepository.findAll();
    }

    /**
     * Search flashCard by id
     */
    public Card findById(long id) throws Exception{
        Optional<Card> byId = cardRepository.findById(id);
        return byId.orElseThrow(Exception::new); // TODO ?
    }

    public void save(Card card) {
        this.cardRepository.save(card);
    }

    /**
     * Delete flashCard by id
     * @param id - id
     */
    public void delete(Long id) { //TODO Переписать
        this.cardRepository.delete(CardBuilder.create().withId(id).build());
    }

    /**
     * Search card by front side
     * @param front
     * @return
     */
    public Card findByFront(String front) {
        Card byFront = this.cardRepository.findByFront(front);
        return byFront;
    }

    /**
     * Create new flashCard
     */
    public void add(Card card) {
        this.cardRepository.save(card);
    }

    /**
     * Creates a collection of Cards from an input file
     * @param file
     * @return
     * @throws IOException
     */
    public List<Card> createCardsFromTextFile(MultipartFile file) throws IOException { //TODO Улучшить и переписать логику
        File income = File.createTempFile("temp", ".txt");
        file.transferTo(income);

        FileReader fileReader = new FileReader(income);
        BufferedReader bufferedReader = new BufferedReader(fileReader);

        List<Card> cards = bufferedReader.lines()
                .map(x -> {
                    String[] split = x.split("-"); //TODO Можно добавить проверку, существуют ли уже такие карточки
                    return new Card(split[0], split[1]);
                })
                .collect(Collectors.toList());

        cardRepository.saveAll(cards);

        return cards;
    }

    /**
     * Edit card
     * @param card - new card
     */
    public Card editCard(Card card) {
        Optional<Card> byId = cardRepository.findById(card.getId());
        if (byId.isPresent()) { //TODO ПЕределать эту конструкцию+
            cardRepository.save(card);
            return card;
        } else {
            return null;
        }
    }
}
