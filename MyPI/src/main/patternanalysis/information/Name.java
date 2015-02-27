package main.patternanalysis.information;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Name {

	public static void PatternAnalysis(String file) {

		Pattern name = Pattern.compile("([가간갈감강견경고공곽구국군권기길김나난남낭노"
				+ "도돈독마매맹명박반방배백범변복봉부빈사삼상서석선설"
				+ "섭성소손송수순승시신심아안양엄연염예오옥온왕용우운원위유육윤" + "은이인임자장전제조종주지진차창채천최추춘탁태"
				+ "판팽편평포표풍피필하학한함해허현형호홍황보])[가-힣]{1,5}");
		// 영문이름 ex) si-young yang OR yang si-young OR siyoung yang OR yang
		// siyoung OR yang si young
		// 영문이름 보류 |[\\w\\-]{2,10}\\s[\\w\\-]{2,10}\\s[\\w\\-]{2,10}
		Matcher m = name.matcher(file);

	}

}
