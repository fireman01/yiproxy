package com.product.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ProductService {

	 List<Map<String, Object>> getProductListWithPage(Map<String, Object> param);
	    
	 int countProductTotal();
	 
	 List<Map<String, Object>> getProductListByName(String id);
	 
	 Map<String, Object> getProductByColor(String id);

	 String saveProduct(Map<String, Object> param);
	 
	 Map<String, Object> getProductById(String id);
	 
	 Map<String, Object> getProductInfoById(String id);
	 
	 String deleteProduct(String id,HttpServletRequest request);

	 List<Map<String, Object>> getProductListByBrand(String brand);
	 
	 List<Map<String, Object>> getSearchResult(Map<String, Object> param);
}
