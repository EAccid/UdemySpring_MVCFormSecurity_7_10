package com.eaccid.spring.web.controllers;

import com.eaccid.spring.web.dao.FormValidationGroup;
import com.eaccid.spring.web.dao.Message;
import com.eaccid.spring.web.dao.User;
import com.eaccid.spring.web.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LoginController {

    private UsersService usersService;

//    @Autowired
//    private MailSender mailSender;

    @Autowired
    public void setUsersService(UsersService usersService) {
        this.usersService = usersService;
    }

    @RequestMapping("/login")
    public String showLogin() {
        return "login";
    }

    @RequestMapping("/denied")
    public String showDenied() {
        return "denied";
    }

    @RequestMapping("/messages")
    public String showMessages() {
        return "messages";
    }

    @RequestMapping("/admin")
    public String showAdmin(Model model) {

        List<User> users = usersService.getAllUsers();
        model.addAttribute("users", users);

        return "admin";
    }

    @RequestMapping("/loggedout")
    public String showLoggedOut() {
        return "loggedout";
    }

    @RequestMapping("/logout")
    public String logoutUrl() {
        return "logout";
    }

    @RequestMapping("/newaccount")
    public String showNewAccount(Model model) {

        model.addAttribute("user", new User());

        return "newaccount";
    }

    @RequestMapping(value = "/createaccount", method = RequestMethod.POST)
    public String createAccount(@Validated(FormValidationGroup.class) User user, BindingResult result) {

        if (result.hasErrors()) {
            return "newaccount";
        }

        user.setAuthority("ROLE_USER");
        user.setEnabled(true);

        if (usersService.exists(user.getUsername())) {
            System.out.println("Caught duplicate username");
            result.rejectValue("username", "DuplicateKey.user.username");
            return "newaccount";
        }

        try {
            usersService.create(user);
        } catch (DuplicateKeyException e) {
            result.rejectValue("username", "DuplicateKey.user.username");
            return "newaccount";
        }

        return "accountcreated";
    }

    @RequestMapping(value = "/getmessages", method = RequestMethod.GET, produces = "application/json")
    public
    @ResponseBody
    Map<String, Object> getMessages(Principal principal) {

        List<Message> messages;
        if (principal == null) {
            messages = new ArrayList<>();
        } else {
            String username = principal.getName();
            messages = usersService.getMessages(username);

        }
        Map<String, Object> data = new HashMap<>();
        data.put("messages", messages);
        data.put("number", messages.size());

        return data;
    }
}