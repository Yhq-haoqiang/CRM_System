package com.yhq.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "ser_service")
public class Ser implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String customer;

	private String types;

	private String outline;

	private int status;

	private String request;

	private String cre_name;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cre_date;

	private String dis_name;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dis_date;

	private String handle;

	private String handle_name;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date handle_date;

	private String handle_result;

	private String satisfaction;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getTypes() {
		return types;
	}

	public void setTypes(String types) {
		this.types = types;
	}

	public String getOutline() {
		return outline;
	}

	public void setOutline(String outline) {
		this.outline = outline;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
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

	public String getDis_name() {
		return dis_name;
	}

	public void setDis_name(String dis_name) {
		this.dis_name = dis_name;
	}

	public Date getDis_date() {
		return dis_date;
	}

	public void setDis_date(Date dis_date) {
		this.dis_date = dis_date;
	}

	public String getHandle() {
		return handle;
	}

	public void setHandle(String handle) {
		this.handle = handle;
	}

	public String getHandle_name() {
		return handle_name;
	}

	public void setHandle_name(String handle_name) {
		this.handle_name = handle_name;
	}

	public Date getHandle_date() {
		return handle_date;
	}

	public void setHandle_date(Date handle_date) {
		this.handle_date = handle_date;
	}

	public String getHandle_result() {
		return handle_result;
	}

	public void setHandle_result(String handle_result) {
		this.handle_result = handle_result;
	}

	public String getSatisfaction() {
		return satisfaction;
	}

	public void setSatisfaction(String satisfaction) {
		this.satisfaction = satisfaction;
	}

}
