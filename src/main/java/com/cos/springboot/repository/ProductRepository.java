package com.cos.springboot.repository;

import java.util.List;

import com.cos.springboot.model.Product;

public interface ProductRepository {

	List<Product> findAll();
	
	List<Product> findByType(String type);
	
	List<Product> findByPrice(String type);
	
	List<Product> findByOrder(String type);
	
	List<Product> findByPriceAll();
	
	List<Product> findByOrderAll();
	
}
