package com.catalog.service;

import java.util.List;
import java.util.Map;

public interface CatalogService {

	 List<Map<String, Object>> getCatalogListWithPage(Map<String, Object> param);
	    
	 int countCatalogTotal();
	 
	 List<Map<String, Object>> getCatalogListByType(String type);

	 String saveCatalog(Map<String, Object> param);
	 
	 Map<String, Object> getCatalogInfoById(String id);
	 
	String deleteCatalog(String id);

	List<Map<String, Object>> getCatalogListByPreCatalog(String id);
	
	List<Map<String, Object>> getCascadingCatalogListByPreCatalog(String id);
}
