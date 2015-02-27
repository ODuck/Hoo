package main.patternanalysis.information;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import main.patternanalysis.RankingCount;

public class ResidentNumber {

	public static void PatternAnalysis(String file) {
		
		Pattern resident = Pattern
				.compile("[0-9]{2}(0[1-9]|1[012])(0[1-9]|1[0-9]|2[0-9]|3[01])-[012349][0-9]{6}|[0-9]{2}(0[1-9]|1[012])(0[1-9]|1[0-9]|2[0-9]|3[01])\\s[012349][0-9]{6}");
		Matcher m = resident.matcher(file);

	}

}
