package demo.mapper;

import demo.domain.OrganizationLevel;
import demo.domain.OrganizationLevelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrganizationLevelMapper {
    long countByExample(OrganizationLevelExample example);

    int deleteByExample(OrganizationLevelExample example);

    int insert(OrganizationLevel record);

    int insertSelective(OrganizationLevel record);

    List<OrganizationLevel> selectByExample(OrganizationLevelExample example);

    int updateByExampleSelective(@Param("record") OrganizationLevel record, @Param("example") OrganizationLevelExample example);

    int updateByExample(@Param("record") OrganizationLevel record, @Param("example") OrganizationLevelExample example);
}