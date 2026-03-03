package com.sahil.latticestay.Service.Interfaces;


import com.sahil.latticestay.Entities.BookingEntity;

public interface CheckoutService {

    String getCheckoutSession(BookingEntity booking, String successUrl, String failureUrl);

}
