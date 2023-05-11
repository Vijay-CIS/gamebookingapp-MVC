package com.vijay.gamebookingapp.controller;


import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vijay.gamebookingapp.model.Booking;
import com.vijay.gamebookingapp.model.User;
import com.vijay.gamebookingapp.service.BookingService;
import com.vijay.gamebookingapp.service.UserService;

import lombok.extern.log4j.Log4j2;


@Log4j2
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private BookingService bookingService;
	
	@GetMapping()
	public String home() {
		log.info("home");
		System.out.println("home");
		return "index";
	}
	
	@GetMapping("/index")
	public String index() {
		log.info("Inside Index");
		return "index";
	}
	
	
	@GetMapping("/signup")
	public String register( Model model, User user) {
		log.info("Inside signup - Get");
		model.addAttribute("userForm",user );
		return "register";
	}
	
	@PostMapping("/signup")
	public String register(@ModelAttribute("userForm")User user, Model model) {
		log.info("Inside signup - Post");
		model.addAttribute("userForm", user);
		userService.save(user);
		return "redirect:/index";
	}
	
	@GetMapping("/signin")
	public String login(Model model, User user) {
		log.info("Inside Login - Get");
		model.addAttribute("userForm",user);
		return "login";
	}
	
	@PostMapping("/signin")
	public String login(@ModelAttribute("userForm") User userForm,HttpSession session, Model model) {
		log.info("Inside Login - Post");
		try {
			User user = userService.login(userForm.getEmail(),userForm.getPassword());
			session.setAttribute("user", user);
			return "redirect:/index";
		}
		catch(Exception e) {
			log.error("error",e);
			model.addAttribute("error", e.getMessage());
			return "login";
		}
	
	}
	
	@GetMapping("/booking")
	public String booking(Model model, Booking booking) {
		log.info("Inside Booking - Get");
		model.addAttribute("bookingForm", booking);
		return "booking";
	}
	@PostMapping("/booking")
	public String booking(@ModelAttribute("bookingForm")Booking booking, Model model) {
		log.info("Inside Booking - Post");
		booking.setBookingDate(LocalDateTime.now());
		booking.setAmount(100);
		//booking.setPlayDate(LocalDate.now());
		booking.setStatus("BOOKED");
		bookingService.save(booking);
	//	model.addAttribute("bookingForm", booking);
		return "mybookings";
	}
	
	@GetMapping("/userBookings")
	public String userBookings(Model model,HttpSession session ) {
		User user = (User) session.getAttribute("user");
		if (user==null) {
			return "redirect:/signin";
		}
	    List<Booking> list = bookingService.fetchAllUserBookings(user.getId());
	    model.addAttribute("bookingList", list);
	    return "mybookings";
	}
	
	@GetMapping("/allBookings")
	public String allBookings(Model model) {
		List<Booking> list = bookingService.fetchAllBookings();
		model.addAttribute("bookingList", list);
		return "allbookings";
	}
	
	@GetMapping("/updateBookingStatus/{bookingId}")
	public String updateBookingStatus(@PathVariable("bookingId") Integer bookingId,@RequestParam("status") String status, HttpSession session) {
	   Booking booking = bookingService.findByBookingId(bookingId);
	   booking.setStatus(status);
	   
	   bookingService.updateBookings(booking);
	   return "redirect:/userBookings";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("logout");
		session.invalidate();
		return "redirect:/signin";
	}
	
}
