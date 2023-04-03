package net.entity;

public class Item {
	private String id;
	private String name;
	private int qty;
	private double unitPrice;
	private int status;
	private String category;
	private String brand;
	
	public Item() {}
	
	

	public Item(String id, String name, int qty, double unitPrice, int status, String category, String brand) {
		super();
		this.id = id;
		this.name = name;
		this.qty = qty;
		this.unitPrice = unitPrice;
		this.status = status;
		this.category = category;
		this.brand = brand;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public String getBrand() {
		return brand;
	}



	public void setBrand(String brand) {
		this.brand = brand;
	}



	@Override
	public String toString() {
		return "Item [id=" + id + ", name=" + name + ", qty=" + qty + ", unitPrice=" + unitPrice + ", status=" + status
				+ ", category=" + category + ", brand=" + brand + "]";
	}
	
	
}
