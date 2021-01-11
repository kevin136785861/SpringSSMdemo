package demo.mapper;

import demo.domain.BatchSetting;
import demo.domain.BatchSettingExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BatchSettingMapper {
    long countByExample(BatchSettingExample example);

    int deleteByExample(BatchSettingExample example);

    int deleteByPrimaryKey(Long id);

    int insert(BatchSetting record);

    int insertSelective(BatchSetting record);

    List<BatchSetting> selectByExample(BatchSettingExample example);

    BatchSetting selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") BatchSetting record, @Param("example") BatchSettingExample example);

    int updateByExample(@Param("record") BatchSetting record, @Param("example") BatchSettingExample example);

    int updateByPrimaryKeySelective(BatchSetting record);

    int updateByPrimaryKey(BatchSetting record);
}