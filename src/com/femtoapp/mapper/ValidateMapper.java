package com.femtoapp.mapper;

import com.femtoapp.pojo.Validate;

public interface ValidateMapper {

	
	public Validate findValidateByPhonenum(String    phonenum) throws Exception;
	public void insertValidate(Validate validate)throws Exception;
}
