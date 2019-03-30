package com.chenzi.admin.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="orders")
public class Orders implements java.io.Serializable {

	private int id;
	private User user;
	private Goods goods;
	private Date createat;
	private Integer jprice;
	private Integer fkstatus;
	private String paystatus;
	private String paynumber;

	// Constructors

	/** default constructor */
	public Orders() {
	}

	/** minimal constructor */
	public Orders(User user, Goods goods,Date createat,Integer jprice,Integer fkstatus,String paystatus,String paynumber) {
		this.user = user;
		this.goods = goods;
		this.createat = createat;
		this.jprice = jprice;
		this.fkstatus = fkstatus;
		this.paystatus = paystatus;
		this.paynumber = paynumber;
	}

	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	@GenericGenerator(name="paymentableGenerator",strategy = "native")
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne()
	@JoinColumn(name = "userid")
	/*@Basic(fetch=FetchType.LAZY)*/
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne()
	@JoinColumn(name = "goodsid")
	/*@Basic(fetch=FetchType.LAZY)*/
	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
	@Column(name="createat")
	public Date getCreateat() {
		return this.createat;
	}

	public void setCreateat(Date createat) {
		this.createat = createat;
	}

	@Column(name="jprice")
	public Integer getJprice() {
		return this.jprice;
	}

	public void setJprice(Integer jprice) {
		this.jprice = jprice;
	}
	
	@Column(name="fkstatus")
	public Integer getFkstatus() {
		return this.fkstatus;
	}

	public void setFkstatus(Integer fkstatus) {
		this.fkstatus = fkstatus;
	}
	
	@Column(name="paystatus")
	public String getPaystatus() {
		return this.paystatus;
	}

	public void setPaystatus(String paystatus) {
		this.paystatus = paystatus;
	}
	
	@Column(name="paynumber")
	public String getPaynumber() {
		return this.paynumber;
	}

	public void setPaynumber(String paynumber) {
		this.paynumber = paynumber;
	}
}