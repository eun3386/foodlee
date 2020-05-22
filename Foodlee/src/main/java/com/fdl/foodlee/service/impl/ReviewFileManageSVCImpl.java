package com.fdl.foodlee.service.impl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fdl.foodlee.service.inf.IReviewFileSVC;

@Service
public class ReviewFileManageSVCImpl implements IReviewFileSVC {

	// 파일 네이밍(이름 짓기)
	// /userName/ 사용자별 고유 저장폴더
	// koala.png
	// "UP_koala_시간정보_RANDOM.png"
	// "UP_koala_yyyyMMddHHmmss_RANDOM.png"

	private String makeUniqueFilename(String oriFile) {
		StringBuffer uniName = new StringBuffer();
		int lastExt = oriFile.lastIndexOf('.');
		String oriFileName = oriFile.substring(0, lastExt);
		String oriExt = oriFile.substring(lastExt + 1).toLowerCase();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		UUID uuid = UUID.randomUUID();
		String myuuid = uuid.toString();
		//
		uniName.append(DEF_UP_PREFIX);
		uniName.append(oriFileName + "_");
		uniName.append(sdf.format(new Date()) + "_");
		uniName.append(myuuid);
		uniName.append("." + oriExt);

		System.out.println(uniName);

		return uniName.toString();
	}

	@Override
	public String writeUploadedFile(MultipartFile upfile, String realPath, String userName) {

		// DEF_UPLOAD_DEST
		String filePath = ""; // 512B
		String oriFilename = "";
		if (upfile != null && !upfile.isEmpty()) {
			oriFilename = upfile.getOriginalFilename();
			String storedFileName = makeUniqueFilename(oriFilename);
			// realPath += storedFileName;
			realPath += userName + "/" + storedFileName;
			// realPath += userName+"_"+oriFilename;

			File dest = new File(realPath);
			System.out.println("realPath: " + realPath);
			try {
				upfile.transferTo(dest);
//				filePath = DEF_UPLOAD_DEST + "/" +
//						userName+"_"+oriFilename;
				filePath = DEF_UPLOAD_DEST + "/" + userName + "/" + storedFileName;
				return filePath;
//			} catch (IllegalStateException | IOException e) {
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	@Override
	public boolean makeUserDir(HttpSession ses, String login) {
		// 사용자 전용 고유 폴더 만들기..
		String userRealPath = ses.getServletContext().getRealPath(DEF_UPLOAD_DEST) + "\\" + login;
		System.out.println("userRealPath = " + userRealPath);
		
		File upbFolder = new File(ses.getServletContext().getRealPath(DEF_UPLOAD_DES));
		if (!upbFolder.isDirectory()) {
			try {
				Files.createDirectory(upbFolder.toPath());
				
				File upFolder = new File(ses.getServletContext().getRealPath(DEF_UPLOAD_DEST));
				// upFolder.mkdir();
				
				Files.createDirectory(upFolder.toPath());
				
				File userFolder = new File(userRealPath);
				
				Files.createDirectory(userFolder.toPath());
				// userFolder.canWrite();
				// return userFolder.mkdir();
				System.out.println("폴더 생성에 성공함");
				return true;
			} catch (IOException e) {
				System.out.println("폴더 생성 에러 에러 이유:");
				e.printStackTrace();
				return false;
			}
		} else {
			System.err.println("이미 폴더가 존재");
			return false;
		}
	}

	@Override
	// public String writeUploadedMultipleFiles(
	public Map<String, Object> writeUploadedMultipleFiles(List<MultipartFile> reviewPic, String realPath, String login) {
		StringBuffer sb = new StringBuffer();
		long totalByte = 0L;
		for (int i = 0; i < reviewPic.size(); i++) {
			MultipartFile uf = reviewPic.get(i);
			String fp = this.writeUploadedFile(uf, realPath, login);
			if (fp != null) {
				sb.append(fp + (i != reviewPic.size() - 1 ? MULTI_SEP : ""));
				totalByte += uf.getSize();
			} else {
				System.out.println("파일저장 실패: " + uf.getOriginalFilename());
			}
		}
		double totalMB = totalByte / (1024.0 * 1024.0);
		int fileCnt = reviewPic.size();
		String muliFPs = sb.toString();

		HashMap<String, Object> rMap = new HashMap<String, Object>();
		rMap.put("totalMB", new Double(totalMB));
		rMap.put("fileCnt", new Integer(fileCnt));
		rMap.put("muliFPs", muliFPs);
		return rMap;
	}
}
