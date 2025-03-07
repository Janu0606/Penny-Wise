package com.dao;

public interface IDao<T> {
	void addUser(T t);
	T authenticate(String email);
}
