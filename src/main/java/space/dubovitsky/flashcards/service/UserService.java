package space.dubovitsky.flashcards.service;

import org.springframework.stereotype.Service;
import space.dubovitsky.flashcards.model.User;
import space.dubovitsky.flashcards.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User findByUsername(String username) {
        User byUsername = userRepository.findByUsername(username);
        return byUsername;
    }

    public void save(User user) {
        userRepository.save(user);
    }
}
