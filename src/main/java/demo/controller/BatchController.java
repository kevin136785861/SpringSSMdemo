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

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @RequestMapping(value = "/update" , method = RequestMethod.POST)
    @ResponseBody
    public JsonResult update(@RequestParam(value = "id")String id,@RequestParam(value = "active")Integer active){
        System.out.println(id);
        Batch select = batchService.select(id);
        select.setActive(active);
        batchService.save(select);
        return JsonResult.ok(true);
    }
    @RequestMapping(value = "/selectActive" , method = RequestMethod.POST)
    @ResponseBody
    public JsonResult selectActive(@RequestParam(value = "active")Integer active){
        int i = batchService.selectActive(active);
        if (i==1){
            return JsonResult.ok(false);
        }else
            return JsonResult.ok(true);
    }

    @RequestMapping(value = "/selectName" , method = RequestMethod.POST)
    public String selectName(@RequestParam(value = "pageNo",defaultValue = "1") Integer pageNo,
                                 @RequestParam(value = "pageSize",defaultValue = "5") Integer pageSize,
                             @RequestParam(value = "search")String search,
                             Model model) {
        try {
            String gbk = new String(search.getBytes("ISO-8859-1"), "UTF-8");
            System.out.println(gbk);
            List<Batch> list = batchService.selectName(pageNo, pageSize,gbk);
            for (Batch batch : list) {
                batch.setDifficultyName(dictionaryService.getDictionaryNameByLevel(batch.getDifficultyLevel()).getItemName());
            }
            System.out.println(list);
            PageInfo<Batch> batchPageInfo = new PageInfo<>(list);
            model.addAttribute("batchPageInfo", batchPageInfo);
            setBatchList(batchPageInfo);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "batch";
    }

    @RequestMapping(value = "/listByAjax", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult listByAjax() {
        List<Batch> batchList = batchService.listByAjax();
        Batch batch = batchService.curBatch();
        Map<String,Object> map = new HashMap<>();
        map.put("list",batchList);
        map.put("curBatch",batch);
        return JsonResult.ok(map);
    }
}
