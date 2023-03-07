package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.BbsComment;
import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.BbsParam;

public interface BbsDao {

	List<BbsDto> bbslist(BbsParam bbs);	
	int getAllBbs(BbsParam bbs);
	
	int writeBbs(BbsDto dto);
	
	BbsDto getBbs(int seq);
	
	int updateBbs(BbsDto dto);
	
	int answerBbsUpdate(BbsDto dto);
	int answerBbsInsert(BbsDto dto);
	
	// 댓글
	int commentWrite(BbsComment bbs);	
	List<BbsComment> commentList(int seq);
}



