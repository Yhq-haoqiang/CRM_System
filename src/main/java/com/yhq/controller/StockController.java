package com.yhq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhq.service.IStockService;

@Controller
public class StockController {
	
	@Autowired
	private IStockService iss;
	
	@RequestMapping("/getstockpage/{pagenum}")
	public String getAllPage(@PathVariable int pagenum,Model m){
		m.addAttribute("bean", iss.getAllPage(pagenum));
		return "crm_base/stock";
	}
}
