package miniproject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("DAO_reservation")
public class DAO_reservation {
	
	@Resource(name = "template")
    SqlSessionTemplate st;
	
	public int insertReservation(DTO_reservation dto) {
		int result = this.st.insert("miniproject.email_join_mapper.insertReservation", dto);
        return result;
    }
	
	public int reserve_ck(String e_name, String apt_name) {
		Map<String, String> map = new HashMap<>();
		map.put("e_name", e_name);
	    map.put("apt_name", apt_name);
	    return this.st.selectOne("miniproject.email_join_mapper.check_reservation", map);
	}
	
	public DTO_reservation selectReservationByEmail(String e_mail) {
	    return this.st.selectOne("miniproject.email_join_mapper.selectByEmail", e_mail);
	}
	
	public List<DTO_reservation> selectReservationsByName(String e_name) {
	    return this.st.selectList("miniproject.email_join_mapper.selectReservationsByName", e_name);
	}
	
	public int reservation_cancel(DTO_reservation dto){
		return this.st.delete("miniproject.email_join_mapper.reservation_cancel",dto);
	}

}
