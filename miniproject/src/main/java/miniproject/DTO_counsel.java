package miniproject;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository("DTO_counsel")
public class DTO_counsel {
	int cidx;
	String e_name,e_mail,e_number,crent,chouse,cday,ctext,cdate;
}
