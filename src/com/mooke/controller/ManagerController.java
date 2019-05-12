package com.mooke.controller;

import com.mooke.entity.Tools;

import com.mooke.service.Impl.ExecutiveServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Customermanager")
public class ManagerController {
    @Autowired
    private ExecutiveServiceImpl executiveService;

    //用户展示
    @RequestMapping("showUser.html")
    public  String showUser(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        Integer curpage=1;//从第一页开始
        Integer perpage=5;//每页两条数据
        if(request.getParameter("curpage")!=null){
            curpage=Integer.parseInt(request.getParameter("curpage"));
        };//此处获取点击的页数

        String findByName = null;
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("curpage",(curpage-1)*perpage);
        map.put("perpage",perpage);
        map.put("mid",session.getAttribute("username"));
        if (!"".equals(request.getParameter("findByName")) && request.getParameter("findByName") != null) {
            findByName = request.getParameter("findByName");
            map.put("findByName", findByName);
            //借用queryListByPage方法
            List<Tools> list = executiveService.queryListByPage("ManagerMapper.findByName", map);
            model.addAttribute("list", list);
            model.addAttribute("username", session.getAttribute("username"));
            return "Customermanager/showUser";
        }

        List<Tools> list= executiveService.queryListByPage("ManagerMapper.queryListByPage", map);
        model.addAttribute("list", list);
        //查询数据库中总条数
        Integer totalcount = executiveService.queryTotalCount("ExecutiveMapper.queryTotalCount",map);
        System.out.println(111);
        Integer totalpage = 0;
        if (totalcount % perpage == 0){
            totalpage = totalcount / perpage;
        }else {
            totalpage = (totalcount / perpage) + 1;
        }
        model.addAttribute("list", list);
        model.addAttribute("curpage", curpage);
        model.addAttribute("totalpage", totalpage);
        model.addAttribute("username", session.getAttribute("username"));
        return "Customermanager/showUser";
    }

    //资本查询
    @RequestMapping("showCapital.html")
    public  String showCapital(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("cid",request.getParameter("cid"));
        //借用queryListByPage方法
        List<Tools> list= executiveService.queryListByPage("ExecutiveMapper.queryCapitalListByPage", map);
        model.addAttribute("list", list);
        model.addAttribute("username", session.getAttribute("username"));
        return "Customermanager/showCapital";
    }

    //明细查询
    @RequestMapping("showDetail.html")
    public  String showDetail(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("cid",request.getParameter("cid"));
        //借用queryListByPage方法
        List<Tools> list= executiveService.queryListByPage("ExecutiveMapper.queryDetailListByPage", map);
        model.addAttribute("list", list);
        model.addAttribute("username", session.getAttribute("username"));
        model.addAttribute("cid", request.getParameter("cid"));
        return "Customermanager/showDetail";
    }
    //明细搜索
    @RequestMapping("searchDetail.html")
    public  String searchDetail(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("cid",request.getParameter("cid"));
        map.put("pid",request.getParameter("pid"));

        //借用queryListByPage方法
        List<Tools> list= executiveService.queryListByPage("ExecutiveMapper.queryDetailListByType", map);
        model.addAttribute("list", list);
        model.addAttribute("username", session.getAttribute("username"));
        model.addAttribute("cid", request.getParameter("cid"));
        return "Customermanager/showDetail";
    }

    //进入添加明细页面
    @RequestMapping("addDetail.html")
    public  String addDetail(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        Map<String,Object> map =new HashMap<String,Object>();
        //借用queryListByPage方法
        List<Tools> productlist= executiveService.queryListByPage("ExecutiveMapper.queryProductList", map);
        model.addAttribute("productlist", productlist);
        List<Tools> managerList= executiveService.queryListByPage("ExecutiveMapper.queryManagerList", map);
        model.addAttribute("managerList", managerList);
        model.addAttribute("cid", request.getParameter("cid"));
        return "Customermanager/addDetail";
    }

    //明细添加
    @RequestMapping("addDetailed.html")
    public  String addDetailed(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        String pdid=request.getParameter("pdid");
        String pid =pdid.split(",")[1];
        String money =request.getParameter("money");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("mid",request.getParameter("mid"));
        map.put("cid",request.getParameter("cid"));
        //借用方法
        map.put("findByName",request.getParameter("cid"));
        List<Tools> list = executiveService.queryListByPage("ExecutiveMapper.findByName", map);
        map.put("mid",list.get(0).getMid());
        map.put("pid",pid);
        map.put("dpdid",pdid.split(",")[0]);
        map.put("dendtime",request.getParameter("dendtime"));
        map.put("dcurrent",0);
        map.put("dterminal",0);
        map.put("dfinancing",0);
        map.put("dfund",0);
        map.put("dinsurance",0);
        if (pid.equals("001")){
            map.put("dcurrent",money);
        }
        if (pid.equals("002")){
            map.put("dterminal",money);
        }
        if (pid.equals("003")){
            map.put("dfinancing",money);
        }
        if (pid.equals("004")){
            map.put("dfund",money);
        }
        if (pid.equals("005")){
            map.put("dinsurance",money);
        }
        //借用addUsered方法
        executiveService.addUsered("ExecutiveMapper.addDetailed", map);
        model.addAttribute("cid",request.getParameter("cid"));
        return "redirect:showDetail.html";
    }
    //进入修改明细页面
    @RequestMapping("editDetail.html")
    public  String editDetail(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("did",request.getParameter("did"));
        //借用queryListByPage方法
        List<Tools> productlist= executiveService.queryListByPage("ExecutiveMapper.queryProductList", map);
        model.addAttribute("productlist", productlist);
        Tools list= executiveService.queryDetailListByDid("ExecutiveMapper.queryDetailListByDid", map);
        model.addAttribute("list", list);
        model.addAttribute("cid", request.getParameter("cid"));
        return "Customermanager/editDetail";
    }
    //明细修改
    @RequestMapping("editDetailed.html")
    public  String editDetailed(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        String pdid=request.getParameter("pdid");
        String pid =pdid.split(",")[1];
        String money =   request.getParameter("money");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("did",request.getParameter("did"));
        map.put("pid",pid);
        map.put("dpdid",pdid.split(",")[0]);
        map.put("dtime",request.getParameter("dtime"));
        map.put("dendtime",request.getParameter("dendtime"));
        map.put("money",money);
        map.put("dcurrent",0);
        map.put("dterminal",0);
        map.put("dfinancing",0);
        map.put("dfund",0);
        map.put("dinsurance",0);
        if (pid.equals("001")){
            map.put("dcurrent",money);
        }
        if (pid.equals("002")){
            map.put("dterminal",money);
        }
        if (pid.equals("003")){
            map.put("dfinancing",money);
        }
        if (pid.equals("004")){
            map.put("dfund",money);
        }
        if (pid.equals("005")){
            map.put("dinsurance",money);
        }
        //借用updateUsered方法
        executiveService.updateUsered("ExecutiveMapper.editDetailed", map);
        model.addAttribute("cid", request.getParameter("cid"));
        return "redirect:showDetail.html";
    }
    //删除明细
    @RequestMapping("removeDetail.html")
    public  String removeDetail(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        Map<String,Object> map =new HashMap<String,Object>();
        //借用queryListByPage方法
        map.put("did",request.getParameter("did"));
        executiveService.deleteUsered("ExecutiveMapper.removeDetail", map);
        model.addAttribute("cid", request.getParameter("cid"));
        return "redirect:showDetail.html";
    }

    //进入添加用户页面
    @RequestMapping("addUser.html")
    public  String addUser(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        Map<String,Object> map =new HashMap<String,Object>();
        //借用queryListByPage方法
        List<Tools> productlist= executiveService.queryListByPage("ExecutiveMapper.queryProductList", map);
        model.addAttribute("productlist", productlist);
        List<Tools> managerList= executiveService.queryListByPage("ExecutiveMapper.queryManagerList", map);
        model.addAttribute("managerList", managerList);
        return "Customermanager/addUser";
    }

    // ajax校验用户编号是否存在
    @RequestMapping(value = "/checkcid.html", method = {RequestMethod.POST})
    @ResponseBody
    public String checkcid(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        String cid =request.getParameter("cid");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("cid",cid);
        //借用queryListByPage方法
        List<Tools> result= executiveService.queryListByPage("ExecutiveMapper.checkcId", map);
        //编号存在时
        if (result.size()!=0) {
            return "exist";
        }
        //编号不存在
        return "unexist";
    }

    //添加新用户信息去数据库
    @RequestMapping("addUsered.html")
    public  String addUsered(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        String cid =request.getParameter("cid");
        String cname =request.getParameter("cname");
        String csex =request.getParameter("csex");
        String cage =request.getParameter("cage");
        String cIDcard =request.getParameter("cIDcard");
        String cphone =request.getParameter("cphone");
        String crisk =request.getParameter("crisk");
        String cIDnumber =request.getParameter("cIDnumber");
        String mid =request.getParameter("mid");
        String coccupation =request.getParameter("coccupation");

        Map<String,Object> map =new HashMap<String,Object>();
        map.put("cid",cid);
        map.put("cname",cname);
        map.put("csex",csex);
        map.put("cage",cage);
        map.put("cIDcard",cIDcard);
        map.put("cphone",cphone);
        map.put("crisk",crisk);
        map.put("cIDnumber",cIDnumber);
        map.put("mid",mid);
        map.put("coccupation",coccupation);
        String pdid=request.getParameter("pdid");
        String pid =pdid.split(",")[1];
        String money =request.getParameter("money");
        map.put("mid",request.getParameter("mid"));
        map.put("pid",pid);
        map.put("dpdid",pdid.split(",")[0]);
        map.put("dendtime",request.getParameter("dendtime"));
        map.put("dcurrent",0);
        map.put("dterminal",0);
        map.put("dfinancing",0);
        map.put("dfund",0);
        map.put("dinsurance",0);
        if (pid.equals("001")){
            map.put("dcurrent",money);
        }
        if (pid.equals("002")){
            map.put("dterminal",money);
        }
        if (pid.equals("003")){
            map.put("dfinancing",money);
        }
        if (pid.equals("004")){
            map.put("dfund",money);
        }
        if (pid.equals("005")){
            map.put("dinsurance",money);
        }
        //借用addUsered方法
        executiveService.addUsered("ExecutiveMapper.addDetailed", map);
        executiveService.addUsered("ExecutiveMapper.addUsered", map);

        return "redirect:showUser.html";
    }
    //修改用户
    @RequestMapping("editUser.html")
    public  String editUser(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("findByName",request.getParameter("cid"));
        //借用queryListByPage方法
        List<Tools> list = executiveService.queryListByPage("ExecutiveMapper.findByName", map);
        List<Tools> managerList= executiveService.queryListByPage("ExecutiveMapper.queryManagerList", map);
        model.addAttribute("managerList", managerList);
        model.addAttribute("cid",  list.get(0).getCid());
        model.addAttribute("cname", list.get(0).getCname());
        model.addAttribute("cage",list.get(0).getCage() );
        model.addAttribute("csex",list.get(0).getCsex() );
        model.addAttribute("cIDcard",  list.get(0).getcIDcard());
        model.addAttribute("cphone",  list.get(0).getCphone());
        model.addAttribute("coccupation",  list.get(0).getCoccupation());
        model.addAttribute("crisk", list.get(0).getCrisk());
        model.addAttribute("cIDnumber", list.get(0).getcIDnumber() );
        model.addAttribute("mid",   list.get(0).getMid());
        return "Customermanager/editUser";
    }


    //添加新用户信息去数据库
    @RequestMapping("editUsered.html")
    public  String editUsered(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        String cid =request.getParameter("cid");
        String cname =request.getParameter("cname");
        String csex =request.getParameter("csex");
        String cage =request.getParameter("cage");
        String cIDcard =request.getParameter("cIDcard");
        String cphone =request.getParameter("cphone");
        String crisk =request.getParameter("crisk");
        String cIDnumber =request.getParameter("cIDnumber");
        String mid =request.getParameter("mid");
        String coccupation =request.getParameter("coccupation");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("cid",cid);
        map.put("cname",cname);
        map.put("csex",csex);
        map.put("cage",cage);
        map.put("cIDcard",cIDcard);
        map.put("cphone",cphone);
        map.put("crisk",crisk);
        map.put("cIDnumber",cIDnumber);
        map.put("mid",mid);
        map.put("coccupation",coccupation);
        executiveService.updateUsered("ExecutiveMapper.updateUsered", map);

        return "redirect:showUser.html";
    }
    //删除用户
    @RequestMapping("removeUser.html")
    public  String removeUser(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        String cid =request.getParameter("cid");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("cid",cid);
        executiveService.deleteUsered("ExecutiveMapper.deleteUsered", map);
        return "redirect:showUser.html";
    }

    //产品管理
    @RequestMapping("showProduct.html")
    public  String showProduct(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        Map<String,Object> map =new HashMap<String,Object>();
        //借用queryListByPage方法
        List<Tools> list= executiveService.queryListByPage("ExecutiveMapper.showProduct", map);
        model.addAttribute("list",list);
        return "Customermanager/showProduct";
    }

    //产品管理
    @RequestMapping("searchProduct.html")
    public  String searchProduct(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        String pid = null;
        String prisk = null;
        pid = request.getParameter("pid");
        prisk = request.getParameter("prisk");
        map.put("pid", pid);
        map.put("prisk", prisk);

        if (pid != null && !"".equals(pid) && prisk != null && !"".equals(prisk)) {
            //借用queryListByPage方法
            List<Tools> list= executiveService.queryListByPage("ExecutiveMapper.showProductByPidPrisk", map);
            model.addAttribute("list",list);
            model.addAttribute("list", list);
            model.addAttribute("pid", pid);
            model.addAttribute("prisk", prisk);
            return "Customermanager/showProduct";
        }

        if ((pid == null || "".equals(pid)) && prisk != null && !"".equals(prisk)) {
            //借用queryListByPage方法
            List<Tools> list= executiveService.queryListByPage("ExecutiveMapper.showProductByPrisk", map);
            model.addAttribute("list",list);
            model.addAttribute("list", list);
            model.addAttribute("pid", pid);
            model.addAttribute("prisk", prisk);
            return "Customermanager/showProduct";
        }
        if ((prisk == null || "".equals(prisk)) && pid != null && !"".equals(pid)) {
            //借用queryListByPage方法
            List<Tools> list= executiveService.queryListByPage("ExecutiveMapper.showProductByPid", map);
            model.addAttribute("list", list);
            model.addAttribute("pid", pid);
            model.addAttribute("prisk", prisk);
            return "Customermanager/showProduct";
        }

        return "redirect:showProduct.html";
    }

    //产品管理
    @RequestMapping("addProduct.html")
    public  String addProduct(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        return "Customermanager/addProduct";
    }
    //添加产品
    @RequestMapping("addProducted.html")
    public  String addProducted(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        String pid =request.getParameter("pid");
        String pname =request.getParameter("pname");
        String ptime =request.getParameter("ptime");
        String prisk =request.getParameter("prisk");
        String pmoney =request.getParameter("pmoney");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("pid",pid);
        map.put("pname",pname);
        map.put("ptime",ptime);
        map.put("prisk",prisk);
        map.put("pmoney",pmoney);
        executiveService.addUsered("ExecutiveMapper.addProducted", map);
        return "redirect:showProduct.html";
    }

    @RequestMapping("editProduct.html")
    public  String editProduct(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        String id =request.getParameter("id");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("id",id);
        Tools list= executiveService.queryDetailListByDid("ExecutiveMapper.editProduct", map);
        model.addAttribute("list", list);
        model.addAttribute("id", id);
        return "Customermanager/editProduct";
    }

    @RequestMapping("editProducted.html")
    public  String editProducted(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        String id =request.getParameter("id");
        String pid =request.getParameter("pid");
        String pname =request.getParameter("pname");
        String ptime =request.getParameter("ptime");
        String prisk =request.getParameter("prisk");
        String pmoney =request.getParameter("pmoney");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("id",id);
        map.put("pid",pid);
        map.put("pname",pname);
        map.put("ptime",ptime);
        map.put("prisk",prisk);
        map.put("pmoney",pmoney);
        executiveService.updateUsered("ExecutiveMapper.updateProducted", map);
        return "redirect:showProduct.html";
    }
    @RequestMapping("removeProduct.html")
    public  String removeProduct(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        String id =request.getParameter("id");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("id",id);
        executiveService.deleteUsered("ExecutiveMapper.deleteProduct", map);
        return "redirect:showProduct.html";
    }

    //新用户营销
    @RequestMapping("showNewUser.html")
    public  String showNewUser(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        Integer curpage=1;//从第一页开始
        Integer perpage=5;//每页两条数据
        if(request.getParameter("curpage")!=null){
            curpage=Integer.parseInt(request.getParameter("curpage"));
        };//此处获取点击的页数

        String findByName = null;
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("curpage",(curpage-1)*perpage);
        map.put("perpage",perpage);
        List<Tools> list= executiveService.queryListByPage("ExecutiveMapper.showNewUser", map);
        model.addAttribute("list", list);
        //查询数据库中总条数
        Integer totalcount = executiveService.queryTotalCount("ExecutiveMapper.queryNewUserTotalCount",map);
        Integer totalpage = 0;
        if (totalcount % perpage == 0){
            totalpage = totalcount / perpage;
        }else {
            totalpage = (totalcount / perpage) + 1;
        }
        model.addAttribute("list", list);
        model.addAttribute("curpage", curpage);
        model.addAttribute("totalpage", totalpage);
        model.addAttribute("username", session.getAttribute("username"));
        model.addAttribute("username", session.getAttribute("username"));
        return "Customermanager/showNewUser";
    }

    //进入添加新用户界面
    @RequestMapping("addNewUser.html")
    public  String addNewUser(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        return "Customermanager/addNewUser";
    }
    //用户添加完成
    @RequestMapping("addNewUsered.html")
    public  String addNewUsered(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        String nname =request.getParameter("nname");
        String nphone =request.getParameter("nphone");
        String ncontent =request.getParameter("ncontent");
        String nsuccess =request.getParameter("nsuccess");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("nname",nname);
        map.put("nphone",nphone);
        map.put("ncontent",ncontent);
        map.put("nsuccess",nsuccess);
        //借用addUsered方法
        executiveService.addUsered("ExecutiveMapper.addNewUsered", map);
        return "redirect:showNewUser.html";
    }

    //进入跟进页面
    @RequestMapping("follow.html")
    public  String follow(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        String nid =request.getParameter("nid");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("nid",nid);
        //借用queryListByPage方法
        List<Tools> list= executiveService.queryListByPage("ManagerMapper.follow", map);
        model.addAttribute("list",list);
        model.addAttribute("nid",nid);
        return "Customermanager/follow";
    }

    //移除跟进信息
    @RequestMapping("removeFollow.html")
    public  String removeFollow(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        String id =request.getParameter("id");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("id",id);
        //借用deleteUsered方法
        executiveService.deleteUsered("ManagerMapper.deletefollow", map);
        model.addAttribute("nid",request.getParameter("nid"));
        return "redirect:follow.html";
    }

    //已有用户营销
    @RequestMapping("showHaveUser.html")
    public  String showHaveUser(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        Integer curpage=1;//从第一页开始
        Integer perpage=5;//每页两条数据
        if(request.getParameter("curpage")!=null){
            curpage=Integer.parseInt(request.getParameter("curpage"));
        };//此处获取点击的页数
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("curpage",(curpage-1)*perpage);
        map.put("perpage",perpage);
        map.put("mid",session.getAttribute("username"));
        List<Tools> list= executiveService.queryListByPage("ManagerMapper.showHaveUser", map);
        model.addAttribute("list", list);
        //查询数据库中总条数
        Integer totalcount = executiveService.queryTotalCount("ManagerMapper.queryHaveUserTotalCount",map);
        Integer totalpage = 0;
        if (totalcount % perpage == 0){
            totalpage = totalcount / perpage;
        }else {
            totalpage = (totalcount / perpage) + 1;
        }
        model.addAttribute("curpage", curpage);
        model.addAttribute("totalpage", totalpage);
        model.addAttribute("username", session.getAttribute("username"));
        return "Customermanager/showHaveUser";
    }
    //流失客户展示
    @RequestMapping("showLoss.html")
    public  String showLoss(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        Integer curpage=1;//从第一页开始
        Integer perpage=5;//每页两条数据
        if(request.getParameter("curpage")!=null){
            curpage=Integer.parseInt(request.getParameter("curpage"));
        };//此处获取点击的页数
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("curpage",(curpage-1)*perpage);
        map.put("perpage",perpage);
        List<Tools> list= executiveService.queryListByPage("ExecutiveMapper.showLossUser", map);
        model.addAttribute("list", list);
        //查询数据库中总条数
        Integer totalcount = executiveService.queryTotalCount("ExecutiveMapper.queryLossTotalCount",map);

        Integer totalpage = 0;
        if(totalcount==null){
            totalcount=0;
        }
        if (totalcount % perpage == 0){
            totalpage = totalcount / perpage;
        }else {
            totalpage = (totalcount / perpage) + 1;
        }
        model.addAttribute("curpage", curpage);
        model.addAttribute("totalpage", totalpage);
        model.addAttribute("username", session.getAttribute("username"));
        return "Customermanager/showLoss";
    }

    //进入修改流失用户界面
    @RequestMapping("editLoss.html")
    public  String editLoss(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        model.addAttribute("cid",request.getParameter("cid"));
        model.addAttribute("lcause",request.getParameter("lcause"));
        return "Customermanager/editLoss";
    }

    //修改后
    @RequestMapping("editLossed.html")
    public  String editLossed(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("cid",request.getParameter("cid"));
        map.put("lcause",request.getParameter("lcause"));
        executiveService.updateUsered("ExecutiveMapper.editLossed",map);
        return "redirect:showLoss.html";
    }

    @RequestMapping("removeLoss.html")
    public  String removeLoss(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        String cid =request.getParameter("cid");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("cid",cid);
        executiveService.deleteUsered("ExecutiveMapper.deleteUsered", map);
        return "redirect:showLoss.html";
    }


    @RequestMapping("showManager.html")
    public  String showManager(HttpServletRequest request, HttpServletResponse response,HttpSession session, Model model)
    {
        Integer curpage=1;//从第一页开始
        Integer perpage=5;//每页两条数据
        if(request.getParameter("curpage")!=null){
            curpage=Integer.parseInt(request.getParameter("curpage"));
        };//此处获取点击的页数
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("curpage",(curpage-1)*perpage);
        map.put("perpage",perpage);
        List<Tools> list= executiveService.queryListByPage("ExecutiveMapper.showManager", map);
        model.addAttribute("list", list);
        //查询数据库中总条数
        Integer totalcount = executiveService.queryTotalCount("ExecutiveMapper.queryManagerTotalCount",map);
        Integer totalpage = 0;
        if(totalcount==null){
            totalcount=0;
        }
        if (totalcount % perpage == 0){
            totalpage = totalcount / perpage;
        }else {
            totalpage = (totalcount / perpage) + 1;
        }
        model.addAttribute("curpage", curpage);
        model.addAttribute("totalpage", totalpage);
        model.addAttribute("username", session.getAttribute("username"));
        return "Customermanager/showManager";
    }


    //注销
    @RequestMapping("logout.html")
    public  String logout(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        return "index";
    }
    //添加新跟进
    @RequestMapping("addNewFollow.html")
    public  String addNewFollow(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        model.addAttribute("nid",request.getParameter("nid"));
        return "Customermanager/addNewFollow";
    }
    //添加新跟进后
    @RequestMapping("addNewFollowed.html")
    public  String addNewFollowed(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
    {
        String nid =request.getParameter("nid");
        String ftime =request.getParameter("ftime");
        String fway =request.getParameter("fway");
        String fresult =request.getParameter("fresult");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("mid",session.getAttribute("username"));
        map.put("nid",nid);
        map.put("ftime",ftime);
        map.put("fway",fway);
        map.put("fresult",fresult);
        //借用addUsered方法
        executiveService.addUsered("ManagerMapper.addNewFollowed", map);
        model.addAttribute("nid",request.getParameter("nid"));
        return "redirect:follow.html";
    }
}
