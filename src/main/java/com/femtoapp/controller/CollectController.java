package com.femtoapp.controller;



import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.femtoapp.pojo.Collect;
import com.femtoapp.pojo.CollectCustom;
import com.femtoapp.pojo.CollectQueryVo;
import com.femtoapp.service.CollectService;
import com.github.pagehelper.PageInfo;



@Controller
@RequestMapping("/collect")
public class CollectController {

	@Autowired
	private CollectService collectService;

	//分页条件查找公司收藏ResultType
		@RequestMapping("/findCollectSellerListclient")
		public  @ResponseBody JSONObject findCollectSellerListclient(String uid,Integer pageNo, Integer pageSize)throws Exception{
			JSONObject json = new JSONObject();
			try {
				PageInfo<CollectCustom> queryByPage = collectService.findCollectSellerListqueryByPage(uid, pageNo,pageSize);
				json.put("result", 1);
				json.put("queryByPage",queryByPage);
				return json;
			} catch (Exception e) {
				// TODO Auto-generated catch block
			json.put("result", -1);
			json.put("message",e.getMessage());
			return json;
			}
			
		}
		
		
		
		
		//分页条件查找公司收藏ResultMap
				@RequestMapping("/findCollectSellerListResultMapclient")
				public  @ResponseBody JSONObject findCollectSellerListResultMapclient(String uid,String p_type,String co_type,Integer pageNo, Integer pageSize)throws Exception{
					JSONObject json = new JSONObject();
					try {
						PageInfo<Collect> queryByPage = collectService.findCollectSellerListResultMap(uid,p_type,co_type,pageNo, pageSize);
						json.put("result", 1);
						json.put("queryByPage",queryByPage);
						return json;
					} catch (Exception e) {
						// TODO Auto-generated catch block
					json.put("result", -1);
					json.put("message",e.getMessage());
					return json;
					}
					
				}
				//分页条件查找面料商品收藏ResultMap
				@RequestMapping("/findCollectCategoryListResultMapclient")
				public  @ResponseBody JSONObject findCollectCategoryListResultMapclient(String uid,String co_type,Integer pageNo, Integer pageSize)throws Exception{
					JSONObject json = new JSONObject();
					try {
						PageInfo<Collect> queryByPage = collectService.findCollectCategoryListResultMap(uid, co_type, pageNo, pageSize);
						json.put("result", 1);
						json.put("queryByPage",queryByPage);
						return json;
					} catch (Exception e) {
						// TODO Auto-generated catch block
					json.put("result", -1);
					json.put("message",e.getMessage());
					return json;
					}
					
				}
		
		
		
		
	//分页条件查找收藏
	@RequestMapping("/findcollectlistclient")
	public  @ResponseBody JSONObject findcollectlistclient(CollectCustom collectCustom,Integer pageNo, Integer pageSize)throws Exception{
		JSONObject json = new JSONObject();
		
		CollectQueryVo collectQueryVo = new CollectQueryVo();
		collectQueryVo.setCollectCustom(collectCustom);
		try {
			PageInfo<CollectCustom> queryByPage = collectService.queryByPage(collectQueryVo, pageNo,pageSize);
			json.put("result", 1);
			json.put("queryByPage",queryByPage);
			return json;
		} catch (Exception e) {
			// TODO Auto-generated catch block
		json.put("result", -1);
		json.put("message",e.getMessage());
		return json;
		}
		
	}
	//根据id查找收藏
		@RequestMapping("/findcollectByidclient")
		public  @ResponseBody JSONObject findcollectByidclient(String coid)throws Exception{
			JSONObject json = new JSONObject();
			
			try {
				Collect collect = collectService.findObjectByid(coid);
				json.put("result", 1);
				json.put("collect",collect);
				return json;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				json.put("result", -1);
				json.put("message",e.getMessage());
				return json;
			}
			
		
		}

		//添加收藏
		@RequestMapping("/insertcollectclient")
		public  @ResponseBody JSONObject insertcollectclient( Collect collect)throws Exception{
			JSONObject json = new JSONObject();
			try {
				collect.setCoid(UUID.randomUUID().toString());
				collect.setCreate_time(current_time());
				collectService.insertObject(collect);
				json.put("result", 1);
				json.put("message","添加成功");
				return json;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				json.put("result", -1);
				json.put("message",e.getMessage());
				return json;
			}
		
		}
		//修改收藏
		@RequestMapping("/updatecollectclient")
		public  @ResponseBody JSONObject updatecollectclient( Collect collect)throws Exception{
			JSONObject json = new JSONObject();
			try {
				collectService.updateObject(collect);
				json.put("result", 1);
				json.put("message","修改成功");
				return json;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				json.put("result", -1);
				json.put("message",e.getMessage());
				return json;
			}
		
		}
		//删除收藏
		@RequestMapping("/deletecollectclient")
		public  @ResponseBody JSONObject deletecollectclient( String  coid)throws Exception{
			JSONObject json = new JSONObject();
			try {
				collectService.deleteObject(coid);
				json.put("result", 1);
				json.put("message","删除成功");
				return json;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				json.put("result", -1);
				json.put("message",e.getMessage());
				return json;
			}
		
		}
		private String current_time() {

			Date d = new Date();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateNowStr = sdf.format(d);

			return dateNowStr;
		}
}
