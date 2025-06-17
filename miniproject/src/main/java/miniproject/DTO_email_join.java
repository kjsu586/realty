package miniproject;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Repository("DTO_email_join")
public class DTO_email_join {
	String e_mail,e_pw,e_pwck,e_name,e_number,e_ck1,e_ck2,e_ck3;
	String e_marketing,e_date;
	int eidx;
	
	public void setE_ck1(String e_ck1) { this.e_ck1 = "on".equals(e_ck1) ? "Y" : "N"; }
    public void setE_ck2(String e_ck2) { this.e_ck2 = "on".equals(e_ck2) ? "Y" : "N"; }
    public void setE_ck3(String e_ck3) { this.e_ck3 = "on".equals(e_ck3) ? "Y" : "N"; }
    public void setE_marketing(String e_marketing) { this.e_marketing = "on".equals(e_marketing) ? "Y" : "N"; }
}
