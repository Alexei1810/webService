package service;

import models.User;

public class ValidationClass {
    public boolean notNull(User user){
        if(!user.getName().equals(null)&&!user.getPassword().equals(null)){
            return true;
        }else {
            return false;
        }
    }
}
