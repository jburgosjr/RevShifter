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
	<link rel="stylesheet" href="/css/homeStyle.css"> 
	<title>Home</title>
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
	            	<span class="white-text name">What up:</span>
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
				<div class="alert-box" style="visibility:hidden; <c:out value="${error}"/> ">
					<div class="row" id="alert_box">
					  <div class="col s12">
					    <div class="card <c:out value="${color}" /> accent-4">
					      <div class="row">
					        <div class="col s12 m10 ">
					          <div class="card-content white-text center" style="padding-left:10rem;">
					             <form:errors path="addComment.*" element="p" cssClass="alert alert-danger"/>

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
        	<div class="center-div">
        		  <div class="row">
				    <div class="col s12 ">					     	
						<c:forEach items="${images}" var="image">
							<c:forEach items="${following}" var="check">
								<c:choose>
									<c:when test="${image.user.id == check.follower.id}">
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
											     <span class="card-title activator deep-purple-text text-darken-4" style="display:inline-block;">Show <i class=" small material-icons left deep-purple-text text-darken-4">comment</i></span>

												 <div style="display:inline-block; verticle-align:top;" class="right">    
													     <c:set var="revCheck" value="false"/>
													     <c:forEach items="${image.usersLiked}" var="likeCheck">
													     	<c:if test="${likeCheck.id == user.id}">
													     		<c:set var="revCheck" value="true"/>
													     	</c:if>
													     </c:forEach>
													     <c:choose>
													     	<c:when test="${revCheck == true }">
													     		<form action="/unRev" method="POST">
																	<input type="hidden" name="_method" value="delete">
																	<input type="hidden" value="${user.id}" name="user">
																	<input type="hidden" value="${image.id}" name="image">
													     			<button class="btn-floating white" type="submit"><i class="material-icons"><img src="/images/icons/rev-select.png" style="width:2.3rem; height:2.3rem;"></i></button>											     																			
																</form>
													     	</c:when>
													     	
													     	<c:otherwise>
													     		<form:form action="/addRev" method="POST" modelAttribute="addRev" style="display:inline-block">
													     			<form:hidden path="user" value="${user.id }"/>
													     			<form:hidden path="image" value="${image.id}"/>
													     		    <button type="submit" class="btn-floating white"><i class="material-icons"><img src="/images/icons/rev-unselect.png" style="width:2.3rem; height:2.3rem;"></i></button>
													     			
													     		</form:form>
													    	</c:otherwise>
													     </c:choose>
												     
												    
											     </div>
											     <div style="display:inline-block; margin-right:1.4rem;" class="right">
												 	<p class="card-title grey-text counter" style="margin-top:.3rem;">${fn:length(image.usersLiked)} Revs </p>
												 
												 </div>
											</div>
											<div class="card-reveal">
											     <span class="card-title grey-text text-darken-4">Comments<i class="material-icons right">close</i></span>
													  <form:form action="/addComment" method="POST" modelAttribute="addComment">
											     	  <div class="input-field col s12">
											            <form:textarea path="Comment" cssId="textarea2" cssClass="materialize-textarea" data-length="255"></form:textarea>
											            <label for="textarea2">Add Comment</label>
											          </div>
											          	<form:hidden path="image" value="${image.id}" />
											          	<form:hidden path="user" value="${user.id}" />
											         	<div class="container center">
											         		<button class="btn waves-effect waves-light btn-small" style="background-color:rgb(34, 0, 85);" type="submit" name="action">
											         			<i class=" small material-icons"><img src="/images/icons/addComment.png" style="width:2rem; height:2rem; margin-top:.2rem;"></i>
											         		</button>
											         	</div>
											     	</form:form>
											     	<br>
											     <div>
											     	<ul class="collection listFS">
														<c:forEach items="${image.comments}" var="comment">
															<c:choose>
																<c:when test="${comment.user.id == user.id }">
																	<li class="collection-item avatar ">
																      <a href="/profile/${comment.user.id }"><img src=${comment.user.defaultImage } alt="" class="circle"></a>
																      <a href="/profile/${comment.user.id }" style="margin:.6rem;"><span class="title text-spacing-list deep-purple-text darken-4">${fn:toUpperCase(fn:substring(comment.user.firstName, 0, 1))}${fn:toLowerCase(fn:substring(comment.user.firstName, 1,fn:length(comment.user.firstName)))} ${fn:toUpperCase(fn:substring(comment.user.lastName, 0, 1))}${fn:toLowerCase(fn:substring(comment.user.lastName, 1,fn:length(comment.user.lastName)))}</span></a>
																	      <form action="/deleteComment" method="POST">
																	      	<input type="hidden" name="_method" value="delete">
																	      	<input type="hidden" name="commentId" value="${comment.id }"/>
																	      	<button type="submit" class="right" style="display:inline-block; background:none; border:none;"><i class=" small material-icons red-text text-accent-4">delete_forever</i></button>																      
																	      </form>
																      <p class="text-spacing-list" style="margin:.6rem;">
																         "${comment.comment}"
																      </p>

																    </li>
																</c:when>
																<c:otherwise>
																	<li class="collection-item avatar ">
																      <a href="/profile/${comment.user.id }"><img src=${comment.user.defaultImage } alt="" class="circle"></a>
																      <a href="/profile/${comment.user.id }" style="margin:.6rem;"><span class="title text-spacing-list deep-purple-text darken-4">${fn:toUpperCase(fn:substring(comment.user.firstName, 0, 1))}${fn:toLowerCase(fn:substring(comment.user.firstName, 1,fn:length(comment.user.firstName)))} ${fn:toUpperCase(fn:substring(comment.user.lastName, 0, 1))}${fn:toLowerCase(fn:substring(comment.user.lastName, 1,fn:length(comment.user.lastName)))}</span></a>
																      <p class="text-spacing-list" style="margin:.6rem;">
																         "${comment.comment}"
																      </p>
															
																    </li>
																</c:otherwise>
															</c:choose>
														</c:forEach>
														
													 </ul>
											     </div>
				
											</div>
								  		</div>
									</c:when>
								</c:choose>
						
							</c:forEach>
						
						</c:forEach>
				    </div>
				  </div>
				  
        </div>
      </div>
     </div>

		 	

	
  	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
    <script type="text/javascript" src="js/homeScript.js"></script>
</body>
</html>