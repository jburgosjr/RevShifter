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
	<link rel="stylesheet" href="/css/homiesStyle.css">
	<title>Following</title>
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
	            	<span class="white-text name">Who you follow:</span>
	                <span class="white-text email">${fn:toUpperCase(fn:substring(user.firstName, 0, 1))}${fn:toLowerCase(fn:substring(user.firstName, 1,fn:length(user.firstName)))} ${fn:toUpperCase(fn:substring(user.lastName, 0, 1))}${fn:toLowerCase(fn:substring(user.lastName, 1,fn:length(user.lastName)))}</span>
                </div>
            </li>
            <li>
            	<br>
            	<br>
            	<div class="container center">
      				<a href="/myGarage" class="btn btn-large waves-effect waves-light z-depth-5" style="margin-bottom:1rem;  background:white; color:rgb(34, 0, 85); padding-top:.3rem; margin-left:0.7rem;">
         
            			<i><img src="/images/icons/garage.png" style="width:3rem; height:3rem;"></i>
            		</a>>
            	
            		<a href="/home" class="btn btn-large waves-effect waves-light z-depth-5 " style="margin-bottom:1rem; background:white;  color:rgb(34, 0, 85);">
            			<i class="material-icons center" style="font-size:3rem;">home</i>
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
        <div class="container display-middle ">
        	<div class="center-div">
        		  <div class="row">
				    <div class="col s12  ">
				    	 <a href="/explore" class="btn-floating btn-large waves-effect waves-light deep-purple darken-4 right" style="margin:.7rem; "><i><img src="/images/icons/explore.png" style="width:2rem; height:2rem; padding-top:.2rem; margin-top:.6rem;"></i></a>
						 <div class="container">
							 <ul class="collection listFS">
								<c:forEach items="${following}" var="follow">
									<li class="collection-item avatar ">
								      <a href="/profile/${follow.follower.id }"><img src=${follow.follower.defaultImage } alt="" class="circle"></a>
								      <a href="/profile/${follow.follower.id }"><span class="title text-spacing-list deep-purple-text darken-4">${fn:toUpperCase(fn:substring(follow.follower.firstName, 0, 1))}${fn:toLowerCase(fn:substring(follow.follower.firstName, 1,fn:length(follow.follower.firstName)))} ${fn:toUpperCase(fn:substring(follow.follower.lastName, 0, 1))}${fn:toLowerCase(fn:substring(follow.follower.lastName, 1,fn:length(follow.follower.lastName)))}</span></a>
								      <p class="text-spacing-list">${follow.follower.city}<br>
								         ${follow.follower.state}
								      </p>
							
								    </li>
								</c:forEach>
								
							 </ul>
						 </div>
				    </div>
				  </div>
				  
        </div>
      </div>
     </div>


	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
    <script type="text/javascript" src="/js/homieScript.js"></script>
 </body>
</body>
</html>