package demo.mapper;

import demo.domain.KnrdInfo;
import demo.domain.KnrdInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface KnrdInfoMapper {
    long countByExample(KnrdInfoExample example);

    int deleteByExample(KnrdInfoExample example);

    int insert(KnrdInfo record);

    int insertSelective(KnrdInfo record);

    List<KnrdInfo> selectByExample(KnrdInfoExample example);

    int updateByExampleSelective(@Param("record") KnrdInfo record, @Param("example") KnrdInfoExample example);

    int updateByExample(@Param("record") KnrdInfo record, @Param("example") KnrdInfoExample example);
}