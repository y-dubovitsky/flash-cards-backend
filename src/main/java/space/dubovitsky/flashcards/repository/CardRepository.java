package space.dubovitsky.flashcards.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import space.dubovitsky.flashcards.model.Card;
import space.dubovitsky.flashcards.model.User;

import java.util.List;

public interface CardRepository extends JpaRepository<Card, Long> {

    Card findByFront(String front);

    List<Card> findAllByUser(User username);

    @Override
    Page<Card> findAll(Pageable pageable);
}
