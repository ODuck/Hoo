package main.patternanalysis.information;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Homephone {

	public static void PatternAnalysis(String file) {

		Pattern homephone = Pattern.compile("02-[\\d]{3,4}-[\\d]{4}|"
				+ "03[1-3]-[\\d]{3}-[\\d]{4}|" + "04[1-3]-[\\d]{3}-[\\d]{4}|"
				+ "05[1-5]-[\\d]{3}-[\\d]{4}|" + "06[1-4]-[\\d]{3}-[\\d]{4}");
		Matcher m = homephone.matcher(file);

	}

}
