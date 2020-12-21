package space.dubovitsky.flashcards.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import space.dubovitsky.flashcards.model.Card;

public interface CardRepository extends JpaRepository<Card, Long> {

    Card findByFront(String front);

}
