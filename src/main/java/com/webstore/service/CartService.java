package com.webstore.service;

import com.webstore.domain.Cart;

import java.util.List;

public interface CartService {
    public Cart getShoppingCar(Long userId,Long itemId);

    public void addShoppingCar(Cart cart, double price);

    public boolean deleteShoppingCar(Long userId, Long itemId);

    public boolean updateShoppingCar(Cart cart, double price);

    public List<Cart> getShoppingCars(Long userId);
}
