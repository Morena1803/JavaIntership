package com.example.UshtLayers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @GetMapping
    public List<Student> getAll() {
        return studentService.printoStudentet();
    }

    @PostMapping
    public Student create(@RequestBody Student student) {
        return studentService.shtoStudent(student);
    }

    @PutMapping("/{id}")
    public Student update(@PathVariable Long id, @RequestBody Student newStudent) {
        return studentService.modifikoStudent(id, newStudent);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        studentService.fshiStudent(id);
    }
}
