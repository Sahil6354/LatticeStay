package com.sahil.latticestay.Strategy;

import com.sahil.latticestay.Entities.InventoryEntity;

import java.math.BigDecimal;
public interface PricingStrategy {

    BigDecimal calculatePrice(InventoryEntity inventory);
}
