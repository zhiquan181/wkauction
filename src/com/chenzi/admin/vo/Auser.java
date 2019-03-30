package com.chenzi.admin.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="auser")
public class Auser implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer userid;
	private String username;
	private String password;
	private String sex;
	private Integer weight;

	// Constructors

	/** default constructor */
	public Auser() {}

	/** full constructor */
	public Auser(String username, String password, String sex, Integer weight) {
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.weight = weight;
	}

	@Id
	@Column(name="userid")
	@GeneratedValue(strategy=GenerationType.AUTO)
	@GenericGenerator(name="paymentableGenerator",strategy = "native")
	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	@Column(name="username")
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	@Column(name="password")
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name="sex")
	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Column(name="weight")
	public Integer getWeight() {
		return this.weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

}