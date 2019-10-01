function validate() {
    var userFname = document.getElementById("txtUserFirstName").value;
    var fname = /^[a-zA-Z]*$/;
    var userLname = document.getElementById("txtUserLastName").value;
    var lname = /^[a-zA-Z]*$/;
    var userEmail = document.getElementById("txtUserEmail").value;
    var email_Pattern = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    var gender = document.getElementById("ddlGender").value;
    var userContact = document.getElementById("txtUserContactNumber").value;
    var valusercontact=/^[0-9]*$/;
    var userUserid = document.getElementById("txtUserId").value;
    var valuserid = /^[A-Za-z0-9]*$/;
    var userPwd = document.getElementById("txtUserPassword").value;
    var userCpwd = document.getElementById("txtUserCPassword").value;
    var g = document.getElementById("ddlGender");
    var gender = s.options[g.selectedIndex].value;
    var r = document.getElementById("ddlRole");
    var role = r.options[r.selectedIndex].value;

    if (userFname == '' || userFname == null) {
        document.getElementById("txtUserFirstName").focus();
        alert("Enter your first name!");
        return false;
    }

    else if(fname.test(userFname)==false)
    {
        document.getElementById("txtUserFirstName").focus();
        alert("Enter only alphabets for first name!");
        return false;
    }
  
    else if (userLname == '' || userLname == null) {
        document.getElementById("txtUserLastName").focus();
        alert("Enter your last name!");
        return false;
    }

    else if (lname.test(userLname) == false) {
        document.getElementById("txtUserLastName").focus();
        alert("Enter only alphabets for last name!");
        return false;
    }
  
    else if (userEmail == '') {
        document.getElementById("txtUserEmail").focus();
        alert("Enter your email!");
        return false;
    }

    else if (email_Pattern.test(userEmail) == false) {
        document.getElementById("txtUserEmail").focus();
        alert("Enter valid email!");
        return false;
    }

    else if (gender == '0') {
        document.getElementById("ddlGender").focus();
        alert("Enter your gender!");
        return false;
    }

    else if (userContact == '') {
        document.getElementById("txtUserContactNumber").focus();
        alert("Enter your contact number!");
        return false;
    }

    else if (userContact.length != 10 || valusercontact.test(userContact)==false ) {
        document.getElementById("txtUserContactNumber").focus();
        alert("Enter valid contact number!");
        return false;
    }

    else if (userUserid == '') {
        document.getElementById("txtUserId").focus();
        alert("Enter your User ID!");
        return false;
    }

    else if (valuserid.test(userUserid)==false) {
        document.getElementById("txtUserId").focus();
        alert("Enter only characters and numbers");
        return false;
    }

    else if (userPwd == '') {
        document.getElementById("txtUserPassword").focus();
        alert("Enter your password!");
        return false;
    }

    else if (userCpwd == '') {
        document.getElementById("txtUserCPassword").focus();
        alert("Confirm your password!");
        return false;
    }

    else if (role == '0') {
        document.getElementById("ddlRole").focus();
        alert("Select a role!");
        return false;
    }

    else if (userPwd != userCpwd) {
        document.getElementById("txtUserCPassword").focus();
        alert("Passwords don't match!");
        return false;
    }
}

function packageValidate() {
    var pkWeight = document.getElementById("txtPackageWeight").value;
    var sendAddress = document.getElementById("txtSenderAddress").value;
    var recAddress = document.getElementById("txtReceiverAddress").value;
    var s = document.getElementById("ddlSendCity");
    var sendCity = s.options[s.selectedIndex].value;
    var r = document.getElementById("ddlReceiveCity");
    var recCity = s.options[r.selectedIndex].value;
    var p = document.getElementById("ddlPackageType");
    var package = p.options[p.selectedIndex].value;

    if (pkWeight == '') {
        document.getElementById("txtPackageWeight").focus();
        alert("Package weight cannot be empty!");
        return false;
    }

    else if (sendAddress == '') {
        document.getElementById("txtSenderAddress").focus();
        alert("Sender address cannot be empty!");
        return false;
    }

    else if (sendCity == '0') {
        document.getElementById("txtSenderAddress").focus();
        alert("Select a city!");
        return false;
    }

    else if (recAddress == '') {
        document.getElementById("txtReceiverAddress").focus();
        alert("Receiver address cannot be empty!");
        return false;
    }

    else if (recCity == '0') {
        document.getElementById("txtReceiverAddress").focus();
        alert("Select a city!");
        return false;
    }

    else if (package == '0') {
        document.getElementById("txtReceiverAddress").focus();
        alert("Select a package!");
        return false;
    }
}

function warehouse() {
    var warehouseRow = document.getElementById("txtWname").value;

    if (warehouseRow == '') {
        document.getElementById("txtWname").focus();
        alert("Enter warehouse location");
        return false;
    }
}

function profile() {
    var corrAddress = document.getElementById("txtCorAddress").value;

    if (perAddress == '') {
        document.getElementById("corrAddress").focus();
        alert("Correspondence address cannot be empty");
        return false;
    }
}
