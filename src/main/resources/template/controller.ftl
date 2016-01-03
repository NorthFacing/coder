package ${packageName}.${className_x}.controller;

import com.bob.core.base.controller.BaseController;
import com.bob.modules.${className_x}.service.${className_d}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

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

}

