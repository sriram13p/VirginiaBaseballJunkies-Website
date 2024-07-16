<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        html,body,h1,h2,h3,h4,h5 {font-family: "RobotoDraft", "Roboto", sans-serif;}
        .w3-bar-block .w3-bar-item{padding:16px}
        .error-message {
            color: red;
        }
    </style>
</head>
<body>

<!-- Side Navigation -->
<nav class="w3-sidebar w3-bar-block w3-collapse w3-white w3-animate-left w3-card" style="z-index:3;width:320px;" id="mySidebar">
  <strong><a href="/" class="w3-bar-item w3-button w3-border-bottom w3-large">ADMIN DASHBOARD</a></strong>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu"
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align" onclick="document.getElementById('id01').style.display='block'">Create Tournament<i class="w3-padding fa fa-pencil"></i></a>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-button w3-hover-black w3-left-align" onclick="openMail('tournaments');w3_close();" id="firstTab">Tournaments</a>
  <a id="myBtn" onclick="myFunc('Demo1')" href="javascript:void(0)" class="w3-bar-item w3-button"><i class="fa fa-inbox w3-margin-right"></i>Inbox (3)<i class="w3-margin-left fa fa-caret-down"></i></a>
  <div id="Demo1" class="w3-hide w3-animate-left">
    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-border-bottom test w3-hover-light-grey" onclick="openMail('tournaments');w3_close();" id="firstTab">
      <div class="w3-container">
        <img class="w3-round w3-margin-right" src="/w3images/avatar3.png" style="width:15%;"><span class="w3-opacity w3-large">Borge Refsnes</span>
        <h6>Subject: Remember Me</h6>
        <p>Hello, i just wanted to let you know that i'll be home at...</p>
      </div>
    </a>
     <a href="javascript:void(0)" class="w3-bar-item w3-button w3-border-bottom test w3-hover-light-grey" onclick="openMail('Jane');w3_close();">
      <div class="w3-container">
        <img class="w3-round w3-margin-right" src="/w3images/avatar5.png" style="width:15%;"><span class="w3-opacity w3-large">Jane Doe</span>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit...</p>
      </div>
    </a>
    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-border-bottom test w3-hover-light-grey" onclick="openMail('John');w3_close();">
      <div class="w3-container">
        <img class="w3-round w3-margin-right" src="/w3images/avatar2.png" style="width:15%;"><span class="w3-opacity w3-large">John Doe</span>
        <p>Welcome!</p>
      </div>
    </a>
  </div>
  <a href="#" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-margin-right"></i>Sent</a>
  <a href="#" class="w3-bar-item w3-button"><i class="fa fa-hourglass-end w3-margin-right"></i>Drafts</a>
  <a href="#" class="w3-bar-item w3-button"><i class="fa fa-trash w3-margin-right"></i>Trash</a>
  <a href="/logout" class="w3-bar-item w3-button"><i class="fa fa-sign-out w3-margin-right"></i>Logout</a>

</nav>

<!-- Modal that pops up when you click on "New Message" -->
<div id="id01" class="w3-modal" style="z-index:4">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-padding w3-red">
       <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-right w3-xxlarge"><i class="fa fa-remove"></i></span>
      <h2>Create Tournament</h2>
    </div>
    <div class="w3-panel">
    <form id="tournamentForm" method="post" action="/tournament">
           <div class="error-message" id="error-message-tournament">

            </div>

      <label for="tname">Tournament Name</label>
      <input class="w3-input w3-border w3-margin-bottom" type="text" id="tname" name="tname" required>
      <div id="tnameError" class="error-message"></div>

      <label for="location">Location</label>
      <input class="w3-input w3-border w3-margin-bottom" type="text" id="location" name="location" required>
      <div id="locationError" class="error-message"></div>

      <label for="league">League</label>
      <input class="w3-input w3-border w3-margin-bottom" type="text" id="league" name="league" required>
      <div id="leagueError" class="error-message"></div>

      <label for="organizer">Organizer</label>
      <input class="w3-input w3-border w3-margin-bottom" type="text" id="organizer" name="organizer" required>
      <div id="organizerError" class="error-message"></div>

      <label for="ageAllowed">Organizer</label>
      <select id="ageAllowed" name="ageAllowed" multiple class="w3-select w3-border" required>
                  <option value="9U">9U</option>
                  <option value="10U">10U</option>
                  <option value="11U">11U</option>
                  <option value="12U">12U</option>
                  <option value="13U">13U</option>
                  <option value="14U">14U</option>
                  <option value="15U&16U">15U/16U</option>
              </select>
      <div id="ageAllowedError" class="error-message"></div>

      <label for="startDate">Start Date</label>
      <input class="w3-input w3-border w3-margin-bottom" type="date" id="startDate" name="startDate" required>
      <div id="startDateError" class="error-message"></div>

      <label for="endDate">End Date</label>
      <input class="w3-input w3-border w3-margin-bottom" type="date" id="endDate" name="endDate" required>
      <div id="endDateError" class="error-message"></div>

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

<!-- Overlay effect when opening the side navigation on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="Close Sidemenu" id="myOverlay"></div>

<!-- Page content -->
<div class="w3-main" style="margin-left:320px;">
<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-top" onclick="w3_open()"></i>
<a href="javascript:void(0)" class="w3-hide-large w3-red w3-button w3-right w3-margin-top w3-margin-right" onclick="document.getElementById('id01').style.display='block'"><i class="fa fa-pencil"></i></a>

<div id="tournaments" class="w3-container person w3-responsive w3-margin-top">

    <div class="error-message" id="error-message-tournament-container"> </div>
   <table class="w3-table-all" id="tournament-data-table">
      <thead>
        <tr class="w3-red">
          <th>TournamentID</th>
          <th>TournamentName</th>
          <th>Organizer</th>
          <th>League</th>
          <th>Location</th>
          <th>AgeAllowed</th>
          <th>StartDate</th>
          <th>endDate</th>
        </tr>
      </thead>
      <tbody>
      </tbody>
    </table>
</div>

<div id="Jane" class="w3-container person">
  <br>
  <img class="w3-round w3-animate-top" src="/w3images/avatar5.png" style="width:20%;">
  <h5 class="w3-opacity">Subject: None</h5>
  <h4><i class="fa fa-clock-o"></i> From Jane Doe, Sep 25, 2015.</h4>
  <a class="w3-button">Reply<i class="w3-padding fa fa-mail-reply"></i></a>
  <a class="w3-button">Forward<i class="w3-padding fa fa-arrow-right"></i></a>
  <hr>
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
  <p>Forever yours,<br>Jane</p>
</div>

<div id="John" class="w3-container person">
  <br>
  <img class="w3-round w3-animate-top" src="/w3images/avatar2.png" style="width:20%;">
  <h5 class="w3-opacity">Subject: None</h5>
  <h4><i class="fa fa-clock-o"></i> From John Doe, Sep 23, 2015.</h4>
  <a class="w3-button">Reply<i class="w3-padding fa fa-mail-reply"></i></a>
  <a class="w3-button">Forward<i class="w3-padding fa fa-arrow-right"></i></a>
  <hr>
  <p>Welcome.</p>
  <p>That's it!</p>
</div>

</div>

<script>
function onloadFunction() {
  const tableBody = document.querySelector("#tournament-data-table tbody");

  $.ajax({
       type: 'GET',
       url: '/tournament', // Replace with your actual API endpoint
       success: function(response, textStatus, jqXHR) {
         console.log('AJAX success:', response);
         if (jqXHR.status === 200) {
           const tableBody = document.querySelector("#tournament-data-table tbody");
           tableBody.innerHTML = ''; // Clear existing rows

           response.forEach(item => {
             const row = document.createElement('tr');

                 // Create cells for each column and append them to the row
                 const idCell = document.createElement('td');
                 idCell.textContent = item.id;
                 row.appendChild(idCell);

                 const tnameCell = document.createElement('td');
                 tnameCell.textContent = item.tname;
                 row.appendChild(tnameCell);

                 const organizerCell = document.createElement('td');
                 organizerCell.textContent = item.organizer;
                 row.appendChild(organizerCell);

                 const leagueCell = document.createElement('td');
                 leagueCell.textContent = item.league;
                 row.appendChild(leagueCell);

                 const locationCell = document.createElement('td');
                 locationCell.textContent = item.location;
                 row.appendChild(locationCell);

                 const ageAllowedCell = document.createElement('td');
                 ageAllowedCell.textContent = item.ageAllowed;
                 row.appendChild(ageAllowedCell);

                 const startDateCell = document.createElement('td');
                 startDateCell.textContent = item.startDate;
                 row.appendChild(startDateCell);

                 const endDateCell = document.createElement('td');
                 endDateCell.textContent = item.endDate;
                 row.appendChild(endDateCell);

                 // Append the row to the table body
                 tableBody.appendChild(row);
           });
         } else {
           console.log('AJAX error status:', jqXHR.status);
           $('#error-message-tournament-container').text('Try Again');
         }
       },
       error: function(error) {
         console.error('AJAX error:', error);
         $('#error-message-tournament-container').text('Try Again Later');
       }
     });
}


window.onload = onloadFunction;


document.addEventListener("DOMContentLoaded", function () {
    // Get form and input elements
    var form = document.getElementById("tournamentForm");
    var tournamentNameInput = document.getElementById("tname");
    var locationInput = document.getElementById("location");
    var startDateInput = document.getElementById("startDate");
    var endDateInput = document.getElementById("endDate");
    var organizerInput = document.getElementById("organizer");
    var leagueInput = document.getElementById("league");
    var ageAllowedInput = document.getElementById("ageAllowed");

    var selectedValues;

    // Validate function
    function validateForm() {
        var isValid = true;



        // Clear previous error messages
        document.getElementById("tnameError").textContent = "";
        document.getElementById("locationError").textContent = "";
        document.getElementById("startDateError").textContent = "";
        document.getElementById("endDateError").textContent = "";
        document.getElementById("organizerError").textContent = "";
        document.getElementById("leagueError").textContent = "";
        document.getElementById("ageAllowedError").textContent = "";


        // Validate AgeAllowed
        const selectedOptions = ageAllowedInput.selectedOptions;
        if (selectedOptions.length === 0) {
            document.getElementById("ageAllowedError").textContent = "Age Allowed is required.";
            isValid = false;
        }
        selectedValues = Array.from(selectedOptions).map(option => option.value);

        // Validate tournament name
        if (tournamentNameInput.value.trim() === "") {
            document.getElementById("tnameError").textContent = "Tournament name is required.";
            isValid = false;
        }

        // Validate location
        if (locationInput.value.trim() === "") {
            document.getElementById("locationError").textContent = "Location is required.";
            isValid = false;
        }
        // Validate league
        if (leagueInput.value.trim() === "") {
            document.getElementById("leagueError").textContent = "League is required.";
            isValid = false;
        }

        // Validate start date
        var startDate = new Date(startDateInput.value);
        var today = new Date();
        if (startDate <= today) {
            document.getElementById("startDateError").textContent = "Start date must be in the future.";
            isValid = false;
        }

        // Validate end date
        var endDate = new Date(endDateInput.value);
        if (endDate <= startDate) {
            document.getElementById("endDateError").textContent = "End date must be after start date.";
            isValid = false;
        }

        // Validate Organizer
        if (organizerInput.value.trim() === "") {
            document.getElementById("organizerError").textContent = "Organizer is required.";
            isValid = false;
        }

        return isValid;
    }


    // Event listeners for input fields
    tournamentNameInput.addEventListener("input", validateForm);
    locationInput.addEventListener("input", validateForm);
    startDateInput.addEventListener("input", validateForm);
    endDateInput.addEventListener("input", validateForm);
    organizerInput.addEventListener("input", validateForm);
    leagueInput.addEventListener("input", validateForm);
    ageAllowedInput.addEventListener("input", validateForm);

    // Event listener for form submission
    form.addEventListener("submit", function(event) {
        event.preventDefault(); // Prevent default form submission

        if (!validateForm()) {
            return; // Exit function early if validation fails
        }

        // Form data object
        var formData = {
            tname: tournamentNameInput.value,
            organizer: organizerInput.value,
            location: locationInput.value,
            startDate: startDateInput.value,
            endDate: endDateInput.value,
            league: leagueInput.value,
            ageAllowed: selectedValues
        };
         // Disable submit button
         $('#submitButton').prop('disabled', true);

        $.ajax({
                        type: 'POST',
                        url: '/tournament', // Replace with your actual API endpoint
                        contentType: 'application/json',
                        data: JSON.stringify(formData),
                        success: function(response) {
                            if (response.message) {
                                $('#error-message-tournament').text(response.message);

                                setTimeout(function() {
                                                clearForm();
                                                    document.getElementById('id01').style.display = 'none';
                                                    window.location.href = "/dashboard";
                                                }, 2000);
                            }else{
                                $('#error-message-tournament').text('Try Again');
                                $('#submitButton').prop('disabled', false);
                            }
                        },
                        error: function(error) {
                            console.error('Error:', error);
                            $('#error-message-tournament').text('Try Again Later');
                            $('#submitButton').prop('disabled', false);
                        }
                    });

    });
});

function clearForm() {
    document.getElementById("tname").value = "";
    document.getElementById("location").value = "";
    document.getElementById("organizer").value = "";
    document.getElementById("startDate").value = "";
    document.getElementById("endDate").value = "";

    // Clear error messages
    document.getElementById("tnameError").textContent = "";
    document.getElementById("locationError").textContent = "";
    document.getElementById("organizerError").textContent = "";
    document.getElementById("startDateError").textContent = "";
    document.getElementById("endDateError").textContent = "";
    document.getElementById("error-message-tournament").textContent = "";

}

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
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-red";
    } else {
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className =
            x.previousElementSibling.className.replace(" w3-red", "");
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

var openTab = document.getElementById("firstTab");
openTab.click();
</script>

</body>
</html>
