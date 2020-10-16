package com.bean;

public class cartbean {
	//private int id;
	private int quantity;
	private productbean pbean=new productbean();
	private int finalprice;
	
	public int getFinalprice() {
		return finalprice;
	}
	public void setFinalprice(int finalprice) {
		this.finalprice = finalprice;
	}
	public int getQuantity() {
		return quantity;
	}
	public cartbean() {
		super();
//		this.quantity = quantity;
//		this.pbean = pbean;
	}
	
	public cartbean(int quantity, productbean pbean) {
		super();
		this.quantity = quantity;
		this.pbean = pbean;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public productbean getPbean() {
		return pbean;
	}
	public void setPbean(productbean pbean) {
		this.pbean = pbean;
	}
	
	//private String total;

}
