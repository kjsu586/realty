package miniproject;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository("DTO_apt_info")
public class DTO_apt_info {
	int aidx,household_count,building_count;
	String apt_name,apt_addr,apt_type,apt_shape,date_of_sale,date_of_occupancy;
	String apt_img,heating_structure,construction_company,use_status,date_of_registration;
	
	int midx;
	String mtitle,mdetail_info,m_img,m_link;
}
