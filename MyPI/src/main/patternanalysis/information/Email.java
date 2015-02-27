package main.patternanalysis.information;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import main.patternanalysis.RankingCount;

public class Email {

	public static void PatternAnalysis(String file) {

		Pattern Email = Pattern
				.compile("[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+");

		Matcher m = Email.matcher(file);

	}
}
