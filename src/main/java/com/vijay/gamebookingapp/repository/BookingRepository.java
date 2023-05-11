package com.vijay.gamebookingapp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vijay.gamebookingapp.model.Booking;

@Repository
public interface BookingRepository extends JpaRepository<Booking,Integer>{

	List<Booking> findByUserId(Long id);


	Booking findByBookingId(Integer bookingId);

	

}
