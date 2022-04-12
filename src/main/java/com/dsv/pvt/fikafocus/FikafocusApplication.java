package com.dsv.pvt.fikafocus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@RestController
public class FikafocusApplication {

    public static void main(String[] args) {
        SpringApplication.run(FikafocusApplication.class, args);
    }


    @GetMapping
    public String hello(){
        return "hi";
    }
}
