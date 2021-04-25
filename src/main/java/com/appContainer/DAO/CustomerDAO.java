package com.appContainer.DAO;

import com.appContainer.Models.Customer;

import java.util.List;

public interface CustomerDAO {

    List<Customer> getCustomers();

    void saveCustomer(Customer theCustomer);

     Customer getCustomer(int theId);

    void deleteCustomer(int theId);

    List<Customer> searchCustomer(String customerName);
}
