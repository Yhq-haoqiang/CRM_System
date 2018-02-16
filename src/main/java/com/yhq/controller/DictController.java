package com.yhq.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhq.pojo.Dict;
import com.yhq.service.IDictService;
import com.yhq.utils.PageBean;

@Controller
public class DictController {

	@Autowired
	private IDictService ids;

	@RequestMapping("/getAllDict/{pagenum}")
	public String getAllDict(@PathVariable int pagenum, Model m) {
		m.addAttribute("bean", ids.getDictByPage(pagenum));
		return "crm_base/dict";
	}
	
	@RequestMapping("/todict_add")
	@RequiresPermissions("添加")
	public String toAddPage() {
		return "crm_base/dict_add";
	}

	@PostMapping("/addDict")
	public String addDict(Dict dict) {
		ids.saveAndUpdateDict(dict);
		return "redirect:/getAllDict/1";
	}

	@RequestMapping("/todict_edit/{id}")
	public String toUpdatePage(@PathVariable int id, Model m) {
		m.addAttribute("d", ids.findById(id));
		return "crm_base/dict_edit";

	}

	@PostMapping("/updateDict")
	public String updateDict(Dict dict) {
		ids.saveAndUpdateDict(dict);
		return "redirect:/getAllDict/1";
	}

	@RequestMapping("/deletedict/{id}")
	public String deleteDictById(@PathVariable int id) {
		ids.deleteDictById(id);
		return "redirect:/getAllDict/1";
	}
	
	@PostMapping("/query")
	public String query(Dict dict,Model m){
		PageBean<Dict> bean = ids.queryDictByPage(dict);
		m.addAttribute("bean", bean);
		return "crm_base/dict";
		
	}
}
