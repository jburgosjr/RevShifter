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
	<link rel="stylesheet" href="/css/carInfoStyle.css">
	<title>Vehicle Info</title>
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
	 <div class="alert-box container" style="visibility:hidden; <c:out value="${error}"/>">
					<div class="row right" id="alert_box" style="width:60rem; z-index:1;">
					  <div class="col s12 m12">
					    <div class="card <c:out value="${color}" /> accent-4">
					      <div class="row">
					        <div class="col s12 m10 ">
					          <div class="card-content white-text center">
					             <form:errors path="addVehicle.*" element="p" cssClass="alert alert-danger"/>
					          	
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
	                <span class="white-text email ">${vehicle.year} ${vehicle.make} ${vehicle.subModel}</span>
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
					          <img src="${image.url}" >
					          
					        </div>
					        <div class="card-content center">
							  <a href="#delImage${image.id}"><i class=" small material-icons red-text text-accent-4 right modal-trigger" style="vertical-align:top; margin-bottom:.2rem;">delete_forever</i></a>
					          <a href="#comment${image.id}" class="waves-effect waves-light btn-small modal-trigger left" style="margin-top:.3rem"><i class="material-icons deep-purple-text text-darken-4">comment</i></a>
					          <div id="comment${image.id}" class="modal">
								    <div class="modal-content">
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
							  <div id="delImage${image.id}" class="modal">
							  	<div class="modal-content center">
							  		<h3 class="red-text text-accent-4">Are you sure you want to delete this image?</h3>
							  		<img src="${image.url}" style="width:222.328px; height:130px;">
							  	</div>
							  	<div class="modal-footer">
							      <a href="#!" class="modal-close waves-effect waves-green btn-flat">Nah</a>
							      <form action="/delImage" method="post">
							      	<input type="hidden" name="_method" value="delete">
							      	<input type="hidden" name="imageId" value="${image.id}">
							      	<input type="hidden" name="vehicleId" value="${vehicle.id}">
							      	<button type="submit" class="modal-close waves-effect waves-red btn-flat">Yeee</button>
							      </form>
							  	</div>
							  </div>
					        </div>
					      </div>
					     </div>
					    </c:forEach> 
					   
			</div>
     		<a href="#addPhoto" class="btn-floating modal-trigger right" style="margin:.7rem; background:rgb(34, 0, 85);"><i class="large material-icons">add_a_photo</i></a>
     		 <div id="addPhoto" class="modal  center">
     		 	<div class="modal-content">
     		 		<div class="container">
     		 			<h3 class="header"><u>Add a Photo</u></h3>
	     		 		<form:form action="/myGarage/addPhoto" method="POST" modelAttribute="image" enctype="multipart/form-data">
	     		 			<form:hidden path="vehicle" value="${vehicle.id}"/>
	     		 			<div class="file-field input-field col s12">
	                              <div class="btn waves-effect waves-light" style="background-color:rgb(34, 0, 85);">
	                                  <span><i class="material-icons" style="font-size:2rem;">image</i></span>
	                                  <input type="file" name="file" id="image" required>
	                              </div>
	                              <div class="file-path-wrapper">
	                    
	                                <input class="file-path validate" type="text" placeholder="<- Upload Cover Image" disabled>
	                              </div>
	                          </div>
	                          <button class="btn waves-effect waves-light" style="background-color:rgb(34, 0, 85);" type="submit" name="action">add
							    	<i class="material-icons right">file_upload</i>
							  </button>
	     		 		</form:form>
	     		 	</div>
     		 	</div>
     		 </div>
     	</div>
     </div>

	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
    <script type="text/javascript" src="/js/carInfoScript.js"></script>
 </body>
</body>
</html>