package com.eaccid.spring.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class OffersController {

    @RequestMapping("/")
    public String showHome(Model model) {
        model.addAttribute("nameBold", "<b>Tiffany</b>");
        model.addAttribute("name", "<b>Tiffany</b>");
        return "home";
    }

   /*
    public ModelAndView showHome() {
        ModelAndView mv = new ModelAndView("home");
        Map<String, Object> model = mv.getModel();
        model.put("name", "<b>River</b>");
        return mv;
    }

    public String showHome(HttpSession session) {
        session.setAttribute("name", "Boris");
        return "home";
    }


    public String showHome(Model model) {
        model.addAttribute("name", "Tiffany");
        return "home";
    }
*/


}
