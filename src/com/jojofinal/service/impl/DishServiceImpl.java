package com.jojofinal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jojofinal.mapper.DishMapper;
import com.jojofinal.mapper.MsgMapper;
import com.jojofinal.po.Dish;
import com.jojofinal.service.DishService;

@Service
public class DishServiceImpl implements DishService {

	@Autowired
	private DishMapper dm;
	
	@Override
	public void addDish(Dish dish) {
		dm.addDish(dish);
	}

	@Override
	public void deleteDish(int did) {
		dm.deleteDish(did);
	}

	@Override
	public List<Dish> findById(int did) {
		return dm.findById(did);
	}

	@Override
	public List<Dish> showByRID(int rid) {
		return dm.showByRID(rid);
	}

	@Override
	public void addgnum(int did) {
		dm.addgnum(did);
	}

	@Override
	public void addbnum(int did) {
		dm.addbnum(did);
		
	}

	@Override
	public int getgnum(int did) {
		return dm.getgnum(did);
	}

	@Override
	public int getbnum(int did) {
		return dm.getbnum(did);
	}

	@Override
	public void updateDishName(Dish dish) {
		// TODO Auto-generated method stub
		dm.updateDishName(dish);
	}

	@Override
	public void updateDish(Dish dish) {
		// TODO Auto-generated method stub
		dm.updateDish(dish);
	}

	@Override
	public List<Dish> showHotRank() {
		// TODO Auto-generated method stub
		return dm.showHotRank();
	}

	@Override
	public List<Dish> showBadRank() {
		// TODO Auto-generated method stub
		return dm.showBadRank();
	}
	
}
