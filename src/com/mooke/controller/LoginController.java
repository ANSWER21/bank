package com.mooke.controller;



import com.mooke.dao.Impl.LoginDaoImpl;
import com.mooke.entity.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class LoginController {

    @Autowired
    private LoginDaoImpl loginDao;

    //登录后
    @RequestMapping("logined.html")
    public  String logined(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        String username = request.getParameter("username");
        String password=request.getParameter("password");
        Login UserEntity=new Login();
        UserEntity.setUsername(username);
        UserEntity.setPassword(password);
        List<Login> list = loginDao.login("Login.login",UserEntity);
        if(list.size()!=0){
            session.setAttribute("username",username);
            if(list.get(0).getRole().equals(0) ){
                return "redirect:executive/showUser.html";
            }
            if (list.get(0).getRole().equals(1)){
                return "redirect:Customermanager/showUser.html";
            }
        }
        return "index";
    }


    //注销
    @RequestMapping("logout.html")
    public  String logout(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        return "index";
    }


}
