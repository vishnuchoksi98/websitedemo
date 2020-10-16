package com.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.productdao;
import com.bean.cartbean;
import com.bean.dashboardbean;
import com.bean.imagetry;
import com.bean.loginbean;
import com.bean.productbean;
import com.bean.purchasebean;
import com.bean.userbean;

@Controller
public class controller {
	
	
	@Autowired
	productdao dao;
	 
	

	@RequestMapping("/addproduct")
	public String showform(Model m,HttpSession session) {
		System.out.println(session.getAttribute("username"));
		if(session.getAttribute("username")==null) {
			return "redirect:/login";
		}else {
		m.addAttribute("command", new productbean());
		return "addproduct";
		}
	} 

	@RequestMapping("/header")
	public String showHeader() {
		return "header";
	}
	
	@RequestMapping("/imgtry")
	public String imgcheck() {
		return "imgtry";
	}
	
	/*@RequestMapping(value = "/doUpload", method = RequestMethod.POST)
	public String uploadtry(@ModelAttribute("img") imagetry img,@RequestParam MultipartFile file, Model m) {
		try {
			dao.imagetry(file);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/viewlist";
	}*/
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("emp") productbean emp,@RequestParam MultipartFile file,HttpSession session,Model m) throws IOException {
		System.out.println("filename:"+file.getName());
		String path=session.getServletContext().getRealPath("/");  
        String filename=file.getOriginalFilename();
        emp.setFilename(filename);
        dao.save(emp,file);
        System.out.println("id:"+emp.getProId());		
		return "redirect:/viewlist"; // will redirect to viewlist request mapping
	}
	
	@RequestMapping(value = "/getStudentPhoto/{id}", method = RequestMethod.GET)
	public void getStudentPhoto(HttpServletResponse response, @PathVariable("id") int id,HttpSession session) throws SQLException, IOException {
		response.setContentType("image/jpeg,image/jpg,image/png");
		Blob ph=dao.getPhotoById(id);
		byte[] bytes = ph.getBytes(1, (int) ph.length());
		InputStream inputStream = new ByteArrayInputStream(bytes);
		IOUtils.copy(inputStream, response.getOutputStream());
		System.out.println("ph length"+ph.length()+"ph string"+ph.toString());

	}
	@RequestMapping("/viewlist")
	public String viewemp(Model m) {
		List<productbean> list = dao.getEmployees();
		m.addAttribute("list", list);
		//System.out.println(list);
		return "view";
	}

	/*
	 * @RequestMapping("/viewlist/{id}") public String perticularview(@PathVariable
	 * int id,Model m) { productbean emp = dao.getEmpById(id);
	 * m.addAttribute("command", emp); System.out.println(id); return "view"; }
	 */

	@RequestMapping(value = "/editemp/{id}")
	public String edit(@PathVariable int id, Model m) {
		productbean emp = dao.getEmpById(id);
		m.addAttribute("command", emp);
		System.out.println(id);
		return "editform";
	}

	@RequestMapping(value = "/editsave", method = RequestMethod.POST)
	public String editsave(@ModelAttribute("emp") productbean emp) {
		System.out.println("in controller" + emp.getCategory());
		dao.update(emp);
		return "redirect:/viewlist";
	}

	@RequestMapping(value = "/deleteemp/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id) {
		dao.delete(id);
		return "redirect:/viewlist";
	}

//	@RequestMapping(value = "/temp")
//	public String temp() {
//		
//		return "temp";
//	}

	@RequestMapping(value = "/rings/{id}")
	public String viewproduct(@PathVariable int id, Model m) {
		productbean emp = dao.getEmpById(id);
		m.addAttribute("command", emp);
		System.out.println(emp.getName());
		return "rings";
	}
//
//	@RequestMapping(value = "/rings")
//	public String temp1() {
//		return "rings";
//	}
	@RequestMapping(value = "/productlist")
	public String productlist() {
		return "productlist";
	}

	@RequestMapping(value = {"/productlist","/{page}"})
	public String render(@RequestParam(required = false)Integer page,Model m,HttpSession session) {
		System.out.println(session.getAttribute("username"));
		if(session.getAttribute("username")==null) {
			return "redirect:/login";
		}else {
			List<productbean> list = dao.getEmployees();
			m.addAttribute("list", list);
			//System.out.println("stock of list:"+list.get(2).getStock());
			
	        PagedListHolder<productbean> pagedListHolder = new PagedListHolder<productbean>(list);
	        pagedListHolder.setPageSize(8);
	        m.addAttribute("maxpage",pagedListHolder.getPageCount());
            System.out.println("page count:"+pagedListHolder.getPageCount());
	        if(page==null || page < 1 || page > pagedListHolder.getPageCount()) 
	        {
		        page=1;
	            System.out.println("page in side null:"+page);
            }
	       // m.addAttribute("page",page);
	        /*if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
	            pagedListHolder.setPage(0);
	            page=0;
	            System.out.println("page in side zeero:"+page);
	            //page=0;
	          //  modelAndView.addObject("users", pagedListHolder.getPageList());
	        }
	        else */if(page <= pagedListHolder.getPageCount()) {
	        	System.out.println("inside page setting func");
	            pagedListHolder.setPage(page-1);
	            //page=page-1;
	            System.out.println("page :"+page);
	            //modelAndView.addObject("users", pagedListHolder.getPageList());
	        }
	        m.addAttribute("page",page);
	        System.out.println("page :"+page);
	        list = dao.getSelectedEmployee((pagedListHolder.getPage()*8), 8);
			m.addAttribute("list", list);
			
			//System.out.println(list.get(17).getData());
			//System.out.println(list.get(17).getName());
			return "productlist";
		}
	}

	
	@RequestMapping(value = "/productdesc/{id}")
	public ModelAndView renderpdescid(@PathVariable int id, Model m) {
		ModelAndView mv = new ModelAndView("productdesc");
		System.out.println("before id test:"+id);
		productbean emp = dao.getEmpById(id);
		System.out.println("id test:"+emp.getProId());
		System.out.println("stock test:"+emp.getStock());
		if(emp.getStock()<=0) {
			//m.addAttribute("productstock", "Product is currently out of stock.");
			mv.addObject("productstock", "Product is currently out of stock.");

		}
		else {
			System.out.println("stock is not less then 0.");
			mv.addObject("productstock",null);
		}
		m.addAttribute("command", emp);
		return mv;
	}

	@RequestMapping(value = "/productdesc")
	public String renderpdesc() {
		return "productdesc";
	}

	@RequestMapping(value = "/productlist/{category}")
	@ResponseBody
	public  ResponseEntity<List<productbean>> listing(@PathVariable String category,Model m) {
		//ModelAndView mv = new ModelAndView("productlist");
		System.out.println("inside category");
		List<productbean> list = dao.getSelectedData(category);
		m.addAttribute("list", list);
		return new ResponseEntity<List<productbean>>(list, HttpStatus.OK);

		//mv.addObject("process","abcd");
		//return mv;
		/*
		 * System.out.println("in category list method'"+category+"'"); productbean emp
		 * = dao.getSelectedData(category); m.addAttribute("command", emp);
		 * System.out.println(emp.getPrice()); return "productlist";
		 */
	}
	
	/*@RequestMapping("/purchase/{id}")
	public String purchase(Model m ,@PathVariable int id,HttpSession session) {
		//m.addAttribute("login", new loginbean());
		productbean emp = dao.getEmpById(id);
		String username= (String) session.getAttribute("username");
		userbean user= dao.getcust(username);
		m.addAttribute("command", emp);
		m.addAttribute("data",user);
		dao.purchaseentry(emp, user);
		return "/purchase";
	}*/
	
	@RequestMapping("/purchaserecord")
	public String purchasedetail(Model m) {
		List<purchasebean> list = dao.getPurchasedata();
		m.addAttribute("list", list);
		//System.out.println(list);
		return "purchaserecord";
	}
//	@RequestMapping("/cart")
//	public String cart(Model m,HttpSession session) {
//		String username= (String) session.getAttribute("username");
//		List<purchasebean> list = dao.getSelectedPurchasedata(username);
//		m.addAttribute("list", list);
//		return "shoppingcart";
//	}
	
	@RequestMapping("/cart/{id}")
	public String cart(Model m ,@PathVariable int id,HttpSession session) {
		System.out.println("welcome to cart method");
		String username= (String) session.getAttribute("username");
		
		productbean pbean=dao.getEmpById(id);
		if (session.getAttribute("cart") == null) 
		{
			List<cartbean> cart = new ArrayList<cartbean>();
			cart.add(new cartbean(1,pbean));
			session.setAttribute("cart", cart);
			
		}
		else
		{
			List<cartbean> cart = (List<cartbean>) session.getAttribute("cart");
			cart.add(new cartbean(1,pbean));
			for (int counter = 0; counter < cart.size(); counter++) { 		      
				System.out.println("data:"+cart.size());
		          System.out.println(cart.get(counter));
		      }
			//int index = this.exists(id, list);

			session.setAttribute("cart", cart);
		}
		//m.addAttribute("list", list);
		return "redirect:/shoppingcart";
	}
	
	/*@RequestMapping(value="/incrementproduct",method=RequestMethod.GET)
	@ResponseBody
	public  int incrementvalue(@RequestParam String id,HttpSession session) {
		
		List<cartbean> cart = (List<cartbean>) session.getAttribute("cart");
		int index = this.exists(id, cart);
		int quantity=cart.get(index).getQuantity();
		quantity++;
		int price = cart.get(index).getPbean().getPrice();
		price=price*quantity;
		System.out.println("quantity:"+quantity);
		System.out.println("price"+price);
		cart.get(index).getPbean().setPrice(price);
		cart.get(index).setQuantity(quantity);
		System.out.println("new quantiy:"+cart.get(index).getQuantity());
		session.setAttribute("cart", cart);
		return quantity;
	}*/
	@RequestMapping(value="/incrementproduct/{id}",method=RequestMethod.GET)
	public String incrementvalue(@PathVariable("id") String id,HttpSession session) {
		List<cartbean> cart = (List<cartbean>) session.getAttribute("cart");
		int index = this.exists(id, cart);
		int quantity=cart.get(index).getQuantity();
		quantity++;
		int price = cart.get(index).getPbean().getPrice();
		int finalprice;
		//finalprice=price*quantity;
		System.out.println("quantity:"+quantity);
		System.out.println("price"+price);
		//cart.get(index).getPbean().setPrice(price);
		cart.get(index).setQuantity(quantity);
		//System.out.println("finalprice:"+finalprice);
		System.out.println("new quantiy:"+cart.get(index).getQuantity());
		session.setAttribute("cart", cart);
		
		return "redirect:/shoppingcart";
	}
	
	@RequestMapping(value="/decrementproduct/{id}",method=RequestMethod.GET)
	public String decrementvalue(@PathVariable("id") String id,HttpSession session) {
		List<cartbean> cart = (List<cartbean>) session.getAttribute("cart");
		int index = this.exists(id, cart);
		int quantity=cart.get(index).getQuantity();
		quantity--;
		if(quantity==0)
		{
			quantity=1;
		}
		int price = cart.get(index).getPbean().getPrice();
		int finalprice;
		//finalprice=price*quantity;
		System.out.println("quantity:"+quantity);
		System.out.println("price"+price);
		//cart.get(index).getPbean().setPrice(price);
		cart.get(index).setQuantity(quantity);
		//System.out.println("finalprice:"+finalprice);
		System.out.println("new quantiy:"+cart.get(index).getQuantity());
		session.setAttribute("cart", cart);
		
		return "redirect:/shoppingcart";
	}
//	@RequestMapping("/cart")
//	public String cart(Model m ,HttpSession session) {
//		//m.addAttribute("login", new loginbean());
//		//productbean emp = dao.getEmpById(id);
//		String username= (String) session.getAttribute("username");
//		userbean user= dao.getcartdetail(username);
//		m.addAttribute("command", emp);
//		m.addAttribute("data",user);
//		dao.purchaseentry(emp, user);
//		return "/purchase";
//	}
	
	@RequestMapping(value = "/removeitem/{id}", method = RequestMethod.GET)
	public String remove(@PathVariable("id") String id, HttpSession session) {
		//cartbean cartbean = new cartbean();
		List<cartbean> cart = (List<cartbean>) session.getAttribute("cart");
		//int index = Integer.parseInt(id);
		int index = this.exists(id, cart);
		System.out.println("quantity:"+cart.get(index).getQuantity());
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "redirect:/shoppingcart";
	}
	
	private int exists(String id, List<cartbean> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getPbean().getProId()==(Integer.parseInt(id))) {
				return i;
			}
		}
		return -1;
	}
	@RequestMapping(value="/finalpurchase",method=RequestMethod.GET)
	public String finalpurchase(HttpSession session,Model m) {
		List<cartbean> cart = (List<cartbean>) session.getAttribute("cart");
		String username= (String) session.getAttribute("username");
		userbean user= dao.getcust(username);
		for (int counter = 0; counter < cart.size(); counter++) {
			dao.purchaseentry(cart, user,counter);
			System.out.println("data:"+cart.size());
	        System.out.println(cart.get(counter));
	        System.out.println("Name again:"+cart.get(counter).getPbean().getProId());
	      }
		cart.clear();
		return "redirect:/purchaserecord";
	}
	@RequestMapping("/shoppingcart")
	public String shoppingcart() 
	{
		return "shoppingcart";
	}
	
	@RequestMapping("/totalsales")
	public String totalsales(Model m,HttpServletResponse response) 
	{
		List<dashboardbean> list = dao.getTotalbills();
		m.addAttribute("list", list);
		System.out.println(list.get(0).getFullname());
		//System.out.println(list);
		return "totalbills";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard() 
	{
		return "dashboard";
	}
	
}
