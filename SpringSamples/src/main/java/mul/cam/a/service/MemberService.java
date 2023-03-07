package mul.cam.a.service;

import java.util.List;

import mul.cam.a.dto.MemberDto;

public interface MemberService {

	List<MemberDto> allMember();
	
	boolean idCheck(String id);
	boolean addMember(MemberDto dto);
	MemberDto login(MemberDto dto);
}
