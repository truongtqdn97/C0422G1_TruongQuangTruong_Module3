package service;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> selectAllUsers();

    boolean deleteUser(int id) throws SQLException;

    boolean updateUser(User user) throws SQLException;

    List<User> searchByCountry(String country);

    List<User> sortByName();

    List<User> displayUsersList();//bt1 ss13

    boolean updateUser_SP(User user);//bt1 ss13

    boolean deleteUser_SP(int id);//bt1 ss13

}
