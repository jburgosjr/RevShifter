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
	<link rel="stylesheet" href="/css/exploreStyle.css">
	<title>Explore</title>
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
	                <img src="images/white_logo.png" class="logo">
	            </div>
	            <br>
            </li>
            <li>
            	<div class="userView">
	            	<img class="background z-depth-5" src="${user.defaultImage}" style="width:350px; heigth:150px;">
	            	<br>
	            	<br>
	            	<span class="white-text name">Explore:</span>
	                <span class="white-text email">${fn:toUpperCase(fn:substring(user.firstName, 0, 1))}${fn:toLowerCase(fn:substring(user.firstName, 1,fn:length(user.firstName)))} ${fn:toUpperCase(fn:substring(user.lastName, 0, 1))}${fn:toLowerCase(fn:substring(user.lastName, 1,fn:length(user.lastName)))}</span>
                </div>
            </li>
            <li>
            	<br>
				<br>
            	<div class="container center">
            		<a href="/myGarage" class="btn btn-large waves-effect waves-light z-depth-5" style="margin-bottom:1rem;  background:white; color:rgb(34, 0, 85); padding-top:.3rem;">
         
            			<i><img src="/images/icons/garage.png" style="width:3rem; height:3rem;;"></i>
            		</a>
            	
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
        <div class="container display-middle">
        	<div class="center-div">
        		  <div class="row">
				    <div class="col s12 ">
					<c:forEach items="${images}" var="image">
						<c:if test="${image.user.id != user.id}">
							<div class="card">
							<div class="card-content">
								  <span class="card-title deep-purple-text darken-4">
									   <a href="/profile/${image.user.id}"><img src="${image.user.defaultImage}" alt="" class="circle responsive-img"></a>
									  <a href="/profile/${image.user.id}" class="deep-purple-text text-darken-4"><p class="listName">${fn:toUpperCase(fn:substring(image.user.firstName, 0, 1))}${fn:toLowerCase(fn:substring(image.user.firstName, 1,fn:length(image.user.firstName)))} ${fn:toUpperCase(fn:substring(image.user.lastName, 0, 1))}${fn:toLowerCase(fn:substring(image.user.lastName, 1,fn:length(image.user.lastName)))}</p></a>
								  </span>
							</div>

								<div class="card-image">
							      <img src="${image.url}">
							    </div>
							    <div class="card-content">
							     <span class="card-title activator deep-purple-text text-darken-4">Show<i class=" small material-icons left deep-purple-text text-darken-4">comment</i></span>
							    </div>
							    <div class="card-reveal">
							      <span class="card-title grey-text text-darken-4">Comments<i class="material-icons right">close</i></span>

							    </div>
							  </div>
											     		
						</c:if>
					</c:forEach>
				    </div>
				  </div>
				  
        </div>
      </div>
     </div>


	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
    <script type="text/javascript" src="js/exploreScript.js"></script>
 </body>
</body>
</html>