package ${packageName}.${className_x}.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.mall.core.base.controller.BaseController;
import com.mall.core.utils.AjaxResults;
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
    @RequestMapping(value = "/${className_x}/save", method = RequestMethod.POST)
    public AjaxResults<?> save(@Validated ${className_d} ${className_x}) {
        ${className_x}Service.save(${className_x});
        return AjaxResults.success();
    }

    @ResponseBody
    @RequestMapping(value = "/${className_x}/getById", method = RequestMethod.GET)
    public AjaxResults<?> getById(String id) {
        return new AjaxResults<${className_d}>(${className_x}Service.getById(id));
    }

    @RequestMapping(value = "/${className_x}/listHtml", method = RequestMethod.GET)
    public String listHtml(Model model) {
        return "/${className_x}/list";
    }

    @ResponseBody
    @RequestMapping(value = "/${className_x}/getList", method = RequestMethod.POST)
    public AjaxResults<List<?>> getList(${className_d}Vo ${className_x}Vo) {
        return new AjaxResults<List<?>>(${className_x}Service.getList(${className_x}Vo));
    }

    @ResponseBody
    @RequestMapping(value = "/${className_x}/getPage", method = RequestMethod.POST)
    public AjaxResults<PageInfo<?>> getPage(${className_d}Vo ${className_x}Vo) {
	    PageInfo<${className_d}> pageInfo = ${className_x}Service.getPage(${className_x}Vo.getPage(), ${className_x}Vo.getRows(), ${className_x}Vo);
        return new AjaxResults<PageInfo<?>>(pageInfo);
    }

}

