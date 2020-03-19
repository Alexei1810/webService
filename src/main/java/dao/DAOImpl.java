package dao;

import models.User;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateSessionFactory;

import java.util.List;

public class DAOImpl implements DAO {
    @Override
    public User selectOne(int id) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        User user = session.get(User.class, id);
        session.close();
        return user;
    }

    @Override
    public List<User> selectAll() {
        List<User> users = (List<User>) HibernateSessionFactory.getSessionFactory().openSession().
                createQuery("from User").list();
        return users;
    }

    @Override
    public void create(User user) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(user);
        transaction.commit();
        session.close();
    }

    @Override
    public void update(User user) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(user);
        transaction.commit();
        session.close();
    }

    @Override
    public void delete(User user) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(user);
        transaction.commit();
        session.close();
    }
}
