package main.ranking;

import main.patternanalysis.Constant;
import main.patternanalysis.RankingCount;

public class CalculateExp implements Constant {
	RankingCount rankingCount;

	public CalculateExp(RankingCount rankingCount) {
		this.rankingCount = rankingCount;
	}

	public double getExposure(int pr) {

		double urlExposure = 0;

		double KT_resident = 2 * (1 - Math.pow(0.5,
				rankingCount.getResidentCount()));
		double KT_cellphone = 2 * (1 - Math.pow(0.5,
				rankingCount.cellphoneCount));
		double KT_homephone = 2 * (1 - Math.pow(0.5,
				rankingCount.homephoneCount));
		double KT_id = 2 * (1 - Math.pow(0.5, rankingCount.getIdCount()));
		double KT_email = 2 * (1 - Math.pow(0.5, rankingCount.getEmailCount()));
		double KT_name = 2 * (1 - Math.pow(0.5, rankingCount.getNameCount()));
		double KT_address = 2 * (1 - Math.pow(0.5,
				rankingCount.getAddressCount()));
		double KT_workplace = 2 * (1 - Math.pow(0.5,
				rankingCount.getWorkplaceCount()));
		double KT_birthday = 2 * (1 - Math.pow(0.5,
				rankingCount.getWorkplaceCount()));
		double KT_school = 2 * (1 - Math
				.pow(0.5, rankingCount.getSchoolCount()));
		double KT_occupation = 2 * (1 - Math.pow(0.5,
				rankingCount.getOccupationCount()));
		double KT_nickname = 2 * (1 - Math.pow(0.5,
				rankingCount.getNicknameCount()));

		double KF_WT = KT_resident * 7.2 + KT_cellphone * 6.1 + KT_homephone
				* 5.3 + KT_id * 6.1 + KT_email * 5.7 + KT_name * 5.4
				+ KT_address * 6.9 + KT_workplace * 5.7 + KT_birthday * 5.7
				+ KT_school * 4.9 + KT_occupation * 4.9 + KT_nickname * 6.1
				* 0.5;

		int KC = calCoupling(KT_resident, KT_cellphone, KT_homephone, KT_id,
				KT_email, KT_name, KT_address, KT_workplace, KT_birthday,
				KT_school, KT_occupation, KT_nickname);

		urlExposure = KF_WT * KC;

		System.out.println("주민" + rankingCount.getResidentCount() + " " + "핸드폰"
				+ rankingCount.getCellphoneCount() + " " + "집전화"
				+ rankingCount.getHomephoneCount() + " " + "아이디"
				+ rankingCount.getIdCount() + " " + "이메일"
				+ rankingCount.emailCount + " " + "이름"
				+ rankingCount.getNameCount() + " " + "주소"
				+ rankingCount.getAddressCount() + " " + "직장"
				+ rankingCount.getWorkplaceCount() + " " + "생일"
				+ rankingCount.getBirthdayCount() + " " + "학교"
				+ rankingCount.getSchoolCount() + " " + "직업"
				+ rankingCount.getOccupationCount() + " " + "닉네임"
				+ rankingCount.getNicknameCount() + " KC 값 : " + KC
				+ " 최종 노출도 : " + Math.round(urlExposure));

		return Math.round(urlExposure);

	}

	public int calCoupling(double KT_resident, double KT_cellphone,
			double KT_homephone, double KT_id, double KT_email, double KT_name,
			double KT_address, double KT_workplace, double KT_birthday,
			double KT_school, double KT_occupation, double KT_nickname) {
		int complexWeight = 0;

		if (KT_homephone != 0) {
			complexWeight++;
		}
		if (KT_cellphone != 0) {
			complexWeight++;
		}
		if (KT_email != 0) {
			complexWeight++;
		}

		if ((KT_id != 0) && (KT_name != 0)) {
			complexWeight++;
		}
		if ((KT_email != 0) && (KT_name != 0)) {
			complexWeight++;
		}

		if ((KT_name != 0) && (KT_workplace != 0)) {
			complexWeight++;
		}
		if ((KT_name != 0) && (KT_school != 0)) {
			complexWeight++;
		}
		if ((KT_name != 0) && (KT_occupation != 0)) {
			complexWeight++;
		}

		if ((KT_name != 0) && (KT_occupation != 0)) {
			complexWeight++;
		}

		if ((KT_nickname != 0) && (KT_id != 0)) {
			complexWeight++;
		}

		if (rankingCount.getIdCount() + rankingCount.getNicknameCount() >= 20) {
			complexWeight++;
			complexWeight++;
			complexWeight++;
		}

		if (KT_resident != 0) {
			complexWeight++;
		}

		if (KT_address != 0) {
			complexWeight++;
		}

		if (KT_birthday != 0) {
			complexWeight++;
		}

		return complexWeight;
	}

}
