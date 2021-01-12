package demo.service;

import demo.domain.Dictionary;
import demo.domain.DictionaryExample;
import demo.mapper.DictionaryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DictionaryServiceImpl implements DictionaryService {
    @Autowired
    private DictionaryMapper dm;

    @Override
    public Dictionary getDictionaryNameByLevel(String level) {
        DictionaryExample de = new DictionaryExample();
        de.createCriteria().andItemValueEqualTo(level);
        List<Dictionary> dictionaries = dm.selectByExample(de);
        return dictionaries.get(0);
    }

    @Override
    public List<Dictionary> listByType(String type) {
        DictionaryExample example = new DictionaryExample();
        example.createCriteria().andTypeEqualTo(type).andItemNameIsNotNull();
        return dm.selectByExample(example);
    }
}
