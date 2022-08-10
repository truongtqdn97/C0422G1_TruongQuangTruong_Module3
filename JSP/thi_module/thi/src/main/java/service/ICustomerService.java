package service;

import model.Customer;
import model.CustomerType;

import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> selectAllCustomer();

    Customer selectCustomer(int pId);

    boolean updateCustomer(Customer customer);

    boolean removeCustomer(int pId);

    List<Customer> searchByName(String name);

    List<CustomerType> selectCustomerType();

    List<Customer> selectCustomerIncludeDeleted();

    Map<String, String> insertCheckedCustomer(Customer customer);
}
