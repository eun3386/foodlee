package com.fdl.foodlee.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fdl.foodlee.service.inf.IEventFileSVC;

@Service
public class EventFileManageSVCImpl implements IEventFileSVC {

	@Override
	public String writeUploadedFile(MultipartFile upfile, String realPath, String userName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean makeUserDir(HttpSession ses, String login) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Map<String, Object> writeUploadedMultipleFiles(List<MultipartFile> upfiles, String realPath, String login) {
		// TODO Auto-generated method stub
		return null;
	}

}
