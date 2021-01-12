package demo.controller;

import com.github.pagehelper.PageInfo;
import demo.common.JsonResult;
import demo.domain.Batch;
import demo.service.BatchService;
import demo.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import static demo.common.utils.SessionUntil.setBatchList;

@Controller
@RequestMapping("/batch")
public class BatchController {
    @Autowired
    private BatchService batchService;
    @Autowired
    private DictionaryService dictionaryService;

    @RequestMapping("/list")
    public String list(@RequestParam(value = "pageNo",defaultValue = "1") Integer pageNo,
                       @RequestParam(value = "pageSize",defaultValue = "5") Integer pageSize,
                       Model model){
        List<Batch> list = batchService.list(pageNo, pageSize);
        for (Batch batch:list) {
            batch.setDifficultyName(dictionaryService.getDictionaryNameByLevel(batch.getDifficultyLevel()).getItemName());
        }
        PageInfo<Batch> batchPageInfo = new PageInfo<>(list);
        model.addAttribute("batchPageInfo",batchPageInfo);
        setBatchList(batchPageInfo);
        return "batch";
    }

    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult insert(Batch batch){
        System.out.println(batch);
        batchService.save(batch);
        return JsonResult.ok(true);
    }
}
