const app = document.getElementById('root');

function myApiRequestFunction()
	{
	// Create a request variable and assign a new XMLHttpRequest object to it.
	var request = new XMLHttpRequest();
	var url = "http://a2b538e9a13274218be989a87af346ab-1215678508.us-east-1.elb.amazonaws.com:8080/validateUser?username=jdoe1&password=password";
	var loginStatus;
	//var user = document.getElementById('username')
	//var pass

	// Open a new connection, using the GET request on the URL endpoint
	request.open('GET', url, true);
	console.log('a');

	request.onload = function () {
  		// Begin accessing JSON data here
		var data = JSON.parse(this.response);
	
		if (request.status >= 200 && request.status < 400) {
  			loginStatus = data.successfulLogin;
  		}
		else {
  			console.log('error');
		}		
	}

	// Send request
	request.send();
	console.log('b');
	
	if(loginStatus)
 		location.replace("providerview.html");
  	else
  		location.replace("loginfailview.html");
  }