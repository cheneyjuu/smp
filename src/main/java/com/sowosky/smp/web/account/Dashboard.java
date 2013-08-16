package com.sowosky.smp.web.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * User: Juchen
 * Date: 13-8-16
 * Time: 下午10:43
 */
@Controller
@RequestMapping (value = "/dashboard")
public class Dashboard {

    @RequestMapping (method = RequestMethod.GET)
    public String dashboard(){
        return "dashboard";
    }
}
