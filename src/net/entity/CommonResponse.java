package net.entity;
public class CommonResponse {
	private boolean success;
	public CommonResponse(boolean success) {
		super();
		this.success = success;
	}

	public boolean success() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	@Override
	public String toString() {
		return "CommonResponse [success=" + success + "]";
	}
	
}