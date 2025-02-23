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
<style>
        .w3-down::before {
            content: '\25BC'; /* Down arrow */
            color: #000000; /* Black color for the down arrow */
        }

        .w3-up::before {
            content: '\25B2'; /* Up arrow */
            color: #000000; /* Black color for the up arrow */
        }

        .card-header {
            cursor: pointer;
            border-radius: 8px 8px 0 0; /* Curve only the top corners */
            background-color: #ffffff; /* Default header color */
            color: #000000; /* Default text color */
            padding: 10px; /* Add some padding for better appearance */
            transition: background-color 0.3s ease; /* Smooth transition for background color */
        }

        .header-top {
            display: flex;
            justify-content: space-between; /* Space between name and arrow */
            align-items: center; /* Align items vertically center */
        }

        .w3-card-4 {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            overflow: hidden; /* Ensure content doesn't overflow card borders */
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            background-color: #f4f4f4;
        }

        .team-details {
            display: none; /* Hide team details by default */
            margin-top: 10px;
        }

        .card-expanded .team-details {
            display: block; /* Show team details when expanded */
        }

        .card-expanded .card-header {
            background-color: red; /* Change header color when expanded */
            color: #ffffff; /* Change text color for better contrast */
        }
    </style>
 <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 50px auto;
        }
        .schedule-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 20px;

        }
        .schedule-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .schedule-header div {
            display: flex;
            align-items: center;
        }
        .schedule-header img {
            border-radius: 50%;
            margin-left: 5px;
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
                 <div class="error-message" id="error-message-child"></div>

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
<a href="javascript:void(0)" class="w3-red w3-button w3-round-xxlarge w3-right w3-margin-top w3-margin-right" onclick="document.getElementById('id01').style.display='block'">+ Add Child</i></a>


<div id="announcement" class="w3-container person">
<h5>Announcement</h5>
</div>

<div id="tournament" class="w3-container person">
<br>

    <div class="w3-bar">
         <button id="btnAvailable" class="w3-bar-item w3-button w3-round-xxlarge tablink w3-red">Available</button>
         <button id="btnRegistered" class="w3-bar-item w3-button w3-round-xxlarge tablink">Registered</button>
         <button id="btnGames" class="w3-bar-item w3-button w3-round-xxlarge tablink">Games</button>
    </div>
    <div id="Available" class="w3-container tab" style="display:block">
        <br>
        <div class="error-message" id="error-message-available"></div>
        <div id="availableContent"></div>
    </div>

    <div id="Registered" class="w3-container tab" style="display:none">
        <br>
        <div class="error-message" id="error-message-registered"></div>
        <div id="registeredContent"></div>
    </div>

    <div id="Games" class="w3-container tab" style="display:none">
            <br>
            <div class="error-message" id="error-message-games"></div>
            <div id="gamesContent">
            <strong>Games</strong>
            </div>
    </div>

</div>

</div>

</div>
<script>
let childIDHolder;
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

      if(${children}.length===0){
      var tournamentHide = document.getElementById('tournament');
      tournamentHide.innerHTML = '';

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



                        div2.appendChild(h5);




      }
      else{
                // Loop through response data and create elements
                ${children}.forEach(function(item, index) {
                  // Create <a> tag for DemoContainer
                  var aTag = document.createElement('a');
                  aTag.href = 'javascript:void(0)';
                  aTag.className = 'w3-bar-item w3-button w3-border-bottom test w3-hover-light-grey';
                  aTag.textContent = item.cname;
                  aTag.setAttribute('onclick', "tournament('" + item.id + "'); w3_close();");
                  aTag.id = (index === 0) ? 'firstTab' : item.id + 'Tab'; // Assign id=firstTab to the first element

                  var div1 = document.createElement('div');
                  div1.className = 'w3-container';



                  var span = document.createElement('span');
                  span.className = 'w3-opacity w3-large ';
                  span.textContent = item.name;

                  div1.appendChild(span);
                  aTag.appendChild(div1);
                  demoContainer.appendChild(aTag);

                  // Create <div> tag for MainContainer
                  var div2 = document.createElement('div');
                  div2.id = item.id;
                  div2.className = 'w3-container person';

                  var h5 = document.createElement('h5');
                  h5.className = 'w3-opacity';
                  h5.textContent = item.cname;

                  div2.appendChild(h5);
                  mainContainer.appendChild(div2);



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

  document.getElementById('btnAvailable').click();

  const availableDiv = $('#availableContent');
  availableDiv.empty();

  const registeredDiv = $('#registeredContent');
  registeredDiv.empty();

  childIDHolder=id;
  fetchTounrnament(id);
  fetchGames(id);

}

function fetchGames(id){
 const registeredDiv = $('#gamesContent');
   registeredDiv.empty();
 $('#error-message-games').text("");
        $.ajax({
            type: 'GET',
            url: '/games?id=' + id, // Append id to the URL
            contentType: 'application/json',
            success: function(response,textStatus, jqXHR) {

                if (jqXHR.status === 200) {

                    if(response.length===0){
                        $('#error-message-games').text('No Games Available');
                    }
                    else{
                         generateGameCards(response);
                    }

                } else {
                    $('#error-message-games').text('Unexpected response format');

                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                $('#error-message-games').text('Failed to Load Data. Please try again later.');

            }
        });

}

function generateCard(game) {
    // Create card header with name, location, and date
    var cardHeader =
        '<header class="card-header">' +
            '<div class="header-top">' +
                '<span><strong>' + game.gname + '</strong></span>' +
                '<i class="w3-xlarge w3-margin-right w3-text-black w3-right w3-down" onclick="toggleCard(this)"></i>' +
            '</div>' +
            '<div>' +
                '<div>' +
                    '<i class="fa fa-map-marker"></i> ' + game.location +
                '</div>' +
                '<div>' +
                    '<i class="fa fa-calendar"></i> ' + new Date(game.gameDate).toLocaleDateString() +
                '</div>' +
                '<div>' +
                    '<i class="fa fa-trophy"></i> ' + game.tournament.tname +
                '</div>' +
            '</div>' +
        '</header>';

    // Create teams details in a table
    var teamDetails = game.teams.map(function(team) {
        return '<tr>' +
                   '<td>' + team.registration.child.cname + '</td>' +
                   '<td>' + team.registration.child.position + '</td>' +
                   '<td>' + team.registration.child.jerseyNo + '</td>' +
               '</tr>';
    }).join('');

    // Combine header and body
    return (
        '<div class="w3-card-4 w3-margin-bottom">' +
            cardHeader +
            '<div class="team-details">' +
                '<div class="w3-container">' +
                    '<h3>Team Details</h3>' +
                    '<table>' +
                        '<thead>' +
                            '<tr>' +
                                '<th>Child Name</th>' +
                                '<th>Position</th>' +
                                '<th>Jersey Number</th>' +
                            '</tr>' +
                        '</thead>' +
                        '<tbody>' +
                            teamDetails +
                        '</tbody>' +
                    '</table>' +
                    '<br>' +
                '</div>' +
            '</div>' +
        '</div>'
    );
}


function generateGameCards(games){
    const container = document.getElementById('gamesContent');
            container.innerHTML = games.map(generateCard).join('');
}
function toggleCard(icon) {
        const card = icon.closest('.w3-card-4');
        card.classList.toggle('card-expanded');
        icon.classList.toggle('w3-down');
        icon.classList.toggle('w3-up');
    }

function fetchTounrnament(id){

   $('#error-message-available').text("");
        $.ajax({
            type: 'GET',
            url: '/tournaments?id=' + id, // Append id to the URL
            contentType: 'application/json',
            success: function(response,textStatus, jqXHR) {

                if (jqXHR.status === 200) {

                    if(response.length===0){
                        $('#error-message-available').text('No Tournaments Available');
                    }
                    else{
                         generateTournamentCards(response,id);
                    }

                } else {
                    $('#error-message-available').text('Unexpected response format');

                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                $('#error-message-available').text('Failed to Load Data. Please try again later.');

            }
        });
}

function convertIsoToDateString(isoString) {
    var date = new Date(isoString);

    // Extract the year, month, and day
    var year = date.getFullYear();
    var month = ('0' + (date.getMonth() + 1)).slice(-2); // Months are zero-based
    var day = ('0' + date.getDate()).slice(-2);

    // Format as "YYYY-MM-DD"
    return year + '-' + month + '-' + day;
}

function generateTournamentCards(tournaments, id) {
    const availableDiv = $('#availableContent');
    availableDiv.empty();
    tournaments.forEach(function(tournament) {
        var startDate = convertIsoToDateString(tournament.startDate);
        var endDate = convertIsoToDateString(tournament.endDate);

        var cardHtml =
            '<div class="w3-card-4 schedule-card" id="card-' + tournament.id + '">' +
                '<div class="schedule-header">' +
                    '<div><span>' + tournament.tname + '</span></div>' +
                    '<div>' +
                        '<button class="w3-button w3-red w3-border w3-border-gray w3-round-large" id="register-btn-' + tournament.id + '" onclick="registerTournament(' + tournament.id + ',' + id + ')">REGISTER</button>' +
                    '</div>' +
                '</div>' +
                '<div><i class="fa fa-calendar"></i><span class="w3-opacity"> ' + startDate + ' to ' + endDate + '</span></div>' +
                '<div><span class="w3-opacity">' + tournament.league + '</span></div>' +
                '<div><span class="w3-opacity">' + tournament.organizer + '</span></div>' +
                '<div><i class="fa fa-map-marker"></i><span class="w3-opacity"> ' + tournament.location + '</span></div>' +
                '<div>' +
                    '<input type="checkbox" id="checkbox-' + tournament.id + '"> Willing to play up one age group if available' +
                '</div>' +
            '</div><br>';
        availableDiv.append(cardHtml);
    });
}

function registerTournament(tournamentId,id) {
    var checkbox = $('#checkbox-' + tournamentId);
    var willingToPlayUp = checkbox.is(':checked');

    var tournamentData = {
            tid: tournamentId,
            willingToPlayUp: willingToPlayUp,
            cid: id
        };
    // Disable the register button
    $('#register-btn-' + tournamentId).prop('disabled', true);

    $('#error-message-available').text("");
    $.ajax({
            url: '/registration', // Change this URL to your actual endpoint
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(tournamentData),
            success: function(response) {
                if(response.message && response){
                    $('#card-' + tournamentId).remove();

                }else{
                     $('#error-message-available').text(response.message);
                     $('#register-btn-' + tournamentId).prop('disabled', false);
                }

            },
            error: function(error) {
                 $('#error-message-available').text(error.responseJSON.message);
                 $('#register-btn-' + tournamentId).prop('disabled', false);
            }
        });

}


</script>
<script>
 document.getElementById('btnAvailable').addEventListener('click', function() {
        openTab('Available', this);
    });
    document.getElementById('btnAvailable').addEventListener('touchstart', function() {
        openTab('Available', this);
    });

    document.getElementById('btnRegistered').addEventListener('click', function() {
        openTab('Registered', this);
        fetchRegistration();
    });
    document.getElementById('btnRegistered').addEventListener('touchstart', function() {
        openTab('Registered', this);
        fetchRegistration();
    });

    document.getElementById('btnGames').addEventListener('click', function() {
            openTab('Games', this);
           //fetchRegistration();
    });
    document.getElementById('btnGames').addEventListener('touchstart', function() {
            openTab('Games', this);
           // fetchRegistration();
    });

function openTab(tabName, element) {
    var i, x, tablinks;


    // Hide all elements with class "tab"
    x = document.getElementsByClassName("tab");
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }

    // Remove the "w3-red" class from all elements with class "tablink"
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].classList.remove("w3-red","w3-animate-zoom");
    }

    // Show the current tab, and add an "w3-red" class to the button that opened the tab
    document.getElementById(tabName).style.display = "block";
    element.classList.add("w3-red");
    element.classList.add("w3-animate-zoom");
}

function fetchRegistration(){
 $('#error-message-registered').text("");
        $.ajax({
            type: 'GET',
            url: '/registrations?id=' + childIDHolder, // Append id to the URL
            contentType: 'application/json',
            success: function(response,textStatus, jqXHR) {

                if (jqXHR.status === 200) {

                    if(response.length===0){
                        $('#error-message-registered').text('No Registrations Available');
                    }
                    else{
                         generateRegistrationCards(response,childIDHolder);
                    }

                } else {
                    $('#error-message-registered').text('Unexpected response format');

                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                $('#error-message-registered').text('Failed to Load Data. Please try again later.');

            }
        });
}

function generateRegistrationCards(tournaments, id){
const availableDiv = $('#registeredContent');
    availableDiv.empty();
    tournaments.forEach(function(tournament) {
        var startDate = convertIsoToDateString(tournament.tournament.startDate);
        var endDate = convertIsoToDateString(tournament.tournament.endDate);

        var checkboxChecked = tournament.willingToPlayUp ? 'checked' : '';
        var cardHtml =
            '<div class="w3-card-4 schedule-card" id="card-' + tournament.id + '">' +
                '<div class="schedule-header">' +
                    '<div><span>' + tournament.tournament.tname + '</span></div>' +
                    '<div>' +
                        '<button class="w3-button w3-red w3-border w3-border-gray w3-round-large" id="edit-btn-' + tournament.id + '" onclick="editTournament(' + tournament.id + ')">EDIT</button>' +
                    '</div>' +
                '</div>' +
                '<div><i class="fa fa-calendar"></i><span class="w3-opacity"> ' + startDate + ' to ' + endDate + '</span></div>' +
                '<div><span class="w3-opacity">' + tournament.tournament.league + '</span></div>' +
                '<div><span class="w3-opacity">' + tournament.tournament.organizer + '</span></div>' +
                '<div><i class="fa fa-map-marker"></i><span class="w3-opacity"> ' + tournament.tournament.location + '</span></div>' +
                '<div>' +
                    '<input type="checkbox" id="checkbox-' + tournament.id + '" ' + checkboxChecked + ' disabled> Willing to play up one age group if available' +
                '</div>' +
            '</div><br>';
        availableDiv.append(cardHtml);
    });

}
</script>

</body>
</html>
