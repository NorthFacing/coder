package ${packageName}.${className_x}.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ${packageName}.common.Result;
import ${packageName}.${className_x}.model.${className_d};
import ${packageName}.${className_x}.model.${className_d}Vo;
import ${packageName}.${className_x}.service.${className_d}Service;
/**
 * ${className_d}Controller
 * @since v0.0.1
 * @author Bob
 * @Date ${.now}
 */
@Controller
public class ${className_d}Controller extends BaseController {

    @Autowired
    private ${className_d}Service ${className_x}Service;

    @ResponseBody
    @RequestMapping(value = "/${className_x}/save", method = {RequestMethod.GET, RequestMethod.POST})
    public Result<Long> save(@Validated ${className_d} ${className_x}) {
	    return Result.createSuccessResult(${className_x}Service.save(${className_x}));
    }

    @ResponseBody
    @RequestMapping(value = "/${className_x}/getById", method = {RequestMethod.GET, RequestMethod.POST})
    public Result<${className_d}> getById(Long id) {
	    return Result.createSuccessResult(${className_x}Service.getById(id));
    }

}

