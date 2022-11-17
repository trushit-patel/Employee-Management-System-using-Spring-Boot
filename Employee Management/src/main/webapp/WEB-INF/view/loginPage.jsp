<html>
<head></head>
<body onload="getLocation()">
   <h1>Login</h1>
   <form name='f' id="form-id" action="/login" method='POST' onsubmit="addLocation()">
      <table>
         <tr>
            <td>User:</td>
            <td><input type='text' name='username' value=''></td>
         </tr>
         <tr>
            <td>Password:</td>
            <td><input type='password' name='password' /></td>
         </tr>
         <tr>
            <td><input name="submit" type="submit" value="submit" /></td>
         </tr>
      </table>
  </form>
   <script>
 //  var x = document.getElementById("demo");
   
   function getLocation() {
	  
     if (navigator.geolocation) {
       navigator.geolocation.getCurrentPosition(showPosition,showError);
     } else {
       alert("Geolocation is not supported by this browser.");
     }
     
   }

   function showPosition(position) {
     
     let {latitude,longitude} = position.coords;
     let uri = 'https://api.opencagedata.com/geocode/v1/json?q='+latitude+','+longitude+'&key=2054a7cc5f4447028d4d95c27e48782b';
     
     fetch(uri)
     .then(response=>response.json()).then(result=>{
    	 
    	 let {country, city, postcode, suburb, county, road} = result.results[0].components;
    	 addLocation({country, city, postcode, suburb, county, road}.stringify());
     })
   }
   
   function addLocation(x){
	   
	    var form=document.getElementById('form-id');//retrieve the form as a DOM element

	    var input = document.createElement('input');//prepare a new input DOM element
	    input.setAttribute('name', "location");//set the param name
	    input.setAttribute('value', x);//set the value
	    input.setAttribute('type', "hidden")//set the type, like "hidden" or other

	    form.appendChild(input);//append the input to the form

	    form.submit();//send with added input   
   }
   
   function showError(error) {
	   
	   switch(error.code) {
	     case error.PERMISSION_DENIED:
	       alert("User denied the request for Geolocation.");
	       break;
	     case error.POSITION_UNAVAILABLE:
	       alert("Location information is unavailable.");
	       break;
	     case error.TIMEOUT:
	       alert("The request to get user location timed out.");
	       break;
	     case error.UNKNOWN_ERROR:
	       alert("An unknown error occurred.");
	       break;
	   }
	 }
   </script>
</body>
</html>