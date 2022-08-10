package service.impl;

import model.Customer;
import model.CustomerType;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> selectAllCustomer() {
        return customerRepository.selectAllCustomer();
    }

    @Override
    public Customer selectCustomer(int pId) {
        return null;
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return false;
    }

    @Override
    public boolean removeCustomer(int pId) {
        return false;
    }

    @Override
    public List<Customer> searchByName(String name) {
        return null;
    }

    @Override
    public List<CustomerType> selectCustomerType() {
        return customerRepository.selectCustomerType();
    }

    @Override
    public List<Customer> selectCustomerIncludeDeleted() {
        return null;
    }

    @Override
    public Map<String, String> insertCheckedCustomer(Customer customer) {
        return null;
    }
}
