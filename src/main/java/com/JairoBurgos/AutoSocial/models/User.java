package com.JairoBurgos.AutoSocial.models;



import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message="First Name Field must not be blank")
	@Size(min=3,message="First name must be three chracters or more")
	private String firstName;
	
	@NotBlank(message="Last Name Field must not be blank")
	@Size(min=3,message="Last name must be three chracters or more")
	private String lastName;
	
	@NotBlank(message="Email field must not be blank")
	@Email
	private String email;
	
	@NotBlank(message="Password field must not be blank")
	@Size(min=5,message="Password must be 5 characters or more")
	private String password;
	
	
    @Transient
    private String passwordConfirmation;
	
	private String state;
	
	@NotBlank(message="City field must not be blank")
	@Size(min=2,message="City must be 2 characters or more")
	private String city;
	
	private String defaultImage;
	
	@Column(updatable=false)
	private Date createdAt;
	    
	private Date updatedAt;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name="followers",
			joinColumns = @JoinColumn(name = "user_id"),
			inverseJoinColumns = @JoinColumn(name="follower_id")
			)
	private List<User> followers;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name="followers",
			joinColumns =@JoinColumn(name = "follower_id"),
			inverseJoinColumns = @JoinColumn(name="user_id")
			)
	private List<User> userFollowers;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name="revs",
			joinColumns = @JoinColumn(name = "user_id"),
			inverseJoinColumns = @JoinColumn(name = "image_id")
			)
	private List<Image> likedImages;
	
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
	private List<Image> uploadedImages;
	
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
	private List<Comment> comment;
	
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
	private List<Vehicle> userVehicles;
	
	public User() {
		
	}
	
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}


	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public Date getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}


	public Date getUpdatedAt() {
		return updatedAt;
	}


	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}


	public List<User> getFollowers() {
		return followers;
	}


	public void setFollowers(List<User> followers) {
		this.followers = followers;
	}


	public List<User> getUserFollowers() {
		return userFollowers;
	}


	public void setUserFollowers(List<User> userFollowers) {
		this.userFollowers = userFollowers;
	}




	public List<Image> getLikedImages() {
		return likedImages;
	}


	public void setLikedImages(List<Image> likedImages) {
		this.likedImages = likedImages;
	}


	public List<Image> getUploadedImages() {
		return uploadedImages;
	}


	public void setUploadedImages(List<Image> uploadedImages) {
		this.uploadedImages = uploadedImages;
	}


	public List<Comment> getComment() {
		return comment;
	}


	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}


	public List<Vehicle> getUserVehicles() {
		return userVehicles;
	}


	public void setUserVehicles(List<Vehicle> userVehicles) {
		this.userVehicles = userVehicles;
	}


	public String getDefaultImage() {
		return defaultImage;
	}


	public void setDefaultImage(String defaultImage) {
		this.defaultImage = defaultImage;
	}
	
	

}
