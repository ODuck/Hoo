package main.ranking;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Vector;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import main.search.MakeObject;
import main.search.SearchResult;

public class Ranking {
	public static Vector<SearchResult> result;
	private int client_num;
	private String[] gradeText = new String[2];
	public ProgressObserver observer;

	public void setObserver(ProgressObserver observer) {
		this.observer = observer;
	}

	public Ranking(int client_num, ProgressObserver observer) {
		this.client_num = client_num;
		this.setObserver(observer);
	}

	class ResultThread implements Runnable {
		int i;

		public ResultThread(int i) {
			this.i = i;
		}

		@Override
		public void run() {
			result.get(i).openURL();

			return;
		}
	}

	public Vector<SearchResult> getResult(ArrayList<String> searchWordList)
			throws IllegalAccessException, InvocationTargetException,
			NoSuchMethodException, IOException {
		ExpDataBean expData = null;
		MakeObject makeObject = new MakeObject();
		PageRank pageRank = new PageRank();
		CalculateExp calExp;
		ExposureGraph expGraph = null;

		double finalExp = 0;

		result = makeObject.getResult(searchWordList);

		int googleCount = 0, naverCount = 0, daumCount = 0;
		for (int i = 0; i < result.size(); i++) {
			if (result.get(i).getEngine().equals("Daum")) {
				daumCount++;
			} else if (result.get(i).getEngine().equals("Naver")) {
				naverCount++;
			} else if (result.get(i).getEngine().equals("Google")) {
				googleCount++;
			}
		}
		System.out.println(googleCount + "    " + naverCount + "     "
				+ daumCount);

		// 중복 URL 체크
		checkDupUrl();


		// 페이지 분석 Threading
		ExecutorService service = Executors.newFixedThreadPool(50);

		for (int i = 0; i < result.size(); i++) {
			service.execute(new ResultThread(i));
		}
		System.out.println("======페이지 분석중...======");
		service.shutdown();
		while (true) {
			if (service.isTerminated()) {
				System.out.println("======페이지 분석 끝======");
				break;
			}
			try {
				Thread.sleep(100);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 페이지 분석 후 위험도 계산
		System.out.println("======위험도 계산중...======");
		for (int i = 0; i < result.size(); i++) {

			calExp = new CalculateExp(result.get(i).rankingCount);
			result.get(i)
					.setExposure(calExp.getExposure(result.get(i).getPr()));

		}
		System.out.println("======위험도 계산 끝======");

		// 정렬
		sortResult();
		pruningAlgorithm();
		System.out
				.println("pruningAlgorithm 직후의 result 사이즈 : " + result.size());

		double sumExp = 0;

		for (int i = 0; i < result.size(); i++) {
			sumExp += result.get(i).getExposure();
		}
		System.out.println("이게 사용자 특정화 데이터 : " + sumExp);

		finalExp = Math.round(sumExp / 100);

		expData = new ExpDataBean();
		expData = getExpData(client_num, finalExp);

		int grade = (int) (Math.round(sumExp) / 1000);

		setGradeText(getGrade(grade));

		try {
			expGraph.insertExprecord(expData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;

	}

	public String[] getGrade(int grade) {

		String gradeText[] = { " ", " " };

		if (grade == 0) {
			gradeText[0] = "<span style='color: #0c4881'>'안전'</span>";
			gradeText[1] = "회원님의 개인 정보는 비교적 안전하게 관리되고 있습니다. \n 회원정보를 모두 입력하지 않으셨을 경우, 검색되는 데이터의 질이 떨어질 수 있습니다.";
			return gradeText;
		} else if (grade == 1) {
			gradeText[0] = "<span style='color: #ffe355'>'경고'</span>";
			gradeText[1] = "회원님의 개인 정보가 일부 웹에 존재합니다. \n 검색결과를 보시고, 제공되는 솔루션을 통해 자신의 개인정보를 관리해보세요";
			return gradeText;
		} else if (grade == 2) {
			gradeText[0] = "<span style='color: #ffa94f'>'위험'</span>";
			gradeText[1] = "회원님의 중요한 개인 정보가 일부 웹에 노출되어 있습니다. \n 검색결과를 보시고, 제공되는 솔루션을 통해 자신의 개인정보를 관리해보세요";
			return gradeText;
		} else if (grade >= 3) {
			gradeText[0] = "<span style='color: #ff5f45'>'매우 위험'</span>";
			gradeText[1] = "회원님의 중요한 개인 정보가 웹에 다수 노출되어 있습니다. \n 검색결과를 보시고, 제공되는 솔루션을 통해 자신의 개인정보를 관리해보세요";
			return gradeText;
		} else {
			gradeText[0] = "<span style='color: #ff5f45'>'알수없음'</span>";
			gradeText[1] = "검색결과가 불분명합니다. 너무 많은 정보가 검색되어 트래픽 문제가 발생하였습니다.";
			return gradeText;
		}

	}

	public ExpDataBean getExpData(int client_num, double finalExp) {
		ExpDataBean expData = null;
		expData = new ExpDataBean();

		GregorianCalendar cal = new GregorianCalendar();

		String year = Integer.toString(cal.get(Calendar.YEAR));
		String month = Integer.toString(cal.get(Calendar.MONTH) + 1);
		String day = Integer.toString(cal.get(Calendar.DATE));

		expData.setClient_num(client_num);
		expData.setDate(year + "." + month + "." + day);
		expData.setExposure(finalExp);

		return expData;
	}

	public void pruningAlgorithm() {
		int resultSize = result.size();

		for (int i = 0; i < resultSize; i++) {

			if ((result.get(i).getExposure() == 0)
					|| (result.get(i).getExposure() == -1)) {

				result.remove(i);
				i--;
				resultSize--;

			}

		}
	}

	public void checkDupUrl() {
		int currentSize = result.size();

		for (int i = 0; i < currentSize - 1; i++) {
			for (int j = i + 1; j < currentSize; j++) {
				if (result.get(i).getURL().equals(result.get(j).getURL())) {
					result.remove(j);
					j--;
					currentSize--;
				}
			}
		}
	}

	// inversed quick_sort
	public void sortResult() {
		quicksort(result, 0, result.size() - 1);
	}

	public int partition(Vector<SearchResult> arr, int left, int right,
			int pivotIndex) {
		SearchResult pivotValue = arr.get(pivotIndex);
		SearchResult tmp = arr.get(pivotIndex);
		arr.set(pivotIndex, arr.get(right));
		arr.set(right, tmp);

		int storeIndex = left;

		for (int i = left; i < right; i++) {
			if (arr.get(i).getExposure() > pivotValue.getExposure()) {

				tmp = arr.get(i);
				arr.set(i, arr.get(storeIndex));
				arr.set(storeIndex, tmp);
				storeIndex++;
			}
		}
		tmp = arr.get(storeIndex);
		arr.set(storeIndex, arr.get(right));
		arr.set(right, tmp);

		return storeIndex;
	}

	public void quicksort(Vector<SearchResult> arr, int left, int right) {

		if (right > left) {
			int pivotIndex = left + (right - left) / 2;
			int pivotNewIndex = partition(arr, left, right, pivotIndex);
			quicksort(arr, left, pivotNewIndex - 1);
			quicksort(arr, pivotNewIndex + 1, right);
		}
	}

	public String[] getGradeText() {
		return gradeText;
	}

	public void setGradeText(String[] gradeText) {
		this.gradeText = gradeText;
	}
}
