<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	   
	   
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
	  <link rel="stylesheet" href="/css/logRegStyle.css"> 
	<title>Login</title>
</head>			
				<div class="alert-box container  " style="visibility:hidden; <c:out value="${error}"/> ">
					<div class="row" id="alert_box">
					  <div class="col s12 m12">
					    <div class="card <c:out value="${color}" /> accent-4">
					      <div class="row">
					        <div class="col s12 m10 ">
					          <div class="card-content white-text center">
					             <form:errors path="userReg.*" element="p" cssClass="alert alert-danger"/>
					          	 <c:out value="${successText}" escapeXml="false"/>
								 <c:out value="${error2Text}" escapeXml="false"/>
					          </div>
					        </div>
					        <div class="chip right <c:out value="${color}" /> accent-4" style="margin-right:.8rem;">
					          <i class="close material-icons white-text" id="alert_close" aria-hidden="true">close</i>
					        </div>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
		
		<div class="center-div center z-depth-5" >
			<img class="logo" alt="logo" src="images/purp_logo.png">
			<div class="flash-messages">
			</div>
			<div class="container forms">
				<div class="row tabs-edit ">
				    <div class="col s12">
				      <ul class="tabs z-depth-1" style="background-color:transparent;">
				        <li class="tab col s6  "><a href="#test1">Login</a></li>
				        <li class="tab col s6"><a href="#test2">Register</a></li>
				      </ul>
				    </div>
				    <div id="test1" class="col s12">
				    	<br>
				    	<div class="loginForm">
							<form method="POST" action="/Login">
								<div class="input-field col s12">
									<input id="email" type="email" class="validate" name="email">
	          						<label for="email">Email</label>
								</div>
								<div class="input-field col s12">
						          <input id="password" type="password" class="validate" name="password">
						          <label for="password">Password</label>
						        </div>
						        <button class="btn waves-effect waves-light" style="background-color:rgb(34, 0, 85);" type="submit" name="action">login
							    	<i class="material-icons right">time_to_leave</i>
							    </button>
							</form>
						</div>
				    </div>
				    <div id="test2" class="col s12">
					    <div class="form-scroll-overflow">
					    	<form:form action="/register" method="POST" modelAttribute="userReg">
					    		<div class="input-field col s12">
					    			
					    			<form:label for="firstName" path="firstName">First Name</form:label>
					    			<form:input path="firstName" cssClass="validate" cssId="first_name" type="text"/>
					    		</div>
					    		<div class="input-field col s12">
					    			
					    			<form:label for="lastName" path="lastName">Last Name</form:label>
					    			<form:input path="lastName" cssClass="validate" cssId="last_name" type="text"/>
					    		</div>
					    		<div class="input-field col s12">
					    			<form:label for="email" path="email">Email</form:label>
					    			<form:input path="email" cssClass="validate" cssId="email" type="email"/>
					    		</div>
					    		<div class="input-field col s10">
									<form:select  path="state" >
										<form:option value="AL">Alabama (AL)</form:option>
										<form:option value="AK">Alaska (AK)</form:option>
										<form:option value="AZ">Arizona (AZ)</form:option>
										<form:option value="AR">Arkansas (AR)</form:option>
										<form:option value="CA">California (CA)</form:option>
										<form:option value="CO">Colorado (CO)</form:option>
										<form:option value="CT">Connecticut (CT)</form:option>
										<form:option value="DE">Delaware (DE)</form:option>
										<form:option value="DC">District Of Columbia (DC)</form:option>
										<form:option value="FL">Florida (FL)</form:option>
										<form:option value="GA">Georgia (GA)</form:option>
										<form:option value="HI">Hawaii (HI)</form:option>
										<form:option value="ID">Idaho (ID)</form:option>
										<form:option value="IL">Illinois (IL)</form:option>
										<form:option value="IN">Indiana (IN)</form:option>
										<form:option value="IA">Iowa (IA)</form:option>
										<form:option value="KS">Kansas (KS)</form:option>
										<form:option value="KY">Kentucky (KY)</form:option>
										<form:option value="LA">Louisiana (LA)</form:option>
										<form:option value="ME">Maine (ME)</form:option>
										<form:option value="MD">Maryland (MD)</form:option>
										<form:option value="MA">Massachusetts (MA)</form:option>
										<form:option value="MI">Michigan (MI)</form:option>
										<form:option value="MN">Minnesota (MN)</form:option>
										<form:option value="MS">Mississippi (MS)</form:option>
										<form:option value="MO">Missouri (MO)</form:option>
										<form:option value="MT">Montana (MT)</form:option>
										<form:option value="NE">Nebraska (NE)</form:option>
										<form:option value="NV">Nevada (NV)</form:option>
										<form:option value="NH">New Hampshire (NH)</form:option>
										<form:option value="NJ">New Jersey (NJ)</form:option>
										<form:option value="NM">New Mexico (NM)</form:option>
										<form:option value="NY">New York (NY)</form:option>
										<form:option value="NC">North Carolina (NC)</form:option>
										<form:option value="ND">North Dakota (ND)</form:option>
										<form:option value="OH">Ohio (OH)</form:option>
										<form:option value="OK">Oklahoma (OK)</form:option>
										<form:option value="OR">Oregon (OR)</form:option>
										<form:option value="PA">Pennsylvania (PA)</form:option>
										<form:option value="RI">Rhode Island (RI)</form:option>
										<form:option value="SC">South Carolina (SC)</form:option>
										<form:option value="SD">South Dakota (SD)</form:option>
										<form:option value="TN">Tennessee (TN)</form:option>
										<form:option value="TX">Texas (TX)</form:option>
										<form:option value="UT">Utah (UT)</form:option>
										<form:option value="VT">Vermont(VT)</form:option>
										<form:option value="VA">Virginia(VA)</form:option>
										<form:option value="WA">Washington(WA)</form:option>
										<form:option value="WV">West Virginia(WV)</form:option>
										<form:option value="WI">Wisconsin(WI)</form:option>
										<form:option value="WY">Wyoming(WY)</form:option>
									</form:select>
									<form:label path="state" >State</form:label>
					    		</div>
					    		<div class="input-field col s12">
					    			<form:label for="city" path="city">City</form:label>
					    			<form:input path="city" cssClass="validate"  type="text"/>
					    		</div>
								<div class="input-field col s12">
					    			<form:label for="password" path="password">Password</form:label>
					    			<form:input path="password" cssClass="validate"  type="password"/>
					    		</div>
					    		<div class="input-field col s12">
					    			<form:label for="passwordConfirmation" path="passwordConfirmation">Password confirmation</form:label>
					    			<form:input path="passwordConfirmation" cssClass="validate"  type="password"/>
					    		</div>
					    		<button class="btn waves-effect waves-light" style="background-color:rgb(34, 0, 85);" type="submit" name="action">Register
							    	<i class="material-icons right">person_add</i>
							    </button>
					    	</form:form>
					    </div>
				    </div>
				    
				  </div>
				
			</div>
		</div>


	
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
    <script type="text/javascript" src="js/logRegScript.js"></script>
</body>
</html>