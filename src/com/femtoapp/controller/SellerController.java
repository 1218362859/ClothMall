package com.femtoapp.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.alibaba.fastjson.JSONObject;
import com.femtoapp.pojo.Seller;
import com.femtoapp.pojo.SellerCustom;
import com.femtoapp.pojo.SellerQueryVo;
import com.femtoapp.pojo.User;
import com.femtoapp.pojo.Validate;
import com.femtoapp.service.SellerService;
import com.femtoapp.service.ValidateService;
import com.femtoapp.tool.MD5Tools;
import com.femtoapp.tool.SendTelMessage;
import com.femtoapp.tool.UploadImage;
import com.femtoapp.tool.ValidateCode;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/seller")
public class SellerController {

	@Autowired
	private SellerService sellerService;
	@Autowired
	private ValidateService validateService;

	// ע�� ��֤�ֻ�����
	@RequestMapping("/registerSellerclient")
	public @ResponseBody JSONObject registerSellerclient(String username, String password, String phonenum, String code)
			throws Exception {

		JSONObject json = new JSONObject();
		try {
			sellerService.findSellerByUsername(username);
		} catch (Exception e) {
			try {
				Validate validate = validateService.findValidateByPhonenum(phonenum);
				if (validate.getValidateCode().equals(code)) {
					String sid = UUID.randomUUID().toString();
					Seller seller = new Seller();
					seller.setUsername(username);
					seller.setPhonenum(phonenum);
					seller.setState(1);
					seller.setName("��ʱ��ͣ��Ƭ��");
					seller.setCreate_time(current_time());
					seller.setSid(sid);
					sellerService.insertObject(seller);

					json.put("result", 1);
					json.put("message", "ע��ɹ�����������¼");
					return json;
				}
				json.put("result", -1);
				json.put("message", "��֤�����");
				return json;

			} catch (Exception e1) {
				// TODO Auto-generated catch block
				json.put("result", -1);
				json.put("message", "��֤������");
				return json;
			}
		}

		json.put("result", -1);
		json.put("message", "���˺��ѱ�ע��");

		return json;

	}

	// �ϴ�ͷ��
	@RequestMapping("/ResultuploadPhoneclient")
	public @ResponseBody JSONObject ResultuploadPhoneclient(
			@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, String sid)
			throws Exception {
		JSONObject json = new JSONObject();
		if (sid == null) {

			json.put("result", -1);
			json.put("message", "δ���յ��û�id");
			return json;
		}
		Seller seller = null;
		try {
			seller = sellerService.findObjectByid(sid);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			json.put("result", -1);
			json.put("message", "δ�ҵ����û�");
			return json;
		}
		if (file == null) {

			json.put("result", -1);
			json.put("message", "�ļ�Ϊ��");
			return json;

		}
		String path;
		try {
			path = uploadFile(file, request);
			File oldfile = new File("C:" + seller.getPhotourl());
			if (oldfile.exists() && oldfile.isFile()) {
				oldfile.delete();
			}
		} catch (IOException e) {
			json.put("result", -1);
			json.put("message", "�ϴ�ʧ�ܣ�IO�쳣");

			return json;
		}
		seller.setPhotourl(path.substring(2, path.length()));
		try {

			sellerService.updateObject(seller);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json.put("result", -1);
			json.put("message", "�޸�ʧ��");

			return json;
		}
		json.put("result", 1);
		json.put("path", path);
		json.put("message", "�ϴ��ɹ�");

		return json;

	}

	private String uploadFile(MultipartFile file, HttpServletRequest request)

			throws IOException {

		String path = "C:\\resources\\fileUpload\\images\\" + current_time_day() + "\\";// ·��
		String newFileName = UUID.randomUUID().toString() + file.getOriginalFilename();// �ļ������� uuid+�ļ�ԭ����
		File targetFile = new File(path, newFileName);
		// ����ļ��в������򴴽�
		if (!targetFile.exists() && !targetFile.isDirectory()) {
			System.out.println("//������");
			// file .mkdir(); //ֻ�ܴ�������Ŀ¼
			targetFile.mkdirs();// �����༶Ŀ¼
		}
		file.transferTo(targetFile);// ���ڴ��е�����д��

		return targetFile.getAbsolutePath();

	}

	// �����û����Ƿ����
	@RequestMapping("/findUsernameclient")
	public @ResponseBody JSONObject findUsernameclient(String username) throws Exception {
		JSONObject json = new JSONObject();
		try {
			sellerService.findSellerByUsername(username);
		} catch (Exception e) {
			json.put("result", 1);
			json.put("message", "����ʹ�ø��˺�");
			return json;
		}
		json.put("result", -1);
		json.put("message", "���˺��ѱ�ע��");

		return json;
	}

	// �������뷢�Ͷ���
	@RequestMapping("/LossPasswordSendValidateCodeclient")
	public @ResponseBody JSONObject LossPasswordSendValidateCodeclient(String phonenum) throws Exception {

		JSONObject json = new JSONObject();
		try {
			Seller seller = sellerService.findSellerByPhonenum(phonenum);
			String code = ValidateCode.createCode(4);// ����һ����λ�����
			int result_code = SendTelMessage.SMSsend(code, phonenum);// ����nub���͵���phone�ϣ����ط��ͽ��result 1Ϊ�ɹ����� -1 Ϊ����ʧ��

			if (result_code == 1) {
				Validate validate = new Validate();
				validate.setPhonenum(phonenum);
				validate.setValidateCode(code);
				validate.setCreate_time(current_time());
				validateService.insertValidate(validate);
				json.put("id", seller.getSid());
				json.put("result", 1);
				json.put("message", "��֤���ѳɹ����͵������ֻ�");
				return json;
			} else {
				json.put("result", 0);
				json.put("message", "������æ");
				return json;
			}
		} catch (Exception e) {
			json.put("result", -1);
			json.put("message", "���ֻ�����δע��");
			return json;
		}

	}

	// �޸��̼һ�����Ϣ
	@RequestMapping("/updateSellerclient")
	public @ResponseBody JSONObject updateSellerclient(String sid, String name, String type, String phonenum,
			String describes, String seller_name) throws Exception {

		JSONObject json = new JSONObject();

		try {
			Seller seller = sellerService.findObjectByid(sid);
			if (name != null) {

				seller.setName(seller_name);
			}
			if (type != null) {

				seller.setType(type);
			}
			if (phonenum != null) {

				seller.setPhonenum(phonenum);
			}
			if (describes != null) {

				seller.setDescribes(describes);
			}
			if (seller_name != null) {

				seller.setSeller_name(seller_name);
			}
			sellerService.updateObject(seller);
			json.put("result", 1);
			json.put("message", "�޸ĳɹ�");
			return json;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json.put("result", -1);
			json.put("message", e.getMessage());
			return json;
		}

	}

	// �����������֤���޸�
	@RequestMapping("/LossPassChangeclient")
	public @ResponseBody JSONObject LossPassChangeclient(String sid, String newPassword, String phonenum, String code)
			throws Exception {

		JSONObject json = new JSONObject();

		Seller seller;
		try {

			seller = sellerService.findObjectByid(sid);
		} catch (Exception e1) {
			json.put("result", -1);
			json.put("message", "�Ҳ������û�");
			return json;
		}

		try {
			Validate validate = validateService.findValidateByPhonenum(phonenum);
			if (validate.getValidateCode().equals(code) && seller.getPhonenum().equals(phonenum)) {
				seller.setPassword(MD5Tools.MD5(newPassword));
				sellerService.updateObject(seller);
				json.put("result", 1);
				json.put("message", "�޸ĳɹ�");
				return json;

			}
			json.put("result", -1);
			json.put("message", "��֤�����");
			return json;

		} catch (Exception e) {
			json.put("result", -1);
			json.put("message", "��֤������");
			return json;
		}

	}

	// �޸�����
	@RequestMapping("/changePasswordclient")
	public @ResponseBody JSONObject changePasswordclient(String sid, String oldPassword, String newPassword)
			throws Exception {

		JSONObject json = new JSONObject();

		Seller seller;
		try {
			seller = sellerService.findObjectByid(sid);
			if (seller.getPassword().equals(MD5Tools.MD5(oldPassword))) {

				seller.setPassword(MD5Tools.MD5(newPassword));
				sellerService.updateObject(seller);
				json.put("result", 1);
				json.put("message", "�޸�����ɹ�");
				return json;
			}

			json.put("result", -1);
			json.put("message", "�������������");
			return json;
		} catch (Exception e) {
			json.put("result", -1);
			json.put("message", "�û�δ�ҵ������ݴ���");
			return json;
		}

	}

	/*
	 * ע�ᷢ����֤��
	 */
	@RequestMapping("/SendValidateCodeByphonenumclient")
	public @ResponseBody JSONObject SendValidateCodeByphonenumclient(String phonenum) throws Exception {
		JSONObject json = new JSONObject();

		try {
			Seller seller = sellerService.findSellerByPhonenum(phonenum);
			json.put("result", -1);
			json.put("message", "�ú����ѱ�ע��");
			return json;
		} catch (Exception e) {
			String code = ValidateCode.createCode(4);// ����һ����λ�����
			int result_code = SendTelMessage.SMSsend(code, phonenum);// ����nub���͵���phone�ϣ����ط��ͽ��result 1Ϊ�ɹ����� -1 Ϊ����ʧ��

			if (result_code == 1) {
				Validate validate = new Validate();
				validate.setPhonenum(phonenum);
				validate.setValidateCode(code);
				validate.setCreate_time(current_time());
				validateService.insertValidate(validate);

				json.put("result", 1);
				json.put("message", "��֤���ѳɹ����͵������ֻ�");
				return json;
			} else {
				json.put("result", 0);
				json.put("message", "������æ");
				return json;
			}
		}

	}

	@RequestMapping("/loginclient")
	public @ResponseBody JSONObject loginclient(HttpServletResponse response, String username, String password)
			throws Exception {

		JSONObject json = new JSONObject();

		Seller seller;
		try {
			seller = sellerService.findSellerByUsername(username);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json.put("result", -1);
			json.put("message", e.getMessage());
			return json;
		}

		if (!seller.getPassword().equals(MD5Tools.MD5(password))) {
			json.put("result", -1);
			json.put("message", "�������");
			return json;
		}

		if (seller.getState() != 1) {
			json.put("result", -1);
			json.put("message", "�˺�δ����");

			return json;

		} else {
			json.put("result", 1);
			json.put("seller", seller);
			return json;

		}
	}

	@RequestMapping("/findSellerById")
	public void findSellerById(HttpServletResponse response, String sid) throws Exception {

		Seller seller = sellerService.findObjectByid(sid);
		if (seller != null) {
			response.getWriter().print("1");
		} else {

			response.getWriter().print("0");
		}

	}

	@RequestMapping("/findsellerlist")
	public ModelAndView findsellerlist(SellerCustom sellerCustom, Integer pageNo, Integer pageSize) throws Exception {
		ModelAndView modelAndView = new ModelAndView();

		SellerQueryVo sellerQueryVo = new SellerQueryVo();
		sellerQueryVo.setSellerCustom(sellerCustom);
		PageInfo<SellerCustom> queryByPage = sellerService.queryByPage(sellerQueryVo, pageNo, pageSize);

		modelAndView.setViewName("/WEB-INF/admin/sellerlist.jsp");
		modelAndView.addObject("queryByPage", queryByPage);
		modelAndView.addObject("seller", sellerCustom);
		return modelAndView;
	}

	@RequestMapping("/findSeller_Goods_CategoryResultMap")
	public ModelAndView findSeller_Goods_CategoryResultMap(SellerCustom sellerCustom, Integer pageNo, Integer pageSize)
			throws Exception {
		ModelAndView modelAndView = new ModelAndView();

		SellerQueryVo sellerQueryVo = new SellerQueryVo();
		sellerQueryVo.setSellerCustom(sellerCustom);
		PageInfo<Seller> queryByPage = sellerService.findSeller_Goods_CategoryResultMap(sellerQueryVo, pageNo,
				pageSize);

		modelAndView.setViewName("/WEB-INF/admin/seller.jsp");
		modelAndView.addObject("queryByPage", queryByPage);
		modelAndView.addObject("seller", sellerCustom);
		return modelAndView;
	}

	@RequestMapping("/insertPage")
	public String insertPage() throws Exception {

		return "/WEB-INF/admin/insertSeller.jsp";
	}

	@RequestMapping("/findSellerByUsername")
	public void findSellerByUsername(HttpServletResponse response, String username) throws Exception {

		JSONObject json = new JSONObject();
		Seller seller = sellerService.findSellerByUsername(username);
		if (seller == null) {
			response.getWriter().print("1");
		} else {

			response.getWriter().print("0");
		}

	}

	@RequestMapping("/updatePage")
	public ModelAndView updatePage(String sid) throws Exception {
		Seller seller = sellerService.findObjectByid(sid);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("seller", seller);
		modelAndView.setViewName("/WEB-INF/admin/insertSeller.jsp");
		return modelAndView;
	}

	@RequestMapping("/insertObject")
	public String insertObject(Seller seller, HttpServletRequest request) throws Exception {
		MultipartFile multipartFile = null;
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) {
			MultipartHttpServletRequest multipartRequest = WebUtils.getNativeRequest(request,
					MultipartHttpServletRequest.class);
			multipartFile = multipartRequest.getFile("multipartFile");
		}
		if (multipartFile.getSize() != 0) {
			seller.setPhotourl(UploadImage.uploadimage(multipartFile));
		}
		seller.setSid(UUID.randomUUID().toString());
		seller.setCreate_time(current_time());
		seller.setPassword(MD5Tools.MD5(seller.getPassword()));
		sellerService.insertObject(seller);
		return "redirect:/seller/findsellerlist.action";
	}

	@RequestMapping("/updateObject")
	public String updateObject(Seller seller, HttpServletRequest request) throws Exception {
		MultipartFile multipartFile = null;
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) {
			MultipartHttpServletRequest multipartRequest = WebUtils.getNativeRequest(request,
					MultipartHttpServletRequest.class);
			multipartFile = multipartRequest.getFile("multipartFile");
		}
		if (multipartFile.getSize() != 0) {
			seller.setPhotourl(UploadImage.uploadimage(multipartFile));
		} else {
			Seller seller2 = sellerService.findObjectByid(seller.getSid());
			seller.setPhotourl(seller2.getPhotourl());
		}
		sellerService.updateObject(seller);
		return "redirect:/seller/findsellerlist.action";
	}

	@RequestMapping("/deleteObject")
	public String deleteObject(String sid) throws Exception {

		sellerService.deleteObject(sid);
		return "redirect:/seller/findsellerlist.action";
	}

	private String current_time() {

		Date d = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String dateNowStr = sdf.format(d);

		return dateNowStr;
	}

	private String current_time_day() {

		Date d = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateNowStr = sdf.format(d);

		return dateNowStr;
	}

}
