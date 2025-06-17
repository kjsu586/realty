package miniproject;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("DAO_email_join")
public class DAO_email_join {
	
	@Resource(name="template")
	public SqlSessionTemplate st;
	
	public int email_in(DTO_email_join dto) {
		//System.out.println(dto.e_mail);
		//System.out.println(dto.e_ck1);
		int result = this.st.insert("email_insert",dto);
		return result;
	}
	
	public List<DTO_email_join> login(DTO_email_join dto) {
		List<DTO_email_join> result = this.st.selectList("login",dto);
		
		return result;
	}
	
	public DTO_email_join findByKakaoId(String kakao_id) {
	    return this.st.selectOne("findByKakaoId", kakao_id);
	}
	
}
