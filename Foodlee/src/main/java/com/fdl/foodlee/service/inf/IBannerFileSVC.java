package com.fdl.foodlee.service.inf;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface IBannerFileSVC {
	String DEF_UPLOAD_DEST = "/uploads";
	String DEF_UP_PREFIX = "UP_";
	String MULTI_SEP = "|"; //","
	String writeUploadedFile(MultipartFile upfile, 
				String realPath, String userName);
	boolean makeUserDir(HttpSession ses, String login);
	//String writeUploadedMultipleFiles(
	Map<String,Object> writeUploadedMultipleFiles(		
//			MultipartFile upfiles, 
			List<MultipartFile> upfiles, 
			String realPath, String login);
}
