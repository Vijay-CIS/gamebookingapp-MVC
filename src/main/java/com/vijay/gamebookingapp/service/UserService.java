package com.vijay.gamebookingapp.service;

import com.vijay.gamebookingapp.model.User;

public interface UserService {

	void save(User user);

	User login(String email, String password) throws Exception;

}