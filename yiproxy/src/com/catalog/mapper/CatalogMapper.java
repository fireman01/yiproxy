package com.catalog.mapper;


import java.util.List;
import java.util.Map;

public interface CatalogMapper {
    
    
    List<Map<String, Object>> getCatalogListWithPage(Map<String, Object> param);
    
    int countCatalogTotal();

	List<Map<String, Object>> getCatalogListByType(String type);
	
	void saveCatalog(Map<String, Object> param);
	
	void updateCatalog(Map<String, Object> param);
	
	Map<String, Object> getCatalogInfoById(String id);
	
	void deleteCatalog(String id);

	List<Map<String, Object>> getCatalogListByPreCatalog(String id);
    
}