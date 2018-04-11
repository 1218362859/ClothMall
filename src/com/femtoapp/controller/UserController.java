package com.femtoapp.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.femtoapp.pojo.User;
import com.femtoapp.pojo.UserCustom;
import com.femtoapp.pojo.UserQueryVo;
import com.femtoapp.pojo.Validate;
import com.femtoapp.service.UserService;
import com.femtoapp.service.ValidateService;
import com.femtoapp.tool.MD5Tools;
import com.femtoapp.tool.SendTelMessage;
import com.femtoapp.tool.UploadImage;
import com.femtoapp.tool.ValidateCode;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private ValidateService validateService;

	@RequestMapping("/loginPage")
	public String loginPage() throws Exception {

		return "/WEB-INF/login.jsp";
	}

	// �˳�
	@RequestMapping("/loginout")
	public String loginout(HttpSession session) throws Exception {

		session.invalidate();// session����
		return "/WEB-INF/login.jsp";
	}

	// �޸��û�������Ϣ
	@RequestMapping("/updateUserclient")
	public @ResponseBody JSONObject updateUserclient(String uid, Float weight, Float height, String phonenum,
			String birthday, String sex, String nickname) throws Exception {

		JSONObject json = new JSONObject();

		try {
			User user = userService.findObjectByid(uid);
			if (weight != null) {

				user.setWeight(weight);
			}
			if (height != null) {

				user.setHeight(height);
			}
			if (phonenum != null) {

				user.setPhonenum(phonenum);
			}
			if (birthday != null) {

				user.setBirthday(birthday);
			}
			if (sex != null) {

				user.setSex(sex);
			}
			if (nickname != null) {

				user.setNickname(nickname);
			}
			userService.updateObject(user);
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

	// ע�� ��֤�ֻ�����
	@RequestMapping("/registerUserclient")
	public @ResponseBody JSONObject registerUserclient(String username, String password, String phonenum, String code)
			throws Exception {

		JSONObject json = new JSONObject();
			userService.findUserByPhonenum(phonenum);
		try {
			userService.findUserByUsername(username);
		} catch (Exception e) {
			try {
				Validate validate = validateService.findValidateByPhonenum(phonenum);
				if (validate.getValidateCode().equals(code)) {
					String uid = UUID.randomUUID().toString();
					User user = new User();
					user.setPassword(MD5Tools.MD5(password));
					user.setPower(0);
					user.setUsername(username);
					user.setPhonenum(phonenum);
					user.setState(1);
					user.setNickname("��ʱ��ͣ��Ƭ��");
					user.setCreate_time(current_time());
					user.setUid(uid);
					userService.insertObject(user);

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
			@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, String uid)
			throws Exception {
		JSONObject json = new JSONObject();
		if (uid == null) {

			json.put("result", -1);
			json.put("message", "δ���յ��û�id");
			return json;
		}
		User user = null;
		try {
			user = userService.findObjectByid(uid);
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
			File oldfile = new File("C:" + user.getPhotourl());
			if (oldfile.exists() && oldfile.isFile()) {
				oldfile.delete();
			}
		} catch (IOException e) {
			json.put("result", -1);
			json.put("message", "�ϴ�ʧ�ܣ�IO�쳣");

			return json;
		}
		user.setPhotourl(path.substring(2, path.length()));
		try {

			userService.updateObject(user);
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
			User u = userService.findUserByUsername(username);
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
			User user = userService.findUserByPhonenum(phonenum);
			String code = ValidateCode.createCode(4);// ����һ����λ�����
			int result_code = SendTelMessage.SMSsend(code, phonenum);// ����nub���͵���phone�ϣ����ط��ͽ��result 1Ϊ�ɹ����� -1 Ϊ����ʧ��

			if (result_code == 1) {
				Validate validate = new Validate();
				validate.setPhonenum(phonenum);
				validate.setValidateCode(code);
				validate.setCreate_time(current_time());
				validateService.insertValidate(validate);
				json.put("id", user.getUid());
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

	// �����������֤���޸�
	@RequestMapping("/LossPassChangeclient")
	public @ResponseBody JSONObject LossPassChangeclient(String uid, String newPassword, String phonenum, String code)
			throws Exception {

		JSONObject json = new JSONObject();

		User user;
		try {

			user = userService.findObjectByid(uid);
		} catch (Exception e1) {
			json.put("result", -1);
			json.put("message", "�Ҳ������û�");
			return json;
		}

		try {
			Validate validate = validateService.findValidateByPhonenum(phonenum);
			if (validate.getValidateCode().equals(code) && user.getPhonenum().equals(phonenum)) {
				user.setPassword(MD5Tools.MD5(newPassword));
				userService.updateObject(user);
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
	public @ResponseBody JSONObject changePasswordclient(String uid, String oldPassword, String newPassword)
			throws Exception {

		JSONObject json = new JSONObject();

		User user;
		try {
			user = userService.findObjectByid(uid);
			if (user.getPassword().equals(MD5Tools.MD5(oldPassword))) {

				user.setPassword(MD5Tools.MD5(newPassword));
				userService.updateObject(user);
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
			User user = userService.findUserByPhonenum(phonenum);
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

		User user;
		try {
			user = userService.findUserByUsername(username);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json.put("result", -1);
			json.put("message", e.getMessage());
			return json;
		}

		if (!user.getPassword().equals(MD5Tools.MD5(password))) {
			json.put("result", -1);
			json.put("message", "�������");
			return json;
		}

		if (user.getState() != 1) {
			json.put("result", -1);
			json.put("message", "�˺�δ����");

			return json;

		} else {
			json.put("result", 1);
			json.put("user", user);
			return json;

		}
	}

	@RequestMapping("/login")
	public ModelAndView login(HttpSession session, HttpServletResponse response, String username, String password)
			throws Exception {

		ModelAndView modelAndView = new ModelAndView();

		User user = userService.findUserByUsername(username);

		if (user == null) {
			modelAndView.addObject("error", "�û�δ�ҵ�");
			modelAndView.addObject("username", username);
			modelAndView.addObject("password", password);
			modelAndView.setViewName("/WEB-INF/login.jsp");
			return modelAndView;
		}
		if (!user.getPassword().equals(MD5Tools.MD5(password))) {
			modelAndView.addObject("error", "�������");
			modelAndView.addObject("username", username);
			modelAndView.addObject("password", password);
			modelAndView.setViewName("/WEB-INF/login.jsp");
			return modelAndView;
		}
		if (user.getPower() != 1) {
			modelAndView.addObject("error", "Ȩ�޲���");
			modelAndView.addObject("username", username);
			modelAndView.addObject("password", password);
			modelAndView.setViewName("/WEB-INF/login.jsp");
			return modelAndView;
		}

		if (user.getState() != 1) {
			modelAndView.addObject("error", "�˺�δ����");

			modelAndView.addObject("username", username);
			modelAndView.addObject("password", password);
			modelAndView.setViewName("/WEB-INF/login.jsp");
			return modelAndView;

		} else {
			session.setAttribute("admin", user);
			modelAndView.setViewName("/WEB-INF/admin/index.jsp");
			return modelAndView;

		}

	}

	@RequestMapping("/insertPage")
	public String insertPage() throws Exception {

		return "/WEB-INF/admin/insertUser.jsp";
	}

	@RequestMapping("/updatePage")
	public ModelAndView updatePage(String uid) throws Exception {
		User user = userService.findObjectByid(uid);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user", user);
		modelAndView.setViewName("/WEB-INF/admin/insertUser.jsp");
		return modelAndView;
	}

	@RequestMapping("/findUserByUsername")
	public void findUserByUsername(HttpServletResponse response, String username) throws Exception {

		User user = userService.findUserByUsername(username);
		if (user == null) {
			response.getWriter().print("1");
		} else {

			response.getWriter().print("0");
		}

	}

	@RequestMapping("/finduserlist")
	public ModelAndView finduserlist(UserCustom userCustom, Integer pageNo, Integer pageSize) throws Exception {
		ModelAndView modelAndView = new ModelAndView();

		UserQueryVo userQueryVo = new UserQueryVo();
		userQueryVo.setUserCustom(userCustom);
		PageInfo<UserCustom> queryByPage = userService.queryByPage(userQueryVo, pageNo, pageSize);

		modelAndView.setViewName("/WEB-INF/admin/userlist.jsp");
		modelAndView.addObject("queryByPage", queryByPage);
		modelAndView.addObject("user", userCustom);
		return modelAndView;
	}

	@RequestMapping("/insertObject")
	public String insertObject(User user, HttpServletRequest request) throws Exception {
		MultipartFile multipartFile = null;
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) {
			MultipartHttpServletRequest multipartRequest = WebUtils.getNativeRequest(request,
					MultipartHttpServletRequest.class);
			multipartFile = multipartRequest.getFile("multipartFile");
		}
		if (multipartFile.getSize() != 0) {
			user.setPhotourl(UploadImage.uploadimage(multipartFile));
		}
		user.setUid(UUID.randomUUID().toString());
		user.setPassword(MD5Tools.MD5(user.getPassword()));
		user.setCreate_time(current_time());
		userService.insertObject(user);
		return "redirect:/user/finduserlist.action";
	}

	@RequestMapping("/updateObject")
	public String updateObject(User user, HttpServletRequest request) throws Exception {
		MultipartFile multipartFile = null;
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) {
			MultipartHttpServletRequest multipartRequest = WebUtils.getNativeRequest(request,
					MultipartHttpServletRequest.class);
			multipartFile = multipartRequest.getFile("multipartFile");
		}
		if (multipartFile.getSize() != 0) {
			user.setPhotourl(UploadImage.uploadimage(multipartFile));
		} else {
			User user2 = userService.findObjectByid(user.getUid());
			user.setPhotourl(user2.getPhotourl());
		}

		userService.updateObject(user);
		return "redirect:/user/finduserlist.action";
	}

	@RequestMapping("/deleteObject")
	public String deleteObject(String uid) throws Exception {

		userService.deleteObject(uid);
		return "redirect:/user/finduserlist.action";
	}

	private String current_time() {

		Date d = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
