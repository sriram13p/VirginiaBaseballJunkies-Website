package com.bezkoder.springjwt.controllers;

import com.bezkoder.springjwt.models.Child;
import com.bezkoder.springjwt.security.services.UserDetailsImpl;
import com.bezkoder.springjwt.security.services.UserDetailsServiceImpl;
import com.bezkoder.springjwt.service.ChildService;
import com.google.gson.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private ChildService childService;

    @RequestMapping("/")
    public String index(){
        return "index";
    }


    @GetMapping("/signin")
    public String signin(){ return "login"; }

    @GetMapping("/signup")
    public String signup(){ return "register"; }

    @GetMapping("/dashboard")
    public ModelAndView adminProfile() {
        ModelAndView modelAndView=new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (auth.getAuthorities().stream().anyMatch(role -> role.getAuthority().equals("ROLE_ADMIN"))) {
            modelAndView.setViewName("adminDashboard");
            return modelAndView;
        }
        if(auth.getAuthorities().stream().anyMatch(role -> role.getAuthority().equals("ROLE_USER"))){
            UserDetailsImpl userDetails = (UserDetailsImpl) auth.getPrincipal();
            Long userID = userDetails.getId();
            List<Child> children=childService.getChildren(userID);
            Gson gson1 = new Gson();
            String json = gson1.toJson(children);


            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            JsonArray jsonArray = JsonParser.parseString(json).getAsJsonArray();

            for (JsonElement element : jsonArray) {
                JsonObject userObject = element.getAsJsonObject().getAsJsonObject("user");
                if (userObject != null) {
                    userObject.addProperty("password", "");
                }
            }

            String updatedJsonString = gson.toJson(jsonArray);

            modelAndView.setViewName("userDashboard");
            modelAndView.addObject("children", updatedJsonString);
            return modelAndView;
        }
        modelAndView.setViewName("index");
        return modelAndView;
    }

//    @RequestMapping("/register")
//    public String register(){
//        return "register";
//    }


}
