package com.femtoapp.mapper;

import java.util.List;

import com.femtoapp.pojo.Photo;
import com.femtoapp.pojo.PhotoCustom;
import com.femtoapp.pojo.PhotoQueryVo;


public interface PhotoMapper {
	public Photo findObjectByid(String   id) throws Exception;
	public void insertObject(Photo photo) throws Exception;
	public List<PhotoCustom> findObjectList(PhotoQueryVo photoQueryVo) throws Exception;
	public void updateObject(Photo photo) throws Exception;
	public void deleteObject(String id)throws Exception;
}
