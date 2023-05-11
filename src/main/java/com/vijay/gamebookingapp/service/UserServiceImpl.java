package com.vijay.gamebookingapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vijay.gamebookingapp.model.User;
import com.vijay.gamebookingapp.repository.UserRepository;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Override
	public void save(User user) {
	userRepository.save(user);
	
	}

	@Override
	public User login(String email, String password) throws Exception {
		User user = userRepository.findByEmail(email).orElse(null);
		if (user == null){
			throw new Exception("Invalid Login Credentials");
			
		}
		else if (!user.getPassword().equals(password)) {
			throw new Exception("Invalid Login Credentials");
		}
		return user;
	}

}
