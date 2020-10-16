package com.bean;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;

public class userbean {
	
	@NotEmpty(message="fullname cant empty")
	@Pattern(regexp="(^[A-Za-z]*$)",message="please enter valid usernamefield")
	private String fullname;
	
	@NotEmpty(message="email cant empty")
	@Email(message="please enter valid email address")
	private String email;
	
	
	//@Length(max=10)
	//@Digits(fraction =0 ,integer = 0,message="please enter valid integer value.")
	//@Pattern(regexp="[0-9]+",message="Please enter only digits with 10 as length.")
	//@NotEmpty(message="phoneno cant empty")
	//@Min(value=10,message="please enter valid phone no ")
	//@Max(value=10,message="please enter valid phone no ")
	@NotEmpty(message="please enter phone no")
	@Size(min=10,max=10,message="plese enter valid length of phone no ")
	@Pattern(regexp="(^[0-9]*$)",message="please enter valid formet of phone no field")
	private String phoneno;
	
	@NotEmpty(message="password cant empty")
	private String password;
	
	private int customerid; 
	
	private int status;
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getCustomerid() {
		return customerid;
	}

	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneno() {
		System.out.println("get PHONE NO"+phoneno);
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		System.out.println("PHONE NO"+phoneno);
		this.phoneno = phoneno;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
}
