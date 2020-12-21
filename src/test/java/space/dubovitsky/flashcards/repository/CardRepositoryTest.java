package space.dubovitsky.flashcards.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import space.dubovitsky.flashcards.model.Card;
import space.dubovitsky.flashcards.model.builder.CardBuilder;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * @DataJpaTest:
 *
 * provides some standard setup needed for testing the persistence layer:
 * configuring H2, an in-memory database
 * setting Hibernate, Spring Data, and the DataSource
 * performing an @EntityScan
 * turning on SQL logging
 */
@DataJpaTest
class CardRepositoryTest {

    /**
     * To carry out DB operations, we need some records already in our database. To setup this data, we can use TestEntityManager.
     * The Spring Boot TestEntityManager is an alternative to the standard JPA EntityManager that provides methods commonly used when writing tests.
     */
    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private CardRepository cardRepository;

    @Test
    public void whenFindByName_thenReturnEmployee() {
        // given
        Card card = CardBuilder.create().withFrond("First").withBack("Первый").build();
        entityManager.persist(card);
        entityManager.flush();

        // when
        Card found = cardRepository.findByFront(card.getFront());

        // then
        assertEquals(found, card);
    }

}