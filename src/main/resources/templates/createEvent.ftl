
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <title>Add Event to ${userId}</title>

  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">


  <link rel="stylesheet" href="/js/bootstrap.min.css">
  <link rel="stylesheet" href="/js/bootstrap-theme.css">
  <link rel="stylesheet" href="/js/fontAwesome.css">
  <link rel="stylesheet" href="/js/hero-slider.css">
  <link rel="stylesheet" href="/js/owl-carousel.css">
  <link rel="stylesheet" href="/js/datepicker.css">
  <link rel="stylesheet" href="/js/tooplate-style.css">
  <link rel="stylesheet" href="/js/sidenav.css">
  <link rel="stylesheet" href="/js/button.css">

  <script src="/js/addEventPage.js"></script>

  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

  <script src="/js/modernizr-2.8.3-respond-1.4.2.min.js"></script>

  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>

<body class="pritty-body">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <#list friends as friend>
  	<a>${friend.firstName} ${friend.lastName}</a>
  </#list>
</div>

<section class="banner" id="top">
  <br>
  <span style="color:white;cursor:pointer;" onclick="openNav()"> <object align="right"><input type="button" class="buttoner" value="&#9776; Friends List"/></object></span>
  <object align="left"><a href="/Frienduler/user/${userId}/manageFriendsAndGroups"><input type="button" class="buttoner" value="Manage Friends/Groups"/></a></object>
  <object align="center"><a href="/Frienduler/user/${userId}/compare"><input type="button" class="buttoner" value="Compare Schedules"/></a></object>
  <div id = "main">
    <div class="container">
      <div class="row">
        <div class="col-md-7 col-md-offset-2">
            <div class="logo">
              <img src="/js/logo.png" width="350" height="150" alt="Picture Cannot Load"/>
            </div>
          
        </div>
        <div class="col-md-6 col-md-offset-3">
        
          <section id="first-tab-group" class="tabgroup">
            <div id="tab1">
              <div class="submit-form">
                  <form id="form-submit" action="" method="get">
                      <div class="row">
                          <div class="col-md-12">
                              <fieldset>
                                  <label>Create an event:</label>
                                  <input id="eventName" type="text" class="form-control date" placeholder="Event name..." required>
                              </fieldset>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-md-6">
                              <fieldset>
                                  <label for="Start Date">Start Date:</label>
                                  <input type="date" id="startDate" class="form-control date" placeholder="Select date..." required>
                              </fieldset>
                          </div>
                          <div class="col-md-6">
                              <fieldset>
                                  <label for="from" style="width:100%;">Start Time:</label>
                                  <input required type="time" id="startTime">
                              </fieldset>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-md-6">
                              <fieldset>
                                  <label for="return">End Date:</label>
                                  <input name="return" type="date" class="form-control date" id="endDate" placeholder="Select date..." required="">

                              </fieldset>
                          </div>
                          <div class="col-md-6">
                              <fieldset>
                                  <label for="to" style="width:100%">End Time:</label>
                                  <input required type="time" id="endTime">
                              </fieldset>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-md-6">
                              <fieldset>
                                  <button class="btn" type="submit" required="required">Repeat every day</button>
                              </fieldset>
                          </div>

                          <div class="col-md-6">
                              <fieldset>
                                  <button id="form-submit" class="btn" onclick="addEvent(&quot;${userId}&quot;)">Set Event Now</button>
                              </fieldset>
                          </div>
                      </div>

                  </form>
              
             	 </div>
              
              <div>
              </div>
              <object align="center"><a href="/Frienduler/user/${userId}"><input type="button" class="buttoner" value="Return to Home"/></a></object>
            </div>
          </section>
        </div>
      </div>
    </div>
    </div>
  </section>
  <script>
    function openNav() {
      document.getElementById("mySidenav").style.width = "250px";
      document.getElementById("main").style.marginRight = "250px";
    }

    function closeNav() {
      document.getElementById("mySidenav").style.width = "0";
      document.getElementById("main").style.marginRight = "0";
    }
  </script>
</body>
</html>
