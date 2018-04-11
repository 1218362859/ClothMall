package com.femtoapp.service;

import com.femtoapp.pojo.Validate;

public interface ValidateService {

	public Validate findValidateByPhonenum(String    phonenum) throws Exception;
	public void insertValidate(Validate validate)throws Exception;
}
