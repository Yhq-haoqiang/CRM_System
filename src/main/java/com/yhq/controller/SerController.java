package com.yhq.controller;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhq.pojo.Ser;
import com.yhq.service.IDictService;
import com.yhq.service.ISerService;
import com.yhq.service.IUserService;

@Controller
public class SerController {

	@Autowired
	private ISerService iss;

	@Autowired
	private IDictService ids;

	@Autowired
	private IUserService ius;

	@RequestMapping("/toaddserpage")
	public String toAddSerPage(Model m) {
		m.addAttribute("list", ids.findByCategory("服务类型"));
		return "crm_service/add";
	}

	@PostMapping("/saveser")
	public String SaveSer(Ser ser) {
		iss.saveAndUpdate(ser);
		return "redirect:/toaddserpage";
	}

	@RequestMapping("/todispatch/{pagenum}")
	public String toDispatch(@PathVariable int pagenum, Model m) {
		m.addAttribute("list", ius.getAllName());
		m.addAttribute("bean", iss.getDispatch(pagenum, 0));
		return "crm_service/dispatch";
	}

	@PostMapping("/dispatchser")
	public String dispatchSer(HttpServletRequest request) {
		String id = request.getParameter("id");
		String disname = request.getParameter("dis_name");
		iss.updateDisName(1, disname, Integer.parseInt(id));
		return "redirect:/todispatch/1";
	}

	@RequestMapping("/deleteByid/{id}")
	public String deleteById(@PathVariable int id) {
		iss.deleteById(id);
		return "redirect:/todispatch/1";

	}

	@RequestMapping("/todeal_list/{pagenum}")
	public String toDealPage(@PathVariable int pagenum, Model m) {
		m.addAttribute("bean", iss.getDispatch(pagenum, 1));
		return "crm_service/deal_list";
	}
	
	@RequestMapping("/todealpage/{id}")
	public String toDelldetail(@PathVariable int id,Model m){
		m.addAttribute("ser", iss.findOne(id));
		return "crm_service/deal";
	}
	
	@PostMapping("/handle")
	public String handle(Ser ser){
		iss.updateHandel(ser.getHandle(), ser.getHandle_date(), ser.getHandle_name(), ser.getId());
		return "redirect:/todeal_list/1";
	}
	
	@RequestMapping("/tofeedback_list/{pagenum}")
	public String toFeedBack(@PathVariable int pagenum, Model m){
		m.addAttribute("bean", iss.getDispatch(pagenum, 2));
		return "crm_service/feedback_list";
	}
	
	@RequestMapping("/tofeedbackpage/{id}")
	public String toFeedBackPage(@PathVariable int id,Model m){
		m.addAttribute("ser", iss.findOne(id));
		return "crm_service/feedback";
	}
	
	@PostMapping("/feedback")
	public String updateFeedback(Ser ser){
		iss.updateFeedBack(ser.getHandle_result(), ser.getSatisfaction(), ser.getId());
		return "redirect:/tofeedback_list/1";
	}
	
	@RequestMapping("/tofile_list/{pagenum}")
	public String tofile_list(@PathVariable int pagenum,Model m){
		m.addAttribute("bean", iss.getDispatch(pagenum, 3));
		return "crm_service/file_list";
	}
	
	@RequestMapping("/todetail/{id}")
	public String toDetailPage(@PathVariable int id,Model m){
		m.addAttribute("ser", iss.findOne(id));
		return "crm_service/file_detail";
	}
}
