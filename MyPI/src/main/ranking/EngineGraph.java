package main.ranking;

public class EngineGraph {

	private String googleEngine = "Google 검색엔진";
	private String naverEngine = "Naver 검색엔진";
	private String daumEngine = "Daum 검색엔진";

	private int googleCount;
	private int naverCount;
	private int daumCount;

	public EngineGraph(int googleCount, int naverCount, int daumCount) {

		this.googleCount = googleCount;
		this.naverCount = naverCount;
		this.daumCount = daumCount;
	}

	public double[] computeEngineRate() {

		String count[] = { googleCount + "", naverCount + "", daumCount + "" };
		double doubleCount[] = { (Double.parseDouble(count[0])),
				(Double.parseDouble(count[1])), (Double.parseDouble(count[2])) };
		double rate[] = new double[3];
		double sum = 0;

		for (int i = 0; i < rate.length; i++) {
			sum += doubleCount[i];
		}

		rate[0] = Math.round((Double.parseDouble(count[0]) / sum * 100));
		rate[1] = Math.round((Double.parseDouble(count[1]) / sum * 100));
		rate[2] = Math.round((Double.parseDouble(count[2]) / sum * 100));

		for (int i = 0; i < rate.length; i++) {

			System.out.println(rate[i]);
		}

		return rate;

	}

	public String getGoogleEngine() {
		return googleEngine;
	}

	public void setGoogleEngine(String googleEngine) {
		this.googleEngine = googleEngine;
	}

	public String getNaverEngine() {
		return naverEngine;
	}

	public void setNaverEngine(String naverEngine) {
		this.naverEngine = naverEngine;
	}

	public String getDaumEngine() {
		return daumEngine;
	}

	public void setDaumEngine(String daumEngine) {
		this.daumEngine = daumEngine;
	}

	public int getGoogleCount() {
		return googleCount;
	}

	public void setGoogleCount(int googleCount) {
		this.googleCount = googleCount;
	}

	public int getNaverCount() {
		return naverCount;
	}

	public void setNaverCount(int naverCount) {
		this.naverCount = naverCount;
	}

	public int getDaumCount() {
		return daumCount;
	}

	public void setDaumCount(int daumCount) {
		this.daumCount = daumCount;
	}

}
