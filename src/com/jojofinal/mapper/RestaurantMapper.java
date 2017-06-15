package com.jojofinal.mapper;

import java.util.List;

import com.jojofinal.po.Restaurant;

public interface RestaurantMapper {
	public void addRes(Restaurant res);

	public void deleteRes(int rid);
	
	public void updatepass(Restaurant res);
	
	public List<Restaurant> isexist(Restaurant res);

	public List<Restaurant> nameisexist(String rname);

	public List<Restaurant> findById(int rid);

	public List<Restaurant> showAll();

	public void updateRes(Restaurant res);
}
