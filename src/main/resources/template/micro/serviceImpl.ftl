package ${packageName}.${className_x}.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.joyoung.base.boot.utils.db.DataCenter;
import com.joyoung.smart.base.exceptions.DbException;
import com.joyoung.smart.base.utils.UUIDUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

import static com.joyoung.base.boot.utils.db.DataCenter.sqlParam;
import static com.joyoung.smart.base.constant.ResponseError.PARAM_LACK_ERR;

/**
 * ${className_d}ServiceImpl
 * @author Bob.Zhu
 * @Date ${.now}
 */
@Slf4j
@Service
public class ${className_d}ServiceImpl implements ${className_d}Service {

    @Resource(name = "menu")
    private DataCenter dataCenter;

    @Override
    public String insert(${className_d} entity) throws DbException{
        String sql = "insert into ${className} (<#list tableCarrays as tableCarray><#if (!tableCarray?is_first)>, </#if>${tableCarray.carrayName}</#list>) values (<#list tableCarrays as tableCarray><#if (!tableCarray?is_first)>, </#if><#if (tableCarray.carrayName_x == "createTime" || tableCarray.carrayName_x == "updateTime")>now()<#elseif (tableCarray.carrayName_x == "deleted")>0<#else>?</#if></#list>)";
        UUIDUtil.setId(entity);
        dataCenter.insert(sql, sqlParam(<#list tableCarrays as tableCarray><#if (tableCarray.carrayName_x == "updateUser")><#if (!tableCarray?is_first)>, </#if>entity.getCreateUser()<#elseif (tableCarray.carrayName_x != "createTime" && tableCarray.carrayName_x != "updateTime" && tableCarray.carrayName_x != "deleted")><#if (!tableCarray?is_first)>, </#if>entity.get${tableCarray.carrayName_d}()</#if></#list>));
        return new ResultWrapper(entity.getId());
    }

    @Override
    public List<String> insertBatch(List<${className_d}> list) throws DbException{
        String sql = "insert into ${className} (<#list tableCarrays as tableCarray><#if (!tableCarray?is_first)>, </#if>${tableCarray.carrayName}</#list>) values (<#list tableCarrays as tableCarray><#if (!tableCarray?is_first)>, </#if><#if (tableCarray.carrayName_x == "createTime" || tableCarray.carrayName_x == "updateTime")>now()<#elseif (tableCarray.carrayName_x == "deleted")>0<#else>?</#if></#list>)";
        ArrayList<Object> params = new ArrayList<>();
        ArrayList<String> ids = new ArrayList<>();
        for (${className_d} entity : list) {
        ArrayList<Object> subList = new ArrayList<>();
            params.add(subList);
            UUIDUtil.setId(entity);
            ids.add(entity.getId());
            <#list tableCarrays as tableCarray>
                <#if (tableCarray.carrayName_x == "updateUser")>
            subList.add(entity.getCreateUser());
                <#elseif (tableCarray.carrayName_x != "createTime" && tableCarray.carrayName_x != "updateTime" && tableCarray.carrayName_x != "deleted")>
            subList.add(entity.get${tableCarray.carrayName_d}());
                </#if>
            </#list>
        }
        dataCenter.insert(sql, params);
        return new ResultWrapper(ids);
    }

    @Override
    public int update(${className_d} entity) throws DbException {
        StringBuffer sb = new StringBuffer();
        List<String> updateStrings = new ArrayList<>();
        List<Object> param = new ArrayList<>();
        sb.append(" update ${className} set ");
        <#list tableCarrays as tableCarray>
            <#if (tableCarray.carrayName_x != "id") && (tableCarray.carrayName_x != "createUser") && tableCarray.carrayName_x != "createTime">
                <#if tableCarray.carrayType == "String">
        if (StringUtils.isNotEmpty(entity.get${tableCarray.carrayName_d}())) {
                <#else>
        if (entity.get${tableCarray.carrayName_d}()!=null) {
                </#if>
            updateStrings.add(" ${tableCarray.carrayName}=?");
            param.add(entity.get${tableCarray.carrayName_d}());
        }
            </#if>
        </#list>
        updateStrings.add(" update_time=now()");
        sb.append(StringUtils.join(updateStrings, ","));
        sb.append(" WHERE id = ? AND deleted = 0");
        param.add(entity.getId());
        JSONArray array = dataCenter.update(sb.toString(), param);
        return array.getIntValue(0);
    }

    @Override
    public List<${className_d}> query(${className_d} entity) throws DbException, ParamException {
        StringBuffer sb = new StringBuffer();
        List<String> queryStrings = new ArrayList<>();
        List<Object> param = new ArrayList<>();
        sb.append(" select <#list tableCarrays as tableCarray><#if (!tableCarray?is_first)>, </#if>${tableCarray.carrayName}</#list> from ${className} where ");
        <#list tableCarrays as tableCarray>
            <#if tableCarray.carrayType == "String">
        if (StringUtils.isNotEmpty(entity.get${tableCarray.carrayName_d}())) {
            <#else>
        if (entity.get${tableCarray.carrayName_d}()!=null) {
            </#if>
            queryStrings.add(" ${tableCarray.carrayName}=?");
            param.add(entity.get${tableCarray.carrayName_d}());
        }
        </#list>
        if (CollectionUtil.isEmpty(queryStrings)) {
            throw new ParamException(PARAM_LACK_ERR);
        }
        sb.append(StringUtils.join(queryStrings, " and "));
        if (entity.getPageSize() == null || entity.getPageSize() == 0) {
            sb.append(" limit 10");
        } else if (entity.getPageSize() > 0) {
            sb.append(" limit ").append(entity.getPageSize());
        }
        return dataCenter.queryList(sb.toString(), param, ${className_d}.class);
    }

    @Override
    public int delete(String id, String updateUser) throws DbException {
        String sql = "update ${className} set deleted=1, update_user=?, update_time=now() where deleted=0 and id=?";
        JSONArray array = dataCenter.update(sql, sqlParam(updateUser, id));
        return array.getIntValue(0);
    }

}