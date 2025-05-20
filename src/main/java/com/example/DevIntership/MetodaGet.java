package com.example.DevIntership;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/messages")
public class MetodaGet {
    @GetMapping("/static")
    public String staticMessage(){
        return "Ushtrim me Spring boot: Metoda Get";
    }
}
