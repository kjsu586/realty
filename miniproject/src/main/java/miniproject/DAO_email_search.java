package miniproject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("DAO_email_search")
public class DAO_email_search {

	 @Resource(name="template")
	    public SqlSessionTemplate st;
	 
	 public DTO_email_join email_ck(String e_mail) {
		 	DTO_email_join result = this.st.selectOne("miniproject.email_join_mapper.email_check", e_mail);
		    return result;
		}
	 
	 public int pw_update(String e_pw, String e_pwck, int eidx) {
		    Map<String, Object> map = new HashMap<String, Object>();
		    map.put("e_pw", e_pw);
		    map.put("e_pwck", e_pwck);
		    map.put("eidx", eidx);
		    int result = this.st.update("miniproject.email_join_mapper.pw_update", map);

		    return result;
		}
	 
	 public DTO_email_join pass_search(String e_mail, String e_number) {
		 
		 Map<String, String> code = new HashMap<String, String>();
	    	code.put("e_mail", e_mail);
	    	code.put("e_number", e_number);
	    	DTO_email_join result = this.st.selectOne("miniproject.email_join_mapper.search_pw", code);
		 
		 return result;
	 }
	 
	 public DTO_email_join user_search(String name, String number) {
		 
		 Map<String, String> code = new HashMap<String, String>();
	    	code.put("e_name", name);
	    	code.put("e_number", number);
	    	DTO_email_join result = this.st.selectOne("miniproject.email_join_mapper.search_userid", code);
	    	
	    	
		 return result;
	 }
	 
	 public List<DTO_email_join> all_list(){
		 List<DTO_email_join> all = this.st.selectList("miniproject.email_join_mapper.user_all");
		 return all;
	 }
	
}
