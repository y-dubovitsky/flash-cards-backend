package space.dubovitsky.flashcards.api;

import org.junit.jupiter.api.Test;
//import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;
import space.dubovitsky.flashcards.api.CardRestController;
import space.dubovitsky.flashcards.repository.CardRepository;

//@RunWith(SpringRunner.class) // @RunWith(SpringRunner.class) provides a bridge between Spring Boot test features and JUnit.
@WebMvcTest
@AutoConfigureMockMvc
class CardRestControllerTest {

    @MockBean
    private CardRepository userRepository;

    @Autowired
    CardRestController userController;

    @Autowired
    private MockMvc mockMvc;

    @Test
    void save() {
    }
}