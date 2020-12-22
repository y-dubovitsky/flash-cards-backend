package space.dubovitsky.flashcards.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import space.dubovitsky.flashcards.model.Card;

public interface CardRepository extends JpaRepository<Card, Long> {

    Card findByFront(String front);

    @Override
    Page<Card> findAll(Pageable pageable);
}
