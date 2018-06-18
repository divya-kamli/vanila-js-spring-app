package com.kalkul.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/home")
public class HomeController {

	@RequestMapping(value="mainPage",method= RequestMethod.GET)
	public String showMain(ModelMap model)
	{
		model.addAttribute("msg", "Canada");
		return "home";
	}
	@RequestMapping(value="showform",method= RequestMethod.GET)
	public String showTestatorMain(ModelMap model)
	{
		Map<String, String> h=new HashMap<String, String>();
		h.put("SALUTATION", "Miss");
		h.put("F_NAME", "Divya");
		h.put("OPeration", "N");
		model.addAttribute("RegisterDataList",h);

		List<Map> prooflist=new ArrayList<Map>();
		h=new HashMap<String, String>();
		h.put("PROOF_ID", "1");
		h.put("PROOF_NAME", "Driving License");
		prooflist.add(h);
		
		h=new HashMap<String, String>();
		h.put("PROOF_ID", "2");
		h.put("PROOF_NAME", "NS Access Card");
		prooflist.add(h);
		
		model.addAttribute("ProofList",prooflist);
		return "personal_details";
	}
	@RequestMapping(value="saveForm",method= RequestMethod.POST)
	public String onSaveForm(ModelMap model)
	{
		model.addAttribute("msg", "Data Saved Successfully");
		return "success";
	}
}
