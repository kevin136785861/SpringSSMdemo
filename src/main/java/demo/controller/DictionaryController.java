package demo.controller;

import demo.common.JsonResult;
import demo.domain.Dictionary;
import demo.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dictionary")
public class DictionaryController {
    @Autowired
    private DictionaryService dictionaryService;

    @RequestMapping("/listByType")
    @ResponseBody
    public JsonResult listByType(String type){
        List<Dictionary> dictionaries = dictionaryService.listByType(type);
        return JsonResult.ok(dictionaries);
    }
}
