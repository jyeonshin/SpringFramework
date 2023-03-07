package mul.cam.a.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import mul.cam.a.service.PdsService;

public class DownloadView extends AbstractView{
	
	@Autowired
	PdsService service;

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("DownloadView renderMergedOutputModel");
		
		File downloadFile = (File)model.get("downloadFile");
		String filename = (String)model.get("filename");	// 원본 파일명
		int seq = (Integer)model.get("seq");
		
		response.setContentType(this.getContentType());
		response.setContentLength((int)downloadFile.length());
		
		// 이 설정은 한글명 파일의 경우 적용된다.
		filename = URLEncoder.encode(filename, "utf-8");
		
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Content-Length", "" + downloadFile.length());
		response.setHeader("Pragma", "no-cache;"); 
		response.setHeader("Expires", "-1;");
		
		OutputStream os = response.getOutputStream();
		FileInputStream fis = new FileInputStream(downloadFile);
		
		// 실제 데이터 기입
		FileCopyUtils.copy(fis, os);
		
		// down load count 증가
		service.downcount(seq);
		
		if(fis != null) {
			fis.close();
		}
	}

	
}






