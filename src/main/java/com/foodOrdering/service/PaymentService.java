package com.foodOrdering.service;

import com.foodOrdering.model.Order;
import com.foodOrdering.response.PaymentResponse;
import com.stripe.exception.StripeException;

public interface PaymentService {
    public PaymentResponse createPaymentLink(Order order) throws StripeException;
}
