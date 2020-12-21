package space.dubovitsky.flashcards.model.builder;

import space.dubovitsky.flashcards.model.Card;

/**
 * Builder for {@link Card}
 */
public class CardBuilder {

    private static CardBuilder instance = new CardBuilder();
    private Long id = null;
    private String front = "";
    private String back = "";

    private CardBuilder() {
    }

    public static CardBuilder create() {
        return instance;
    }

    public CardBuilder withId(long id) {
        this.id = id;
        return instance;
    }

    public CardBuilder withFrond(String front) {
        this.front = front;
        return instance;
    }

    public CardBuilder withBack(String front) {
        this.back = back;
        return instance;
    }

    public Card build() {
        Card card = new Card(front, back); //TODO Можно ли так? В Конструкторе написано что не blank
        if (this.id != null) {
            card.setId(id);
        }
        return card;
    }

}
