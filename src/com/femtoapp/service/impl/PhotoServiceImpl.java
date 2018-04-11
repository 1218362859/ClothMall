package com.femtoapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.femtoapp.exception.ClothMallException;
import com.femtoapp.mapper.PhotoMapper;
import com.femtoapp.pojo.Photo;
import com.femtoapp.pojo.PhotoCustom;
import com.femtoapp.pojo.PhotoQueryVo;
import com.femtoapp.service.PhotoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class PhotoServiceImpl implements PhotoService {

	@Autowired
	private PhotoMapper photoMapper;

	@Override
	public Photo findObjectByid(String id) throws Exception {
		// TODO Auto-generated method stub
		
		Photo photo = photoMapper.findObjectByid(id);
		if(photo==null) {
			throw new ClothMallException("没有找到");
		}
		return photo;
	}

	@Override
	public void insertObject(Photo photo) throws Exception {
		// TODO Auto-generated method stub
		try {
			photoMapper.insertObject(photo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("添加失败");
		}
	}

	@Override
	public void updateObject(Photo photo) throws Exception {
		// TODO Auto-generated method stub
		try {
			photoMapper.updateObject(photo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("修改失败");
		}
	}

	@Override
	public void deleteObject(String id) throws Exception {
		// TODO Auto-generated method stub
		try {
			photoMapper.deleteObject(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("删除失败");
		}
	}

	@Override
	public PageInfo<PhotoCustom> queryByPage(PhotoQueryVo photoQueryVo, Integer pageNo, Integer pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<PhotoCustom> list = photoMapper.findObjectList(photoQueryVo);
	    //用PageInfo对结果进行包装
	    PageInfo<PhotoCustom> page = new PageInfo<PhotoCustom>(list);
		return page;
	}


	


}
