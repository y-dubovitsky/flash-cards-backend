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
@Table(name = "card_table")
public class Card {

    @Id
    @SequenceGenerator(name = "card_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "card_seq")
    private Long id; //TODO Почему тут не использовать примитив?

    @Size(min = 1)
    @NotBlank(message = "Please, fill the front page with some text")
    private String front;

    @Size(min = 1)
    @NotBlank(message = "Please, fill the back page with some text")
    private String back;

    @Column(name = "prompt")
    private String prompt;

    @Column(name = "imageName")
    private String imageName;

    @Column(name = "isLearned")
    private Boolean isLearned;

    @JoinColumn(name = "user_id")
    @ManyToOne(optional = false, cascade = CascadeType.ALL)
    private User user;

    public Card(String front, String back) {
        this.front = front;
        this.back = back;
    }

}
