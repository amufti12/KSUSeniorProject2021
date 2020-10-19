const app = document.getElementById('root');

function myApiRequestFunction()
	{
	// Create a request variable and assign a new XMLHttpRequest object to it.
	var request = new XMLHttpRequest();
	var loginStatus;
	var user = document.getElementById('usernameID').value;
	var pass = document.getElementById('passwordID').value;
	var url = "http://a2b538e9a13274218be989a87af346ab-1215678508.us-east-1.elb.amazonaws.com:8080/validateUser?username=" + user + "&password=" + pass;

	// Open a new connection, using the GET request on the URL endpoint
	request.open('GET', url, true);
	console.log('a');

	

	// Send request
	request.send();
	console.log('b');
	
	request.onload = () => {
  		// Begin accessing JSON data here
  		console.log(request);
		var data = JSON.parse(request.response);
	
		if (request.status >= 200 && request.status < 400) {
  			loginStatus = data.successfulLogin;
  			console.log(loginStatus);
  		}
		else {
			location.replace("loginfailview.html")
  			console.log('error');
		}
		
		console.log(user);
		
		if(loginStatus)
		{
			if(user == 'jdoe1')
			{
				location.replace("providerview.html");
			}
  			if(user == 'james2')
  			{
  				location.replace("patientview.html");
  			}
  			if(user != 'jdoe1' && user != 'james2')
  			{
  				location.replace("loginfailview.html");
  			}
  		}
  		else
  		{
  			location.replace("loginfailview.html");
  		}
  					
	}
	
	console.log(loginStatus);
	
  }