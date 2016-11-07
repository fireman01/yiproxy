package com.product.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.catalog.service.CatalogService;
import com.common.util.FormDataCollectUtil;
import com.common.util.SpringContextUtil;
import com.product.bean.Status;
import com.product.service.ProductService;


@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Resource
	private ProductService productservice;
	
	@RequestMapping("/product_list")
	public  String getCatalogList(HttpServletRequest request,Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance()
				.getFormDataWithPage(request);
		model.addAttribute("productList", productservice.getProductListWithPage(param));
		int total = productservice.countProductTotal();
		int numPerPage = (Integer)param.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		model.addAttribute("totalPage", totalPage);
		if(totalPage==0){
			model.addAttribute("curPage",0);
		}else{
			model.addAttribute("curPage",(Integer)param.get("curPage"));
		}
		return "product/product_list";
		
	}
	
	@RequestMapping("/shoes_list")
	public  String getShoesList(HttpServletRequest request,Model model){
		String id = request.getParameter("id");
		model.addAttribute("productList", productservice.getProductListByName(id));
		return "product/shoes_list";
		
	}
	
	@RequestMapping("/search_result")
	public  String getSearchResult(HttpServletRequest request,Model model) throws UnsupportedEncodingException{
		Map<String, Object> param = FormDataCollectUtil.getInstance()
				.getFormData(request);
		model.addAttribute("productList", productservice.getSearchResult(param));
		return "product/search_result";
		
	}
	
	@RequestMapping("/detail_list")
	public  String getDetailList(HttpServletRequest request,Model model){
		String id = request.getParameter("id");
		model.addAttribute("product", productservice.getProductByColor(id));
		return "product/detail_list";
		
	}
	
	@RequestMapping("/nike")
	public  String getNikeList(HttpServletRequest request,Model model){
		CatalogService catalogService = (CatalogService)SpringContextUtil.getBeanById("CatalogService");
		model.addAttribute("catalogList", catalogService.getCascadingCatalogListByPreCatalog("nike"));
		/*model.addAttribute("productList", productservice.getProductListByBrand("nike"));*/
		return "product/nike";
		
	}
	
	@RequestMapping("/adidas")
	public  String getAdidasList(HttpServletRequest request,Model model){
		CatalogService catalogService = (CatalogService)SpringContextUtil.getBeanById("CatalogService");
		model.addAttribute("catalogList", catalogService.getCascadingCatalogListByPreCatalog("adidas"));
		return "product/adidas";
		
	}
	
	@RequestMapping("/asics")
	public  String getAsicsList(HttpServletRequest request,Model model){
		CatalogService catalogService = (CatalogService)SpringContextUtil.getBeanById("CatalogService");
		model.addAttribute("catalogList", catalogService.getCascadingCatalogListByPreCatalog("asics"));
		return "product/asics";
		
	}
	
	@RequestMapping("/converse")
	public  String getConverseList(HttpServletRequest request,Model model){
		CatalogService catalogService = (CatalogService)SpringContextUtil.getBeanById("CatalogService");
		model.addAttribute("catalogList", catalogService.getCascadingCatalogListByPreCatalog("converse"));
		return "product/converse";
		
	}
	
	@RequestMapping("/jordan")
	public  String getJordanList(HttpServletRequest request,Model model){
		CatalogService catalogService = (CatalogService)SpringContextUtil.getBeanById("CatalogService");
		model.addAttribute("catalogList", catalogService.getCascadingCatalogListByPreCatalog("jordan"));
		return "product/jordan";
		
	}
	
	@RequestMapping("/newbalance")
	public  String getNewbalanceList(HttpServletRequest request,Model model){
		CatalogService catalogService = (CatalogService)SpringContextUtil.getBeanById("CatalogService");
		model.addAttribute("catalogList", catalogService.getCascadingCatalogListByPreCatalog("newbalance"));
		return "product/newbalance";
		
	}
	
	@RequestMapping("/puma")
	public  String getPumaList(HttpServletRequest request,Model model){
		CatalogService catalogService = (CatalogService)SpringContextUtil.getBeanById("CatalogService");
		model.addAttribute("catalogList", catalogService.getCascadingCatalogListByPreCatalog("puma"));
		return "product/puma";
		
	}
	
	@RequestMapping("/reebok")
	public  String getReebokList(HttpServletRequest request,Model model){
		CatalogService catalogService = (CatalogService)SpringContextUtil.getBeanById("CatalogService");
		model.addAttribute("catalogList", catalogService.getCascadingCatalogListByPreCatalog("reebok"));
		return "product/reebok";
		
	}
	
	@RequestMapping("/timberland")
	public  String getTimberlandList(HttpServletRequest request,Model model){
		CatalogService catalogService = (CatalogService)SpringContextUtil.getBeanById("CatalogService");
		model.addAttribute("catalogList", catalogService.getCascadingCatalogListByPreCatalog("timberland"));
		return "product/timberland";
		
	}
	
	@RequestMapping("/ugg")
	public  String getUggList(HttpServletRequest request,Model model){
		CatalogService catalogService = (CatalogService)SpringContextUtil.getBeanById("CatalogService");
		model.addAttribute("catalogList", catalogService.getCascadingCatalogListByPreCatalog("ugg"));
		return "product/ugg";
		
	}
	
	@RequestMapping("/vans")
	public  String getVansList(HttpServletRequest request,Model model){
		CatalogService catalogService = (CatalogService)SpringContextUtil.getBeanById("CatalogService");
		model.addAttribute("catalogList", catalogService.getCascadingCatalogListByPreCatalog("vans"));
		return "product/vans";
		
	}
	
	
	@RequestMapping("/saveProduct")
	public void saveProduct(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance()
				.getFormData(request);
		String result = productservice.saveProduct(param);
		
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/*@RequestMapping("/catalog_edit")
	public String getCatalogInfo(HttpServletRequest request, Model model){
		String id = request.getParameter("id");
		Map<String, Object> map = productservice.getCatalogInfoById(id);
		model.addAttribute("catalogInfo", map);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		if(map!=null){
			list = productservice.getCatalogListByType(map.get("precatalog").toString());
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
	*/
	@RequestMapping("/product_add")
	public String toProductAdd(HttpServletRequest request, Model model){
		CatalogService catalogService = (CatalogService)SpringContextUtil.getBeanById("CatalogService");
		model.addAttribute("brandList", catalogService.getCatalogListByType("1"));
		return "product/product_add";
	}
	
	@RequestMapping("/product_edit")
	public String toProductEdit(HttpServletRequest request, Model model){
		String id = request.getParameter("id");
		Map<String, Object> map = productservice.getProductInfoById(id);
		CatalogService catalogService = (CatalogService)SpringContextUtil.getBeanById("CatalogService");
		model.addAttribute("brandList", catalogService.getCatalogListByType("1"));
		model.addAttribute("product", map);
		model.addAttribute("rangeList", catalogService.getCatalogListByPreCatalog((String)map.get("brand")));
		model.addAttribute("nameList", catalogService.getCatalogListByPreCatalog((String)map.get("shoesRange")));
		model.addAttribute("colorList", catalogService.getCatalogListByPreCatalog((String)map.get("name")));
		return "product/product_edit";
	}
	
	@RequestMapping("/deleteProduct")
	public void deleteProduct(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		String result = productservice.deleteProduct(id,request);
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST,produces = "application/json;charset=utf8")
	public Map<String, Object>  uploadMultipleFileHandler(@RequestParam("file") MultipartFile[] files,HttpServletRequest request) throws IOException{
			StringBuilder sb = new StringBuilder();
			Map<String, Object> map = new HashMap<String, Object>();
	        for (int i = 0; i < files.length; i++) {
	            MultipartFile file = files[i];
	            if (!file.isEmpty()) {
	                InputStream in = null;
	                OutputStream out = null;
	                try {
	                    String rootPath = request.getSession().getServletContext().getRealPath("");
	                    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	                    String today = sdf.format(new Date());
	                    File dir = new File(rootPath + File.separator + "upload"+File.separator + today);
	                    if (!dir.exists())
	                        dir.mkdirs();
	                    String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));     
	                    String logImageName = UUID.randomUUID().toString()+ suffix;
	                    File serverFile = new File(dir.getAbsolutePath() + File.separator +logImageName);
	                    if(sb.length()<1){
	                    	sb.append("/upload/" + today+"/"+logImageName);
	                    }else{
	                    	sb.append(",/upload/" + today+"/"+logImageName);
	                    }
	                    in = file.getInputStream();
	                    out = new FileOutputStream(serverFile);
	                    byte[] b = new byte[1024];
	                    int len = 0;
	                    while ((len = in.read(b)) > 0) {
	                        out.write(b, 0, len);
	                    }
	                    out.close();
	                    in.close();
	                    File backupFile = new File(System.getProperty("catalina.home")+ File.separator + "upload"+File.separator + today);
	                    if (!backupFile.exists())
	                    	backupFile.mkdirs();
	                    File bkserverFile = new File(backupFile.getAbsolutePath() + File.separator +logImageName);
	                    in = file.getInputStream();
	                    out = new FileOutputStream(bkserverFile);
	                    b = new byte[1024];
	                    while ((len = in.read(b)) > 0) {
	                        out.write(b, 0, len);
	                    }
	                    out.close();
	                    in.close();
	                    map.put("path", sb.toString());
	        	        map.put("status", Status.SUCCESS);
	                } catch (Exception e) {
	                	e.printStackTrace();
	                	map.put("status", Status.ERROR);
	                } finally {
	                    if (out != null) {
	                        out.close();
	                        out = null;
	                    }
	                    if (in != null) {
	                        in.close();
	                        in = null;
	                    }
	                }
	            } 
	        }
	        
	        return map;
	}
	
	
	
}


