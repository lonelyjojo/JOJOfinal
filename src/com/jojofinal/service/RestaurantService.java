package com.jojofinal.service;

import java.util.List;

import com.jojofinal.po.Restaurant;

public interface RestaurantService {
	public void addRes(Restaurant res);

	public void deleteRes(int rid);

	public List<Restaurant> findById(int rid);

	public List<Restaurant> showAll();

	public void updateRes(Restaurant res);

	public List<Restaurant> findIsexist(Restaurant res);
	
	public List<Restaurant> findNameIsexist(String rname);
	
	public void updatepass(Restaurant res);
}
