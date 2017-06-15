package com.jojofinal.service;

import java.util.List;

import com.jojofinal.po.Dish;

public interface DishService {
	public void addDish(Dish dish);

	public void deleteDish(int did);

	public List<Dish> findById(int did);

	public List<Dish> showByRID(int rid);

	public List<Dish> showHotRank();
	
	public List<Dish> showBadRank();

	public void addgnum(int did);

	public void addbnum(int did);

	public int getgnum(int did);

	public int getbnum(int did);
	
	public void updateDishName(Dish dish);
	
	public void updateDish(Dish dish);
	
}
