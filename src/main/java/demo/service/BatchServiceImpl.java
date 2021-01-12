package demo.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import demo.domain.Batch;
import demo.mapper.BatchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class BatchServiceImpl implements BatchService {
    @Autowired
    private BatchMapper batchMapper;

    @Override
    public List<Batch> list(Integer pageNo, Integer pageSize){
        PageHelper.startPage(pageNo,pageSize);
        List<Batch> batches = batchMapper.selectByExample(null);
        System.out.println(batches);
        return batches;
    }

    @Override
    public void save(Batch batch) {
        batch.setActive(1);

        batchMapper.insertSelective(batch);
    }
}
