
/*////USED FOR VALIDATING Allow All Special Characters handle Max Length with Compulsory or not////////////////*/
function address_Validate(frm, field_name, captionName, isCompulsory, maxLength)
{
    var fieldvalue = frm.elements[field_name].value;
    if (isCompulsory === true)
    {
        if ((fieldvalue) === "")
        {
            value_common_alert(captionName);
            frm.elements[field_name].focus();
            return false;
        }
    }
    if ((fieldvalue) !== "")
    {
        if (fieldvalue.length > maxLength) {
            valid_common_alert(captionName, maxLength);
            frm.elements[field_name].focus();
            return false;
        }
    }
    return true;
}
function value_common_alert(captionName)
{
	alert("Please enter value for "+captionName);
	}
function valid_common_alert(captionName)
{
	alert("Please enter valid value for "+captionName);
	}

/* Text Only (Special Character Not Allowed Except( ' and.and ) . */
function validate_Name(frm, field_name, captionName, isCompulsory)
{
    var fieldvalue = frm.elements[field_name].value;
    var alpharegexpr = /^([a-zA-Z][a-zA-Z'. ]*)$/;
    if (isCompulsory === true)
    {
        if ((fieldvalue) === "")
        {
            value_common_alert(captionName);
            frm.elements[field_name].focus();
            return false;
        }
    }
    if ((fieldvalue) !== "")
    {
        if (alpharegexpr.test(fieldvalue) !== true)
        {
            valid_common_alert(captionName);
            frm.elements[field_name].focus();
            return false;
        }
        return true;
    }
    return true;
}



/*////USED FOR VALIDATING Only Number with Max Length and Min Length////////////////*/
function NumberValidte(frm, field_name, captionName, isCompulsory, minLength, maxLength)
{
    var fieldvalue = frm.elements[field_name].value;
    var alpharegexpr = /^([0-9]+)$/;
    if (isCompulsory === true)
    {
        if ((fieldvalue) === "") {
            value_common_alert(captionName);
            frm.elements[field_name].focus();
            return false;
        }
    }
    if ((fieldvalue) !== "")
    {
        if (alpharegexpr.test(fieldvalue) !== true)
        {
            valid_common_alert(captionName);
            frm.elements[field_name].focus();
            return false;
        }
        if (fieldvalue.length < minLength)
        {
            captionName = captionName.replace("\"", "'");
            alert("\'" + captionName + "\' should not be less than " + minLength + " characters.");
            frm.elements[field_name].focus();
            return false;
        }
        if (fieldvalue.length > maxLength)
        {
            valid_common_alert(captionName, maxLength);
            frm.elements[field_name].focus();
            return false;
        }
        return true;
    }
    return true;
}

function ValidateEmail(frm, field_name, captionName, isCompulsory) {
    var fieldvalue = frm.elements[field_name].value;
    var alpharegexpr = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
    if (isCompulsory === true)
    {
        if ((fieldvalue) === "")
        {
            value_common_alert(captionName);
            frm.elements[field_name].focus();
            return false;
        }
    }
    if ((fieldvalue) !== "")
    {
        if (alpharegexpr.test(fieldvalue) !== true)
        {
            valid_common_alert(captionName);
            frm.elements[field_name].focus();
            return false;
        }
        return true;
    }
    return true;
}

/*////USED FOR VALIDATING ONLY ALPHANUMERIC////////////////*/
function validate_alphaNumeric(frm, field_name, captionName, isCompulsory)
{
    var fieldvalue = frm.elements[field_name].value;
    var alpharegexpr = /^[A-Za-z0-9]+$/;
    if (isCompulsory === true)
    {
        if ((fieldvalue) === "")
        {
            value_common_alert(captionName);
            frm.elements[field_name].focus();
            return false;
        }
    }
    if ((fieldvalue) !== "")
    {
        if (alpharegexpr.test(fieldvalue) !== true)
        {
            valid_common_alert(captionName);
            frm.elements[field_name].focus();
            return false;
        }
        return true;
    }
    return true;
}

function getData_sync(dataSource, divID, param,flag)
{
    if(flag!=true)
        flag=false;
    var XMLHttpRequestObject =false;
    if(window.XMLHttpRequest)
    {
        XMLHttpRequestObject = new XMLHttpRequest();
    }
    else if (window.ActiveXObject)
    {
        XMLHttpRequestObject = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if(XMLHttpRequestObject)
    {
        var obj = document.getElementById(divID);
        obj.innerHTML = '<center><div><img src="../resources/images/ajax-loader1.gif" ><br><font color=darkblue><b>Loading Page... </b></font></div></center>';
        XMLHttpRequestObject.open("POST",dataSource,flag);
        XMLHttpRequestObject.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
        XMLHttpRequestObject.send(param);
        if(XMLHttpRequestObject.readyState == 4  && XMLHttpRequestObject.status == 200)
        {
            obj.innerHTML = XMLHttpRequestObject.responseText;
        }
    }
}