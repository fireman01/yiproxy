package com.common.util;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class CommonUtil {
	
	public static JSONObject formatMap2Json(Map<Object, Object> map){
		
		return JSONObject.fromObject(map);
	}
	
public static JSONArray formatList2JsonArray(List<Map<String, Object>> list){
		
		return JSONArray.fromObject(list);
	}

public static String getSequence() {

	return java.util.UUID.randomUUID().toString().replaceAll("-", "");
}

}
