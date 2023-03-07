package mul.cam.a.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import mul.cam.a.dto.PdsDto;
import mul.cam.a.service.PdsService;
import mul.cam.a.util.PdsUtil;

@Controller
public class PdsController {

	@Autowired
	PdsService service;
	
	@RequestMapping(value = "pdslist.do", method = RequestMethod.GET)
	public String pdslist(Model model) {
		List<PdsDto> list = service.pdslist();
		model.addAttribute("pdslist", list);
		
		return "pdslist";
	}
	
	@GetMapping(value = "pdswrite.do")
	public String pdswrite() {
		return "pdswrite";
	}
	
	@PostMapping(value = "pdsupload.do")
	public String pdsupload(PdsDto dto, 
							@RequestParam(value = "fileload", required = false)
							MultipartFile fileload,
							HttpServletRequest req) {	
		
		// filename 痍⑤뱷
		String filename = fileload.getOriginalFilename();	// �썝蹂몄쓽 �뙆�씪紐�
		
		dto.setFilename(filename);	// �썝蹂� �뙆�씪紐�(DB)
		
		// upload�쓽 寃쎈줈 �꽕�젙
		// server
		String fupload = req.getServletContext().getRealPath("/upload");
		
		// �뤃�뜑
	//	String fupload = "c:\\temp";
		
		System.out.println("fupload:" + fupload);
		
		// �뙆�씪紐낆쓣 異⑸룎�릺吏� �븡�뒗 紐낆묶(Date)�쑝濡� 蹂�寃�
		String newfilename = PdsUtil.getNewFileName(filename);
		
		dto.setNewfilename(newfilename);	// 蹂�寃쎈맂 �뙆�씪紐�
		
		File file = new File(fupload + "/" + newfilename);
				 
		try {
			// �떎�젣濡� �뙆�씪 �깮�꽦 + 湲곗엯 = �뾽濡쒕뱶
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// db�뿉 ���옣
			service.uploadPds(dto);
			
		} catch (IOException e) {			
			e.printStackTrace();
		}		
		
		return "redirect:/pdslist.do";
	}
	
	@PostMapping(value = "filedownLoad.do")
	public String filedownLoad(int seq, String filename, String newfilename, Model model, 
			HttpServletRequest req) {
		
		// 寃쎈줈
		// server
		String fupload = req.getServletContext().getRealPath("/upload");
				
		// �뤃�뜑
		//	String fupload = "c:\\temp";
		
		// �떎�슫濡쒕뱶 諛쏆쓣 �뙆�씪
		File downloadFile = new File(fupload + "/" + newfilename);				
		
		model.addAttribute("downloadFile", downloadFile);	// file �떎�젣 �뾽濡쒕뱶�릺�뼱 �엳�뒗 �뙆�씪紐�	寃쎈줈/35435345345.txt
		model.addAttribute("filename", filename);		// �썝 �뙆�씪紐�					abc.txt
		model.addAttribute("seq", seq);					// download 移댁슫�듃瑜� 利앷�
		
		return "downloadView";
	}
	
	@GetMapping(value = "pdsdetail.do")
	public String pdsdetail(Model model, int seq) {
		PdsDto pds = service.getPds(seq);
		model.addAttribute("pds", pds);
		
		return "pdsdetail";
	}
	
}











