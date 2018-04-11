package com.femtoapp.tool;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;


public class PrintToJson {
	public static void print(HttpServletResponse response, JSONObject jsonob) {
		PrintWriter pw = null;
		try {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			pw = response.getWriter();
		} catch (IOException localIOException) {

		}
		pw.write(jsonob.toString());
		pw.flush();
		pw.close();
	}

	public static void printStr(HttpServletResponse response, String str) {
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
		} catch (IOException localIOException) {

		}
		pw.write(str);
		pw.flush();
		pw.close();
	}
}
