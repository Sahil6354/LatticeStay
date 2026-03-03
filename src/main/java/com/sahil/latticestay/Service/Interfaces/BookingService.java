package com.sahil.latticestay.Service.Interfaces;

import com.sahil.latticestay.Dto.BookingDTO;
import com.sahil.latticestay.Dto.BookingRequest;
import com.sahil.latticestay.Dto.GuestDTO;
import com.sahil.latticestay.Dto.HotelReportDTO;
import com.sahil.latticestay.Enums.BookingStatus;
import com.stripe.model.Event;

import java.time.LocalDate;
import java.util.List;

public interface BookingService {
    BookingDTO initialiseBooking(BookingRequest bookingRequest);

    BookingDTO addGuests(Long bookingId, List<GuestDTO> guestDtoList);

    String initiatePayments(Long bookingId);

    void capturePayment(Event event);

    void cancelBooking(Long bookingId);

    BookingStatus getBookingStatus(Long bookingId);

    List<BookingDTO> getAllBookingsByHotelId(Long hotelId);

    HotelReportDTO getHotelReport(Long hotelId, LocalDate startDate, LocalDate endDate);

    List<BookingDTO> getMyBookings();
}
