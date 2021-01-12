package space.dubovitsky.flashcards.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import space.dubovitsky.flashcards.model.Task;

public interface TaskRepository extends JpaRepository<Task, Long> {
}
