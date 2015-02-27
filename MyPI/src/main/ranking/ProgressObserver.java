package main.ranking;

import java.util.Observable;

public class ProgressObserver extends Observable implements Runnable {
	private String state;
	private int max, num;

	public ProgressObserver() {
		state = null;
		num = max = 0;
	}

	@Override
	public void run() {
		try {
			Thread.sleep(100);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
		setChanged();
		notifyObservers();
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
		setChanged();
		notifyObservers();
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
		setChanged();
		notifyObservers();
	}
}
