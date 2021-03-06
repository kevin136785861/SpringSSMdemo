package demo.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import demo.common.utils.SessionUntil;
import demo.domain.Batch;
import demo.domain.BatchExample;
import demo.domain.KnrdInfo;
import demo.domain.Whitelist;
import demo.mapper.BatchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

import static demo.common.utils.Constant.*;

@Service
public class BatchServiceImpl implements BatchService {
    @Autowired
    private BatchMapper batchMapper;
    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private KnrdService knrdService;

    @Override
    public List<Batch> list(Integer pageNo, Integer pageSize){

            PageHelper.startPage(pageNo,pageSize);
            List<Batch> batches = batchMapper.selectByExample(null);
            return batches;

    }

    @Override
    public List<Batch> selectName(Integer pageNo, Integer pageSize, String name) {
        PageHelper.startPage(pageNo,pageSize);
        BatchExample be = new BatchExample();
        be.createCriteria().andNameLike("%"+name+"%");
        List<Batch> batchList = batchMapper.selectByExample(be);
        System.out.println(batchList);
        return batchList;
    }

    @Override
    public void save(Batch batch) {
        if(batchMapper.selectByPrimaryKey(batch.getId())==null){
            batch.setActive(1);
            batchMapper.insertSelective(batch);
        }else {
         batchMapper.updateByPrimaryKey(batch);
        }
    }

    @Override
    public Batch select(String id) {
        Batch batch = batchMapper.selectByPrimaryKey(Long.parseLong(id));
        return batch;
    }

    @Override
    public int selectActive(Integer active) {
        BatchExample batchExample = new BatchExample();
        batchExample.createCriteria().andActiveEqualTo(active);
        List<Batch> batchList = batchMapper.selectByExample(batchExample);
        return batchList.size()>0?1:0;
    }


    @Override
    public List<Batch> listByAjax() {
        BatchExample example = new BatchExample();
        example.createCriteria().andDeletedEqualTo(DELETE_FLAG_0);
        example.setOrderByClause("id DESC");
        return batchMapper.selectByExample(example);
    }

    @Override
    public Batch curBatch() {
        BatchExample example = new BatchExample();
        example.createCriteria().andDeletedEqualTo(DELETE_FLAG_0).andActiveEqualTo(ACTIVE_FLAG_1);
        List<Batch> batches = batchMapper.selectByExample(example);
        if(batches.size()>0){
            return batches.get(0);
        }else{
            BatchExample exampleNew = new BatchExample();
            exampleNew.createCriteria().andDeletedEqualTo(DELETE_FLAG_0);
            example.setOrderByClause("id desc");
            List<Batch> batchesNew = batchMapper.selectByExample(example);
            return batchesNew.size()>0?batches.get(0):new Batch();
        }
    }
    @Override
    public Batch activeBatch() {
        BatchExample example = new BatchExample();
        example.createCriteria().andDeletedEqualTo(DELETE_FLAG_0).andActiveEqualTo(ACTIVE_FLAG_1);
        List<Batch> batches = batchMapper.selectByExample(example);
        return batches.size()>0?batches.get(0):null;
    }

    @Override
    public Boolean isSuitable() {
        Batch batch = activeBatch();//BKN
        batch.setDifficultyName(dictionaryService.getNameByTypeAndValue(DICTIONARY_TYPE_DIFFICULTY,batch.getDifficultyLevel()));//不困难
        Whitelist curUser = SessionUntil.getLoginUser();
        //获取学生的困难等级
        KnrdInfo knrd = knrdService.selectByUser(curUser);
        System.out.println(knrd);
        if(batch.getDifficultyName().equals(knrd.getPovertyLevel())){
            //符合
            return true;
        }
        return false;
    }
}
