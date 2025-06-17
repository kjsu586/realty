package miniproject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("DAO_md_board")
public class DAO_md_board {
	
	@Resource(name="template")
	SqlSessionTemplate st;
	
	public int md_board_in(DTO_md_board dto) {
		int result = this.st.insert("miniproject.email_join_mapper.md_board_write",dto);
		return result;
	}
	
	public List<DTO_md_board> md_board_list(){
		List<DTO_md_board> md_list = this.st.selectList("miniproject.email_join_mapper.md_board_list");
		return md_list;
	}
	
	public void md_board_rcnt_up(int ridx) {
		this.st.update("miniproject.email_join_mapper.md_board_rcnt_up",ridx);
	}
	
	public DTO_md_board md_board_view(int ridx) {
		DTO_md_board md_view = this.st.selectOne("miniproject.email_join_mapper.md_board_view",ridx);
		return md_view;
	}
	
	public List<DTO_md_board> md_board_list(int offset, int pageSize, String search) {
	    Map<String, Object> map = new HashMap();
	    map.put("offset", offset);
	    map.put("limit", pageSize);
	    map.put("search", "%" + search + "%");
	    return st.selectList("miniproject.email_join_mapper.md_board_list_paging", map);
	}

	public int md_board_total(String search) {
	    return st.selectOne("miniproject.email_join_mapper.md_board_total", "%" + search + "%");
	}

}
