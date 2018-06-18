package com.kalkul.api;

import java.util.LinkedList;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class GstServiceQueryResponse {
	  Status status;
	    String errorMessage;
	  List<GstOutputbean> gstList = new LinkedList<>();
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public List<GstOutputbean> getGstList() {
		return gstList;
	}
	public void setGstList(List<GstOutputbean> gstList) {
		this.gstList = gstList;
	}

	  
}
