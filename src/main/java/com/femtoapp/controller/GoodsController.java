package com.femtoapp.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.femtoapp.pojo.GoodsCustom;
import com.femtoapp.pojo.GoodsQueryVo;
import com.alibaba.fastjson.JSONObject;
import com.femtoapp.pojo.Category;
import com.femtoapp.pojo.CategoryCustom;
import com.femtoapp.pojo.CategoryQueryVo;
import com.femtoapp.pojo.Goods;
import com.femtoapp.service.CategoryService;
import com.femtoapp.service.GoodsService;
import com.femtoapp.tool.UploadImage;
import com.github.pagehelper.PageInfo;



@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	@Autowired
	private CategoryService categoryService;
//后台分页条件查找商品列表
	@RequestMapping("/findgoodslist")
	public ModelAndView findgoodslist(GoodsCustom goodsCustom,Integer pageNo, Integer pageSize)throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		GoodsQueryVo goodsQueryVo = new GoodsQueryVo();
		goodsQueryVo.setGoodsCustom(goodsCustom);
		PageInfo<GoodsCustom> queryByPage = goodsService.queryByPage(goodsQueryVo, pageNo,pageSize);
		
		modelAndView.setViewName("/WEB-INF/admin/goodslist.jsp");
		modelAndView.addObject("queryByPage", queryByPage);
		modelAndView.addObject("goods", goodsCustom);
		return modelAndView;
	}
	//客户端分页条件查找商品列表
	@RequestMapping("/findgoodslistclient")
	public @ResponseBody JSONObject findgoodslistclient(GoodsCustom goodsCustom,Integer pageNo, Integer pageSize)throws Exception{

		JSONObject json = new JSONObject();
		GoodsQueryVo goodsQueryVo = new GoodsQueryVo();
		goodsQueryVo.setGoodsCustom(goodsCustom);
		try {
			PageInfo<GoodsCustom> queryByPage = goodsService.queryByPage(goodsQueryVo, pageNo,pageSize);
			json.put("result", 1);
			json.put("queryByPage", queryByPage);
			return json;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json.put("result", -1);
			json.put("message",e.getMessage());
			return json;
		}
		
		
		
	
	}
	
	//客户端根据id查找商品信息
		@RequestMapping("/findgoodsByidclient")
		public @ResponseBody JSONObject findgoodsByidclient(String gid)throws Exception{
		
			JSONObject json = new JSONObject();
			
			try {
				Goods goods = goodsService.findObjectByid(gid);
				json.put("result", 1);
				json.put("goods",goods);
				
				return json;
			} catch (Exception e) {
				json.put("result", -1);
				json.put("message",e.getMessage());
				return json;
			}
			
		
		}

		//添加商品基本信息
		@RequestMapping("/insertGoodsclient")
		public @ResponseBody JSONObject insertGoodsclient(CategoryCustom categoryCustom)throws Exception{
		
			JSONObject json = new JSONObject();
			
			try {
				
				
				categoryCustom.setGid(UUID.randomUUID().toString());
				categoryCustom.setCreate_time(current_time());
				categoryCustom.setCid(UUID.randomUUID().toString());
				goodsService.insertObject(categoryCustom);
				categoryService.insertObject(categoryCustom);
				
				
				json.put("result", 1);
				json.put("message","添加商品信息成功");
				return json;
			} catch (Exception e) {
				json.put("result", -1);
				json.put("message",e.getMessage());
				return json;
			}
			
		
		}
		
		
		//客户端根据id查找商品类别信息
		@RequestMapping("/findCategoryclient")
		public @ResponseBody JSONObject findCategoryclient(CategoryCustom categoryCustom,Integer pageNo, Integer pageSize)throws Exception{
		
			JSONObject json = new JSONObject();
			CategoryQueryVo categoryQueryVo = new CategoryQueryVo();
			categoryQueryVo.setCategoryCustom(categoryCustom);
			try {
				PageInfo<CategoryCustom> queryByPage = categoryService.queryByPage(categoryQueryVo, pageNo, pageSize);
				json.put("result", 1);
				json.put("queryByPage",queryByPage);
				return json;
			} catch (Exception e) {
				json.put("result", -1);
				json.put("message",e.getMessage());
				return json;
			}
			
		
		}
	
	
	//后台  到添加页面
	@RequestMapping("/insertPage")
	public String insertPage() throws Exception {

		return "/WEB-INF/admin/insertGoods.jsp";
	}
	@RequestMapping("/insertCategoryPage")
	public String insertCategoryPage() throws Exception {

		return "/WEB-INF/admin/insertCategoryPage.jsp";
	}
	//后台 到修改页面
	@RequestMapping("/updatePage")
	public ModelAndView updatePage(String cid) throws Exception {
		CategoryCustom categoryCustom = categoryService.findObjectByid(cid);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("category", categoryCustom);
		modelAndView.setViewName("/WEB-INF/admin/updateGoods.jsp");
		return modelAndView;
	}
	

//ajax查找商品id
	@RequestMapping("/findGoodsById")
	public   void  findSellerById(HttpServletResponse response,String gid) throws Exception{
		
	Goods goods = goodsService.findObjectByid(gid);
		if(goods!=null) {
			response.getWriter().print("1");
		}else {
			
			response.getWriter().print("0");
		}
		
	}
	
	//客户端添加商品类别
		@RequestMapping("/insertCategoryclient")
		public 		@ResponseBody JSONObject insertCategoryclient(CategoryCustom categoryCustom)throws Exception{
			JSONObject json = new JSONObject();
			
			categoryCustom.setCid(UUID.randomUUID().toString());
			try {
				categoryService.insertObject(categoryCustom);
				json.put("result",1);
				json.put("message","添加类别成功");
				return json;
			} catch (Exception e) {
				// TODO Auto-generated catch block
			json.put("result",-1);
			json.put("message",e.getMessage());
			return json;
			}
		}
	
	
	//后台添加商品类别
	@RequestMapping("/insertCategory")
	public String insertCategory(CategoryCustom categoryCustom,HttpServletRequest request)throws Exception{
		MultipartFile multipartFile = null;
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart){ 
            MultipartHttpServletRequest multipartRequest = WebUtils.getNativeRequest(request, MultipartHttpServletRequest.class);
            multipartFile = multipartRequest.getFile("multipartFile");
        }
		if(multipartFile.getSize()!=0) {
			categoryCustom.setImageurl(UploadImage.uploadimage(multipartFile));
		}		
		
		
		categoryCustom.setCid(UUID.randomUUID().toString());
		categoryService.insertObject(categoryCustom);
		return "redirect:/goods/findgoodslist.action";
	}
	//后台添加商品并添加类别
	@RequestMapping("/insertGoodsCategory")
	public String insertGoodsCategory(CategoryCustom categoryCustom,HttpServletRequest request)throws Exception{
		MultipartFile multipartFile = null;
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart){ 
            MultipartHttpServletRequest multipartRequest = WebUtils.getNativeRequest(request, MultipartHttpServletRequest.class);
            multipartFile = multipartRequest.getFile("multipartFile");
        }
		if(multipartFile.getSize()!=0) {
			categoryCustom.setImageurl(UploadImage.uploadimage(multipartFile));
		}
		categoryCustom.setGid(UUID.randomUUID().toString());
		categoryCustom.setCreate_time(current_time());
		categoryCustom.setCid(UUID.randomUUID().toString());
		goodsService.insertObject(categoryCustom);
		categoryService.insertObject(categoryCustom);
		return "redirect:/goods/findgoodslist.action";
	}
	//修改商品基本信息
	@RequestMapping("/updateObject")
	public String updateObject(CategoryCustom categoryCustom,HttpServletRequest request)throws Exception{
		MultipartFile multipartFile = null;
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart){ 
            MultipartHttpServletRequest multipartRequest = WebUtils.getNativeRequest(request, MultipartHttpServletRequest.class);
            multipartFile = multipartRequest.getFile("multipartFile");
        }
		if(multipartFile.getSize()!=0) {
			categoryCustom.setImageurl(UploadImage.uploadimage(multipartFile));
		}else {
			Category category2 = categoryService.findObjectByid(categoryCustom.getCid());
			categoryCustom.setImageurl(category2.getImageurl());
		}
		categoryService.updateObject(categoryCustom);
		return "redirect:/goods/findgoodslist.action";
	}
	
	
	//客户端修改商品基本信息
		@RequestMapping("/updateObjectclient")
		public  @ResponseBody JSONObject updateObjectclient(CategoryCustom categoryCustom)throws Exception{
			JSONObject json = new JSONObject();
			

			
			
			try {
				categoryService.updateObject(categoryCustom);
				json.put("result",1);
				json.put("message","修改成功");
				return json;
			} catch (Exception e) {
				json.put("result",-1);
				json.put("message",e.getMessage());
				return json;
			}
			
		}
		//客户端删除商品
		@RequestMapping("/deleteObjectclient")
		public  @ResponseBody JSONObject  deleteObjectclient(String gid)throws Exception{
			JSONObject json = new JSONObject();
			try {
				goodsService.findObjectByid(gid);
				goodsService.deleteObject(gid);
				json.put("result",1);
				json.put("message","删除成功");
				return json;
			} catch (Exception e) {
				json.put("result",-1);
				json.put("message",e.getMessage());
				return json;
			}
		}
		
		//客户端删除商品类别
		@RequestMapping("/deleteCategoryclient")
		public  @ResponseBody JSONObject  deleteCategoryclient(String cid)throws Exception{
			JSONObject json = new JSONObject();
			try {
				categoryService.deleteObject(cid);
				json.put("result",1);
				json.put("message","删除成功");
				return json;
			} catch (Exception e) {
				json.put("result",-1);
				json.put("message",e.getMessage());
				return json;
			}
		}
	
	
	//删除商品
	@RequestMapping("/deleteObject")
	public String deleteObject(String gid)throws Exception{
		
		goodsService.deleteObject(gid);
		return "redirect:/goods/findgoodslist.action";
	}
	private String current_time() {

		Date d = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateNowStr = sdf.format(d);

		return dateNowStr;
	}

}
