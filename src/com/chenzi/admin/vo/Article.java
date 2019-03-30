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
@Table(name="article")
public class Article implements java.io.Serializable {

	// Fields

	private Integer articleid;
	private Auser auser;
	private String title;
	private String content;
	private Date createat;
	private Integer pv;

	// Constructors

	/** default constructor */
	public Article() {
	}

	/** full constructor */
	public Article(Auser auser, String title, String content, Date createat, Integer pv) {
		this.auser = auser;
		this.title = title;
		this.content = content;
		this.createat = createat;
		this.pv = pv;
	}

	@Id
	@Column(name="articleid")
	@GeneratedValue(strategy=GenerationType.AUTO)
	@GenericGenerator(name="paymentableGenerator",strategy = "native")
	public Integer getArticleid() {
		return this.articleid;
	}

	public void setArticleid(Integer articleid) {
		this.articleid = articleid;
	}
	
	@ManyToOne()
	@JoinColumn(name = "editorid")
	/*@Basic(fetch=FetchType.LAZY)*/
	public Auser getAuser() {
		return this.auser;
	}

	public void setAuser(Auser auser) {
		this.auser = auser;
	}

	@Column(name="title")
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name="content")
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name="createat")
	public Date getCreateat() {
		return this.createat;
	}

	public void setCreateat(Date createat) {
		this.createat = createat;
	}

	@Column(name="pv")
	public Integer getPv() {
		return this.pv;
	}

	public void setPv(Integer pv) {
		this.pv = pv;
	}

}