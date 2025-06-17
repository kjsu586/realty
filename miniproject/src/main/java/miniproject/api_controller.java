package miniproject;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@CrossOrigin(origins="*", allowedHeaders = "*")
@Controller
public class api_controller {
	PrintWriter pw = null;
	
	@Resource(name="DTO_email_join")
	DTO_email_join dto;
	
	@Resource(name="DAO_email_search")
	DAO_email_search dao;
	
	@Resource(name="DTO_apt_info")
	DTO_apt_info dto2;
	
	@Resource(name="DAO_apt_info")
	DAO_apt_info dao2;
	
	@Resource(name="DAO_email_join")
	DAO_email_join dao3;
	
	@Resource(name="DAO_counsel")
	DAO_counsel dao4;
	
	@Resource(name="DAO_reservation")
	DAO_reservation dao5;
	
	@Resource(name="DTO_reservation")
	DTO_reservation dto3;
	
	@Resource(name="DAO_md_board")
	DAO_md_board dao6;
	
	@Resource(name="DTO_md_board")
	DTO_md_board dto4;
	
	@Resource(name="md5_pass")
	md5_pass md;
	
	
	@GetMapping("/realty/md_board")
	public String md_board(@RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "search", defaultValue = "") String search,
            Model m) {
		
		int pageSize = 10;
	    int offset = (page - 1) * pageSize;
	    
	    List<DTO_md_board> list = dao6.md_board_list(offset, pageSize, search);
	    int totalCount = dao6.md_board_total(search);
	    int totalPages = (int) Math.ceil((double) totalCount / pageSize);
	    
	    m.addAttribute("list", list);
	    m.addAttribute("currentPage", page);
	    m.addAttribute("totalPages", totalPages);
	    m.addAttribute("pageSize", pageSize);
	    m.addAttribute("total", totalCount);
	    m.addAttribute("userpage", offset);
	    m.addAttribute("search", search);
		
		return "realty/md_board";
	}
	
	@GetMapping("/realty/md_board_view")
	public String md_board_view(@RequestParam("ridx") int ridx, Model m) {
	    dao6.md_board_rcnt_up(ridx); // 조회수 증가
	    DTO_md_board dto = dao6.md_board_view(ridx);
	    m.addAttribute("dto",dto);
	    return "/realty/md_board_view"; // 상세보기 JSP
	}
	
	
	@PostMapping("/realty/md_board_write")
	public String md_board_write(@RequestParam("thumbnail") MultipartFile file ,DTO_md_board dto, Model m,HttpServletRequest req) throws Exception {
		
		String filename = file.getOriginalFilename();
		System.out.println(filename);
		
		String upload = req.getServletContext().getRealPath("/upload");
		System.out.println(upload);
		File saveFile = new File(upload, filename);
	    file.transferTo(saveFile);
	    
	    dto.setThumbnailname(filename);
		
		int result = this.dao6.md_board_in(dto);
		String msg = "";
		if(result > 0) {
			msg = "추천분양 정보 게시판 게시물이 추가 되었습니다.";
		}
		m.addAttribute("msg",msg);
		
		return "redirect:/realty/md_board";
	}
	
	@GetMapping("/realty/logout")
	public String logout(HttpSession se) {
		se.invalidate();
		return "redirect:/realty/index";
	}
	
	@GetMapping("/realty/reservation_cancel")
	public String reservation_cancel(@RequestParam("apt_name") String apt_name, HttpSession session) {
	    DTO_email_join loginUser = (DTO_email_join) session.getAttribute("login");

	    if (loginUser == null) {
	        return "redirect:/realty/login.jsp";
	    }

	    DTO_reservation dto = new DTO_reservation();
	    dto.setE_name(loginUser.getE_name());
	    dto.setApt_name(apt_name);

	    dao5.reservation_cancel(dto);

	    return "redirect:/realty/reservation_list";
	}
	
	@GetMapping("/realty/reservation_list")
	public String showReservationList(HttpSession session, Model model) {
	    DTO_email_join loginUser = (DTO_email_join) session.getAttribute("login");

	    if (loginUser == null) {
	        return "redirect:/realty/login.jsp";
	    }

	    List<DTO_reservation> reserve = dao5.selectReservationsByName(loginUser.getE_name());
	    model.addAttribute("reserve", reserve);

	    return "/realty/reservation_list";  // <-- 예약 리스트 JSP 경로
	}
	
	@GetMapping("/realty/reserve_check")
	public String reserveCheck(Model model, HttpSession session) {
	    DTO_email_join loginUser = (DTO_email_join) session.getAttribute("login");

	    if (loginUser == null) {
	        return "redirect:/realty/login.jsp";
	    }

	    DTO_reservation reserveInfo = dao5.selectReservationByEmail(loginUser.getE_mail());
	    model.addAttribute("reserve", reserveInfo);

	    return "/realty/reservation_check"; // 예약 확인 페이지
	}
	
	@PostMapping("/realty/reservation")
	public String reserveOk(DTO_reservation dto) {
		int result = this.dao5.insertReservation(dto);
		if (result > 0) {
		    System.out.println("성공");
		} else {
		    System.out.println("실패");
		}
	    return "redirect:/realty/reservation_check"; // 예약 확인 페이지로 이동
	}
	
	
	@GetMapping("/realty/email_check.do")
	public String email_check(@RequestParam("e_mail") String e_mail, HttpServletResponse res) throws Exception {
		DTO_email_join result = this.dao.email_ck(e_mail);
		
		boolean e_ck = false;
		if(result != null) {
			e_ck = true;
		}
		else {
			e_ck = false;
		}
		
		
		res.setContentType("text/html;charset=UTF-8");
	    PrintWriter pw = res.getWriter();

	    if (e_ck == true) {
	        pw.println("<script>alert('이미 사용 중인 이메일입니다.'); window.close(); </script>");
	    } else {
	    	 pw.println("<script>"
	                 + "alert('사용 가능한 이메일입니다.');"
	                 + "if (window.opener && !window.opener.closed) {"
	                 + "window.opener.document.getElementById('e_mail_display').readOnly = true;"
	                 + "}"
	                 + "window.close();"
	                 + "</script>");
	    }

	    pw.close();
		
		return null;
	}
	
	
	@PostMapping("/realty/login")
	public String login(@RequestParam(name="kakao_id", required = false) String kakao_id,
			@RequestParam(name="kakao_nicknm", required = false) String kakao_nicknm,
			DTO_email_join dto,Model m, HttpSession se) throws Exception {
		
		 String enc_pw = md.md5_make(dto.getE_pw());
		    dto.setE_pw(enc_pw);
		
		List<DTO_email_join> result = this.dao3.login(dto);
		
		if(result != null && !result.isEmpty()) {
			
			se.setAttribute("login", result.get(0));
			return  "redirect:/realty/index";
		}
		
		m.addAttribute("error", "이메일 또는 비밀번호가 올바르지 않습니다.");
	    return "realty/login";
	}
	
	@GetMapping("/realty/index")
	   public String index(Model m) {
	       List<DTO_apt_info> alldata = dao2.all_data(); // DAO에서 데이터 가져오기
	       List<DTO_apt_info> md_choice = dao2.md_data();
	        
	       m.addAttribute("md_choice",md_choice);
	       m.addAttribute("all", alldata); // Model에 추가
	       return "forward:/realty/index.jsp"; // JSP 페이지 반환
	  }
	
	@GetMapping("/realty/login")
	public String loginForm() {
	    return "realty/login"; // login.jsp를 보여줌
	}
	
	 @GetMapping("/realty/week_tails")
	    public String week_tails(Model m,@RequestParam int aidx, HttpSession hs) {
		 	DTO_email_join loginUser = (DTO_email_join) hs.getAttribute("login");
		 	
		 	  if (loginUser == null) {
		 	        // 로그인 안 된 경우 → 로그인 페이지로 리다이렉트
		 	        return "redirect:/realty/login";
		 	    }
		 	  
		 	 List<DTO_apt_info> alldata = dao2.all_data(); // DAO에서 데이터 가져오기
		 	 DTO_apt_info apt = alldata.stream()
		        		.filter(data -> data.getAidx() == (aidx))  // int 비교는 == 사용
	                    .findFirst()
	                    .orElse(null);  // aidx에 맞는 데이터가 없으면 null 반환

				// 해당 데이터를 모델에 추가
				m.addAttribute("apt", apt);
		        m.addAttribute("all", alldata); // Model에 추가
		 	  
		 	  if(loginUser != null) {
		 		  int reserve = dao5.reserve_ck(loginUser.getE_name(), apt.getApt_name());
		 		  m.addAttribute("reserve",reserve);
		 	  }
		 
	       
	        
	        
	        
	        return "/realty/week_tails"; // JSP 페이지 반환
	   }
	 
	 @GetMapping("/realty/reserve_form")
	 public String reserveForm(@RequestParam("aidx") int aidx, HttpSession session, Model model) {
	     DTO_apt_info apt = dao2.selectByAidx(aidx);
	     DTO_email_join user = (DTO_email_join) session.getAttribute("login");

	     model.addAttribute("apt", apt);
	     model.addAttribute("user", user);

	     return "/realty/reservation"; // reservation.jsp로 forward
	 }
	
	
	@GetMapping("/counsel.do")
	public String counsel(HttpServletResponse res) throws Exception {
		res.setContentType("text/html;charset=utf-8");
		List<DTO_email_join> result = this.dao.all_list();
		this.pw = res.getWriter();
		
		JSONObject alldata = new JSONObject(); //{}
		JSONArray ja = new JSONArray(); //[]
		int w = 0;
		while(w < result.size()) {
			JSONObject jo = new JSONObject(); //{}
			jo.put("e_name",result.get(w).e_name);
			jo.put("e_mail",result.get(w).e_mail);
			jo.put("e_number",result.get(w).e_number);
			ja.put(jo);
			w++;
		}
		alldata.put("user_info", ja);
		this.pw.print(alldata);
		
		this.pw.close();
		
		return null;
	}
	
	@GetMapping("/realty/counsel")
	public String showCounselForm(HttpSession session, Model model) {
	    DTO_email_join loginUser = (DTO_email_join) session.getAttribute("login");

	    if (loginUser == null) {
	        // 로그인 안 되어 있으면 로그인 페이지로 이동
	        return "redirect:/realty/login.jsp";
	    }

	    // 로그인된 사용자 정보 model에 담기
	    model.addAttribute("user", loginUser);
	    return "/realty/counsel"; // forward -> JSP 열기
	}
	
	@PostMapping("/realty/counsel")
	public String insertCounsel(DTO_counsel dto) {
	    dao4.counsel(dto);
	    return "redirect:/realty/index";
	}
	
	
}
