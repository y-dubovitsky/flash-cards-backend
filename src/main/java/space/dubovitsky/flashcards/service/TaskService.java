package space.dubovitsky.flashcards.service;

import org.springframework.stereotype.Service;
import space.dubovitsky.flashcards.model.Task;
import space.dubovitsky.flashcards.repository.TaskRepository;

import java.util.List;

@Service
public class TaskService {

    private final TaskRepository taskRepository;

    public TaskService(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    public void save(Task task) {
        taskRepository.save(task);
    }

    public List<Task> findAll() {
        return taskRepository.findAll();
    }
}
