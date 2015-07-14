package com;

import com.bob.coder.generator.Generator;
import com.bob.coder.util.ParseConfig;

/**
 * 程序入口，执行此mian函数执行代码生成操作
 * 
 * @since v0.0.1
 * @author Bob
 * @created 2015年7月14日 下午4:19:22
 */
public class Build {

    public static void main(String[] args) {
        try {
            // 初始化参数
            ParseConfig.setcfg();
            // 代码生成
            new Generator().generate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
