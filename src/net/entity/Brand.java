package net.entity;

public class Brand {
	private String brandId;
	private String brandName;
	
	public Brand() {
		
	}
	
	public Brand(String brandId, String brandName) {
		super();
		this.brandId = brandId;
		this.brandName = brandName;
	}

	public String getBrandId() {
		return brandId;
	}


	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}


	public String getBrandName() {
		return brandName;
	}


	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}


	@Override
	public String toString() {
		return "Brand [toString()=" + super.toString() + "]";
	}

}
