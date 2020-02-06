package com.cos.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.springboot.model.Product;
import com.cos.springboot.repository.ProductRepository;

@Controller
public class ProductController {
	
	@Autowired
	private ProductRepository productRepository; 

//	@GetMapping({"","/"})
//	public String index() {
//		return "index";
//	}
//	
//	@GetMapping("/list")
//	public String products(Model model) {
//		List<Product> products = productRepository.findAll();
//		
//		model.addAttribute("products", products);
//		
//		return "list";
//	}
	
	@GetMapping("/")
	public String products(Model model) {
		List<Product> products = productRepository.findAll();
		
		model.addAttribute("products", products);
		
		System.out.println("/");
		
		return "list";
	}
	
	@GetMapping("/all")
	public @ResponseBody List<Product> allFind(Model model){
		List<Product> products = productRepository.findAll();

		System.out.println("/all");
		System.out.println("products: " + products);
		
		model.addAttribute("products", products);

		return products;
	}
	
	@GetMapping("/{type}")
	public @ResponseBody List<Product> findByType(@PathVariable String type, Model model){
		List<Product> products = productRepository.findByType(type);

		System.out.println("/fruit, cook");
		
		model.addAttribute("products", products);

		return products;
	}
	
	@GetMapping("/price/{type}")
	public @ResponseBody List<Product> findByPrice(@PathVariable String type, Model model){
		List<Product> products = productRepository.findByPrice(type);

		System.out.println("/price/type");
		
		model.addAttribute("products", products);

		return products;
	}
	
	@GetMapping("/order/{type}")
	public @ResponseBody List<Product> findByOrder(@PathVariable String type, Model model){
		List<Product> products = productRepository.findByOrder(type);

		System.out.println("/order/type");
		
		model.addAttribute("products", products);

		return products;
	}
	
	@GetMapping("/price/all")
	public @ResponseBody List<Product> findByPriceAll(Model model){
		List<Product> products = productRepository.findByPriceAll();

		System.out.println("/price/all");
		
		model.addAttribute("products", products);

		return products;
	}
	
	@GetMapping("/order/all")
	public @ResponseBody List<Product> findByOrderAll(Model model){
		List<Product> products = productRepository.findByOrderAll();

		System.out.println("/order/all");
		
		model.addAttribute("products", products);

		return products;
	}


}
