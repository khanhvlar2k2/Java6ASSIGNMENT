package com.poly.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Nationalized;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "accounts")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Accounts implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	private String username;
	
	private String password;
	
	@Nationalized
	private String fullname;
	
	private String email;
	
	private String phone;
	
	private boolean gender;
	
	@Nationalized 
	private String address;
	
	private String avatar;
	
	private boolean isAdmin;
	
	private boolean isDeleted;
	
	@OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
	private List<Orders> orders;
	
}
