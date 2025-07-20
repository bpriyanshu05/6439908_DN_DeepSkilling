package com.example.jwt.controller;

import com.example.jwt.util.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Base64;

import jakarta.servlet.http.HttpServletRequest;


@RestController
public class AuthenticationController {

    @Autowired
    private JwtUtil jwtUtil;

    @GetMapping("/authenticate")
    public String authenticate(HttpServletRequest request) {
        String authHeader = request.getHeader("Authorization");
        if (authHeader == null || !authHeader.startsWith("Basic ")) {
            return "{\"error\":\"Missing Authorization header\"}";
        }

        String[] credentials = new String(Base64.getDecoder()
            .decode(authHeader.substring(6))).split(":");

        String username = credentials[0];
        String password = credentials[1];

        if (username.equals("user") && password.equals("pwd")) {
            String token = jwtUtil.generateToken(username);
            return "{\"token\":\"" + token + "\"}";
        } else {
            return "{\"error\":\"Invalid credentials\"}";
        }
    }
}

