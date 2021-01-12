package demo.service;

import demo.domain.Dictionary;

import java.util.List;

public interface DictionaryService {
    Dictionary getDictionaryNameByLevel(String level);
    List<Dictionary> listByType(String type);
}
