package com.appContainer.services;

import com.appContainer.entities.Customer;

import java.util.List;

public interface CustomerService {

     List<Customer> getCustomers();

     void saveCustomer(Customer theCustomer);

     Customer getCustomer(int theId);

     void deleteCustomer(int theId);

     List<Customer> searchCustomer(String customerName);
}
