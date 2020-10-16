package com.bean;

import org.springframework.web.multipart.MultipartFile;

public class productbean {
	private int proid;
	private String name;
	private int price;
	private String gcolor;
	private float gweight;
	private int noofdiamond;
	private String dtype;
	private String dcolor;
	private float dweight;
	private String quality;
	private String description;
	private String category;
	private String filename;
	private int stock;

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	private MultipartFile file;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	private String filepath;
	private byte[] data;

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getCategory() {
		// System.out.println("get category is called");
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	

	public int getProId() {
		return proid;
	}

	public void setProId(int proid) {
		this.proid = proid;
	}

	public String getName() {

		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getGcolor() {
		return gcolor;
	}

	public void setGcolor(String gcolor) {
		this.gcolor = gcolor;
	}

	public float getGweight() {
		return gweight;
	}

	public void setGweight(float gweight) {
		this.gweight = gweight;
	}

	public int getNoofdiamond() {
		return noofdiamond;
	}

	public void setNoofdiamond(int noofdiamond) {
		this.noofdiamond = noofdiamond;
	}

	public String getDtype() {
		return dtype;
	}

	public void setDtype(String dtype) {
		this.dtype = dtype;
	}

	public String getDcolor() {
		return dcolor;
	}

	public void setDcolor(String dcolor) {
		this.dcolor = dcolor;
	}

	public float getDweight() {
		return dweight;
	}

	public void setDweight(float dweight) {
		this.dweight = dweight;
	}

	public String getQuality() {
		return quality;
	}

	public void setQuality(String quality) {
		this.quality = quality;
	}

	public productbean(int proid, String name, int price, String gcolor, float gweight, int noofdiamond, String dtype,
			String dcolor, float dweight, String quality, String description, String category, MultipartFile file,
			String filename, String filepath, byte[] data) {
		super();
		this.proid = proid;
		this.name = name;
		this.price = price;
		this.gcolor = gcolor;
		this.gweight = gweight;
		this.noofdiamond = noofdiamond;
		this.dtype = dtype;
		this.dcolor = dcolor;
		this.dweight = dweight;
		this.quality = quality;
		this.description = description;
		this.category = category;
		System.out.println("file in cons:" + file);
		this.filename = filename;
		this.filepath = filepath;
		this.data = data;
		System.out.println("data in cons:" + data.length);
	}

	public productbean() {
		super();
	}

}
