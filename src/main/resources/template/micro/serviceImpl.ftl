package ${packageName}.${className_x}.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.joyoung.base.boot.utils.db.DataCenter;
import com.joyoung.smart.base.exceptions.BaseException;
import com.joyoung.smart.base.utils.UUIDUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

import static com.joyoung.base.boot.utils.db.DataCenter.sqlParam;

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
    public ${className_d} insert(${className_d} entity) throws BaseException{
        String sql = "insert into ${className} (<#list tableCarrays as tableCarray><#if (!tableCarray?is_first)>, </#if>${tableCarray.carrayName}</#list>) values (<#list tableCarrays as tableCarray><#if (!tableCarray?is_first)>, </#if><#if (tableCarray.carrayName_x == "createTime" || tableCarray.carrayName_x == "updateTime")>now()<#elseif (tableCarray.carrayName_x == "deleted")>0<#else>?</#if></#list>)";
        UUIDUtil.setId(entity);
        dataCenter.insert(sql, sqlParam(<#list tableCarrays as tableCarray><#if (tableCarray.carrayName_x == "updateUser")><#if (!tableCarray?is_first)>, </#if>entity.getCreateUser()<#elseif (tableCarray.carrayName_x != "createTime" && tableCarray.carrayName_x != "updateTime" && tableCarray.carrayName_x != "deleted")><#if (!tableCarray?is_first)>, </#if>entity.get${tableCarray.carrayName_d}()</#if></#list>);
        return new ${className_d}(entity.getId());
    }

    @Override
    public int update(${className_d} entity) throws BaseException {
        StringBuffer sb = new StringBuffer();
        List<String> updateStrings = new ArrayList<>();
        List<Object> param = new ArrayList<>();
        sb.append(" update ${className} ");
        <#list tableCarrays as tableCarray>
            <#if (tableCarray.carrayName_x != "id") && (tableCarray.carrayName_x != "createUser") && tableCarray.carrayName_x != "createTime">
                <#if tableCarray.carrayType == "String">
        if (StringUtils.isNotEmpty(entity.get${tableCarray.carrayName_d}())) {
                <#else>
        if (entity.get${tableCarray.carrayName_d}()!=null) {
                </#if>
            updateStrings.add("set ${tableCarray.carrayName}=?");
            param.add(entity.get${tableCarray.carrayName_d}());
        }
            </#if>
        </#list>
        updateStrings.add("update_time=now()");
        sb.append(StringUtils.join(updateStrings, ","));
        sb.append(" WHERE id = ? AND deleted = 0");
        param.add(entity.getId());
        JSONArray array = dataCenter.update(sb.toString(), param);
        return array.getIntValue(0);
    }

    @Override
    public int delete(String id, String updateUser) throws BaseException{
    }

    @Override
    public ${className_d} query(${className_d} entity) throws BaseException{
    }

}