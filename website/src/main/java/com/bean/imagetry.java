package com.bean;

import org.springframework.web.multipart.MultipartFile;

public class imagetry {
private int id;
//private MultipartFile file;
private byte[] data;
/*public MultipartFile getFile() {
	return file;
}
public void setFile(MultipartFile file) {
	this.file = file;
}*/
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public byte[] getData() {
	return data;
}
public void setData(byte[] data) {
	this.data = data;
}

}
