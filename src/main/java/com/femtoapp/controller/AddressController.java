package com.femtoapp.controller;



import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.femtoapp.pojo.Address;
import com.femtoapp.pojo.AddressCustom;
import com.femtoapp.pojo.AddressQueryVo;
import com.femtoapp.service.AddressService;
import com.femtoapp.service.ValidateService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/address")
public class AddressController {

	@Autowired
	private AddressService addressService;

	
	
	//��ҳ���������ջ���ַ
			@RequestMapping("/findAddressListclient")
			public  @ResponseBody JSONObject findAddressListclient(AddressCustom addressCustom,Integer pageNo, Integer pageSize)throws Exception{
				JSONObject json = new JSONObject();
				AddressQueryVo addressQueryVo = new AddressQueryVo();
				addressQueryVo.setAddressCustom(addressCustom);
				try {
					PageInfo<AddressCustom> queryByPage = addressService.queryByPage(addressQueryVo, pageNo, pageSize);
					json.put("result",1);
					json.put("queryByPage",queryByPage);
					return json;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					json.put("result",-1);
					json.put("message",e.getMessage());
					return json;
				}
			}
			//����ջ���ַ
			@RequestMapping("/insertAddressclient")
			public  @ResponseBody JSONObject insertAddressclient(Address address)throws Exception{
				JSONObject json = new JSONObject();
				try {
					address.setAid(UUID.randomUUID().toString());
					addressService.insertObject(address);
					json.put("result",1);
					json.put("message","��ӳɹ�");
					return json;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					json.put("result",-1);
					json.put("message",e.getMessage());
					return json;
				}
			}
			//ɾ���ջ���ַ
			@RequestMapping("/deleteAddressclient")
			public  @ResponseBody JSONObject deleteAddressclient(String  aid)throws Exception{
				JSONObject json = new JSONObject();
				try {
					addressService.deleteObject(aid);
					json.put("result",1);
					json.put("message","ɾ���ɹ�");
					return json;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					json.put("result",-1);
					json.put("message",e.getMessage());
					return json;
				}
			}
			//�޸��ջ���ַ
			@RequestMapping("/updateAddressclient")
			public  @ResponseBody JSONObject updateAddressclient(Address address)throws Exception{
				JSONObject json = new JSONObject();
				try {
					addressService.updateObject(address);
					json.put("result",1);
					json.put("message","�޸ĳɹ�");
					return json;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					json.put("result",-1);
					json.put("message",e.getMessage());
					return json;
				}
			}
}
