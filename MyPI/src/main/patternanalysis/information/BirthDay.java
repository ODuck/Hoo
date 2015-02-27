package main.patternanalysis.information;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import main.patternanalysis.RankingCount;

public class BirthDay {
	
	public static void PatternAnalysis(String file) {
		
		// 생년월일 6자 제한, 70년생부터 96년생까지만 
		Pattern birth = Pattern.compile("( 7[0-9](0[1-9]|1[012])(0[1-9]|1[0-9]|2[0-9]|3[01]) )|"
									  + "( 8[0-9](0[1-9]|1[012])(0[1-9]|1[0-9]|2[0-9]|3[01]) )|"
									  + "( 9[0-6](0[1-9]|1[012])(0[1-9]|1[0-9]|2[0-9]|3[01]) )");
		Matcher m = birth.matcher(file);
		
	}

}
