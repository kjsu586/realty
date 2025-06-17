package miniproject;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface email_join_mapper {
	public int email_insert(DTO_email_join dto);
}
