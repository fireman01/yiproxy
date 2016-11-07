package com.catalog.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.catalog.service.CatalogService;
import com.common.util.FormDataCollectUtil;



@Controller
@RequestMapping("/catalog")
public class CatalogController {
	
	@Resource
	private CatalogService catalogservice;
	
	@RequestMapping("/catalog_list")
	public  String getCatalogList(HttpServletRequest request,Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance()
				.getFormDataWithPage(request);
		model.addAttribute("catalogList", catalogservice.getCatalogListWithPage(param));
		int total = catalogservice.countCatalogTotal();
		int numPerPage = (Integer)param.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		model.addAttribute("totalPage", totalPage);
		if(totalPage==0){
			model.addAttribute("curPage",0);
		}else{
			model.addAttribute("curPage",(Integer)param.get("curPage"));
		}
		return "catalog/catalog_list";
		
	}
	
	@RequestMapping("/getCatalogByType")
	public  void getCatalogByType(HttpServletRequest request, HttpServletResponse response){
		String type = request.getParameter("type");
		List<Map<String, Object>> list = catalogservice.getCatalogListByType(type);
		JSONArray jsonArray = JSONArray.fromObject(list);
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().print(jsonArray.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getCatalogListByPreCatalog")
	public  void getCatalogListByPreCatalog(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		List<Map<String, Object>> list = catalogservice.getCatalogListByPreCatalog(id);
		JSONArray jsonArray = JSONArray.fromObject(list);
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().print(jsonArray.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/saveCatalog")
	public void saveCatalog(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance()
				.getFormData(request);
		String result = catalogservice.saveCatalog(param);
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/catalog_edit")
	public String getCatalogInfo(HttpServletRequest request, Model model){
		String id = request.getParameter("id");
		Map<String, Object> map = catalogservice.getCatalogInfoById(id);
		model.addAttribute("catalogInfo", map);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		if(map!=null){
			int type = Integer.valueOf(map.get("type").toString());
			list = catalogservice.getCatalogListByType(String.valueOf(type-1));
			if(list==null||list.size()==0){
				Map<String, Object> tmp = new HashMap<String, Object>();
				tmp.put("id", "0");
				tmp.put("name", "无");
				list.add(tmp);
			}
			model.addAttribute("catalogList", list);
			
		}else{
			model.addAttribute("catalogList",list);
		}
		
		return "catalog/catalog_edit";
	}
	
	@RequestMapping("/deleteCatalog")
	public void deleteCatalog(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		String result = catalogservice.deleteCatalog(id);
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}


