package miniproject;

import java.io.File;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Repository("DTO_md_board")
public class DTO_md_board {
	Integer ridx, rcnt;
	String rtitle, rwriter, rtext, rdate, thumbnailname;
}
