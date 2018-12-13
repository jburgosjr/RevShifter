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
	<link rel="stylesheet" href="/css/profileCarInfoStyle.css">
	<title>Car Info</title>
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
            	<div class="userView" >
	            	<img class="background z-depth-5" src="${vehicle.coverImage}" style="width:300px; heigth:208px;">
	            	<br>
	            	<br>
	            	<span class="white-text name ">${vehicle.model}</span>
	                <span class="white-text email ">${vehicle.year} ${vehicle.make} ${vehicle.subModel}
	                </span>
                </div>
            </li>
            <li>
            	<br>
            	<br>
            	<div class="container center">
      				<a href="/myGarage" class="btn btn-large waves-effect waves-light z-depth-5" style="margin-bottom:1rem;  background:white; color:rgb(34, 0, 85); padding-top:.3rem; margin-left:0.7rem;">
         
            			<i><img src="/images/icons/garage.png" style="width:3rem; height:3rem;"></i>
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
     			<c:forEach items="${vehicle.images}" var="image">
     				<div class="col s12 m4" >
					      <div class="card" style="width:222.328px; height:179.047px;">
					        <div class="card-image" style="width:222.328px; height:125.047px;">
					          <img src="${image.url}" width=222.31 height=145.89>
					          
					        </div>
					        <div class="card-content center">

					          <a href="#comment${image.id}" class="waves-effect waves-light btn-small modal-trigger"><i class="material-icons deep-purple-text text-darken-4">comment</i></a>
					          <div id="comment${image.id}" class="modal">
								    <div class="modal-content">
								    	<p class="card-title grey-text counter" style="margin-top:.3rem;">${fn:length(image.usersLiked)} Revs <img src="/images/icons/rev-select.png" style="width:2.3rem; height:2.3rem;"></p>
								    	<ul class="collection listFS">
											<c:forEach items="${image.comments}" var="comment">
												<li class="collection-item avatar ">
													<a href="/profile/${comment.user.id }"><img src=${comment.user.defaultImage } alt="" class="circle"></a>
													<a href="/profile/${comment.user.id }" style="margin:.6rem;"><span class="title text-spacing-list deep-purple-text darken-4">${fn:toUpperCase(fn:substring(comment.user.firstName, 0, 1))}${fn:toLowerCase(fn:substring(comment.user.firstName, 1,fn:length(comment.user.firstName)))} ${fn:toUpperCase(fn:substring(comment.user.lastName, 0, 1))}${fn:toLowerCase(fn:substring(comment.user.lastName, 1,fn:length(comment.user.lastName)))}</span></a>
													<p class="text-spacing-list" style="margin:.6rem;">
														"${comment.comment}"
													</p>
													
												</li>
											</c:forEach>
														
										</ul>								    
								    </div>	   
							  </div>
					        </div>
					      </div>
					     </div>
					    </c:forEach> 
					   
			</div>
		</div>
	</div>



	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
    <script type="text/javascript" src="/js/profileCarInfoScript.js"></script>
 </body>
</body>
</html>