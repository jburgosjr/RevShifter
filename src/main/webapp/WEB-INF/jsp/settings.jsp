<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
	<link rel="stylesheet" href="/css/settingStyle.css">
	<title>Settings</title>
</head>
<body>
     <a href="#logoutPrompt" class="btn-floating modal-trigger deep-purple darken-4 right" style="margin:.7rem;"><i class="large material-icons">directions_run</i></a>
       <div id="logoutPrompt" class="modal deep-purple-text center">
		    <div class="modal-content ">
		      <img src="/images/purp_logo.png" class="logo">
		      <h5>you sure you want to logout?</h5>
		    </div>
		    <div class="modal-footer ">
		      <a href="#!" class="modal-close waves-effect waves-green btn-flat">Nah</a>
		      	
		      <a href="/logout" class="modal-close waves-effect waves-red btn-flat">Yeee</a>
		    </div>
	</div>
 	 <div class="container">
          <ul id="slide-out" class="side-nav fixed z-depth-5 ">
            <li class="center">
	            <div class="userView">
	                <img src="/images/white_logo.png" class="logo">
	            </div>
	            <br>
            </li>
            <li>
            	<div class="userView">
	            	<img class="background z-depth-5" src="${user.defaultImage}" style="width:350px; heigth:150px;">
	            	<br>
	            	<br>
	            	<span class="white-text name">Settings</span>
	                <span class="white-text email">${fn:toUpperCase(fn:substring(user.firstName, 0, 1))}${fn:toLowerCase(fn:substring(user.firstName, 1,fn:length(user.firstName)))} ${fn:toUpperCase(fn:substring(user.lastName, 0, 1))}${fn:toLowerCase(fn:substring(user.lastName, 1,fn:length(user.lastName)))}</span>
                </div>
            </li>
            <li>
            	<br>
            	<br>
            	<div class="container center">
      				<a href="/myGarage" class="btn btn-large waves-effect waves-light z-depth-5" style="margin-bottom:1rem;  background:white; color:rgb(34, 0, 85); padding-top:.3rem; margin-left:.6rem;">
         
            			<i><img src="/images/icons/garage.png" style="width:3rem; height:3rem;;"></i>
            		</a>>
            	
            		<a href="/following/${user.id}" class="btn btn-large waves-effect waves-light z-depth-5 " style="margin-bottom:1rem; background:white;  color:rgb(34, 0, 85);">
            			<i class="material-icons center" style="font-size:3rem;">group</i>
            		</a>
            		<a href="/followers/${user.id}" class="btn btn-large waves-effect waves-light z-depth-5" style="margin-bottom:1rem;  background:white; color:rgb(34, 0, 85);">
         
            			<i class="material-icons" style="font-size:3rem;">people_outline</i>
            		</a>
            		<a href="/home" class="btn btn-large waves-effect waves-light z-depth-5" style="margin-bottom:1rem; 
            		 background:white; color:rgb(34, 0, 85);">
         
            			<i class="material-icons" style="font-size:3rem;">home</i>
            		</a>
            	</div>
            </li>
        </ul>
    
     </div>
     
 <div class="alert-box container  " style="visibility:hidden; <c:out value="${error}"/> ">
					<div class="row right" id="alert_box" style="width:60rem;">
					  <div class="col s12 m12">
					    <div class="card <c:out value="${color}" /> accent-4">
					      <div class="row">
					        <div class="col s12 m10 ">
					          <div class="card-content white-text center">
					             <form:errors path="user.*" element="p" cssClass="alert alert-danger"/>
					          	
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
		    <br>
		    <br>
			<div class="container forms">
				<div class="row tabs-edit ">
				    <div class="col s12">
				      <ul class="tabs z-depth-1" style="background-color:transparent;">
				        <li class="tab col s6  "><a href="#test1">Main Info</a></li>
				        <li class="tab col s6"><a href="#test2">Profile Image</a></li>
				      </ul>
				    </div>
				    <div id="test1" class="col s12">
				    	<br>
					    <div class="form-scroll-overflow">
					    	<form:form action="/updateUserInfo/${user.id}" method="POST" modelAttribute="user">
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
					    		<form:hidden path="password"/>
					    		<form:hidden path="defaultImage"/>
					    		<button class="btn waves-effect waves-light" style="background-color:rgb(34, 0, 85);" type="submit" name="action">Update
							    	<i class="material-icons right">sync</i>
							    </button>
					    	</form:form>
					    </div>
				   
				    
				  </div>
				   <div id="test2" class="col s12">
						<form action="/settings/addDefaultPic" method="POST" enctype="multipart/form-data" class="upload-form col s12">
                          <div class="file-field input-field col s12">
                              <div class="btn waves-effect waves-light" style="background-color:rgb(34, 0, 85);">
                                  <span><i class="material-icons" style="font-size:2rem;">image</i></span>
                                  <input type="file" name="file" id="image" required>
                              </div>
                              <div class="file-path-wrapper">
                                <input class="file-path validate" type="text" placeholder="Upload Image">
                              </div>
                          </div>
                     
                          <button class="btn waves-effect waves-light" style="background-color:rgb(34, 0, 85);" type="submit" name="action">Upload
							    	<i class="material-icons right">file_upload</i>
					      </button>
               
                      </form>
				   </div>
				
			</div>
		</div>
	</div>
	
	

	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
    <script type="text/javascript" src="/js/settingScript.js"></script>
 </body>
</body>
</html>