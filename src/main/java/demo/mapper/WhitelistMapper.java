package demo.mapper;

import demo.domain.Whitelist;
import demo.domain.WhitelistExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WhitelistMapper {
    long countByExample(WhitelistExample example);

    int deleteByExample(WhitelistExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Whitelist record);

    int insertSelective(Whitelist record);

    List<Whitelist> selectByExample(WhitelistExample example);

    Whitelist selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Whitelist record, @Param("example") WhitelistExample example);

    int updateByExample(@Param("record") Whitelist record, @Param("example") WhitelistExample example);

    int updateByPrimaryKeySelective(Whitelist record);

    int updateByPrimaryKey(Whitelist record);
}