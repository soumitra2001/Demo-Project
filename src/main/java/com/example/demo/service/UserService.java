package com.example.demo.service;

import com.example.demo.model.User;
import com.example.demo.repository.IUserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private IUserRepo userRepo;

    public List<User> getAllUser(){
        return userRepo.findAll();
    }

    public String addUser(User user) {
        userRepo.save(user);
        return "User successfully added..!";
    }

}
