/**
 * 
 */
package com.jojofinal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jojofinal.mapper.RestaurantMapper;
import com.jojofinal.po.Restaurant;
import com.jojofinal.service.RestaurantService;

/**
 * @author jojo
 * 
 */
@Service
public class RestaurantServiceImpl implements RestaurantService {

	@Autowired
	private RestaurantMapper rmap;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.jojofinal.service.RestaurantService#addRes(com.jojofinal.po.Restaurant
	 * )
	 */
	@Override
	public void addRes(Restaurant res) {
		rmap.addRes(res);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.jojofinal.service.RestaurantService#deleteRes(int)
	 */
	@Override
	public void deleteRes(int rid) {
		// TODO Auto-generated method stub
		rmap.deleteRes(rid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.jojofinal.service.RestaurantService#findById(int)
	 */
	@Override
	public List<Restaurant> findById(int rid) {
		// TODO Auto-generated method stub
		return rmap.findById(rid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.jojofinal.service.RestaurantService#showAll()
	 */
	@Override
	public List<Restaurant> showAll() {
		return rmap.showAll();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.jojofinal.service.RestaurantService#updateRes(com.jojofinal.po.Restaurant
	 * )
	 */
	@Override
	public void updateRes(Restaurant res) {
		rmap.updateRes(res);
	}

	@Override
	public List<Restaurant> findIsexist(Restaurant res) {

		List<Restaurant> reses = rmap.isexist(res);
		return reses;

	}

	@Override
	public List<Restaurant> findNameIsexist(String rname) {
		return rmap.nameisexist(rname);
	}

	@Override
	public void updatepass(Restaurant res) {
		// TODO Auto-generated method stub
		rmap.updatepass(res);
	}

}
