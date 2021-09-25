package com.farris.artists.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.farris.artists.models.LoginUser;
import com.farris.artists.models.User;
import com.farris.artists.models.Work;
import com.farris.artists.services.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
    
    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "loginpage.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        userService.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "loginpage.jsp";
        }
        session.setAttribute("user_id", newUser.getId());
        session.setAttribute("user", newUser.getFirstName());
        return "redirect:/works";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        User user = userService.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "loginpage.jsp";
        }
        session.setAttribute("user_id", user.getId());
        session.setAttribute("user", user.getFirstName());
        return "redirect:/works";
    }
    
    @GetMapping("/works")
    public String index(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
    	Long UserId = (Long)session.getAttribute("user_id");
		if(UserId == null) {
			redirectAttributes.addFlashAttribute("notAllowed","You must log in first!");
			return "redirect:/";
		}
        User user = userService.findUserById(UserId);
        List<Work> uWk = user.getWorks();
        model.addAttribute("list",uWk);
        
        model.addAttribute("user", session.getAttribute("user"));
        String question = null;
        List<Work> all = userService.allLikes();
        List<User> users = userService.allUsers();
        model.addAttribute("users", users);
        model.addAttribute("question", question);
        model.addAttribute("works", all);
        return "dashboard.jsp";
    
    }
    
    @GetMapping("/likes/{id}")
    public String likeWork(@PathVariable("id") Long id, Model model, HttpSession session) {
    	
    	userService.createRelationship(id, (Long) session.getAttribute("user_id"));
    	List<Work> all = userService.allLikes();
        model.addAttribute("works", all);
        model.addAttribute("session", session.getAttribute("user_id"));
        List<User> users = userService.allUsers();
        model.addAttribute("users", users);
        return "redirect:/works";
    
    }
    
    @GetMapping("/unlikes/{id}")
    public String unlikeWork(@PathVariable("id") Long id, Model model, HttpSession session) {
    	userService.removeRelationship(id, (Long) session.getAttribute("user_id"));
    	List<Work> all = userService.allLikes();
        model.addAttribute("works", all);
        model.addAttribute("session", session.getAttribute("user_id"));
        List<User> users = userService.allUsers();
        model.addAttribute("users", users);
        return "redirect:/works";
    
    }
    
    @GetMapping("/works/new")
    public String workNew(@ModelAttribute("newWork") Work newWork, HttpSession session, RedirectAttributes redirectAttributes) {
    	Long UserId = (Long)session.getAttribute("user_id");
		if(UserId == null) {
			redirectAttributes.addFlashAttribute("notAllowed","You must log in first!");
			return "redirect:/";
		}
        return "newartwork.jsp";
    
    }
    
    @PostMapping("/works/create")
    public String workCreate(@Valid @ModelAttribute("newWork") Work newWork, BindingResult result, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			return "newartwork.jsp";
		}
        model.addAttribute("user_id", session.getAttribute("user_id"));
        userService.createWork(newWork);
        return "redirect:/works";
    
    }
    
    @GetMapping("/works/{id}")
    public String workIdea(@PathVariable("id") Long id, Model model, HttpSession session) {
    	Work work = userService.findWorkbyId(id);
    	User user = userService.findUserById(work.getCreator());
    	List<User> liked = work.getUsers();
    	model.addAttribute("work", work);
    	model.addAttribute("users", liked);
    	model.addAttribute("user", user.getFirstName());
    	model.addAttribute("session", session.getAttribute("user_id"));
        return "viewpage.jsp";
    
    }
    
    @GetMapping("/works/{id}/edit")
    public String editpage(@PathVariable("id") Long id, @ModelAttribute("editWork") Work editWork, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
    	Long UserId = (Long)session.getAttribute("user_id");
    	Work work = userService.findWorkbyId(id);
		if(UserId != work.getCreator()) {
			redirectAttributes.addFlashAttribute("notAllowed","You do not have access to this page.");
			return "redirect:/works";
		}
    	model.addAttribute("work", work);
    	model.addAttribute("user_id", session.getAttribute("user_id"));
        return "editpage.jsp";
    
    }
    
    @PostMapping("/works/{id}/update")
    public String editWork(@PathVariable("id") Long id, @Valid @ModelAttribute("editWork") Work editWork, BindingResult result, Model model, HttpSession session) {
		if (result.hasErrors()) {
			Work work = userService.findWorkbyId(id);
	    	model.addAttribute("work", work);
			return "editpage.jsp";
		}
        model.addAttribute("user_id", session.getAttribute("user_id"));
        userService.updateWork(editWork);
        return "redirect:/works";
    
    }
    
    @GetMapping("/search/{work}")
	public String searchPage(@RequestParam("work") String work, Model model) {
		List<Work> search = userService.allWorksName(work);
		model.addAttribute("work", work);
		model.addAttribute("search", search);
		return "search.jsp";
	}
		
	@PostMapping("/search")
	public String search(@RequestParam("work") String work, Model model) {
		List<Work> search = userService.allWorksName(work);
		model.addAttribute("work", work);
		model.addAttribute("search", search);
		List<User> users = userService.allUsers();
        model.addAttribute("users", users);
		return "search.jsp";
	}
    
    @RequestMapping("/delete/{id}")
 	public String deleteWork(@PathVariable("id") Long id) {
 			userService.deleteWork(id);
 			return "redirect:/works";
    }
    
    @RequestMapping("/logout")
 	public String logout(HttpSession session) {
 			session.invalidate();
 			return "redirect:/";
    }
    
    
}
