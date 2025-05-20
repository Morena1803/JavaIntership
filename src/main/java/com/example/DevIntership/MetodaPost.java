package com.example.DevIntership;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/messages")
public class MetodaPost{

    @PostMapping("/language")
    public String languageMessage(@RequestParam (required = false) String language) {
        switch (language.toLowerCase()) {
            case "en":
                return "Helloo!";
            case "sq":
                return "Pershendetje!";
            case "fr":
                return "Bonjour!";
            default:
                return "Jepni nje gjuhe tjeter!";
        }
    }
}

