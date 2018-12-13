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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

@Entity
@Table(name="photos")
public class Image {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String url;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name="revs",
			joinColumns = @JoinColumn(name = "image_id"),
			inverseJoinColumns = @JoinColumn(name = "user_id")
			)
	private List<User> usersLiked;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "vehicle_id")
	private Vehicle vehicle;
	
	@OneToMany(mappedBy="image" ,fetch = FetchType.LAZY)
	private List<Comment> comments;
	
	 @Column(updatable=false)
	 private Date createdAt;
	 private Date updatedAt;
	 
	 public Image() {
		 
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


	public List<User> getUsersLiked() {
		return usersLiked;
	}

	public void setUsersLiked(List<User> usersLiked) {
		this.usersLiked = usersLiked;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Vehicle getVehicle() {
		return vehicle;
	}

	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}	 
	    
}
	