package com.kalkul.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.kalkul.api.GstServiceQueryResponse;
import com.kalkul.model.GstService;

@RestController
@RequestMapping("/api/gstservice")
public class GstServiceResource {
	private List<String> dataList = new ArrayList<>(Arrays.asList("Spring", "REST", "JDBC"));

	@RequestMapping("/getData")
	public String test(@RequestParam(value = "id") int id) {
		return dataList.get(id);
	}

	@RequestMapping(value = "/getGSTDetails", method = RequestMethod.GET, produces = {"application/json"})
	//@RequestMapping(value = "/getGSTDetails")
    public GstServiceQueryResponse getGSTDetails(@RequestParam(value = "sup") String supplierState,
    		@RequestParam(value = "con") String consumerState,
    		@RequestParam(value = "code") String hsnSacCode) throws Exception {

		return new GstService().getGSTDetails(supplierState, consumerState, hsnSacCode);
	}
}
