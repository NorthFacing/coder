package ${packageName}.${className_x}.controller;

import ${packageName}.model.${className_d};
import ${packageName}.service.${className_d}Service;
import com.joyoung.smart.base.exceptions.BaseException;
import com.joyoung.smart.base.model.Result;
import com.joyoung.smart.base.model.ResultWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static com.joyoung.base.boot.utils.ParamCheckUtil.checkLackParam;

@RestController
@RequestMapping("/${className_x}")
public class ${className_d}Controller {

    @Autowired
    private ${className_d}Service ${className_x}Service;

    @PostMapping(value = "/insert")
    public Result<ResultWrapper> insert(@RequestBody ${className_d} entity) throws BaseException {
        return Result.wrapper(${className_x}Service.insert(entity));
    }

    @PostMapping(value = "/query")
    public Result<List<${className_d}>> query(@RequestBody ${className_d} entity) throws BaseException {
        return Result.success(${className_x}Service.query(entity));
    }

    @PostMapping(value = "/update")
    public Result<ResultWrapper> update(@RequestBody ${className_d} entity) throws BaseException {
        checkLackParam(entity.getId(), "ID");
        return Result.wrapper(${className_x}Service.update(entity));
    }

    @PostMapping(value = "/delete")
    public Result<ResultWrapper> delete(@RequestBody ${className_d} entity) throws BaseException {
        checkLackParam(entity.getId(), "ID");
        checkLackParam(entity.getId(), "修改人");
        return Result.wrapper(${className_x}Service.delete(entity.getId(), entity.getUpdateUser()));
    }

}
