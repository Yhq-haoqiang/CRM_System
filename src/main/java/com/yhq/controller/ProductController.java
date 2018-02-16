package com.yhq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhq.service.IProductService;

@Controller
public class ProductController {
	
	@Autowired
	private IProductService ips;
	
	@RequestMapping("/getpage/{pagenum}")
	public String getProductPage(@PathVariable int pagenum,Model m){
		m.addAttribute("bean", ips.findALLProductPage(pagenum));
		return "crm_base/product";
	}
}
