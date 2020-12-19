package space.dubovitsky.flashcards.model.builder;

import space.dubovitsky.flashcards.model.Card;

/**
 * Builder for {@link Card}
 */
public class CardBuilder {

    private static Card build() {
        return new Card();
    }

    public static Card withId(long id) {
        Card build = build();
        build.setId(id);
        return build;
    }

}
