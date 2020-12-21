package space.dubovitsky.flashcards.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * Object model class for FlashCard.
 */
@Entity
@Getter @Setter
@NoArgsConstructor
@Table(name = "card")
public class Card {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id; //TODO Почему тут не использовать примитив?

//    @Size(min = 1)
//    @NotBlank(message = "Please, fill the front page with some text")
    private String front;

//    @Size(min = 1)
//    @NotBlank(message = "Please, fill the front page with some text")
    private String back;

//    public Card(@NotBlank(message = "Please, fill the front page with some text") String front, @NotBlank(message = "Please, fill the front page with some text") String back) {
//        this.front = front;
//        this.back = back;
//    }


    public Card(String front, String back) {
        this.front = front;
        this.back = back;
    }
}
