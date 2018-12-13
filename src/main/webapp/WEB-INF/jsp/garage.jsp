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
	<link rel="stylesheet" href="/css/garageStyle.css">
	<title>My Garage</title>
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
	            	<span class="white-text name ">My Garage</span>
	                <span class="white-text email ">${fn:toUpperCase(fn:substring(user.firstName, 0, 1))}${fn:toLowerCase(fn:substring(user.firstName, 1,fn:length(user.firstName)))} ${fn:toUpperCase(fn:substring(user.lastName, 0, 1))}${fn:toLowerCase(fn:substring(user.lastName, 1,fn:length(user.lastName)))}</span>
                </div>
            </li>
            <li>
            	<br>
            	<br>
            	<div class="container center">
      				<a href="/home" class="btn btn-large waves-effect waves-light z-depth-5" style="margin-bottom:1rem;  background:white; color:rgb(34, 0, 85); padding-top:.3rem; margin-left:.6rem;">
         
            			<i class="material-icons" style="font-size:3rem;">home</i>
            		</a>>
            	
            		<a href="/following/${user.id}" class="btn btn-large waves-effect waves-light z-depth-5 " style="margin-bottom:1rem; background:white;  color:rgb(34, 0, 85);">
            			<i class="material-icons center" style="font-size:3rem;">group</i>
            		</a>
            		<a href="/followers/${user.id}" class="btn btn-large waves-effect waves-light z-depth-5" style="margin-bottom:1rem;  background:white; color:rgb(34, 0, 85);">
         
            			<i class="material-icons" style="font-size:3rem;">people_outline</i>
            		</a>
            		<a href="/user/${user.id}/settings" class="btn btn-large waves-effect waves-light z-depth-5" style="margin-bottom:1rem; 
            		 background:white; color:rgb(34, 0, 85); padding-top:.3rem;">
         
            			<i><img src="/images/icons/settings.png" style="width:3rem; height:3rem;;"></i>
            		</a>
            	</div>
            </li>
        </ul>
     </div>
     <div class="container">
     	<div class="center-div">
	     	<div class="row">
				<c:forEach items="${user.userVehicles}" var="car">
					
					    <div class="col s12 m4" >
					      <div class="card" style="width:222.328px; height:179.047px;">
					        <div class="card-image" style="width:222.328px; height:125.047px;">
							  <a href="#delVehicle${car.id}" class="modal-trigger"> <i class=" small material-icons red-text text-accent-4" style="z-index:1; position:absolute; margin-left:13rem; margin-top:.3rem;">delete_forever</i></a>
					          <div id="delVehicle${car.id}" class="modal ">
							    <div class=" center modal-content">
							      <h4 class="red-text text-accent-4">Are you sure you want to delete ${car.year } ${car.make} ${car.subModel}?</h4>
							      <img src="${car.coverImage}" style="width:222.328px; height:130px; margin:auto;">
							      
							    </div>
							    <div class="modal-footer">
							      <a href="#!" class="modal-close waves-effect waves-green btn-flat">Nah</a>
							      <form action="/delVehicle" method="post">
							      	<input type="hidden" name="_method" value="delete">
							      	<input type="hidden" name="vehicleId" value="${car.id}">
							      	<button type="submit" class="modal-close waves-effect waves-red btn-flat">Yeee</button>
							      </form>
							    </div>
							  </div>
					          <img src="${car.coverImage}">
					          <span class="card-title">${car.model}</span>
					        </div>
					        <div class="card-action">
					          <a href="/myGarage/${car.id}">${car.year } ${car.make} ${car.subModel}</a>
					        </div>
					      </div>
					    </div>
					  
				</c:forEach>
			</div>
			  			   			   
			
		   
	       <div id="addVehicle" class="modal  center">
				    <div class="modal-content ">
				      <h3 class="header"><u>Add a Vehicle</u></h3>
				      <div class="container">
				      	<form:form action="/addVehicle" method="POST" modelAttribute="addVehicle" enctype="multipart/form-data">
				      	<div class="input-field col s12">
					    	<form:label for="make" path="make">Make(Manufacturer)</form:label>
					    	<form:input path="make" type="text"/>
					    </div>
					    <div class="input-field col s12">
					    	<form:label for="model" path="model">Model</form:label>
					    	<form:input path="model" type="text"/>
					    </div>
					    <div class="input-field col s12">
					    	<form:label for="subModel" path="subModel">Sub Model</form:label>
					    	<form:input path="subModel" type="text"/>
					    </div>
					    <div class="input-field col s12">
					    	<form:label for="year" path="year">Model Year</form:label>
					    	<form:input path="year" type="text"/>
					    </div>
					     <div class="input-field col s12">
					    	<form:label for="engine" path="engine">Engine</form:label>
					    	<form:input path="engine" type="text"/>
					    </div>
					    
					   <div class="file-field input-field col s12">
                              <div class="btn waves-effect waves-light" style="background-color:rgb(34, 0, 85);">
                                  <span><i class="material-icons" style="font-size:2rem;">image</i></span>
                                  <input type="file" name="file" id="image" required>
                              </div>
                              <div class="file-path-wrapper">
                    
                                <input class="file-path validate" type="text" placeholder="<- Upload Cover Image" disabled>
                              </div>
                          </div>
					    <button class="btn waves-effect waves-light" style="background-color:rgb(34, 0, 85);" type="submit" name="action">Store Vehicle
							    	<i class="material-icons right">directions_car</i>
						</button>
				      </form:form>
				      </div>
				      
				    </div>
			</div>
			<a href="#addVehicle" class="btn-floating modal-trigger right" style="margin:.7rem; background:rgb(34, 0, 85);"><i class="large material-icons"><img src="/images/icons/add-car-2.png" style="width:2rem; height:2rem; padding-top:.2rem;"></i></a>
		</div>
     </div>

	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
    <script type="text/javascript" src="js/garageScript.js"></script>
 </body>
</body>
</html>