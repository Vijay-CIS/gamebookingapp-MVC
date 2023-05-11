package com.vijay.gamebookingapp.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



import lombok.Data;

@Data
@Entity
@Table(name="booking")
public class Booking {
    @Id
    @Column(name="booking_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer bookingId;
    @Column(name="user_id")
	private Long userId;
    @Column(name="machine_id")
	private Integer machineId;
    @Column(name="status")
	private String status;
    @Column(name="start_time")
	private LocalTime startTime;
    @Column(name="end_time")
	private LocalTime endTime;
    @Column(name="amount")
	private Integer amount;
    @Column(name="booking_date")
	private LocalDateTime bookingDate;
    @Column(name="play_date")
	private LocalDate playDate;
	
	public void setPlayDate(String playDateStr ) {
		this.playDate=LocalDate.parse(playDateStr);
	}
	
}
