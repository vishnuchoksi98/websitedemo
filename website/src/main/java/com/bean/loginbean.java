package com.bean;


import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class loginbean {

//@Pattern(regexp="(^[A-Za-z]*$)",message="please enter valid usernamefield")
@NotEmpty(message="Please enter username")
@Email(message="please enter valid email id as your username")
private String username;

@NotEmpty(message="Please enter password")
private String password;


private String usertype;

public String getUsertype() {
	return usertype;
}
public void setUsertype(String usertype) {
	this.usertype = usertype;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

}
