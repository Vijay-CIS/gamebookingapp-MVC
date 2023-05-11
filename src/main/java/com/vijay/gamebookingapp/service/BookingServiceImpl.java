package com.vijay.gamebookingapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vijay.gamebookingapp.model.Booking;
import com.vijay.gamebookingapp.repository.BookingRepository;
@Service
public class BookingServiceImpl implements BookingService {
  
	@Autowired
	private BookingRepository bookingRepository;
	
	
	@Override
	public void save(Booking booking) {
		bookingRepository.save(booking);
		
	}


	@Override
	public List<Booking> fetchAllUserBookings(Long id) {
		List<Booking> list = bookingRepository.findByUserId(id);
		return list;
	}


	@Override
	public List<Booking> fetchAllBookings() {
		List<Booking> list = bookingRepository.findAll();
		return list;
	}


	@Override
	public Booking findByBookingId(Integer bookingId) {
		Booking booking = bookingRepository.findByBookingId(bookingId);
		if (booking == null) {
			throw new RuntimeException("Invalid User ID");
		}
		return booking;
	}


	@Override
	public void updateBookings(Booking booking) {
		bookingRepository.save(booking);
		
	}

}
