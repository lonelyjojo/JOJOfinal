package com.jojofinal.service;

import java.util.List;

import com.jojofinal.po.User;

public interface UserService {
	public void addUser(User u);

	public void deleteUserById(int uid);

	public List<User> findUser(int id);

	public void updatepass(User u);

	public List<User> findIsExist(User u);

	public List<User> findNameIsexist(String uname);

	public List<User> showall();
}
