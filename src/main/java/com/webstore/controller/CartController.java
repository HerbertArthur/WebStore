package com.webstore.controller;

import com.webstore.domain.Cart;
import com.webstore.service.CartService;
import com.webstore.service.ItemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value="/cart")
public class CartController {
	private CartService cartService;
	private ItemService itemService;
	@RequestMapping
	public String get(HttpServletRequest request){
		return "redirect:/cart/"+request.getSession(true).getId();
	}
	
	@RequestMapping(value="/{cartId}", method = RequestMethod.GET)
	public String getCart(@PathVariable("cartId") String cartId, Model model){
		model.addAttribute("cartId", cartId);
		return "cart";
	}

	@RequestMapping(value = "/cart")
	public String cart() {
		return "cart";
	}

	@RequestMapping(value = "/addShoppingCar",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addShoppingCar(Long userId, Long itemId, int counts){
		System.out.println("数量为"+counts);
		Cart cart = cartService.getShoppingCar(userId, itemId);
		if(cart == null){
			Cart cart1 = new Cart();
			cart1.setUserId(userId);
			cart1.setItemId(itemId);
			cart1.setItemNum(counts);

			cartService.addShoppingCar(cart1, itemService.getItemById(itemId).getPrice());

		}
		else{
			cart.setItemNum(cart.getItemNum()+counts);
			double price = itemService.getItemById(itemId).getPrice();
			cartService.updateShoppingCar(cart, price);

		}
		Map<String, Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result","success");
		System.out.println("我返回了");
		return resultMap;
	}
}
