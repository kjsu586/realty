package miniproject;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("DAO_counsel")
public class DAO_counsel {

	@Resource(name="template")
	public SqlSessionTemplate st;
	
	public int counsel(DTO_counsel dto) {
		int result = this.st.insert("counsel",dto);
		return result;
	}
	
	public int reserve_ck(String e_mail) {
		int result = this.st.selectOne("miniproject.email_join_mapper.reserve_ck",e_mail);
		return result;
	}
	
}
