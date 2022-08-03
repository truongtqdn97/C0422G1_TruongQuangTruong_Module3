package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {


    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =? ;";
    private static final String SELECT_ALL_USERS = "select * from users ;";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SELECT_USER_BY_COUNTRY = "select * from users where country like ? ;";
    private static final String SELECT_ALL_SORT_BY_NAME = "select * from users order by `name`;";

    private static final String DISPLAY_USERS_LIST = "call display_users_list(); ";//bt1 ss13
    private static final String UPDATE_USERS_SQL_SP = "call edit_users_info(?,?,?,?);";//bt1 ss13
    private static final String DELETE_USERS_SQL_SP = "call delete_users(?);";//bt1 ss13


    private static final String INSERT_USERS_SQL_ID = "INSERT INTO users (id, name, email, country) VALUES (?, ?, ?, ?);";//bt2 ss13
    private static final String INSERT_USER_PERMISSION_SQL = "INSERT INTO user_permision(user_id,permision_id) "
            + "VALUES(?,?)";//bt2 ss13



    @Override
    public void insertUser(User user) throws SQLException {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        int rowDeleted;
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(DELETE_USERS_SQL);
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate();
            return rowDeleted > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        int rowUpdated;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());

            rowUpdated = statement.executeUpdate();
            return rowUpdated > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    @Override
    public List<User> searchByCountry(String country) {
        List<User> users = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(SELECT_USER_BY_COUNTRY);
            preparedStatement.setString(1, "%" + country + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country1 = resultSet.getString("country");
                users.add(new User(id, name, email, country1));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public List<User> sortByName() {
        List<User> users = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_SORT_BY_NAME);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public List<User> displayUsersList() {
        List<User> users = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        CallableStatement callableStatement;
        try {
            callableStatement = connection.prepareCall(DISPLAY_USERS_LIST);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;


    }

    @Override
    public boolean updateUser_SP(User user) {
        int rowUpdated;
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement cs = connection.prepareCall(UPDATE_USERS_SQL_SP);
            cs.setInt(1, user.getId());
            cs.setString(2, user.getName());
            cs.setString(3, user.getEmail());
            cs.setString(4, user.getCountry());

            rowUpdated = cs.executeUpdate();
            return rowUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteUser_SP(int id) {
        int rowDeleted;
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement cs = connection.prepareCall(DELETE_USERS_SQL_SP);
            cs.setInt(1, id);
            rowDeleted = cs.executeUpdate();
            return rowDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void addUserTransaction(User user, int[] permisions) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        PreparedStatement pstmtAssignment = null;
        ResultSet rs = null;
        try {
            conn = BaseRepository.getConnectDB();
            conn.setAutoCommit(false);
            pstmt = conn.prepareStatement(INSERT_USERS_SQL_ID, Statement.RETURN_GENERATED_KEYS);
            pstmt.setInt(1, user.getId());//bt 2 ss13 neu sai insert user permission ko them moi
            pstmt.setString(2, user.getName());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getCountry());

            int rowAffected = pstmt.executeUpdate();
            rs = pstmt.getGeneratedKeys();
            int userId = 0;
            if (rs.next()) userId = rs.getInt(1);
            if (rowAffected == 1) {
                pstmtAssignment = conn.prepareStatement(INSERT_USER_PERMISSION_SQL);
                for (int permisionId : permisions) {
                    pstmtAssignment.setInt(1, userId);
                    pstmtAssignment.setInt(2, permisionId);
                    pstmtAssignment.executeUpdate();
                }
                conn.commit();
            } else {
                conn.rollback();
            }
        } catch (SQLException ex) {
            try {
                if (conn != null)
                    conn.rollback();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (pstmtAssignment != null) pstmtAssignment.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
