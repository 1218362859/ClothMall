package com.femtoapp.service;


import com.femtoapp.pojo.Photo;
import com.femtoapp.pojo.PhotoCustom;
import com.femtoapp.pojo.PhotoQueryVo;
import com.github.pagehelper.PageInfo;

public interface PhotoService {

	public Photo findObjectByid(String   id) throws Exception;
	public void insertObject(Photo photo) throws Exception;
	public void updateObject(Photo photo) throws Exception;
	public void deleteObject(String id)throws Exception;
	public PageInfo<PhotoCustom> queryByPage(PhotoQueryVo photoQueryVo, Integer pageNo, Integer pageSize)throws Exception;
}
