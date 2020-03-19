package dao;

import models.User;

import java.util.List;

public interface DAO {
    User selectOne(int id);

    List<User> selectAll();

    void create(User user);

    void update(User user);

    void delete(User user);
}

