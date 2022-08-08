package service.customer;

import model.Customer;
import model.CustomerType;

import java.util.List;

public interface ICustomerService {
    List<Customer> selectAllCustomer();

    Customer selectCustomer(int pId);

    boolean insertCustomer(Customer customer);

    boolean updateCustomer(Customer customer);

    boolean removeCustomer(int pId);

    List<Customer> searchByName(String name);

    List<CustomerType> selectCustomerType();

    List<Customer> selectCustomerIncludeDeleted();

}
