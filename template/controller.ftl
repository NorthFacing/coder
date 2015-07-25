package ${packageName}.${className_x}.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.mall.core.base.controller.BaseController;
import com.mall.core.contants.Constants;
import com.mall.core.utils.AjaxResults;
import ${packageName}.${className_x}.model.${className_d};
import ${packageName}.${className_x}.service.${className_d}Service;

/**
 * ${className}Controller
 * @since v0.0.1
 * @author Bob
 * @Date ${.now}
 */
@Controller
public class ${className_d}Controller extends BaseController {

    @Autowired
    private ${className_d}Service ${className_x}Service;

    @RequestMapping(value = "/${className_x}/add", method = RequestMethod.POST)
    public AjaxResults<?> add(@Validated ${className_d} ${className_x}) {
        ${className_x}Service.add(${className_x});
        return AjaxResults.success();
    }

    @ResponseBody
    @RequestMapping(value = "/${className_x}/getById", method = RequestMethod.GET)
    public AjaxResults<?> getById(String id) {
        return new AjaxResults<${className_d}>(${className_x}Service.getById(id));
    }

    @ResponseBody
    @RequestMapping(value = "/${className_x}/listHtml", method = RequestMethod.GET)
    public String listHtml(Model model) {
        return "/${className_x}/list";
    }

    @ResponseBody
    @RequestMapping(value = "/${className_x}/getList", method = RequestMethod.GET)
    public AjaxResults<List<?>> getList(${className_d} ${className_x}) {
        return new AjaxResults<List<?>>(${className_x}Service.getList(${className_x}));
    }

    @ResponseBody
    @RequestMapping(value = "/${className_x}/getPage", method = RequestMethod.GET)
    public AjaxResults<PageInfo<?>> getPage(${className_d} ${className_x},
        @RequestParam(defaultValue = Constants.pageNum) int pageNum,
        @RequestParam(defaultValue = Constants.pageSize) int pageSize) {
        return new AjaxResults<PageInfo<?>>(${className_x}Service.getPage(pageNum, pageSize, ${className_x}));
    }

    @RequestMapping(value = "/${className_x}/update", method = RequestMethod.POST)
    public AjaxResults<?> update(@Validated ${className_d} ${className_x}) {
        ${className_x}Service.updateById(${className_x});
        return AjaxResults.success();
    }

    @RequestMapping(value = "/${className_x}/delById", method = RequestMethod.GET)
    public AjaxResults<?> delById(String id) {
        ${className_x}Service.delById(id);
        return AjaxResults.success();
    }

}

