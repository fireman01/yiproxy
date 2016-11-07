package com.product.mapper;


import java.util.List;
import java.util.Map;

public interface ProductMapper {
    
    
    List<Map<String, Object>> getProductListWithPage(Map<String, Object> param);
    
    int countProductTotal();

	List<Map<String, Object>> getProductListByName(String id);
	
	Map<String, Object> getProductByColor(String id);
	
	void saveProduct(Map<String, Object> param);
	
	void updateProduct(Map<String, Object> param);
	
	Map<String, Object> getProductById(String id);
	
	void deleteProduct(String id);

	List<Map<String, Object>> getProductListByBrand(String brand);
	
	List<Map<String, Object>> getSearchResult(Map<String, Object> param);
    
}