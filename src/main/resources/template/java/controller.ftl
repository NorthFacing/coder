package ${packageName}.${className_x}.controller;

import com.bob.core.base.controller.BaseController;
import com.bob.core.utils.Result;
import com.bob.core.utils.page.PageUtil;
import com.bob.modules.${className_x}.entity.${className_d};
import com.bob.modules.${className_x}.entity.${className_d}Query;
import com.bob.modules.${className_x}.service.${className_d}Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * ${className_d}Controller
 * @since v0.0.1
 * @author Bob.Zhu
 * @Date ${.now}
 */
@Controller
@RequestMapping("/admin")
public class ${className_d}Controller extends BaseController {

    @Autowired
    private ${className_d}Service ${className_x}Service;

    public ${className_d} select(${className_d} entity) {
        return ${className_x}Service.select(entity);
    }

    @RequestMapping(value = "/${className_x}/add")
        public String add() {
        return "/${className_x}/edit";
    }

    @RequestMapping(value = "/${className_x}/update")
        public String update(String id, Model model) {
        ${className_d} entity = ${className_x}Service.selectById(id);
        model.addAttribute("entity", entity);
        return "/${className_x}/edit";
    }

    @ResponseBody
    @RequestMapping(value = "/${className_x}/save")
        public Result save(${className_d} entity) {
        Result result = Result.fail();
        ${className_x}Service.save(entity);
        return result.success();
    }

    @RequestMapping(value = "/${className_x}/view")
        public String select(String id, Model model) {
        ${className_d} entity = ${className_x}Service.selectById(id);
        model.addAttribute("entity", entity);
        return "/sysResource/view";
    }

    @ResponseBody
    @RequestMapping(value = "/${className_x}/delete")
        public Result delete(String id) {
        Result result = Result.fail();
        ${className_x}Service.deleteById(id);
        return result.success();
    }

    @RequestMapping(value = "/${className_x}/list")
        public String list() {
        return "/${className_x}/list";
    }

    @ResponseBody
    @RequestMapping(value = "/${className_x}/pageData")
        public Map<String, Object> pageData(${className_d}Query query) {
        query = ${className_x}Service.pageData(query);
        return PageUtil.convertPage(query);
    }

}

