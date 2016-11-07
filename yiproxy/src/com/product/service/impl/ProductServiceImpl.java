package com.product.service.impl;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.common.util.CommonUtil;
import com.product.mapper.ProductMapper;
import com.product.service.ProductService;

@Service("ProductService")
public class ProductServiceImpl implements ProductService{
	
	@Resource
	private ProductMapper productMapper;

	@Override
	public List<Map<String, Object>> getProductListWithPage(
			Map<String, Object> param) {
		List<Map<String, Object>> list = productMapper.getProductListWithPage(param);
		if(list!=null||list.size()>0){
			for(int i=0; i<list.size(); i++){
				Map<String, Object> map = list.get(i);
				String picture = (String)map.get("picture");
				String[] pictures = picture.split(",");
				map.put("picture",pictures);
				list.set(i, map);
			}
		}
		return list;
	}
	

	@Override
	public int countProductTotal() {
		return productMapper.countProductTotal();
	}

	@Override
	public List<Map<String, Object>> getProductListByName(String id) {
		return productMapper.getProductListByName(id);
	}

	@Override
	public String saveProduct(Map<String, Object> param) {
		param.put("updateTime", new Date());
		StringBuilder sb = new StringBuilder();
		sb.append(param.get("introduction"));
		sb.append(param.get("remarks"));
		param.put("introduction", sb.toString());
		if(param.containsKey("id")){
			productMapper.updateProduct(param);
		}else{
			param.put("id", CommonUtil.getSequence());
			productMapper.saveProduct(param);
		}
		return "1";
	}

	@Override
	public Map<String, Object> getProductById(String id) {
		return productMapper.getProductById(id);
	}

	@Override
	public String deleteProduct(String id,HttpServletRequest request) {
		Map<String, Object> map = productMapper.getProductById(id);
		String picture = (String)map.get("picture");
		String[] images = picture.split(",");
		 String rootPath = request.getSession().getServletContext().getRealPath("");
		for(int i=0; i<images.length; i++){
			File image = new File(rootPath+images[i]);
			if(image.exists()){
				image.delete();
			}
		}
		productMapper.deleteProduct(id);
		return "1";
	}


	@Override
	public List<Map<String, Object>> getProductListByBrand(String brand) {
		List<Map<String, Object>> list = productMapper.getProductListByBrand(brand);
		if(list!=null||list.size()>0){
			for(int i=0; i<list.size(); i++){
				Map<String, Object> map = list.get(i);
				String picture = (String)map.get("picture");
				String[] pictures = picture.split(",");
				map.put("picture",pictures);
				list.set(i, map);
			}
		}
		return list;
	}


	@Override
	public Map<String, Object> getProductByColor(String id) {
		Map<String, Object> map = productMapper.getProductByColor(id);
		String picture = (String)map.get("picture");
		String[] pictures = picture.split(",");
		map.put("picture",pictures);
		return map;
	}


	@Override
	public List<Map<String, Object>> getSearchResult(Map<String, Object> param) {
		String text = (String)param.get("text");
		String brand = (String)param.get("brand");
		text = text.trim();
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT t.* FROM shoes t where t.brand='"+brand+"'");
		if(text.contains(" ")){
			String[] strs = text.split(" ");
			for(int i=0; i<strs.length; i++){
				sb.append(" and t.introduction like '%"+strs[i]+"%'");
			}
		}else if(text.contains(",")){
			String[] strs = text.split(",");
			for(int i=0; i<strs.length; i++){
				sb.append(" and t.introduction like '%"+strs[i]+"%'");
			}
		}else{
			sb.append(" and t.introduction like '%"+text+"%'");
		}
		param.put("sql", sb.toString());
		List<Map<String, Object>> list = productMapper.getSearchResult(param);
		if(list!=null||list.size()>0){
			for(int i=0; i<list.size(); i++){
				Map<String, Object> map = list.get(i);
				String picture = (String)map.get("picture");
				String[] pictures = picture.split(",");
				map.put("picture",pictures);
				list.set(i, map);
			}
		}
		return list;
	}


	@Override
	public Map<String, Object> getProductInfoById(String id) {
		Map<String, Object> map = this.getProductById(id);
		String picture = (String)map.get("picture");
		String[] pictures = picture.split(",");
		map.put("picture",pictures);
		return map;
	}

	
}
