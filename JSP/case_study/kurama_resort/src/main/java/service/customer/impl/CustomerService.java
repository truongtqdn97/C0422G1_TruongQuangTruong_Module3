package service.customer.impl;

import model.Customer;
import model.CustomerType;
import repository.customer.ICustomerRepository;
import repository.customer.impl.CustomerRepository;
import service.customer.ICustomerService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();

    private final String NAME_REREX = "^((([A-Z]+)([a-z]+)\\s)+)(([A-Z]+[a-z]*)*)$";

    private final String PHONE_NUMBER_REGEX = "^((090)|(091)|(\\(84\\)\\+90)|(\\(84\\)\\+91))(([0-9]){7})$";

    private final String IDCARD_REGEX = "^\\d{9}$";

    private final String EMAIL_REGEX = "^[\\w\\_]+\\@[a-z]+\\.[a-z]+$";
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
    public List<Customer> searchByName(String name) {
        return customerRepository.searchByName(name);
    }

    @Override
    public List<CustomerType> selectCustomerType() {
        return customerRepository.selectCustomerType();
    }

    @Override
    public List<Customer> selectCustomerIncludeDeleted() {
        return customerRepository.selectCustomerIncludeDeleted();
    }

    @Override
    public Map<String, String> insertCheckedCustomer(Customer customer) {
        Map<String, String> mapErrors = new HashMap<>();
        if (!customer.getName().isEmpty()){
            if (!customer.getName().matches(NAME_REREX)){
                mapErrors.put("nameRegex", "Please input right format!");
            }
        }else {
            mapErrors.put("nameRegex", "Please input name!");
        }
        if (!customer.getPhoneNumber().isEmpty()){
            if (!customer.getPhoneNumber().matches(PHONE_NUMBER_REGEX)){
                mapErrors.put("phoneNumberRegex", "Please input right format!");
            }
        }else {
            mapErrors.put("phoneNumberRegex", "Please input phone number!");
        }
        if (!customer.getIdentifyCard().isEmpty()){
            if (!customer.getIdentifyCard().matches(IDCARD_REGEX)){
                mapErrors.put("idCardRegex", "Please input right format!");
            }
        }else {
            mapErrors.put("idCardRegex", "Please input Identify card number!");
        }
        if (!customer.getEmail().isEmpty()){
            if (!customer.getEmail().matches(EMAIL_REGEX)){
                mapErrors.put("emailRegex", "Please input right format!");
            }
        }else {
            mapErrors.put("emailRegex", "Please input email address!");
        }

        if (customer.getBirthday()==null){
            mapErrors.put("birthdayRegex", "Please input birthday!");
        }

        if (mapErrors.size()==0){
            this.customerRepository.insertCustomer(customer);
        }
        return mapErrors;
    }
}
