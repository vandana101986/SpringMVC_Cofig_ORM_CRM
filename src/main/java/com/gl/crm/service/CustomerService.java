package com.gl.crm.service;

import java.util.List;

import com.gl.crm.entity.Customer;

public interface CustomerService {

	public List<Customer> fetchAll();

	public void addOrUpdate(Customer c);

	public Customer findById(Integer id);

	public void deleteCustomer(Customer customer);

}
