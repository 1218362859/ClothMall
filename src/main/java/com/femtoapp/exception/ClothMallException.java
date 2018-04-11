package com.femtoapp.exception;

public class ClothMallException extends Exception{

	public String message;
	public ClothMallException(String message){
		
		super(message);
		this.message=message;
		
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
