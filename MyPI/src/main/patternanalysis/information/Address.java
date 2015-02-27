package main.patternanalysis.information;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import main.patternanalysis.RankingCount;

public class Address {

	public static void PatternAnalysis(String file) {

		Pattern address = Pattern
				.compile("[가-힣]{2,5}\\s[가-힣]{2,5}[시구군읍]\\s[가-힣]{2,5}[구군읍면동]\\s[가-힣\\w]{2,10}\\s[가-힣\\w\\-\\s]{3,20}");
		Matcher m = address.matcher(file);

	}

}
