package com.gl.crm.controller;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.crm.entity.Customer;
import com.gl.crm.service.CustomerService;

@Controller
@RequestMapping("/customers")
public class CustomerController {

	@Autowired
	private CustomerService service;

	@RequestMapping("/list")
	public String showAll(Model model) {
		List<Customer> cust = service.fetchAll();
		model.addAttribute("customerList", cust);
		return "customers";
	}
	
	//onclick of "Add New Customer" Button
	@RequestMapping("/addOrUpdateCustomer")
	public String addOrUpdateCustomer(@RequestParam("customerId") Integer id, Model model) {

		Customer c;
		if (id != 0) {
			c = service.findById(id);
			model.addAttribute("cust", c);
		} else {
			c = new Customer();
			model.addAttribute("cust", c);
		}

		return "customerForm";
	}
	
	//onclick of "Submit" button of customerForm page
	@RequestMapping("/addOrUpdateRecord")
	public String addOrUpdateRecord(Integer id, @RequestParam("fName") String firstName,
			@RequestParam("lName") String lastName, @RequestParam("eMail") String eMail) {

		Customer c;
		if (id != 0) {
			c = service.findById(id);
			c.setFirstName(firstName);
			c.setLastName(lastName);
			c.seteMail(eMail);
			service.addOrUpdate(c);
		} else {
			c = new Customer(firstName, lastName, eMail);
			service.addOrUpdate(c);
		}

		return "redirect:list";
	}

	@RequestMapping("/delete")
	public String deleteRecord(@RequestParam("customerId") Integer id) {
		if (id != 0) {
			Customer customer = service.findById(id);
			service.deleteCustomer(customer);
		}

		return "redirect:list";
	}
}
