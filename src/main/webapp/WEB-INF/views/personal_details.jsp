<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Personal Details</title>
<link href="../resources/css/style.css" rel="stylesheet" />
<script src="../resources/js/per_details.js"></script>
<script src="../resources/js/common	.js"></script>

</head>
<body>
</head>
<body ondragstart="return false;" ondrop="return false;">
	<form name="testator" id="testator"
		action="/KalkulSpringApp/home/saveForm" method="POST">

		<div id="form_display" align="center"></div>
		<c:set var="list" value="${RegisterDataList}" />
		<input type="hidden" name="willID" id="willID" readonly="readonly"
			value="${willId}"> <input type="hidden" id="curdate1"
			name="curdate1" value='${cur_date}' /> <input type="hidden"
			id="count" name="count" value='${count}' />
		<div class="container set-bg-color">
			<table>
				<tr>
					<td colspan="2">
						<%--  <jsp:include page="header.jsp">
                                        <jsp:param name="flgDisp" value="N" />
                                    </jsp:include> --%>
					</td>
				</tr>
				<tr>
					<td width="250" valign="top" class="nav-bgclr"><jsp:include
							page="leftpanel.jsp" /></td>
					<td width="710" class="pad-lr-20">
						<table class="pb55">
							<tr>
								<td>
									<table width="100%" cellspacing="0" cellpadding="0" border="0">
										<tbody>
											<tr>
												<td width="80%">
													<h1 class="set-title">PERSONAL DETAILS</h1>
												</td>
												<td align="right"></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>

								<td>
									<p class="boder note" style="position: relative; top: -25px;">
										Personal Details entered are private and confidential and so
										we take care that we don't share it with anyone</p>

									<table id="ptable">
										<p class="sub-title">Personal Details</p>
										<tr>
											<td width="200"><label>Salutation</label></td>
											<td>${list.SALUTATION}</td>
										</tr>
										<tr>
											<td><label>First Name</label></td>
											<td>
												<div class="caption">${list.F_NAME}</div>
											</td>
										</tr>
										<tr>
											<td><label>Father's First Name<span class="red">&nbsp;*</span></label>
											</td>
											<td><input class="form-control border-radias f-left"
												id="txtfFname" name="txtfFname" type="text" maxlength="25"
												autofocus required></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<table id="proofIDtable">
										<tbody>
											<c:if test="${fn:length(ProofDataList) eq 0}">
												<c:set var="lstcount" value="1" />
											</c:if>
											<c:if test="${fn:length(ProofDataList) ne 0}">
												<c:set var="lstcount" value="${fn:length(ProofDataList)}" />
											</c:if>
											<c:forEach begin="0" end="${lstcount-1}" step="1"
												varStatus="i">
												<c:set var="proofId" value="" />
												<c:set var="proofRefNo" value="" />
												<c:set var="proofExpDate" value="" />
												<c:set var="btnCaption" value="Remove" />
												<c:if test="${i.index eq lstcount-1}">
													<c:set var="btnCaption" value="Add More" />
												</c:if>
												<c:if test="${lstcount ne 0}">
													<c:if test="${fn:length(ProofDataList) eq 0}">
														<c:set var="proofId" value="" />
													</c:if>
													<c:if test="${fn:length(ProofDataList) ne 0}">
														<c:set var="proofId"
															value="${ProofDataList[i.index].PROOF_ID}" />
													</c:if>
													<c:set var="proofRefNo"
														value="${ProofDataList[i.index].PROOF_NO}" />
													<c:set var="proofExpDate"
														value="${ProofDataList[i.index].PROOF_EXP_DATE}" />
												</c:if>
												<tr>
													<td width="200"><label>Id Proof -${i.index+1}<span
															class="red">&nbsp;*</span></label></td>
													<td>
														<div class="Proof-type">
															<select class="setddl  f-left" style="width: 130px;"
																id="testatorproofno_${i.index+1}" name="testatorproofno"
																<c:if test="${list.OPeration ne 'N'}">disabled="disabled" </c:if>
																onchange="onChangeProof(this, 'testator');">
																<option value="-1">Select</option>
																<c:forEach items="${ProofList}" var="listPR">
																	<option value="${listPR.PROOF_ID}"
																		<c:if test="${listPR.PROOF_ID eq proofId || (proofId eq '' && listPR.PROOF_ID eq '1') }">  selected="selected"
                                                                                            </c:if>>${listPR.PROOF_NAME}</option>
																</c:forEach>
															</select> <input
																class="form-control border-radias set-small-input f-left"
																type="text" id="testatorrefno_${i.index+1}"
																name="testatorrefno" placeholder="Proof Number"
																value="${proofRefNo}" maxlength="25"
																<c:if test="${list.OPeration ne 'N'}">readonly="readonly" </c:if>>

															<input class="blu-btn" type="button"
																id="addMore_${i.index+1}" value="Remove"
																<c:if test="${list.OPeration ne 'N'}">disabled="disabled" </c:if>
																<c:if test="${fn:length(ProofDataList) eq 1}">style="display: none;"</c:if>
																onclick="createclone_forproof(this, 'proofIDtable', 'Personal', 'testator');" />
															<input class="blu-btn" type="button"
																id="addMore_${i.index+1}" value="${btnCaption}"
																<c:if test="${list.OPeration ne 'N'}">disabled="disabled" </c:if>
																<c:if test="${fn:length(ProofDataList) gt 1}">style="display: none;"</c:if>
																onclick="createclone_forproof(this, 'proofIDtable', 'Personal', 'testator');" />

														</div>
													</td>
												</tr>
											</c:forEach>


										</tbody>
									</table> <!--                                                 Table to make clone -->
									<table style="display: none">
										<tbody>
											<tr id="clonetr">
												<td width="200"><label>Id Proof -1<span
														class="red">&nbsp;*</span></label></td>
												<td>
													<div class="Proof-type">
														<select class="setddl  f-left" style="width: 130px;"
															onchange="onChangeProof(this, 'testator');">
															<option value="-1">Select</option>
															<c:forEach items="${ProofList}" var="listPR">
																<option value="${listPR.PROOF_ID}"
																	<c:if test="${listPR.PROOF_ID eq '1'}">  selected="selected"
                                                                                    </c:if>>${listPR.PROOF_NAME}</option>
															</c:forEach>
														</select> <input
															class="form-control border-radias set-small-input f-left"
															type="text" placeholder="Proof Number" maxlength="25">
														<input class="blu-btn" type="button" value="Remove"
															onclick="createclone_forproof(this, 'proofIDtable', 'Testator', 'testator');" />
														<input class="blu-btn" type="button" value="Add More"
															onclick="createclone_forproof(this, 'proofIDtable', 'Testator', 'testator');" />
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td></td>
							</tr>

							<tr>
								<td>
									<p class="sub-title">Permanent Address</p>
									<table>
										<tr>
											<td width="200"><label>Street Address<span
													class="red">&nbsp;*</span></label></td>
											<td><textarea maxlength="500"
													class="form-control border-radias f-left" type="text"
													style="height: 50px;" name="txtaddress" id="txtaddress"
													<c:if test="${list.OPeration ne 'N'}">readonly="readonly"</c:if>>${fn:escapeXml(list.P_ADDRESS)}</textarea>
											</td>
										</tr>
										<tr>
											<td><label>Country<span class="red">&nbsp;*</span></label>
											</td>
											<td><select class="filterddl setddl ddl-width f-left"
												id="cmbcountry" name="cmbcountry"
												onchange="javaScript:onChangeCountry(this.id);"
												<c:if test="${list.OPeration ne 'N'}">disabled="disabled"</c:if>>
													<option value="-1">Select</option>
													<c:forEach items="${CountryList}" var="listcr">
														<c:choose>
															<c:when test="${list.P_GEO_ID eq '' }">
																<option value="${listcr.GEO_ID}"
																	<c:if test="${listcr.GEO_ID eq '52'}">selected="selected"</c:if>>${listcr.GEO_NAME}</option>
															</c:when>
															<c:when test="${list.P_GEO_ID ne '' }">
																<option value="${listcr.GEO_ID}"
																	<c:if test="${listcr.GEO_ID eq GeoData.C_GEO_ID}">selected="selected" </c:if>>${listcr.GEO_NAME}</option>
															</c:when>
														</c:choose>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<td><label>State<span class="red">&nbsp;*</span></label>
											</td>
											<td><select class="filterddl setddl ddl-width f-left"
												id="cmbState" name="cmbState"
												onchange="javascript:onChangeState(this.id);"
												<c:if test="${list.OPeration ne 'N'}">disabled="disabled"</c:if>>
													<option value="-1">Select</option>
													<%--<c:if test="${list.P_GEO_ID ne ''}">--%>
													<c:choose>
														<c:when test="${list.P_GEO_ID ne ''}">
															<c:forEach items="${stateDataP}" var="liststdata">
																<option value="${liststdata.GEO_ID}"
																	<c:if test="${liststdata.GEO_ID eq GeoData.S_GEO_ID}">selected="selected" </c:if>>${liststdata.GEO_NAME}</option>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<c:forEach items="${stateData}" var="liststdata">
																<option value="${liststdata.GEO_ID}">${liststdata.GEO_NAME}</option>
															</c:forEach>
														</c:otherwise>
													</c:choose>
													<%--</c:if>--%>

											</select></td>
										</tr>
										<tr>
											<td><label>City<span class="red">&nbsp;*</span></label>
											</td>
											<td><select class="filterddl setddl ddl-width f-left"
												<c:if test="${list.OPeration ne 'N'}">disabled="disabled"</c:if>
												id="cmbCity" name="cmbCity">
													<option value="-1">Select</option>
													<c:forEach items="${CityData}" var="listctdata">
														<option value="${listctdata.GEO_ID}"
															<c:if test="${listctdata.GEO_ID eq list.P_GEO_ID}">selected="selected"
                                                                                </c:if>>${listctdata.GEO_NAME}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<td><label for="">Pin Code<span class="red">&nbsp;*</span></label>
											</td>
											<td><input
												class="form-control border-radias f-left input-m"
												type="text" id="txtpincode" required
												pattern="[A-Za-z][0-9][A-Za-z] [0-9][A-Za-z][0-9]"
												value="${list.P_PIN_CODE}"
												<c:if test="${list.OPeration ne 'N'}">readonly="readonly"</c:if>
												name="txtpincode" maxlength="15"></td>
										</tr>
									</table>
								</td>
							</tr>


							<tr>
								<td class="pb55">
									<p class="sub-title">Contact Details</p>
									<table>
										<tr>
											<td><label>Personal Mobile Number</label></td>
											<td><input
												class="form-control border-radias f-left input-m"
												type="text"
												<c:if test="${list.OPeration ne 'N'}">readonly="readonly"</c:if>
												name="txtaltMobile" id="txtaltMobile" maxlength="15"
												value="${list.MOBILENO2}"></td>
										</tr>
										<tr>
											<td><label>Email Id</label></td>
											<td><input type="email"
												class="form-control border-radias f-left input-m" required
												<c:if test="${list.OPeration ne 'N'}">readonly="readonly"</c:if>
												value="${list.EMAILID2}" id="txtaltEmail" name="txtaltEmail"
												maxlength="50"></td>
										</tr>
									</table>
								</td>
							</tr>

							<div class="text-center">
								<div class="btn-fix">
									<input id="btnsave" type="submit" class="btn set-btn"
										value="SAVE" name="btnsubmit" id="btnsubmit"
										onclick="javascript:ValidateForm(this);">
									<c:if test="${list.OPeration eq 'N'}">
										<input type="submit" class="btn set-btn"
											value="SAVE & NEXT &#8594" name="btnsn" id="btnsn"
											onclick="javascript:ValidateForm(this);">
									</c:if>
								</div>
							</div>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
