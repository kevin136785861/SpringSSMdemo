package demo.mapper;

import demo.domain.WhitelistSetting;
import demo.domain.WhitelistSettingExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WhitelistSettingMapper {
    long countByExample(WhitelistSettingExample example);

    int deleteByExample(WhitelistSettingExample example);

    int deleteByPrimaryKey(Long id);

    int insert(WhitelistSetting record);

    int insertSelective(WhitelistSetting record);

    List<WhitelistSetting> selectByExample(WhitelistSettingExample example);

    WhitelistSetting selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") WhitelistSetting record, @Param("example") WhitelistSettingExample example);

    int updateByExample(@Param("record") WhitelistSetting record, @Param("example") WhitelistSettingExample example);

    int updateByPrimaryKeySelective(WhitelistSetting record);

    int updateByPrimaryKey(WhitelistSetting record);
}