package repository.customer.impl;

import model.Customer;
import model.CustomerType;
import repository.BaseRepository;
import repository.customer.ICustomerRepository;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {

    private final String SELECT_ALL_CUSTOMER = "select * from khach_hang" +
            " where `status` = 1 ";
    private final String SELECT_ALL_CUSTOMER_INCLUDE_DELETED = "select * from khach_hang";
    private final String SELECT_CUSTOMER_BY_ID = "select * from khach_hang" +
                                                    " where ma_khach_hang = ? ;";
    private final String INSERT_CUSTOMER = "insert into `khach_hang` (" +
            "`ma_khach_hang`, " +
            "`ma_loai_khach`, " +
            "`ho_ten`, " +
            "`ngay_Sinh`, " +
            "`gioi_tinh`, " +
            "`so_cmnd`, " +
            "`so_dien_thoai`, " +
            "`email`, " +
            "`dia_chi`) \n" +
            "values (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private final String UPDATE_CUSTOMER = "update khach_hang " +
            "set ma_loai_khach=?," +
            "ho_ten=?," +
            "ngay_sinh=?," +
            "gioi_tinh=?," +
            "so_cmnd=?," +
            "so_dien_thoai=?," +
            "email=?," +
            "dia_chi=? " +
            "where ma_khach_hang=?;";
    private final String DELETE_CUSTUMER = "UPDATE `khach_hang` " +
            "SET `status` = 0 WHERE (`ma_khach_hang` = ?);";

    private final String SELECT_CUSTOMER_TYPE = "select * from loai_khach;";

    private final String SEARCH_CUSTOMER_BY_NAME = "select * from khach_hang" +
            " where (ho_ten like ? ) and (`status` = 1) ;";


    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customers = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int pId = rs.getInt(1);
                String name = rs.getString(3);
                LocalDate birthday = LocalDate.parse(rs.getString(4));
//                LocalDate birthday = LocalDate.parse(rs.getString(4), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                int gender = rs.getInt(5);
                String identifyCard = rs.getString(6);
                String phoneNumber = rs.getString(7);
                String email = rs.getString(8);
                int customerType = rs.getInt(2);
                String address = rs.getString(9);
//                Customer(String pId, String name, LocalDate birthday,
//                String gender, String identifyCard,
//                String phoneNumber, String email,
//                int customerType, String address)
                customers.add(new Customer(pId, name, birthday, gender, identifyCard, phoneNumber, email, customerType, address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
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
        List<Customer> customers = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(SELECT_ALL_CUSTOMER_INCLUDE_DELETED);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int pId = rs.getInt(1);
                String name = rs.getString(3);
                LocalDate birthday = LocalDate.parse(rs.getString(4));
//                LocalDate birthday = LocalDate.parse(rs.getString(4), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                int gender = rs.getInt(5);
                String identifyCard = rs.getString(6);
                String phoneNumber = rs.getString(7);
                String email = rs.getString(8);
                int customerType = rs.getInt(2);
                String address = rs.getString(9);
//                Customer(String pId, String name, LocalDate birthday,
//                String gender, String identifyCard,
//                String phoneNumber, String email,
//                int customerType, String address)
                customers.add(new Customer(pId, name, birthday, gender, identifyCard, phoneNumber, email, customerType, address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    @Override
    public Customer selectCustomer(int pId) {
        Customer customer = null;
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement ps;
        try {
            ps = connection.prepareCall(SELECT_CUSTOMER_BY_ID);
            ps.setInt(1, pId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int pIdCustomer = rs.getInt(1);
                String name = rs.getString(3);
                LocalDate birthday = LocalDate.parse(rs.getString(4));
//                LocalDate birthday = LocalDate.parse(rs.getString(4), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                int gender = rs.getInt(5);
                String identifyCard = rs.getString(6);
                String phoneNumber = rs.getString(7);
                String email = rs.getString(8);
                int customerType = rs.getInt(2);
                String address = rs.getString(9);
                customer = new Customer(pIdCustomer, name, birthday, gender, identifyCard, phoneNumber, email, customerType, address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public boolean insertCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        int rowInserted;
        try {
            PreparedStatement ps = connection.prepareCall(INSERT_CUSTOMER);
            ps.setInt(1, customer.getpId());
            ps.setInt(2, customer.getCustomerType());
            ps.setString(3, customer.getName());
            ps.setDate(4, Date.valueOf(customer.getBirthday()));
            ps.setInt(5, customer.getGender());
            ps.setString(6, customer.getIdentifyCard());
            ps.setString(7, customer.getPhoneNumber());
            ps.setString(8, customer.getEmail());
            ps.setString(9, customer.getAddress());
            rowInserted = ps.executeUpdate();
            return rowInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        int rowUpdated;
        try {
            //"set ma_loai_khach=?," +
            //            "ho_ten=?," +
            //            "ngay_sinh=?," +
            //            "gioi_tinh=?," +
            //            "so_cmnd=?," +
            //            "so_dien_thoai=?," +
            //            "email=?," +
            //            "dia_chi=? " +
            //            "where ma_khach_hang=?;";
            PreparedStatement ps = connection.prepareStatement(UPDATE_CUSTOMER);
            ps.setInt(9, customer.getpId());
            ps.setInt(1, customer.getCustomerType());
            ps.setString(2, customer.getName());
            ps.setDate(3, Date.valueOf(customer.getBirthday()));
            ps.setInt(4, customer.getGender());
            ps.setString(5, customer.getIdentifyCard());
            ps.setString(6, customer.getPhoneNumber());
            ps.setString(7, customer.getEmail());
            ps.setString(8, customer.getAddress());
            rowUpdated = ps.executeUpdate();
            return rowUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean removeCustomer(int pId) {
        int rowRemoved;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_CUSTUMER);
            ps.setInt(1, pId);
            rowRemoved = ps.executeUpdate();
            return rowRemoved > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Customer> searchByName(String name) {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(SEARCH_CUSTOMER_BY_NAME);
            ps.setString(1, "%"+name+"%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int pId = rs.getInt(1);
                String nameGet = rs.getString(3);
                LocalDate birthday = LocalDate.parse(rs.getString(4));
//                LocalDate birthday = LocalDate.parse(rs.getString(4), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                int gender = rs.getInt(5);
                String identifyCard = rs.getString(6);
                String phoneNumber = rs.getString(7);
                String email = rs.getString(8);
                int customerType = rs.getInt(2);
                String address = rs.getString(9);
//                Customer(String pId, String name, LocalDate birthday,
//                String gender, String identifyCard,
//                String phoneNumber, String email,
//                int customerType, String address)
                customerList.add(new Customer(pId, nameGet, birthday, gender, identifyCard, phoneNumber, email, customerType, address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }


}
