package com.yhq.controller;


import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhq.pojo.Contacts;
import com.yhq.pojo.Opp;
import com.yhq.pojo.Record;
import com.yhq.service.IOppService;
import com.yhq.service.IPlanService;
import com.yhq.service.IProductService;
import com.yhq.service.IRecordService;
import com.yhq.service.IUserService;

@Controller
public class OppController {

	@Autowired
	private IOppService ios;

	@Autowired
	private IUserService ius;

	@Autowired
	private IProductService ips;

	@Autowired
	private IRecordService irs;

	@Autowired
	private IPlanService ps;

	@RequestMapping("/getallopppage/{pagenum}")
	public String getAllOpp(@PathVariable int pagenum, Model m) {
		m.addAttribute("bean", ios.getAllPage(0, pagenum));
		return "crm_sale/opp/list";
	}

	@RequestMapping("/toaddopppage")
	public String toAddOppPage(Model m) {
		m.addAttribute("list", ius.getAllName());
		return "crm_sale/opp/add";
	}

	@PostMapping("/addopp")
	public String addOpp(Opp opp, Contacts contacts) {
		opp.setContacts(contacts);
		ios.addOpp(opp);
		return "redirect:/getallopppage/1";

	}

	@RequestMapping("/findone/{id}")
	public String findOneOpp(@PathVariable int id, Model m) {
		m.addAttribute("list", ius.getAllName());
		m.addAttribute("opp", ios.findOne(id));
		return "crm_sale/opp/dispatch";
	}

	@PostMapping("/updateopp")
	public String updateOpp(Opp opp, Contacts contacts, HttpServletRequest request) {
		String cid = request.getParameter("cid");
		contacts.setId(Integer.parseInt(cid));
		opp.setContacts(contacts);
		ios.addOpp(opp);
		return "redirect:/getallopppage/1";
	}

	@RequestMapping("/delopp/{id}")
	public String delOpp(@PathVariable int id) {
		ios.delOpp(id);
		return "redirect:/getallopppage/1";
	}

	@RequestMapping("/todevlist/{pagenum}")
	public String toDevList(@PathVariable int pagenum, Model m) {
		m.addAttribute("bean", ios.getAllPage(pagenum));
		return "crm_sale/dev/list";
	}

	@RequestMapping("/toplanpage/{id}")
	public String toPlanPage(@PathVariable int id, Model m) {
		m.addAttribute("list", ips.findAll());
		m.addAttribute("opp", ios.findOne(id));
		return "crm_sale/dev/plan";
	}

	// 更改状态进行归档
	@RequestMapping("/dofile/{id}")
	public String doFile(@PathVariable int id) {
		ios.updateStatus(2, id);
		return "redirect:/todevlist/1";
	}

	@RequestMapping("/getOppInfoPage/{pagenum}")
	public String getOppInfoPage(@PathVariable int pagenum, Model m) {
		m.addAttribute("bean", ios.getAllPage(2, pagenum));
		return "crm_cus/info/list";
	}

	@RequestMapping("/tocontact")
	public String toContactPage(HttpServletRequest req, Model m) {
		String string = req.getParameter("id");
		Integer oppid = Integer.parseInt(string);
		m.addAttribute("oppid", oppid);
		m.addAttribute("customer", req.getParameter("customer"));
		m.addAttribute("bean", irs.findByOppid(oppid, Integer.parseInt(req.getParameter("pagenum"))));
		return "crm_cus/info/contact";
	}

	@RequestMapping("/toaddrec")
	public String toaddrec(HttpServletRequest req, Model m) {
		String string = req.getParameter("id");
		Integer oppid = Integer.parseInt(string);
		m.addAttribute("oppid", oppid);
		m.addAttribute("customer", req.getParameter("customer"));
		return "crm_cus/info/contact_add";
	}

	@PostMapping("/saverec")
	public String saveRec(Record rec, HttpServletRequest req) {
		irs.saveAndUpdate(rec);
		return "redirect:/tocontact?id=" + rec.getOppid() + "&customer=" + req.getParameter("customer") + "&pagenum=1";
	}

	@RequestMapping("/findonerec/{id}")
	public String findRecById(@PathVariable int id, Model m) {
		Record record = irs.findById(id);
		m.addAttribute("rec", record);
		m.addAttribute("opp", ios.findOne(record.getOppid()));
		return "crm_cus/info/contact_edit";
	}

	@PostMapping("/updaterec")
	public String updateRec(Record rec, HttpServletRequest req) {
		irs.saveAndUpdate(rec);
		return "redirect:/tocontact?id=" + rec.getOppid() + "&customer=" + req.getParameter("customer") + "&pagenum=1";
	}

	@RequestMapping("/delrec/{id}")
	public String delRec(@PathVariable int id) {
		Record rec = irs.findById(id);
		Opp opp = ios.findOne(rec.getOppid());
		irs.delRecById(id);
		return "redirect:/tocontact?id=" + rec.getOppid() + "&customer=" + opp.getCustomer() + "&pagenum=1";
	}

	@RequestMapping("/toorderpage")
	public String toOrderPage(HttpServletRequest req, Model m) {
		String string = req.getParameter("id");
		String pagenum = req.getParameter("pagenum");
		Integer oppid = Integer.parseInt(string);
		m.addAttribute("oppid", oppid);
		m.addAttribute("customer", req.getParameter("customer"));
		m.addAttribute("bean", ps.findPlanByOppidAndPage(oppid, Integer.parseInt(pagenum)));
		return "crm_cus/info/order";
	}
	
	@RequestMapping("/tolinkman/{oppid}")
	public String toLinkManPage(@PathVariable int oppid, Model m){
		m.addAttribute("opp", ios.findOne(oppid));//主要联系人
		m.addAttribute("list",  ios.findContactsByOppid(oppid));//附加联系人列表
		return "crm_cus/info/linkman";
	}
	
	@RequestMapping("/tolinkmanadd")
	public String toLinkManAdd(HttpServletRequest req,Model m){
		m.addAttribute("oppid", req.getParameter("oppid"));
		m.addAttribute("customer", req.getParameter("customer"));
		return "crm_cus/info/linkman_add";
	}
	
	@PostMapping("/addorupdatecon")
	public String addCon(Contacts con){
		ios.addAndUpdateContacts(con);
		return "redirect:/tolinkman/"+con.getOppid();
	}
	
	@RequestMapping("/tolinkmanedit")
	public String toLinkManEditPage(HttpServletRequest req,Model m){
		m.addAttribute("oppid", req.getParameter("oppid"));
		m.addAttribute("customer", req.getParameter("customer"));
		String id = req.getParameter("id");
		m.addAttribute("con", ios.findContactsById(Integer.parseInt(id)));
		return "crm_cus/info/linkman_edit";
		
	}
	
	@RequestMapping("/getOppPage/{pagenum}")
	public String getLoseOppPage(@PathVariable int pagenum,Model m){
		m.addAttribute("bean", ios.findByStatusNot(2, pagenum));
		return "crm_cus/lose/list";
	}
	@RequestMapping("/toretard/{oppid}")
	public String toRetard(@PathVariable int oppid,Model m){
		m.addAttribute("opp",ios.findOne(oppid));
		return "crm_cus/lose/retard";
	}
	@RequestMapping("/tosure/{oppid}")
	public String toSure(@PathVariable int oppid,Model m){
		m.addAttribute("opp",ios.findOne(oppid));
		return "crm_cus/lose/sure";
	}
	
	@PostMapping("/addreprieve")
	public String addreprieve(Opp opp){
		ios.updateStatusAndReprieve(opp.getReprieve(), opp.getId());
		return "redirect:/getOppPage/1";
	}
	@PostMapping("/isloss")
	public String isLoss(Opp opp){
		ios.updateStatusLose(opp.getWhyloss(), opp.getId());
		return "redirect:/getOppPage/1";
	}
	
	@RequestMapping("/selectsummoney")
	public String selectSumMoney(Model m){
		m.addAttribute("list", ios.selectsummoney());
		return "crm_rep/contribution";
	}	
	
}
