package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.admindao;
import com.DAO.userdao;
import com.bean.adduserbean;
import com.bean.dashboardbean;
import com.bean.productbean;
import com.bean.userbean;
import com.utility.UserExcelView;

@Controller()
public class admincontroller {

		@Autowired
		admindao dao;
		
		@Autowired
		userdao udao;
		
		@RequestMapping("/adminhome")
		public String adminhome(@ModelAttribute("addusers") adduserbean addusers,Model m) {
			System.out.println("inside admin :");
			m.addAttribute("addusers", addusers );
			List<userbean> list = udao.getCustomer();
			m.addAttribute("list", list);
			int totalsales=dao.gettotalsale();
			m.addAttribute("totalsale",totalsales);
			List<Object> list3 = dao.salesdata();
			System.out.println("sales data fetched.");
			m.addAttribute("saleslist",list3);
			//System.out.println("w:"+w);
			return "admin/adminhome";
		}
		
		@RequestMapping(value="/adduser" ,method = RequestMethod.POST)
		public String adduser(@ModelAttribute("addusers") adduserbean addusers,Model m) {
			System.out.println("inside admin :");
			m.addAttribute("addusers", addusers );
			dao.adduser(addusers);
			return "redirect:/adminhome";
		}

		@RequestMapping(value="/getCustomer/{id}" ,method = RequestMethod.GET)
		@ResponseBody
		public ResponseEntity<adduserbean> adduser(@PathVariable("id") int id,Model m) {
			System.out.println("inside admin :"+id);
			adduserbean add=dao.getcustomer(id);
			m.addAttribute("add",add);
			//m.addAttribute("addusers", addusers );
			//dao.adduser(addusers);
			return new ResponseEntity<adduserbean>(add, HttpStatus.OK);
		}
		
		
		@RequestMapping(value="/userstatechange" ,method = RequestMethod.POST)
		@ResponseBody
		public void userstatechange(@RequestParam int id) {	
			System.out.println("id"+id);
			dao.statechange(id);
			//return "redirect:/adminhome";
		}
		
		@RequestMapping(value="/download" ,method = RequestMethod.GET)
		protected ModelAndView getdata(HSSFWorkbook workbook,Model m){
			List<userbean> list = udao.getCustomer();
			System.out.println("data fetched:");
			/*m.addAttribute("list",list);
			HSSFSheet excelSheet = workbook.createSheet("Animal List");
			UserExcelView c=new UserExcelView();
			c.setExcelHeader(excelSheet);

			//List animalList = (List) model.get("animalList");
			c.setExcelRows(excelSheet, list);*/
			return new ModelAndView("AnimalListExcel", "animalList", list);
		}
		
	/*	@RequestMapping(value="/edituser" ,method = RequestMethod.POST)
		@ResponseBody
		public void edituser(@RequestParam int id) {	
			System.out.println("id"+id);
			dao.statechange(id);
			//return "redirect:/adminhome";
		}*/
}
