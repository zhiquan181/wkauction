package com.chenzi.admin.vo;

import java.util.Date;
import javax.persistence.*;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="link")
public class Link implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer linkid;
	private String title;
	private String domain;
	private Date createat;
	private Auser auser;

	/** default constructor */
	public Link() {}

	/** full constructor */
	public Link(String title, String domain, Date createat) {
		this.title = title;
		this.domain = domain;
		this.createat = createat;
	}
	
	@Id
	@Column(name="linkid")
	@GeneratedValue(strategy=GenerationType.AUTO)
	@GenericGenerator(name="paymentableGenerator",strategy = "native")
	public Integer getLinkid() {
		return this.linkid;
	}

	public void setLinkid(Integer linkid) {
		this.linkid = linkid;
	}

	@Column(name="title")
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name="domain")
	public String getDomain() {
		return this.domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}
	
	@Column(name="createat")
	public Date getCreateat() {
		return this.createat;
	}

	public void setCreateat(Date createat) {
		this.createat = createat;
	}

	@ManyToOne()
	@JoinColumn(name = "editorid")
	/*@Basic(fetch=FetchType.LAZY)*/
	public Auser getAuser() {
		return auser;
	}

	public void setAuser(Auser auser) {
		this.auser = auser;
	}
	
	
}