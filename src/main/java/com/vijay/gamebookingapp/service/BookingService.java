package com.vijay.gamebookingapp.service;

import java.util.List;


import com.vijay.gamebookingapp.model.Booking;


public interface BookingService {

	void save(Booking booking);

	List<Booking> fetchAllUserBookings(Long id);

	List<Booking> fetchAllBookings();
	Booking findByBookingId(Integer bookingId);

	void updateBookings(Booking booking);



}
