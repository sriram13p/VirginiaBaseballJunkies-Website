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
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <style>
        html,body,h1,h2,h3,h4,h5 {font-family: "RobotoDraft", "Roboto", sans-serif;}
        .w3-bar-block .w3-bar-item{padding:16px}
        .error-message {
            color: red;
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
</head>
<body>

<!-- Side Navigation -->
<nav class="w3-sidebar w3-bar-block w3-collapse w3-white w3-animate-left w3-card" style="z-index:3;width:320px;" id="mySidebar">
  <strong><a href="/" class="w3-bar-item w3-button w3-border-bottom w3-large">ADMIN DASHBOARD</a></strong>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu"
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align" onclick="document.getElementById('id01').style.display='block'">Create Tournament<i class="w3-padding fa fa-pencil"></i></a>
  <a href="javascript:void(0)" class="w3-bar-item w3-button" onclick="openMail('tournaments');w3_close();" id="firstTab"><i class="fa fa-trophy w3-margin-right"></i>Tournaments</a>
  <a href="javascript:void(0)" class="w3-bar-item w3-button" onclick="openMail('game');w3_close();"><i class="fa fa-gamepad w3-margin-right"></i>Games</a>
  <a href="#" class="w3-bar-item w3-button"><i class="fa fa-hourglass-end w3-margin-right"></i>Drafts</a>
  <a href="#" class="w3-bar-item w3-button"><i class="fa fa-trash w3-margin-right"></i>Trash</a>
  <a href="/logout" class="w3-bar-item w3-button"><i class="fa fa-sign-out w3-margin-right"></i>Logout</a>

</nav>

<!-- Modal that pops up when you click on "New Message" -->
<div id="id01" class="w3-modal" style="z-index:4">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-padding w3-red">
       <span onclick="document.getElementById('id01').style.display='none';clearForm();" class="w3-button w3-right w3-xxlarge"><i class="fa fa-remove"></i></span>
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

      <label for="ageAllowed">Age Allowed</label>
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
        <a class="w3-button w3-red" onclick="document.getElementById('id01').style.display='none';clearForm();">Cancel</a>
        <a class="w3-button w3-red" onclick="clearForm()">Clear</a>
        <button type="submit" id="submitButton" class="w3-button w3-right w3-green">Submit</button>
      </div>
    </form>
    </div>
  </div>
</div>

<div id="id02" class="w3-modal" style="z-index:4">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-padding w3-red">
       <span onclick="document.getElementById('id02').style.display='none';clearForm();" class="w3-button w3-right w3-xxlarge"><i class="fa fa-remove"></i></span>
      <h2>Create Game</h2>
    </div>
    <div class="w3-panel">
    <form id="gameForm" method="post" action="/game">
           <div class="error-message" id="error-message-game"></div>

      <label for="gname">Game Name</label>
      <input class="w3-input w3-border w3-margin-bottom" type="text" id="gname" name="gname" required>
      <div id="gnameError" class="error-message"></div>

      <label for="glocation">Location</label>
      <input class="w3-input w3-border w3-margin-bottom" type="text" id="glocation" name="location" required>
      <div id="glocationError" class="error-message"></div>

      <label for="gameDate">Game Date</label>
      <input class="w3-input w3-border w3-margin-bottom" type="date" id="gameDate" name="gameDate" required>
      <div id="gameDateError" class="error-message"></div>

      <label for="gtname">Tournament</label>
      <select id="gtname" class="w3-select w3-border">
      <option value="">None</option>
      </select>
      <div id="gtnameError" class="error-message"></div>

      <div class="w3-margin-top"></div>
      <div class="w3-section">
        <a class="w3-button w3-red" onclick="document.getElementById('id02').style.display='none';clearForm();">Cancel</a>
        <a class="w3-button w3-red" onclick="clearForm()">Clear</a>
        <button type="submit" id="gameSubmitButton" class="w3-button w3-right w3-green">Submit</button>
      </div>
    </form>
    </div>
  </div>
</div>

<!-- Overlay effect when opening the side navigation on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="Close Sidemenu" id="myOverlay"></div>

<!-- Page content -->
<div class="w3-main" style="margin-left:320px;">

<div id="tournaments" class="w3-container person w3-responsive">

<header class="w3-container w3-xlarge">
    <p class="w3-left">
    <i class="fa fa-bars w3-hide-large w3-margin-right w3-xlarge" onclick="w3_open()"></i>
    <strong>Tournaments</strong>
    </p>
</header>
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

<div id="game" class="w3-container person">
      <header class="w3-container w3-xlarge">
        <p class="w3-left">
          <i class="fa fa-bars w3-hide-large w3-margin-right w3-xlarge" onclick="w3_open()"></i>
          <strong>Games</strong>
        </p>
        <p class="w3-right">
          <i class="fa fa-plus" onclick="document.getElementById('id02').style.display='block';clearForm();"></i>
        </p>
      </header>

     <div class="w3-container">
     <select id="gtnamepage" class="w3-select w3-border" onchange="handleTournamentChange()">
             <option value="">Select a Tournament</option> <!-- Default option -->
             <!-- Options will be populated dynamically -->
         </select>
     </div>

     <div class="error-message" id="error-message-game-page"><strong></strong></div>
     <br>

     <div class="w3-container" id="gameContent">
     </div>

</div>

<div id="gameContentView" class="w3-container person">
     <header class="w3-container w3-xlarge">
            <p class="w3-left">
              <i class="fa fa-bars w3-hide-large w3-margin-right w3-xlarge" onclick="w3_open()"></i>
              <strong id="gameValue"></strong>
            </p>
     </header>
     <div class="w3-bar">
             <button id="btnAvailable" class="w3-bar-item w3-button w3-round-xxlarge tablink">Available</button>
             <button id="btnRegistered" class="w3-bar-item w3-button w3-round-xxlarge tablink">Registered</button>
     </div>
    <div id="Available" class="w3-container tab w3-responsive" style="display:block">
        <br>
        <div class="error-message" id="error-message-available"></div>
        <div>
        <table class="w3-table-all w3-striped" >
              <thead>
                <tr class="w3-red">
                  <th>RID</th>
                  <th>Child Name</th>
                  <th>Age</th>
                  <th>Position</th>
                  <th>Gender</th>
                  <th>Jersey Number</th>
                  <th>Willing to Play Up</th>
                  <th>Select</th>
                </tr>
              </thead>
              <tbody id="available-data-table">
              </tbody>
                </table>
            <button class="w3-button w3-green w3-margin-top w3-right" id="availableSubmit" onclick="handleAvailableSubmit()">Submit</button>
        </div>
    </div>

    <div id="Registered" class="w3-container tab" style="display:none">
            <br>
            <div class="error-message" id="error-message-registered"></div>
            <div>
              <table class="w3-table-all w3-striped" >
                           <thead>
                             <tr class="w3-red">
                               <th>RID</th>
                               <th>Child Name</th>
                               <th>Age</th>
                               <th>Position</th>
                               <th>Gender</th>
                               <th>Jersey Number</th>
                               <th>Willing to Play Up</th>

                             </tr>
                           </thead>
                           <tbody id="registered-data-table">
                           </tbody>
                             </table>
            </div>
    </div>
</div>

<script>
let availableData;
let gameID;
function handleAvailableSubmit(){
const checkboxes = document.querySelectorAll('.select-row-available');
        const selectedIds = [];

        checkboxes.forEach((checkbox, index) => {
            if (checkbox.checked) {
                selectedIds.push(availableData[index].id);

                // Remove the row from the table
                const row = checkbox.closest('tr');

            }
        });

        var formData = {
                        playersRegistrationIDs: selectedIds,
                        gameID: gameID
                    };
         $('#error-message-available').text('');
         $('#error-message-registered').text('');
        $('#availableSubmit').prop('disabled', true);

                     $.ajax({
                                            type: 'POST',
                                            url: '/players', // Replace with your actual API endpoint
                                            contentType: 'application/json',
                                            data: JSON.stringify(formData),
                                            success: function(response,textStatus, jqXHR) {

                                                                    if (jqXHR.status === 200) {

                                                                             $('#error-message-available').text('successfully Saved');
                                                                             availableData=response.availablePlayers;

                                                                             generatePlayerContent(response);

                                                                    }

                                                                    else {
                                                                        $('#error-message-available').text('Error,Try Again');

                                                                    }
                                                                },
                                                                error: function(xhr, status, error) {
                                                                    console.error('Error:', error);
                                                                    $('#error-message-available').text('Failed to Load Data. Please try again later.');

                                                                }
                            });


}

function handleTournamentChange() {
    var selectElement = document.getElementById('gtnamepage');
    var selectedValue = selectElement.value;
    const gameContentDiv = $('#gameContent');
    gameContentDiv.empty();
    document.getElementById('gameContentView').style.display = 'none';
    $('#error-message-game-page').text("");
            $.ajax({
                type: 'GET',
                url: '/game?id=' + selectedValue, // Append id to the URL
                contentType: 'application/json',
                success: function(response,textStatus, jqXHR) {

                    if (jqXHR.status === 200) {

                        if(response.length===0){
                            $('#error-message-game-page').text('No Games Available');
                        }
                        else{
                             generateGameCards(response);
                        }

                    } else {
                        $('#error-message-game-page').text('Unexpected response format');

                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error:', error);
                    $('#error-message-game-page').text('Failed to Load Data. Please try again later.');

                }
            });
}

function generateGameCards(games) {
    const gameContentDiv = $('#gameContent');
    gameContentDiv.empty();
    games.forEach(function(game) {
        var gameDate = convertIsoToDateString(game.gameDate);

        var cardHtml =
            '<div class="w3-card-4 schedule-card" id="card-' + game.id + '">' +
                '<div class="schedule-header">' +
                    '<div><span>' + game.gname + '</span></div>' +
                    '<div>' +
                        '<i class="fa fa-eye" id="game-btn-' + game.id + '" onclick="loadGameContent(' + game.id + ', \'' + game.gname + '\')"></i>' +
                    '</div>' +
                '</div>' +
                '<div><i class="fa fa-calendar"></i><span class="w3-opacity"> ' + gameDate + '</span></div>' +
                '<div><i class="fa fa-map-marker"></i><span class="w3-opacity"> ' + game.location + '</span></div>' +
            '</div><br>';
        gameContentDiv.append(cardHtml);
    });
}

function calculateAge(dob) {
    // Parse the date of birth string into a Date object
    const birthDate = new Date(dob);
    const today = new Date();

    // Calculate the difference in years
    let age = today.getFullYear() - birthDate.getFullYear();

    // Adjust the age if the birth date hasn't occurred yet this year
    const monthDifference = today.getMonth() - birthDate.getMonth();
    const dayDifference = today.getDate() - birthDate.getDate();

    if (monthDifference < 0 || (monthDifference === 0 && dayDifference < 0)) {
        age--;
    }

    return age;
}

function loadGameContent(id,name){
    document.getElementById('gameValue').innerHTML = "# "+id+" - "+name;

    const availableDiv = $('#available-data-table');
    availableDiv.empty();

     $('#error-message-available').text('');

    const registeredDiv = $('#registered-data-table');
    registeredDiv.empty();
    openMail('gameContentView');
    document.getElementById('btnAvailable').click();

    $.ajax({
                    type: 'GET',
                    url: '/players?id=' + id, // Append id to the URL
                    contentType: 'application/json',
                    success: function(response,textStatus, jqXHR) {

                        if (jqXHR.status === 200) {

                            if(response.length===0){
                                $('#error-message-available').text('No Players Available');
                            }
                            else{
                                 availableData=response.availablePlayers;
                                 gameID=id;
                                 generatePlayerContent(response);

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

function generatePlayerContent(players){
    $('#error-message-available').text('');
    $('#error-message-registered').text('');
    availablePlayersData = players.availablePlayers;
    registeredPlayersData = players.registeredPlayers;

    const availableDiv = document.getElementById('available-data-table');
    availableDiv.innerHTML = '';

    const registeredDiv = document.getElementById('registered-data-table');
    registeredDiv.innerHTML = '';

    if(availablePlayersData.length===0){
    $('#error-message-available').text('No Players Available');
    }
    else{
        availablePlayersData.forEach(item => {
                            const row = document.createElement('tr');

                            const ridCell = document.createElement('td');
                            ridCell.textContent = item.id;
                            row.appendChild(ridCell);

                            const nameCell = document.createElement('td');
                            nameCell.textContent = item.child.cname;
                            row.appendChild(nameCell);

                            const dobCell = document.createElement('td');
                            dobCell.textContent = calculateAge(item.child.dob);
                            row.appendChild(dobCell);

                            const positionCell = document.createElement('td');
                            positionCell.textContent = item.child.position;
                            row.appendChild(positionCell);

                            const genderCell = document.createElement('td');
                            genderCell.textContent = item.child.gender;
                            row.appendChild(genderCell);

                            const jerseyNoCell = document.createElement('td');
                            jerseyNoCell.textContent = item.child.jerseyNo;
                            row.appendChild(jerseyNoCell);

                            const willingToPlayUpCell = document.createElement('td');
                            willingToPlayUpCell.textContent = item.willingToPlayUp ? 'Yes' : 'No';
                            row.appendChild(willingToPlayUpCell);

                            const selectCell = document.createElement('td');
                            const checkbox = document.createElement('input');
                            checkbox.type = 'checkbox';
                            checkbox.classList.add('select-row-available');
                            selectCell.appendChild(checkbox);
                            row.appendChild(selectCell);

                            availableDiv.appendChild(row);
        });
    }

       if(registeredPlayersData.length===0){
        $('#error-message-registered').text('No Players Available');
        }
        else{
            registeredPlayersData.forEach(item => {
                                const row = document.createElement('tr');

                                const ridCell = document.createElement('td');
                                ridCell.textContent = item.id;
                                row.appendChild(ridCell);

                                const nameCell = document.createElement('td');
                                nameCell.textContent = item.child.cname;
                                row.appendChild(nameCell);

                                const dobCell = document.createElement('td');
                                dobCell.textContent = calculateAge(item.child.dob);
                                row.appendChild(dobCell);

                                const positionCell = document.createElement('td');
                                positionCell.textContent = item.child.position;
                                row.appendChild(positionCell);

                                const genderCell = document.createElement('td');
                                genderCell.textContent = item.child.gender;
                                row.appendChild(genderCell);

                                const jerseyNoCell = document.createElement('td');
                                jerseyNoCell.textContent = item.child.jerseyNo;
                                row.appendChild(jerseyNoCell);

                                const willingToPlayUpCell = document.createElement('td');
                                willingToPlayUpCell.textContent = item.willingToPlayUp ? 'Yes' : 'No';
                                row.appendChild(willingToPlayUpCell);

                                registeredDiv.appendChild(row);
            });
        }


}






function onloadFunction() {
  document.getElementById('gameContentView').style.display = 'none';
  const tableBody = document.querySelector("#tournament-data-table tbody");

  $.ajax({
       type: 'GET',
       url: '/tournament', // Replace with your actual API endpoint
       success: function(response, textStatus, jqXHR) {
         if (jqXHR.status === 200) {
           const tableBody = document.querySelector("#tournament-data-table tbody");
           tableBody.innerHTML = ''; // Clear existing rows
           tournaments=response;
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
                 startDateCell.textContent = convertIsoToDateString(item.startDate);
                 row.appendChild(startDateCell);

                 const endDateCell = document.createElement('td');
                 endDateCell.textContent = convertIsoToDateString(item.endDate);
                 row.appendChild(endDateCell);

                 // Append the row to the table body
                 tableBody.appendChild(row);
           });
           populateDropdown(response);
         } else {
           $('#error-message-tournament-container').text('Try Again');
         }
       },
       error: function(error) {
         console.error('AJAX error:', error);
         $('#error-message-tournament-container').text('Try Again Later');
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

    var gameform = document.getElementById("gameForm");
    var gameNameInput = document.getElementById("gname");
    var glocationInput = document.getElementById("glocation");
    var gameDateInput = document.getElementById("gameDate");
    var gtInput = document.getElementById("gtname");


    function validateGameForm(){
        var isValid = true;

        // Clear previous error messages
        document.getElementById("gnameError").textContent = "";
        document.getElementById("gameDateError").textContent = "";
        document.getElementById("glocationError").textContent = "";
        document.getElementById("gtnameError").textContent = "";

        // Validate Game name
        if (gameNameInput.value.trim() === "") {
            document.getElementById("gnameError").textContent = "Game name is required.";
            isValid = false;
        }

        // Validate Game date
        var gameDate = new Date(gameDateInput.value);
        var today = new Date();
        if (gameDate <= today) {
            document.getElementById("gameDateError").textContent = "Game date must be in the future.";
            isValid = false;
        }

        // Validate location
        if (glocationInput.value.trim() === "") {
            document.getElementById("glocationError").textContent = "Location is required.";
            isValid = false;
        }

        // Validate Tournament
        if (gtInput.value.trim() === "") {
            document.getElementById("gtnameError").textContent = "Tournament is required.";
            isValid = false;
        }

        return isValid;

    }


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


    gameNameInput.addEventListener("input",validateGameForm);
    glocationInput.addEventListener("input",validateGameForm);
    gameDateInput.addEventListener("input",validateGameForm);
    gtInput.addEventListener("input",validateGameForm);

    gameForm.addEventListener("submit", function(event) {
            event.preventDefault(); // Prevent default form submission

            if (!validateGameForm()) {
                return; // Exit function early if validation fails
            }

            // Form data object
            var formData = {
                gname: gameNameInput.value,
                location: glocationInput.value,
                gameDate: gameDateInput.value,
                tid: gtInput.value
            };

            $('#gameSubmitButton').prop('disabled', true);

             $.ajax({
                                    type: 'POST',
                                    url: '/game', // Replace with your actual API endpoint
                                    contentType: 'application/json',
                                    data: JSON.stringify(formData),
                                    success: function(response) {
                                        if (response.message) {
                                            $('#error-message-game').text(response.message);

                                            setTimeout(function() {
                                                            clearForm();
                                                            document.getElementById('id02').style.display = 'none';

                                                            }, 2000);
                                        }else{
                                            $('#error-message-game').text('Try Again');
                                            $('#gameSubmitButton').prop('disabled', false);
                                        }
                                    },
                                    error: function(error) {
                                        console.error('Error:', error);
                                        $('#error-message-tournament').text('Try Again Later');
                                        $('#submitButton').prop('disabled', false);
                                    }
                    });


        });

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

    document.getElementById("gname").value = "";
    document.getElementById("glocation").value = "";
    document.getElementById("gameDate").value = "";
    document.getElementById("gtname").value = "";


    // Clear error messages
    document.getElementById("tnameError").textContent = "";
    document.getElementById("locationError").textContent = "";
    document.getElementById("organizerError").textContent = "";
    document.getElementById("startDateError").textContent = "";
    document.getElementById("endDateError").textContent = "";
    document.getElementById("error-message-tournament").textContent = "";

    document.getElementById("gnameError").textContent = "";
    document.getElementById("gameDateError").textContent = "";
    document.getElementById("glocationError").textContent = "";
    document.getElementById("gtnameError").textContent = "";




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
    x = document.getElementsByClassName("w3-bar-item");
    for (i = 0; i < x.length; i++) {
        x[i].classList.remove("w3-red");
    }
    document.getElementById(personName).style.display = "block";
    event.currentTarget.classList.add("w3-red");
}

var openTab = document.getElementById("firstTab");
openTab.click();


</script>
    <script>

        function populateDropdown(tournaments) {
            tournaments.forEach(tournament => {
                        $('#gtname').append(new Option("#"+tournament.id+"-"+tournament.tname, tournament.id));
                    });
            tournaments.forEach(tournament => {
                                    $('#gtnamepage').append(new Option("#"+tournament.id+"-"+tournament.tname, tournament.id));
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
            //fetchRegistration();
        });
        document.getElementById('btnRegistered').addEventListener('touchstart', function() {
            openTab('Registered', this);
            //fetchRegistration();
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
    </script>

</body>
</html>
