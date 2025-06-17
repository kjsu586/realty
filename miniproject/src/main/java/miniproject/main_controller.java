package miniproject;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class main_controller {
	
	@Resource(name="DAO_email_search")
	public DAO_email_search dao_email;
	
	@Resource(name="DAO_email_join")
	public DAO_email_join dao;
	
	@Resource(name="DTO_email_join")
	public DTO_email_join dto;
	
	@Resource(name="md5_pass")
	md5_pass md;
	
	@PostMapping("/realty/pw_update")
	public String pw_update(
	    @RequestParam("e_pw") String e_pw,
	    @RequestParam("e_pwck") String e_pwck,
	    HttpSession session,
	    Model m) {

	    // 세션에서 eidx 꺼냄
	    Integer eidx = (Integer) session.getAttribute("pwchange_eidx");

	    if(eidx == null) {
	        m.addAttribute("msg", "비밀번호 변경 세션이 만료되었습니다.");
	        return "/realty/passwd_search"; // 다시 본인 인증부터
	    }
	    
	    String enc_pw = md.md5_make(e_pw);
	    String enc_pwck = md.md5_make(e_pwck);

	    int result = dao_email.pw_update(enc_pw, enc_pwck, eidx);
	    session.removeAttribute("pwchange_eidx"); // 한 번 쓰고 지워줌 (보안)

	    if(result > 0) {
	        m.addAttribute("msg", "비밀번호가 성공적으로 변경되었습니다.");
	        return "/realty/login"; // 또는 index.jsp
	    } else {
	        m.addAttribute("msg", "비밀번호 변경에 실패했습니다.");
	        return "/realty/search_mypass";
	    }
	}
	
	@PostMapping("/realty/index.jsp")
	public String login(DTO_login dto, Model m) {
		m.addAttribute("e_mail",dto.e_mail);
		m.addAttribute("e_pw",dto.e_pw);
		return "/realty/load";
	}
	
	@PostMapping("/realty/search_mypass")
	public String search_mypass(Model m, DTO_email_join dto,HttpSession session) {
		
		DTO_email_join data = this.dao_email.pass_search(dto.e_mail, dto.e_number);
		
		String msg = "";
		if(data == null) {
	        m.addAttribute("msg", "이메일이나 휴대폰 번호가 일치하지 않습니다.");
	        return "/realty/passwd_search"; // 같은 페이지에 머무르기
	    } else {
	    	session.setAttribute("pwchange_eidx", data.getEidx());
	        return "/realty/search_mypass";
	    }
	}
	
	@PostMapping("/realty/email_search.do")
	public String email_search(Model m, DTO_email_join dto) {
		
		DTO_email_join data = this.dao_email.user_search(dto.e_name, dto.e_number);
		String msg = "";
		if(data == null) {
			msg = "이메일이 없습니다.";
		}
		else {
			msg = data.e_mail;
		}
		m.addAttribute("msg",msg);
		
		return "/realty/search_myinfo";
	}
	
	
	@PostMapping("/realty/email_joinok.do")
	public String email_joinok(DTO_email_join dto, Model m) throws Exception {
		
		try {
			System.out.println("원본 PW: " + dto.getE_pwck());
			
			String enc_pw = md.md5_make(dto.getE_pw());
	        String enc_pwck = md.md5_make(dto.getE_pwck());
	        
	        System.out.println("암호화 PW: " + enc_pw);
	        System.out.println("암호화 PWCK: " + enc_pwck);

	        dto.setE_pw(enc_pw);
	        dto.setE_pwck(enc_pwck);
			
			int result = this.dao.email_in(dto);
			String msg = "";
			System.out.println(result);
			if(result > 0) {
				msg = "alert('회원가입이 완료되었습니다.');"
						+ "location.href='./index';";
			}
			m.addAttribute("msg",msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "/realty/load";
	}
	
	@GetMapping("/index.do")
	public String index() {
		
		return null;
	}
	
	
	
	
	
	
}
