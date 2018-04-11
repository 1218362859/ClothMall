package com.femtoapp.tool;

import java.util.Random;

public class ValidateCode {
	  private static String code = null;

	  private static char[] codeSequence = {'1', '2', '3', '4', '5', '6', '7', '8', '9' };

	  public static String createCode(int codeCount) {
	    Random random = new Random();
	    StringBuffer randomCode = new StringBuffer();

	    for (int i = 0; i < codeCount; i++) {
	      String strRand = String.valueOf(codeSequence[random.nextInt(codeSequence.length)]);
	      randomCode.append(strRand);
	    }
	    code = randomCode.toString();
	    return code;
	  }
	  public static void main(String[] args) {
		  for(int i=0;i<100;i++){
			  
				System.out.println(createCode(4));
		  }

	}
}
