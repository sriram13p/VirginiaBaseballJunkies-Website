<%@page language="java" %>
<!DOCTYPE html>
<html lang="en">
<title>W3.CSS</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><style>
html,body,h1,h2,h3,h4,h5 {font-family: "RobotoDraft", "Roboto", sans-serif;}
.w3-bar-block .w3-bar-item{padding:16px}
.error-message {
            color: red;
        }

</style>
<body>

<!-- Side Navigation -->
<nav class="w3-sidebar w3-bar-block w3-collapse w3-white w3-animate-left w3-card" style="z-index:3;width:320px;" id="mySidebar">
  <strong><a href="/" class="w3-bar-item w3-button w3-border-bottom w3-large">USER DASHBOARD</a></strong>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu"
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
   <a id="firstTab" href="javascript:void(0)" onclick="openMail('announcement');" class="w3-bar-item w3-button"><i class="fa fa-bullhorn w3-margin-right"></i>Announcements</a>
  <a id="myBtn" onclick="myFunc('Demo1')" href="javascript:void(0)" class="w3-bar-item w3-button"><i class="fa fa-inbox w3-margin-right"></i>Children<i class="w3-margin-left fa fa-caret-down"></i></a>
  <div id="Demo1" class="w3-hide w3-animate-left">

  </div>
  <a href="#" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-margin-right"></i>Sent</a>
  <a href="#" class="w3-bar-item w3-button"><i class="fa fa-hourglass-end w3-margin-right"></i>Drafts</a>
  <a href="/logout" class="w3-bar-item w3-button"><i class="fa fa-sign-out w3-margin-right"></i>Logout</a>
</nav>

<!-- Modal that pops up when you click on "New Message" -->
<div id="id01" class="w3-modal" style="z-index:4">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-padding w3-red">
       <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-right w3-xxlarge"><i class="fa fa-remove"></i></span>
      <h2>ADD CHILD</h2>
    </div>
    <div class="w3-panel">
      <form id="childForm" method="post" action="/addChild">
                 <div class="error-message" id="error-message-child">

                  </div>

            <label for="cname">Child Name</label>
            <input class="w3-input w3-border w3-margin-bottom" type="text" id="cname" name="cname" required>
            <div id="cnameError" class="error-message"></div>

            <label for="dob">Date Of Birth</label>
            <input class="w3-input w3-border w3-margin-bottom" type="date" id="dob" name="dob" required>
            <div id="dobError" class="error-message"></div>

            <label for="gender">Gender</label>
            <select class="w3-input w3-border w3-margin-bottom" name="gender" id="gender" required>
                            <option value="" disabled selected>Select Gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Other</option>
                        </select>
            <div id="genderError" class="error-message"></div>

            <label for="position">Player Position</label>
            <input class="w3-input w3-border w3-margin-bottom" type="text" id="position" name="position" required>
            <div id="positionError" class="error-message"></div>

            <label for="jerseyNo">Jersey No</label>
            <input class="w3-input w3-border w3-margin-bottom" type="number" id="jerseyNo" name="jerseyNo" required>
            <div id="jerseyNoError" class="error-message"></div>


            <div class="w3-margin-top"></div>
            <div class="w3-section">
              <a class="w3-button w3-red" onclick="document.getElementById('id01').style.display='none'">Cancel</a>
              <a class="w3-button w3-red" onclick="clearForm()">Clear</a>
              <button type="submit" id="submitButton" class="w3-button w3-right w3-green">Submit</button>
            </div>
          </form>
      </div>
    </div>
  </div>
</div>

<!-- Overlay effect when opening the side navigation on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="Close Sidemenu" id="myOverlay"></div>

<!-- Page content -->
<div class="w3-main" id="main" style="margin-left:320px;">
<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-top" onclick="w3_open()"></i>
<a href="javascript:void(0)" class="w3-red w3-button w3-right w3-margin-top w3-margin-right" onclick="document.getElementById('id01').style.display='block'">ADD CHILD</i></a>


<div id="announcement" class="w3-container person">
<h5>Announcement</h5>
</div>

<div id="tournament" class="w3-container person">
  <h2>Netflix-like Carousel</h2>
      
</div>

</div>

<script>

function onloadFunction() {
  const tableBody = document.querySelector("#tournament-data-table tbody");
    populateDiv();

}
window.onload = onloadFunction;

function populateDiv() {
    var demoContainer = document.getElementById('Demo1');
    var mainContainer = document.getElementById('main');


     // Clear existing content if needed
      demoContainer.innerHTML = '';
        console.log(${children}.length===0);
      if(${children}.length===0){
            var aTag = document.createElement('a');
                        aTag.href = 'javascript:void(0)';
                        aTag.className = 'w3-bar-item w3-button w3-border-bottom test w3-hover-light-grey';
                        aTag.textContent = "Add Child";
                        aTag.setAttribute('onclick', "document.getElementById('id01').style.display='block' " );
                        aTag.id = 'firstTab'

                        var div1 = document.createElement('div');
                        div1.className = 'w3-container';




                        aTag.appendChild(div1);
                        demoContainer.appendChild(aTag);

                        // Create <div> tag for MainContainer
                        var div2 = document.createElement('div');

                        div2.className = 'w3-container person';

                        var h5 = document.createElement('h5');
                        h5.className = 'w3-opacity';
                        h5.textContent = "Add Child";

                        div2.appendChild(h5);
                        mainContainer.appendChild(div2);



      }
      else{
          // Loop through response data and create elements
         ${children}.forEach(function(item, index) {
             // Create <a> tag for DemoContainer
             var aTag = document.createElement('a');
             aTag.href = 'javascript:void(0)';
             aTag.className = 'w3-bar-item w3-button w3-border-bottom test w3-hover-light-grey';
             aTag.setAttribute('onclick', "myFunc('Demo" + (index + 2) + "');");
             aTag.id = (index === 0) ? 'firstTab' : item.id + 'Tab'; // Assign id=firstTab to the first element

             var iTagUser = document.createElement('i');
             iTagUser.className = 'fa fa-user w3-margin-right';

             var span = document.createElement('span');
             span.className = 'w3-large';
             span.textContent = item.cname;

             var iTagCaret = document.createElement('i');
             iTagCaret.className = 'w3-margin-left fa fa-caret-down';

             aTag.appendChild(iTagUser);
             aTag.appendChild(span);
             aTag.appendChild(iTagCaret);

             demoContainer.appendChild(aTag);

             var divContainer = document.createElement('div');
             divContainer.id = 'Demo' + (index + 2);
             divContainer.className = 'w3-hide w3-animate-left';

             var subATag = document.createElement('a');
             subATag.href = '#';
             subATag.className = 'w3-bar-item w3-button';
             subATag.style.paddingLeft = '45px';
             subATag.setAttribute('onclick', 'w3_close(); tournament('+item.id+');');
             subATag.textContent = 'Tournaments';

             divContainer.appendChild(subATag);

             demoContainer.appendChild(divContainer);
         });

        var openTab = document.getElementById("firstTab");
        openTab.click();
    }

  }


document.addEventListener("DOMContentLoaded", function () {
    // Get form and input elements
    var form = document.getElementById("childForm");
    var cnameInput = document.getElementById("cname");
    var genderInput = document.getElementById("gender");
    var positionInput = document.getElementById("position");
    var dobInput = document.getElementById("dob");
    var jerseyNoInput = document.getElementById("jerseyNo");

    // Validate function
    function validateForm() {
        var isValid = true;

        // Clear previous error messages
        document.getElementById("cnameError").textContent = "";
        document.getElementById("genderError").textContent = "";
        document.getElementById("positionError").textContent = "";
        document.getElementById("dobError").textContent = "";
        document.getElementById("jerseyNoError").textContent = "";

        // Validate Child name
        if (cnameInput.value.trim() === "") {
            document.getElementById("cnameError").textContent = "Child name is required.";
            isValid = false;
        }

        // Validate Gender
        if (genderInput.value.trim() === "") {
            document.getElementById("genderError").textContent = "Gender is required.";
            isValid = false;
        }

        // Validate DOB
        var dobDate = new Date(dobInput.value);
        var today = new Date();
        if (dobDate >= today) {
            document.getElementById("dobError").textContent = "Date Of Birth should be in the past.";
            isValid = false;
        }

        // Validate Position
        if (positionInput.value.trim() === "") {
            document.getElementById("positionError").textContent = "Position is required.";
            isValid = false;
        }

        // Validate JerseyNo
        if (jerseyNoInput.value.trim() === "") {
            document.getElementById("jerseyNoError").textContent = "Jersey No is required.";
            isValid = false;
        }

        return isValid;
    }

    // Event listener for form submission
    form.addEventListener("submit", function(event) {
        event.preventDefault(); // Prevent default form submission

        if (!validateForm()) {
            return; // Exit function early if validation fails
        }

        // Disable submit button to prevent multiple submissions
        document.getElementById("submitButton").disabled = true;


        // Form data object
        var formData = {
            cname: cnameInput.value,
            dob: dobInput.value,
            gender: genderInput.value,
            position: positionInput.value,
            jerseyNo: jerseyNoInput.value,
        };


        $.ajax({
            type: 'POST',
            url: '/addChild', // Replace with your actual API endpoint
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function(response) {
                if (response && response.message) {
                    $('#error-message-child').text(response.message);

                    setTimeout(function() {

                        window.location.href = "/dashboard";
                    }, 2000);
                } else {
                    $('#error-message-child').text('Unexpected response format');
                    $('#submitButton').prop('disabled', false);
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                $('#error-message-child').text('Failed to submit the form. Please try again later.');
                $('#submitButton').prop('disabled', false);
            }
        });


    });


    // Event listeners for input fields to validate on input
    cnameInput.addEventListener("input", validateForm);
    dobInput.addEventListener("input", validateForm);
    positionInput.addEventListener("input", validateForm);
    jerseyNoInput.addEventListener("input", validateForm);
    genderInput.addEventListener("input", validateForm);
});



function clearForm() {
    document.getElementById("cname").value = "";
    document.getElementById("dob").value = "";
    document.getElementById("gender").value = "";
    document.getElementById("position").value = "";
    document.getElementById("jerseyNo").value = "";
    document.getElementById("error-message-child").value="";

    // Clear error messages
    document.getElementById("cnameError").textContent = "";
    document.getElementById("dobError").textContent = "";
    document.getElementById("genderError").textContent = "";
    document.getElementById("positionError").textContent = "";
    document.getElementById("jerseyNoError").textContent = "";
    document.getElementById("error-message-child").textContent="";
}



var openInbox = document.getElementById("myBtn");
openInbox.click();

function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

function myFunc(id) {
  var x = document.getElementById(id);
  var previousElement = x.previousElementSibling;

  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    if (previousElement && previousElement.id === 'myBtn') {
      previousElement.className += " w3-red";
    }
  } else {
    x.className = x.className.replace(" w3-show", "");
    if (previousElement && previousElement.id === 'myBtn') {
      previousElement.className = previousElement.className.replace(" w3-red", "");
    }
  }
}

function openMail(personName) {
  var i;
  var x = document.getElementsByClassName("person");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  x = document.getElementsByClassName("test");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" w3-light-grey", "");
  }
  document.getElementById(personName).style.display = "block";
  event.currentTarget.className += " w3-light-grey";
}

function tournament(id) {
  var i;
  var x = document.getElementsByClassName("person");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  x = document.getElementsByClassName("test");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" w3-light-grey", "");
  }
  document.getElementById("tournament").style.display = "block";
  event.currentTarget.className += " w3-light-grey";
  fetchTounrnament(id);

}

function fetchTounrnament(id){


}


</script>



</body>
</html>
