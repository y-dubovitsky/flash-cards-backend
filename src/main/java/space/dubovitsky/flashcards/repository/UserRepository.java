package space.dubovitsky.flashcards.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import space.dubovitsky.flashcards.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

    public User findByUsername(String username);

}
