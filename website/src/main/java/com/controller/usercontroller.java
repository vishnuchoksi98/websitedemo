package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.productdao;
import com.DAO.userdao;
import com.bean.MailMail;
import com.bean.dashboardbean;
import com.bean.loginbean;
import com.bean.productbean;
import com.bean.userbean;

@Controller
public class usercontroller {

	@Autowired
	userdao dao;
	
	@Autowired
	productdao cusdao;
	
	@Autowired
	MailMail mail;

	@RequestMapping("/register")
	public String showform(Model m) {
		m.addAttribute("user", new userbean());
		return "userprofile/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute("user") userbean u, BindingResult result1, Model m) {
		System.out.println(result1.hasErrors());
		boolean c = result1.hasErrors();
		if (c == true) {
			System.out.println("wrong i/p");
			return "userprofile/register";
		} else {

			m.addAttribute("user", u);
			dao.registration(u);
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/register/validation")
	@ResponseBody
	public String emailvalidation(@RequestParam String email) {
		System.out.println("inside email" + email);
		boolean b = dao.getEmpByemail(email);
		String message;
		if (b == true) {
//			m.addAttribute("command", "email is already exist");
			message="email is already exist";
			return message;
		} else {
			//throw new Error("wrong");
			return "";
		}
		// return "register";
//		return "register";
		// System.out.println(list.size());
	}

	@RequestMapping("/login")
	public String showloginform(Model m,HttpSession session) {
		if(session.getAttribute("username")!=null) {
			return "redirect:/productlist";
		}else {
			m.addAttribute("login", new loginbean());
			System.out.println("login time"+session.getAttribute("username"));
			return "userprofile/login";
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@Valid @ModelAttribute("login") loginbean l, BindingResult result1, HttpServletRequest request,
			HttpSession session) {
		// m.addAttribute("login", login);
		//System.out.println("outside render"+session.getAttribute("username"));
		System.out.println(result1.hasErrors());
		boolean c = result1.hasErrors();
		if (c == true) {
			//System.out.println("inside render");
			return "userprofile/login";
		} else {
//			return "userprofile/login";
//		dao.loginvalid(l);
			boolean result = dao.loginvalid(l);
			System.out.println("inside render"+result);
			if (result) {
				session.setAttribute("username", l.getUsername());
				System.out.println("session username"+session.getAttribute("username"));
				System.out.println("l1 password:"+l.getPassword());
				System.out.println("p1 username:"+l.getUsername());
				System.out.println("p1 password:"+l.getUsertype());
				//session.setAttribute("fullname", );
				if(l.getUsertype().equals("admin")) {
					return "redirect:/adminhome";	
				}
				else {					
					return "redirect:/productlist";
				}
			} else {
				request.setAttribute("message", "wrong credential please try again");
				return "userprofile/login";
			}
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("username");
		session.invalidate();
		//System.out.println("logout"+session.getAttribute("username"));
		return "redirect:/login";
	}

	/*
	 * @RequestMapping("/login") public String showlogin(Model m) {
	 * m.addAttribute("login", new loginbean()); return "userprofile/login"; }
	 */

	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.POST) public String
	 * save( @Valid @ModelAttribute("login") loginbean l,BindingResult result1) {
	 * System.out.println(result1.hasErrors()); boolean c=result1.hasErrors();
	 * if(c==true) { System.out.println("wrong i/p"); return "userprofile/login"; }
	 * else { return "redirect:/temp"; } }
	 */
	@RequestMapping("/getcust")
	public String totalsales(Model m,HttpServletResponse response) 
	{
		List<userbean> list = dao.getCustomer();
		m.addAttribute("list", list);
		System.out.println(list.get(0).getFullname());
		//System.out.println(list);
		return "temp";
	}
	
	@RequestMapping("/forgetpassword")
	public String forgetpassword(Model m) 
	{
		m.addAttribute("forgetpassword",new loginbean());
		return "userprofile/forgetpassword";
	}
	
	@RequestMapping(value="/forgetpassword",method = RequestMethod.POST)
	public String forgetpassword(@ModelAttribute("forgetpassword") loginbean l ,Model m) 
	{
		

		//m.addAttribute("forgetemail",new loginbean().getUsername());
		System.out.println("username"+l.getUsername());
		String s=dao.getpassword(l.getUsername());
		if(s==null)
		{
			m.addAttribute("error","mail id is not matching");
			return "userprofile/forgetpassword";
		}else {
		System.out.println("mailpwd:"+s); 
		String extra="your password is: ";
		s=s.concat(extra);
		mail.sendMail("vishnuchoksi98@gmail.com", l.getUsername(), "ForgotPassword", s);
		return "userprofile/temp";
		}
	}


}
