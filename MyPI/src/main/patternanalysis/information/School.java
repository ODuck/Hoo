package main.patternanalysis.information;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class School {

	public static void PatternAnalysis(String file) {

		Pattern school = Pattern
				.compile("[가-힣]{2,10}학교|[가-힣]{2,6}대|[가-힣]{2,6}고|[가-힣]{2,6}중|[가-힣]{2,6}초");
		Matcher m = school.matcher(file);

	}

}
