package com.example.UshtLayers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    public List<Student> printoStudentet() {
        return studentRepository.findAll();
    }

    public Student shtoStudent(Student student) {
        return studentRepository.save(student);
    }

    public Student modifikoStudent(Long id, Student newStudent) {
        Student s = studentRepository.findById(id).orElseThrow();
        s.setName(newStudent.getName());
        s.setAge(newStudent.getAge());
        return studentRepository.save(s);
    }

    public void fshiStudent(Long id) {
        studentRepository.deleteById(id);
    }
}

