package com.dsv.pvt.fikafocus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class FikafocusApplication {

    public static void main(String[] args) {
        SpringApplication.run(FikafocusApplication.class, args);

    }

    @GetMapping
    public String hello(){
        return "hii";
    }


}
