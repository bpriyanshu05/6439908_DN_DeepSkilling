package com.bank.loan_service.controller;

import java.util.Map;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/loans")
public class LoanController {

    @GetMapping("/{number}")
    public Map<String, Object> getLoanDetails(@PathVariable String number) {
        return Map.of(
            "number", number,
            "type", "car",
            "loan", 400000,
            "emi", 3258,
            "tenure", 18
        );
    }
}