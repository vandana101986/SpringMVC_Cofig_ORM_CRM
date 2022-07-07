package com.gl.crm.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gl.crm.entity.Customer;

@Repository
public class ServiceImpl implements CustomerService {
	
	private SessionFactory sessionFactory;
	private Session session;
	
	public ServiceImpl(SessionFactory sessionFac)
	{
		this.sessionFactory=sessionFac;
		try {
			session = this.sessionFactory.getCurrentSession();
		}
		catch(HibernateException e){
			session = this.sessionFactory.openSession();
		}
	}
	
	@Override
	@Transactional
	public List<Customer> fetchAll() {
		List<Customer> custList =session.createQuery("from Customer").list();		
		return custList;
	}

	
	@Transactional
	public void addOrUpdate(Customer c) {
		Transaction tr=session.beginTransaction();
		session.saveOrUpdate(c);
		tr.commit();
		
	}

	@Override
	public Customer findById(Integer id) {
		Customer customer=session.get(Customer.class, id);
		return customer;
	}

	@Override
	@Transactional
	public void deleteCustomer(Customer customer) {
		Transaction tr=session.beginTransaction();
		session.delete(customer);
		tr.commit();
		
	}
	
	

}
