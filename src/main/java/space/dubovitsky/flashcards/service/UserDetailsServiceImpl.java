package space.dubovitsky.flashcards.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import space.dubovitsky.flashcards.repository.UserRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    private final UserRepository userRepository;

    public UserDetailsServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    /**
     * https://stackoverflow.com/questions/49654143/spring-security-5-there-is-no-passwordencoder-mapped-for-the-id-null
     * @param username - username from database
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        try {
            final space.dubovitsky.flashcards.model.User user = userRepository.findByUsername(username);

            if (user != null) {
                return org.springframework.security.core.userdetails.User.withUsername(user.getUsername())
                        .password("{noop}" + user.getPassword())
                        .roles("ADMIN", "USER")
                        .build();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        throw new UsernameNotFoundException(username);
    }
}
