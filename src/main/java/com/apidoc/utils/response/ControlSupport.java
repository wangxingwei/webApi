package com.apidoc.utils.response;

import org.json.JSONObject;

/**
 * response 返回参数 工具类
 * @author wxw
 */
public class ControlSupport {

	public static String responseJson(Integer status, Object obj)
			throws Exception {
		JSONObject json = new JSONObject();
		json.put("status", status);
		json.put("data", obj);
		return json.toString();
	}

	public static String responseJson(Integer status, String message, Object obj)
			throws Exception {
		JSONObject json = new JSONObject();
		json.put("status", status);
		json.put("message", message);
		json.put("data", obj);
		return json.toString();
	}

	public static String responseJson(String message, Object obj)
			throws Exception {

		JSONObject json = new JSONObject();
		json.put("message", message);
		json.put("data", obj);
		return json.toString();
	}

	public static String responseJsonp(Integer status, Object obj,
			String callback) throws Exception {

		JSONObject json = new JSONObject();
		json.put("status", status);
		json.put("data", obj);
		return callback + "(" + json.toString() + ")";
	}

	public static String responseJsonp(String message, Object obj,
			String callback) throws Exception {

		JSONObject json = new JSONObject();
		json.put("message", message);
		json.put("data", obj);
		return callback + "(" + json.toString() + ")";
	}
}
