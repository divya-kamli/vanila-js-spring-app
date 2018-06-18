package com.kalkul.model;

import java.util.LinkedList;
import java.util.List;
import com.kalkul.api.GstOutputbean;
import com.kalkul.api.GstServiceQueryResponse;
import com.kalkul.api.Status;

public class GstService {

	 public GstServiceQueryResponse getGSTDetails(String supplierState, String consumerState,String hsnSacCode) throws Exception 
	 {
			GstServiceQueryResponse obj=new GstServiceQueryResponse();
			boolean flag = true;
			try {
				if (supplierState == null) {
					obj.setErrorMessage("Mandatory Parameter SupplierState is Missing");
					flag = false;
				} else if (consumerState == null) {
					obj.setErrorMessage("Mandatory Parameter ConsumerState is Missing");
					flag = false;
				} else if (hsnSacCode == null || hsnSacCode.equals("")) {
					obj.setErrorMessage("Mandatory Parameter HsnSacCode is Missing");
				}

				if (flag == true) {
					obj.setStatus(Status.SUCCESS);
					List<GstOutputbean> gstList = new LinkedList<>();
					GstOutputbean gstOutBean=new GstOutputbean();
					gstOutBean.setGstAmt("2300");
					gstOutBean.setGstRate("15");
					gstOutBean.setGstType("IGST");
					gstList.add(gstOutBean);
					obj.setGstList(gstList);
					obj.setErrorMessage("");
				} else {
					obj.setStatus(Status.REJECTED);
				}

			} catch (Exception ex) {
				obj.setStatus(Status.FAILED);

			}
			return obj;
		} 
}
