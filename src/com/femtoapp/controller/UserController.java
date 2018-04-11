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

	// 退出
	@RequestMapping("/loginout")
	public String loginout(HttpSession session) throws Exception {

		session.invalidate();// session过期
		return "/WEB-INF/login.jsp";
	}

	// 修改用户基本信息
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
			json.put("message", "修改成功");
			return json;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json.put("result", -1);
			json.put("message", e.getMessage());
			return json;
		}

	}

	// 注册 验证手机号码
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
					user.setNickname("把时间停留片刻");
					user.setCreate_time(current_time());
					user.setUid(uid);
					userService.insertObject(user);

					json.put("result", 1);
					json.put("message", "注册成功，请立即登录");
					return json;
				}
				json.put("result", -1);
				json.put("message", "验证码错误");
				return json;

			} catch (Exception e1) {
				// TODO Auto-generated catch block
				json.put("result", -1);
				json.put("message", "验证码有误");
				return json;
			}
		}

		json.put("result", -1);
		json.put("message", "该账号已被注册");

		return json;

	}

	// 上传头像
	@RequestMapping("/ResultuploadPhoneclient")
	public @ResponseBody JSONObject ResultuploadPhoneclient(
			@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, String uid)
			throws Exception {
		JSONObject json = new JSONObject();
		if (uid == null) {

			json.put("result", -1);
			json.put("message", "未接收到用户id");
			return json;
		}
		User user = null;
		try {
			user = userService.findObjectByid(uid);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			json.put("result", -1);
			json.put("message", "未找到该用户");
			return json;
		}
		if (file == null) {

			json.put("result", -1);
			json.put("message", "文件为空");
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
			json.put("message", "上传失败，IO异常");

			return json;
		}
		user.setPhotourl(path.substring(2, path.length()));
		try {

			userService.updateObject(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			json.put("result", -1);
			json.put("message", "修改失败");

			return json;
		}
		json.put("result", 1);
		json.put("path", path);
		json.put("message", "上传成功");

		return json;

	}

	private String uploadFile(MultipartFile file, HttpServletRequest request)

			throws IOException {

		String path = "C:\\resources\\fileUpload\\images\\" + current_time_day() + "\\";// 路径
		String newFileName = UUID.randomUUID().toString() + file.getOriginalFilename();// 文件新名称 uuid+文件原名称
		File targetFile = new File(path, newFileName);
		// 如果文件夹不存在则创建
		if (!targetFile.exists() && !targetFile.isDirectory()) {
			System.out.println("//不存在");
			// file .mkdir(); //只能创建单个目录
			targetFile.mkdirs();// 创建多级目录
		}
		file.transferTo(targetFile);// 将内存中的数据写入

		return targetFile.getAbsolutePath();

	}

	// 查找用户名是否可用
	@RequestMapping("/findUsernameclient")
	public @ResponseBody JSONObject findUsernameclient(String username) throws Exception {
		JSONObject json = new JSONObject();
		try {
			User u = userService.findUserByUsername(username);
		} catch (Exception e) {
			json.put("result", 1);
			json.put("message", "可以使用该账号");
			return json;
		}
		json.put("result", -1);
		json.put("message", "该账号已被注册");

		return json;
	}

	// 忘记密码发送短信
	@RequestMapping("/LossPasswordSendValidateCodeclient")
	public @ResponseBody JSONObject LossPasswordSendValidateCodeclient(String phonenum) throws Exception {

		JSONObject json = new JSONObject();
		try {
			User user = userService.findUserByPhonenum(phonenum);
			String code = ValidateCode.createCode(4);// 生成一个四位随机码
			int result_code = SendTelMessage.SMSsend(code, phonenum);// 将该nub发送到该phone上，返回发送结果result 1为成功发送 -1 为发送失败

			if (result_code == 1) {
				Validate validate = new Validate();
				validate.setPhonenum(phonenum);
				validate.setValidateCode(code);
				validate.setCreate_time(current_time());
				validateService.insertValidate(validate);
				json.put("id", user.getUid());
				json.put("result", 1);
				json.put("message", "验证码已成功发送到您的手机");
				return json;
			} else {
				json.put("result", 0);
				json.put("message", "服务器忙");
				return json;
			}
		} catch (Exception e) {
			json.put("result", -1);
			json.put("message", "该手机号码未注册");
			return json;
		}

	}

	// 忘记密码后验证并修改
	@RequestMapping("/LossPassChangeclient")
	public @ResponseBody JSONObject LossPassChangeclient(String uid, String newPassword, String phonenum, String code)
			throws Exception {

		JSONObject json = new JSONObject();

		User user;
		try {

			user = userService.findObjectByid(uid);
		} catch (Exception e1) {
			json.put("result", -1);
			json.put("message", "找不到该用户");
			return json;
		}

		try {
			Validate validate = validateService.findValidateByPhonenum(phonenum);
			if (validate.getValidateCode().equals(code) && user.getPhonenum().equals(phonenum)) {
				user.setPassword(MD5Tools.MD5(newPassword));
				userService.updateObject(user);
				json.put("result", 1);
				json.put("message", "修改成功");
				return json;

			}
			json.put("result", -1);
			json.put("message", "验证码错误");
			return json;

		} catch (Exception e) {
			json.put("result", -1);
			json.put("message", "验证码有误");
			return json;
		}

	}

	// 修改密码
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
				json.put("message", "修改密码成功");
				return json;
			}

			json.put("result", -1);
			json.put("message", "旧密码输入错误");
			return json;
		} catch (Exception e) {
			json.put("result", -1);
			json.put("message", "用户未找到，数据错误");
			return json;
		}

	}

	/*
	 * 注册发送验证码
	 */
	@RequestMapping("/SendValidateCodeByphonenumclient")
	public @ResponseBody JSONObject SendValidateCodeByphonenumclient(String phonenum) throws Exception {
		JSONObject json = new JSONObject();

		try {
			User user = userService.findUserByPhonenum(phonenum);
			json.put("result", -1);
			json.put("message", "该号码已被注册");
			return json;
		} catch (Exception e) {
			String code = ValidateCode.createCode(4);// 生成一个四位随机码
			int result_code = SendTelMessage.SMSsend(code, phonenum);// 将该nub发送到该phone上，返回发送结果result 1为成功发送 -1 为发送失败

			if (result_code == 1) {
				Validate validate = new Validate();
				validate.setPhonenum(phonenum);
				validate.setValidateCode(code);
				validate.setCreate_time(current_time());
				validateService.insertValidate(validate);

				json.put("result", 1);
				json.put("message", "验证码已成功发送到您的手机");
				return json;
			} else {
				json.put("result", 0);
				json.put("message", "服务器忙");
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
			json.put("message", "密码错误");
			return json;
		}

		if (user.getState() != 1) {
			json.put("result", -1);
			json.put("message", "账号未激活");

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
			modelAndView.addObject("error", "用户未找到");
			modelAndView.addObject("username", username);
			modelAndView.addObject("password", password);
			modelAndView.setViewName("/WEB-INF/login.jsp");
			return modelAndView;
		}
		if (!user.getPassword().equals(MD5Tools.MD5(password))) {
			modelAndView.addObject("error", "密码错误");
			modelAndView.addObject("username", username);
			modelAndView.addObject("password", password);
			modelAndView.setViewName("/WEB-INF/login.jsp");
			return modelAndView;
		}
		if (user.getPower() != 1) {
			modelAndView.addObject("error", "权限不足");
			modelAndView.addObject("username", username);
			modelAndView.addObject("password", password);
			modelAndView.setViewName("/WEB-INF/login.jsp");
			return modelAndView;
		}

		if (user.getState() != 1) {
			modelAndView.addObject("error", "账号未激活");

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
