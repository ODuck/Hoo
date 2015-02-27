package main.ranking;

public class ExpDataBean {

	private String date;
	private double exposure;
	private int client_num;
	private int data_index;

	public double getExposure() {
		return exposure;
	}

	public void setExposure(double exposure) {
		this.exposure = exposure;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getClient_num() {
		return client_num;
	}

	public void setClient_num(int client_num) {
		this.client_num = client_num;
	}

	public int getData_index() {
		return data_index;
	}

	public void setData_index(int data_index) {
		this.data_index = data_index;
	}

}
