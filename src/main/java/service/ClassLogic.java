package service;


import dao.DAOImpl;
import models.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ClassLogic {
    DAOImpl hibernateDAO = new DAOImpl();
    Scanner scanner = new Scanner(System.in);

    public User toMyPage(User user) {
        User userInfo = new User();
        if (login(user)) {
            userInfo = getInfo(user.getName());
        }
        return userInfo;
    }

    public boolean login(User user) {
        boolean flag = false;
        List<User> users = hibernateDAO.selectAll();
        for (int i = 0; i < users.size(); i++) {
            if (user.getName().equals(users.get(i).getName()) &&
                    user.getPassword().equals(users.get(i).getPassword())) {
                flag = true;
            }
        }
        return flag;

    }

    public User getInfo(String name) {
        List<User> users = hibernateDAO.selectAll();
        User user = new User();
        for (int i = 0; i < users.size(); i++) {
            if (name.equals(users.get(i).getName())) {
                user = users.get(i);
                break;
            }
        }
        return user;

    }

    public boolean createUser(User user) {
        boolean flag = false;
        flag = true;
        List<User> users = hibernateDAO.selectAll();
        for (int i = 0; i < users.size(); i++) {
            if (user.getName().equals(users.get(i).getName())) {
                flag = false;
                break;
            }
        }
        if (flag) {
            hibernateDAO.create(user);
        }
        return flag;

    }

    public List<User> showUsers() {
        List<User> users = hibernateDAO.selectAll();
        return users;

    }

    public void updateUser(User user) {
        hibernateDAO.update(user);

    }

    public void deleteUser(int id) {
        User user = new User();
        user.setId(id);
        hibernateDAO.delete(user);

    }
}
