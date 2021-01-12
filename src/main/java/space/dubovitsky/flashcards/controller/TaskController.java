package space.dubovitsky.flashcards.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import space.dubovitsky.flashcards.model.Task;
import space.dubovitsky.flashcards.service.TaskService;

import java.util.List;

@Controller
@RequestMapping("/task")
public class TaskController {

    private final TaskService taskService;

    public TaskController(TaskService taskService) {
        this.taskService = taskService;
    }

    @GetMapping
    public String findAll(Model model) {
        List<Task> tasks = taskService.findAll();

        model.addAttribute("tasks", tasks);
        return "task";
    }

    /**
     * Save task from user request
     *
     * @param task
     * @param model
     */
    @PostMapping("/add")
    public String save(Task task, Model model) {
        taskService.save(task);

        model.addAttribute("tasks", taskService.findAll());
        return "redirect:/task";
    }

    @DeleteMapping()
    public String delete(
            Task task,
            Model model
    ) {
        taskService.delete(task);

        model.addAttribute("tasks", taskService.findAll());
        return "task";
    }
}
