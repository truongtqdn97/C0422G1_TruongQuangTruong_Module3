package service.customer.impl;

import model.Customer;
import model.CustomerType;
import repository.customer.ICustomerRepository;
import repository.customer.impl.CustomerRepository;
import service.customer.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> selectAllCustomer() {
        return customerRepository.selectAllCustomer();
    }

    @Override
    public Customer selectCustomer(int pId) {
        return customerRepository.selectCustomer(pId);
    }

    @Override
    public boolean insertCustomer(Customer customer) {
        return customerRepository.insertCustomer(customer);
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return customerRepository.updateCustomer(customer);
    }

    @Override
    public boolean removeCustomer(int pId) {
        return customerRepository.removeCustomer(pId);
    }

    @Override
    public List<Customer> searchByCondition() {
        return customerRepository.searchByCondition();
    }

    @Override
    public List<CustomerType> selectCustomerType() {
        return customerRepository.selectCustomerType();
    }
}
