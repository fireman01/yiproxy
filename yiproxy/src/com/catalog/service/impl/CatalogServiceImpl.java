package com.catalog.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.catalog.mapper.CatalogMapper;
import com.catalog.service.CatalogService;
import com.common.util.CommonUtil;

@Service("CatalogService")
public class CatalogServiceImpl implements CatalogService{
	
	@Resource
	private CatalogMapper catalogMapper;

	@Override
	public List<Map<String, Object>> getCatalogListWithPage(
			Map<String, Object> param) {
		return catalogMapper.getCatalogListWithPage(param);
	}

	@Override
	public int countCatalogTotal() {
		return catalogMapper.countCatalogTotal();
	}

	@Override
	public List<Map<String, Object>> getCatalogListByType(String type) {
		return catalogMapper.getCatalogListByType(type);
	}

	@Override
	public String saveCatalog(Map<String, Object> param) {
		param.put("updateTime", new Date());
		if(param.containsKey("id")){
			catalogMapper.updateCatalog(param);
		}else{
			param.put("id", CommonUtil.getSequence());
			catalogMapper.saveCatalog(param);
		}
		return "1";
	}

	@Override
	public Map<String, Object> getCatalogInfoById(String id) {
		return catalogMapper.getCatalogInfoById(id);
	}

	@Override
	public String deleteCatalog(String id) {
		catalogMapper.deleteCatalog(id);
		return "1";
	}

	@Override
	public List<Map<String, Object>> getCatalogListByPreCatalog(String id) {
		return catalogMapper.getCatalogListByPreCatalog(id);
	}
	
	@Override
	public List<Map<String, Object>> getCascadingCatalogListByPreCatalog(String id) {
		List<Map<String, Object>> list = catalogMapper.getCatalogListByPreCatalog(id);
		if(list!=null||list.size()>0){
			for(int i=0; i<list.size(); i++){
				Map<String, Object> map = list.get(i);
				String precatalog = (String)map.get("id");
				map.put("nameList", catalogMapper.getCatalogListByPreCatalog(precatalog));
				list.set(i, map);
			}
			
		}
		return list;
	}

	
}
