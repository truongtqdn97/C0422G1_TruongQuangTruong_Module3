package repository.impl;

import model.Customer;
import model.CustomerType;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String SELECT_ALL_CUSTOMER = "select * from khach_hang" +
            " where `status` = 1 ";
    private final String SELECT_ALL_CUSTOMER_INCLUDE_DELETED = "select * from khach_hang";
    private final String SELECT_CUSTOMER_BY_ID = "select * from khach_hang" +
            " where ma_khach_hang = ? ;";
    private final String DELETE_CUSTUMER = "UPDATE `khach_hang` " +
            "SET `status` = 0 WHERE (`ma_khach_hang` = ?);";

    private final String SELECT_CUSTOMER_TYPE = "select * from loai_khach;";

    private final String SEARCH_CUSTOMER_BY_NAME = "select * from khach_hang" +
            " where (ho_ten like ? ) and (`status` = 1) ;";
    private final String INSERT_CUSTOMER = "insert into `khach_hang` (" +
            "`ma_loai_khach`, " +
            "`ho_ten`, " +
            "`ngay_Sinh`, " +
            "`so_cmnd`, " +
            " values (?, ?, ?, ?);";
    private final String UPDATE_CUSTOMER = "update khach_hang " +
            "set ma_loai_khach = ?, " +
            "ho_ten = ?, " +
            "ngay_sinh = ?, " +
            "so_cmnd = ?, " +
            " where ma_khach_hang = ?;";

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int cId = rs.getInt(1);
                String name = rs.getString(3);
                LocalDate birthday = LocalDate.parse(rs.getString(4));
                String identifyCard = rs.getString(5);
                int customerType = rs.getInt(2);
                customerList.add(new Customer(cId, name, birthday, identifyCard, customerType));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customerList;
    }

    @Override
    public Customer selectCustomer(int pId) {
        return null;
    }

    @Override
    public boolean insertCustomer(Customer customer) {
        return false;
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
        List<CustomerType> customerTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement ps;
        try {
            ps = connection.prepareCall(SELECT_CUSTOMER_TYPE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int customerTypeId = rs.getInt(1);
                String customerTypeName = rs.getString(2);
                customerTypeList.add(new CustomerType(customerTypeId, customerTypeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypeList;
    }

    @Override
    public List<Customer> selectCustomerIncludeDeleted() {
        return null;
    }
}
