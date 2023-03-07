package mul.cam.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.PdsDao;
import mul.cam.a.dto.PdsDto;

@Repository
public class PdsDaoImpl implements PdsDao {
	@Autowired
	SqlSessionTemplate session;
	
	String ns = "Pds.";

	@Override
	public List<PdsDto> pdslist() {		
		return session.selectList(ns + "pdslist");
	}

	@Override
	public int uploadPds(PdsDto dto) {		
		return session.insert(ns + "uploadPds", dto);
	}

	@Override
	public void downcount(int seq) {
		session.update(ns + "downcount", seq);
	}

	@Override
	public PdsDto getPds(int seq) {		
		return session.selectOne(ns + "getPds", seq);
	}
	
	
	
}








