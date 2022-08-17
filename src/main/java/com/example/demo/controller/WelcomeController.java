package com.example.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WelcomeController {

    Logger logger = LoggerFactory.getLogger(WelcomeController.class);

    @Value("${welcome.message}")
    private String message;

    @GetMapping("/welcome")
    public String welcome(){
        logger.info("Returning Message.");
        return message;
    }
}
