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
    <style>
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        .dropdown-content input {
            box-sizing: border-box;
            width: 100%;
            padding: 12px;
            border: none;
        }
        .dropdown-content div {
            padding: 12px;
            cursor: pointer;
        }
        .dropdown-content div:hover {
            background-color: #ddd;
        }
        .show {display: block;}
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
      <input class="w3-input w3-border w3-margin-bottom" type="text" id="dropdownInput" placeholder="Select a tournament" onfocus="toggleDropdown()" required>
      <div id="dropdownContent" class="dropdown-content">
      <input type="text" id="searchInput" placeholder="Search..." onkeyup="filterDropdown()"></div>
      <input type="hidden" id="selectedTournamentId" required>
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
          <i class="fa fa-plus" onclick="document.getElementById('id02').style.display='block'"></i>
        </p>
      </header>
</div>

<script>
function onloadFunction() {
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
    var gtInput = document.getElementById("selectedTournamentId");


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
    document.getElementById("dropdownInput").value = "";
    document.getElementById("searchInput").value = "";

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
            const dropdownContent = document.getElementById('dropdownContent');
            tournaments.forEach(tournament => {
                const div = document.createElement('div');
                div.textContent = "#"+tournament.id+"-"+tournament.tname;
                div.setAttribute('data-id', tournament.id);
                div.addEventListener('click', () => {
                    // Update the input field and hidden input field
                    document.getElementById('dropdownInput').value = tournament.tname;
                    document.getElementById('selectedTournamentId').value = tournament.id;
                    document.getElementById("gtnameError").textContent = "";
                    // Hide the dropdown
                    document.getElementById('dropdownContent').classList.remove('show');
                });
                dropdownContent.appendChild(div);
            });
        }

        function filterDropdown() {
            const input = document.getElementById('searchInput');
            const filter = input.value.toLowerCase();
            const items = document.getElementById('dropdownContent').getElementsByTagName('div');

            Array.from(items).forEach(item => {
                const text = item.textContent || item.innerText;
                item.style.display = text.toLowerCase().includes(filter) ? '' : 'none';
            });
        }

        function toggleDropdown() {
            document.getElementById('dropdownContent').classList.toggle('show');
        }


        // Close the dropdown if the user clicks outside of it
        window.onclick = function(event) {
            if (!event.target.matches('#dropdownInput')) {
                const dropdowns = document.getElementsByClassName("dropdown-content");
                Array.from(dropdowns).forEach(dropdown => {
                    if (dropdown.classList.contains('show')) {
                        dropdown.classList.remove('show');
                    }
                });
            }
        }
    </script>

</body>
</html>
