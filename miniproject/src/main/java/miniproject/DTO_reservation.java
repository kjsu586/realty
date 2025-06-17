package miniproject;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository("DTO_reservation")
public class DTO_reservation {
	int ridx, people_cnt;
	String apt_name, visit_date, visit_time, e_name, e_number, rdate;
}
