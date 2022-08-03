package dao;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> selectAllUsers();

    boolean deleteUser(int id) throws SQLException;

    boolean updateUser(User user) throws SQLException;

    User getUserById(int id);//th1

    void insertUserStore(User user) throws SQLException;//th1

    void addUserTransaction(User user, int[] permisions);//th2

    void insertUpdateWithoutTransaction();//th3

    void insertUpdateUseTransaction();//th4

}
