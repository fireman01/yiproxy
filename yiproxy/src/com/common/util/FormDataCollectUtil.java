package com.common.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

/**
 * 【数据格式化成Map集合类型】
 *
 * @author 林军雄 2014年11月15日
 *
 */
public class FormDataCollectUtil {
	private static FormDataCollectUtil instance;

	private Map<String, Object> map;
	
	private FormDataCollectUtil(){
		
	}

	public static FormDataCollectUtil getInstance() {
		if (instance == null) {
			instance = new FormDataCollectUtil();
		}
		return instance;
	}

	/**
	 *   <p>【将request中的数据收集转换成map，request键值对中的值是个数组，本框架的处理是参数名不能重复】</p>
	 *
	 * @author 林军雄  2014年11月15日 
	 *
	 * @param request
	 * @return
	 */
	public Map<String,Object> getFormData(HttpServletRequest request) {
		map = new HashMap<String, Object>(request.getParameterMap());
		Set<Entry<String, Object>> keSet = map.entrySet();
		for (Iterator<Entry<String, Object>> itr = keSet.iterator(); itr.hasNext();) {
			Entry<String, Object> me = (Entry<String, Object>) itr.next();
			String ok = me.getKey().toString();
			Object ov = me.getValue();
			String value = ((String[]) ov)[0];
			map.put(ok, value);
		}
		return map;
	}
	
	public Map<String,Object> getFormDataWithPage(HttpServletRequest request) {
		map = new HashMap<String, Object>(request.getParameterMap());
		Set<Entry<String, Object>> keSet = map.entrySet();
		for (Iterator<Entry<String, Object>> itr = keSet.iterator(); itr.hasNext();) {
			Entry<String, Object> me = (Entry<String, Object>) itr.next();
			String ok = me.getKey().toString();
			Object ov = me.getValue();
			String value = ((String[]) ov)[0];
			map.put(ok, value);
		}
		if(null==request.getParameter("numPerPage")||"".equals(request.getParameter("numPerPage"))){
			map.put("numPerPage", 10);
		}else{
			map.put("numPerPage", Integer.parseInt(request.getParameter("numPerPage")));
		}
		if(null==request.getParameter("curPage")||"".equals(request.getParameter("curPage"))){
			map.put("curPage", 1);
		}else{
			map.put("curPage", Integer.parseInt(request.getParameter("curPage")));
		}
		int curPage = (Integer)map.get("curPage");
		int numPerPage = (Integer)map.get("numPerPage");
		map.put("pageNum", (curPage-1)*numPerPage);
		return map;
	}
	
	
}
