function ValidateForm(obj)
{
    var frmObj = document.testator;

    document.getElementById('txtfFname').value =(document.getElementById('txtfFname').value);
    if (!validate_Name(frmObj, "txtfFname", "Father's First Name",true))
    {
        return false;
    }
   
    if(CheckValidAddress()===false)
    {
        return false;
    }
    document.getElementById('txtaltMobile').value =(document.getElementById('txtaltMobile').value);
    if(!NumberValidte(frmObj,"txtaltMobile","Alternate Mobile Number",false,10,15))
    {
        return false;
    }
    document.getElementById('txtaltEmail').value =(document.getElementById('txtaltEmail').value);
    if(!ValidateEmail(frmObj,"txtaltEmail","Alternate Email Id",false))
    {
        return false;
    }
    saveRecord(obj);
}

function CheckValidAddress()
{
    var frmObj = document.testator;
    document.getElementById('txtaddress').value = (document.getElementById('txtaddress').value);
    if (!address_Validate(frmObj, "txtaddress", "Street Address", true,500))
    {
        document.getElementById('txtaddress').focus();
        return false;
    }
    document.getElementById('txtpincode').value =(document.getElementById('txtpincode').value);
    if (!validate_alphaNumeric(frmObj, "txtpincode", "Pin Code", true))
    {
        document.getElementById('txtpincode').focus();
        return false;
    }
    
    return;
}

function createclone_forproof(obj, tableName, lableName, sub)
{
    var index = 0;
    var tr = obj.parentNode.parentNode.parentNode;
    var table = document.getElementById(tableName);
    var trIndex = tr.rowIndex;
    if (obj.value === 'Add More')
    {
        if (table.rows.length < document.getElementById(sub + 'proofno_1').length - 1)
        {
            var proofvalue = document.getElementById(sub + 'proofno_' + table.rows.length).value;
            if (document.getElementById(sub + 'proofno_1').value === '-1')
            {
                valid_select_alert("Proof for " + lableName + " Id Proof  - 1");
                document.getElementById(sub + 'proofno_1').focus();
                return false;
            }
            if (document.getElementById(sub + 'proofno_' + table.rows.length).value === '-1')
            {
                valid_select_alert("Proof for " + lableName + " Id Proof  - " + table.rows.length);
                document.getElementById(sub + 'proofno_' + table.rows.length).focus();
                return false;
            }
            if (document.getElementById(sub + 'refno_' + table.rows.length).value === '')
            {
                value_common_alert("Proof Number for " + lableName + " Id Proof  - " + table.rows.length);
                document.getElementById(sub + 'refno_' + table.rows.length).focus();
                return false;
            }

            var row = document.getElementById("clonetr");
            if (lableName === "Alternative Executor's")
            {
                row = document.getElementById("clonetrAltr");
            }

            if (lableName === "Guardian")
            {
                row = document.getElementById("clonetrGard");
            }

            var clone = row.cloneNode(true);
            clone.id = 'm7_row' + index;
            if (lableName === "Executor's" || lableName === "Alternative Executor's") {
                clone.cells[0].innerHTML = '<label>' + lableName + ' Id Proof - ' + (index + 1);
            } else {
                clone.cells[0].innerHTML = '<label>' + lableName + ' Id Proof - ' + (index + 1) + '<span class="red">&nbsp;*</span></label>';
            }


            clone.cells[1].getElementsByTagName("select")[0].name = sub + 'proofno';
            if (lableName === "Executor's" || lableName === "Alternative Executor's") {
                clone.cells[1].getElementsByTagName("select")[0].options[0].selected = true;
            }
            clone.cells[1].getElementsByTagName("input")[0].id = sub + 'refno_' + index;
            clone.cells[1].getElementsByTagName("input")[0].value = '';
            clone.cells[1].getElementsByTagName("input")[0].name = sub + 'refno';
            clone.cells[1].getElementsByTagName("input")[1].id = lableName + 'addMore_' + index;
            clone.cells[1].getElementsByTagName("input")[1].value = 'Remove';
            clone.cells[1].getElementsByTagName("input")[2].id = lableName + 'addMore_' + index;
            clone.cells[1].getElementsByTagName("input")[2].value = 'Add More';
            table.tBodies[0].appendChild(clone);
            //resetProofIDLabels(lableName, table, sub, "add");
        }
        else
        {
            alert("You have reached the maximum limit.");
        }
    }
    else
    {
        if (trIndex > 1)
        {
            table.rows[trIndex - 1].cells[1].getElementsByTagName("input")[1].value = 'Remove';
            table.rows[trIndex - 1].cells[1].getElementsByTagName("input")[1].style.display = "";
            table.rows[trIndex - 1].cells[1].getElementsByTagName("input")[2].value = 'Add More';
        }
        table.deleteRow(trIndex);
        table.rows[0].cells[1].getElementsByTagName("input")[1].value = 'Remove';
        table.rows[0].cells[1].getElementsByTagName("input")[1].style.display = "none";
        table.rows[0].cells[1].getElementsByTagName("input")[2].value = 'Add More';
        //resetProofIDLabels(lableName, table, sub, "remove");
    }

}
function onChangeProof(obj, sub)
{
    var proofID = obj.value;
    var tr = obj.parentNode.parentNode.parentNode;
    var trIndex = tr.rowIndex;
    if (proofID === -1)
    {
        document.getElementById(sub + 'refno_' + (trIndex + 1)).value = '';
    }
    document.getElementById(sub + 'refno_' + (trIndex + 1)).value = '';
    document.getElementById(sub + 'refno_' + (trIndex + 1)).value = '';
}


function saveRecord(obj)
{   
    if (confirm('Are you sure you want to Save this Detail?'))
    {
    	document.testator.submit();
    	return true;
    }
    else
    {
        return false;
    }
}
