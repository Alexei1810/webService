package controller;

import models.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.ClassLogic;
import service.ValidationClass;

import java.util.ResourceBundle;

@Controller
public class ControllerClass {
    ClassLogic service = new ClassLogic();
    ValidationClass valid=new ValidationClass();
    //Enter
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String enter() {
        return "enter";
    }

    @RequestMapping(value = "servletEnter", method = RequestMethod.GET)
    public String enterGet() {
        return "enter";
    }

    //ServletEnterLogin
    @RequestMapping(value = "servletLogin", method = RequestMethod.GET)
    public String loginGet() {
        return "login";
    }

    @RequestMapping(value = "servletLogin", method = RequestMethod.POST)
    public String loginPost(Model model, @RequestParam("name") String name,
                            @RequestParam("password") String password) {
        User user = new User(name, password);
        User info = service.toMyPage(user);
        if (info.getId() != 0) {
            model.addAttribute("user", info);
            return "userPage";
        } else {
            model.addAttribute("message", "Неверные данные!");
            return "login";
        }
    }

    //ServletEnterRegistration
    @RequestMapping(value = "servletRegistration", method = RequestMethod.GET)
    public String registrationGet() {
        return "registration";
    }

    @RequestMapping(value = "servletRegistration", method = RequestMethod.POST)
    public String registrationPost(Model model, @RequestParam("name") String name,
                                   @RequestParam("password") String password) {
        User user = new User(name, password);
        if(valid.notNull(user)) {
            user.setRole("user");
            boolean flag = service.createUser(user);
            if (flag) {
                return "login";
            } else {
                model.addAttribute("message", "Такой логин занят");
                return "registration";
            }
        }else{
            model.addAttribute("message", "Неверный запрос");
            return "registration";
            }
        }

    //ServletDelete
    @RequestMapping(value = "servletDelete", method = RequestMethod.GET)
    public String deleteGet(Model model, int id, @RequestParam("name") String name,
                            @RequestParam("password") String password) {
        model.addAttribute("id", id);
        model.addAttribute("name", name);
        model.addAttribute("password", password);
        return "deleteUser";
    }

    @RequestMapping(value = "servletDelete", method = RequestMethod.POST)
    public String deletePost(@RequestParam("id") int id) {
        service.deleteUser(id);
        return "enter";
    }

    //ServletUpdate
    @RequestMapping(value = "servletUpdate", method = RequestMethod.GET)
    public String updateGet(Model model, @RequestParam("id") int id, @RequestParam("name") String name,
                            @RequestParam("password") String password, @RequestParam("firstname") String firstname,
                            @RequestParam("lastname") String lastname,@RequestParam("gender") String gender,
                            @RequestParam("city") String city, @RequestParam("role") String role) {
        model.addAttribute("id", id);
        model.addAttribute("name", name);
        model.addAttribute("password", password);
        model.addAttribute("firstname", firstname);
        model.addAttribute("lastname", lastname);
        model.addAttribute("gender", gender);
        model.addAttribute("city", city);
        model.addAttribute("role", role);
        return "updateUser";
    }

    @RequestMapping(value = "servletUpdate", method = RequestMethod.POST)
    public String updatePost(Model model, @RequestParam("id") int id, @RequestParam("name") String name,
                             @RequestParam("password") String password, @RequestParam("firstname") String firstname,
                             @RequestParam("lastname") String lastname, @RequestParam("gender") String gender,
                             @RequestParam("city") String city, @RequestParam("role") String role) {
        User user = new User();
        user.setId(id);
        user.setName(name);
        user.setPassword(password);
        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setGender(gender);
        user.setCity(city);
        user.setRole(role);
        service.updateUser(user);
        User info = service.toMyPage(user);
        model.addAttribute("user", info);
        return "userPage";
    }

    @RequestMapping(value = "servletGetAll", method = RequestMethod.GET)
    public String getAllGet(Model model, @RequestParam("name") String name,
                            @RequestParam("password") String password) {
        model.addAttribute("users", service.showUsers());
        model.addAttribute("name", name);
        model.addAttribute("password", password);
        return "getAll";
    }

    @RequestMapping(value = "servletGetAll", method = RequestMethod.POST)
    public String getAllPost(Model model, @RequestParam("login") String login,
                             @RequestParam("pass") String pass, @RequestParam("role") String role,
                             @RequestParam("name") String name, @RequestParam("password") String password) {
        User user = new User();
        user.setName(login);
        user.setPassword(pass);
        user.setRole(role);
        boolean flag = service.createUser(user);
        if (flag) {
            model.addAttribute("name", name);
            model.addAttribute("password", password);
            model.addAttribute("users", service.showUsers());
            return "getAll";
        } else {
            model.addAttribute("name", name);
            model.addAttribute("password", password);
            model.addAttribute("message", "Такой логин занят");
            return "createUser";
        }

    }

    @RequestMapping(value = "servletGetAllCreate", method = RequestMethod.GET)
    public String getAllCreateGet(Model model, @RequestParam("name") String name,
                                  @RequestParam("password") String password) {
        model.addAttribute("name", name);
        model.addAttribute("password", password);
        return "createUser";
    }

    @RequestMapping(value = "getAllDelete", method = RequestMethod.POST)
    public String getAllDelete(Model model, @RequestParam("name") String name,
                               @RequestParam("password") String password,
                               @RequestParam("id") int id) {
        model.addAttribute("name", name);
        model.addAttribute("password", password);
        service.deleteUser(id);
        model.addAttribute("users", service.showUsers());
        return "getAll";
    }
    @RequestMapping(value = "servletAdminUpdate", method = RequestMethod.GET)
    public String updateAdminGet(Model model,@RequestParam("adminName") String adminName,
                                  @RequestParam("adminPassword") String adminPassword,
                                  @RequestParam("id") int id, @RequestParam("name") String name,
                                  @RequestParam("password") String password,
                                 @RequestParam("firstname") String firstname,
                                  @RequestParam("lastname") String lastname, @RequestParam("gender") String gender,
                                  @RequestParam("city") String city, @RequestParam("role") String role) {
        model.addAttribute("id", id);
        model.addAttribute("name", name);
        model.addAttribute("password", password);
        model.addAttribute("firstname", firstname);
        model.addAttribute("lastname", lastname);
        model.addAttribute("gender", gender);
        model.addAttribute("city", city);
        model.addAttribute("role", role);
        model.addAttribute("adminName", adminName);
        model.addAttribute("adminPassword", adminPassword);
        return "tableShowInf";
    }
    @RequestMapping(value = "servletAdminUpdate", method = RequestMethod.POST)
    public String updateAdminPost(Model model,@RequestParam("adminName") String adminName,
                                  @RequestParam("adminPassword") String adminPassword,
                                  @RequestParam("id") int id, @RequestParam("name") String name,
                             @RequestParam("password") String password, @RequestParam("firstname") String firstname,
                             @RequestParam("lastname") String lastname, @RequestParam("gender") String gender,
                             @RequestParam("city") String city, @RequestParam("role") String role) {
        User user=new User();
        user.setId(id);
        user.setName(name);
        user.setPassword(password);
        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setGender(gender);
        user.setCity(city);
        user.setRole(role);
        service.updateUser(user);
        model.addAttribute("users", service.showUsers());
        model.addAttribute("name", adminName);
        model.addAttribute("password", adminPassword);
        return "getAll";
    }

}
