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
	<link rel="stylesheet" href="/css/profileStylecss.css">
	<title>Profile</title>
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
	            	<span class="white-text name ">${fn:toUpperCase(fn:substring(user.firstName, 0, 1))}${fn:toLowerCase(fn:substring(user.firstName, 1,fn:length(user.firstName)))} ${fn:toUpperCase(fn:substring(user.lastName, 0, 1))}${fn:toLowerCase(fn:substring(user.lastName, 1,fn:length(user.lastName)))}</span>
	            	<span class="white-text email ">${user.city}, ${user.state} </span>
                </div>
            </li>
            <li>
            	<div class="container center">
				<c:choose>
					<c:when test="${mainUser.id == user.id }">
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${check != null }">
								<form action="/unfollow" method="POST">
									<input type="hidden" name="_method" value="delete">
									<input type="hidden" value="${user.id}" name="unfollowId">
									<button class="btn waves-effect waves-light " type="submit" style="background-color:rgb(34, 0, 85); color:white; border: solid 1px white;" name="action">Following</button>
								</form>
							</c:when>
							<c:otherwise>
								<form:form action="/follow/${user.id}" method="POST" modelAtrribute="follower">
									<input type="hidden" value="${user.id}" name="follower">
									 <button class="btn waves-effect waves-light " style="background-color:white; color:rgb(34, 0, 85);" type="submit" name="action">Follow
										<i class="material-icons right">person_add</i>
									</button>
								</form:form>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>

            	</div>
            	<br>
            	<div class="container center">
      				<a href="/home" class="btn btn-large waves-effect waves-light z-depth-5" style="margin-bottom:1rem;  background:white; color:rgb(34, 0, 85); padding-top:.3rem; margin-left:.6rem;">
         
            			<i class="material-icons" style="font-size:3rem;">home</i>
            		</a>>
            	
            		<a href="/following/${mainUser.id}" class="btn btn-large waves-effect waves-light z-depth-5 " style="margin-bottom:1rem; background:white;  color:rgb(34, 0, 85);">
            			<i class="material-icons center" style="font-size:3rem;">group</i>
            		</a>
            		<a href="/followers/${mainUser.id}" class="btn btn-large waves-effect waves-light z-depth-5" style="margin-bottom:1rem;  background:white; color:rgb(34, 0, 85);">
         
            			<i class="material-icons" style="font-size:3rem;">people_outline</i>
            		</a>
            		<a href="/user/${mainUser.id}/settings" class="btn btn-large waves-effect waves-light z-depth-5" style="margin-bottom:1rem; 
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
					          <img src="${car.coverImage}">
					          <span class="card-title">${car.model}</span>
					        </div>
					        <div class="card-action">
					          <a href="/profile/garage/${car.id}">${car.year } ${car.make} ${car.subModel}</a>
					        </div>
					      </div>
					    </div>
					  
				</c:forEach>
			</div>
		</div>
     </div>


	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
    <script type="text/javascript" src="js/.js"></script>
 </body>
</body>
</html>