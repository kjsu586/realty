package miniproject;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

@Repository("DAO_apt_info")
public class DAO_apt_info {

	@Resource(name="template")
	public SqlSessionTemplate st;
	
	public List<DTO_apt_info> all_data() {
		List<DTO_apt_info> all = this.st.selectList("miniproject.email_join_mapper.apt_info");
        return all;
    }
	
	public List<DTO_apt_info> md_data(){
		List<DTO_apt_info> md = this.st.selectList("miniproject.email_join_mapper.md_choice");
		return md;
	}
	
	public DTO_apt_info selectByAidx(int aidx) {
		DTO_apt_info result = this.st.selectOne("selectByAidx", aidx);
	    return result;
	}
	
}
