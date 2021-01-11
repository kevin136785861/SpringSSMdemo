package demo.mapper;

import demo.domain.RoleFlowSetting;
import demo.domain.RoleFlowSettingExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RoleFlowSettingMapper {
    long countByExample(RoleFlowSettingExample example);

    int deleteByExample(RoleFlowSettingExample example);

    int deleteByPrimaryKey(Long id);

    int insert(RoleFlowSetting record);

    int insertSelective(RoleFlowSetting record);

    List<RoleFlowSetting> selectByExample(RoleFlowSettingExample example);

    RoleFlowSetting selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") RoleFlowSetting record, @Param("example") RoleFlowSettingExample example);

    int updateByExample(@Param("record") RoleFlowSetting record, @Param("example") RoleFlowSettingExample example);

    int updateByPrimaryKeySelective(RoleFlowSetting record);

    int updateByPrimaryKey(RoleFlowSetting record);
}