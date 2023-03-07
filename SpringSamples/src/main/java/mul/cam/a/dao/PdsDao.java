package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.PdsDto;

public interface PdsDao {

	List<PdsDto> pdslist();
	
	int uploadPds(PdsDto dto);
	
	void downcount(int seq);
	
	PdsDto getPds(int seq);
}
