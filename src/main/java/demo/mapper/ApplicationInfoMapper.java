package demo.mapper;

import demo.domain.ApplicationInfo;
import demo.domain.ApplicationInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ApplicationInfoMapper {
    long countByExample(ApplicationInfoExample example);

    int deleteByExample(ApplicationInfoExample example);

    int deleteByPrimaryKey(Long id);

    int insert(ApplicationInfo record);

    int insertSelective(ApplicationInfo record);

    List<ApplicationInfo> selectByExample(ApplicationInfoExample example);

    ApplicationInfo selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") ApplicationInfo record, @Param("example") ApplicationInfoExample example);

    int updateByExample(@Param("record") ApplicationInfo record, @Param("example") ApplicationInfoExample example);

    int updateByPrimaryKeySelective(ApplicationInfo record);

    int updateByPrimaryKey(ApplicationInfo record);
}