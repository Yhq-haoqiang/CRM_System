package com.yhq.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "sale_opp")
public class Opp implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String oppcome;

	private String customer;

	private String odds;

	private String outline;

	private String descr;

	private String cre_name;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cre_date;

	private String assignor;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date assdate;

	private int status;//是否开发 0未开发，1开发中，2开发成功归档 ，3暂缓流失 ，4流失

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "sale_contacts_id")
	private Contacts contacts;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date losedate;//确认流失时间

	private String reprieve;//暂缓措施

	private String whyloss;//流失原因

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOppcome() {
		return oppcome;
	}

	public void setOppcome(String oppcome) {
		this.oppcome = oppcome;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getOdds() {
		return odds;
	}

	public void setOdds(String odds) {
		this.odds = odds;
	}

	public String getOutline() {
		return outline;
	}

	public void setOutline(String outline) {
		this.outline = outline;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getCre_name() {
		return cre_name;
	}

	public void setCre_name(String cre_name) {
		this.cre_name = cre_name;
	}

	public Date getCre_date() {
		return cre_date;
	}

	public void setCre_date(Date cre_date) {
		this.cre_date = cre_date;
	}

	public String getAssignor() {
		return assignor;
	}

	public void setAssignor(String assignor) {
		this.assignor = assignor;
	}

	public Date getAssdate() {
		return assdate;
	}

	public void setAssdate(Date assdate) {
		this.assdate = assdate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Contacts getContacts() {
		return contacts;
	}

	public void setContacts(Contacts contacts) {
		this.contacts = contacts;
	}

	public Date getLosedate() {
		return losedate;
	}

	public void setLosedate(Date losedate) {
		this.losedate = losedate;
	}

	public String getReprieve() {
		return reprieve;
	}

	public void setReprieve(String reprieve) {
		this.reprieve = reprieve;
	}

	public String getWhyloss() {
		return whyloss;
	}

	public void setWhyloss(String whyloss) {
		this.whyloss = whyloss;
	}

}
