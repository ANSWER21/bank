package com.mooke.entity;


public class Tools {

    /*用户信息*/
    private  Integer id;
    private String cid;//用户编号
    private String cname;//用户姓名
    private String csex;//性别
    private String cage;//年龄
    private String cIDcard;//身份证号
    private String cphone;//电话号码
    private String coccupation;//职业
    private String crisk;//风险承受能力：0级、1级、2级、3级、4级
    private String cIDnumber;//开户账号
    //private String mid;//经理编号

    /*明细*/
    //private String mid;//经理编号
    //private String cid;//用户编号
    private String dname;//
    private String did;//数据编号
    //private String pid;//产品编号
    private String dmoney;//交易金额
    private String ddeadline;//截止时间
    private String dtime;//交易日
    private String dendtime;//到期日

    /*跟进*/
    //private String nid;//新用户编号
    private String ftime;//跟进时间
    private String fway;//跟进方式
    private String fresult;//跟进效果

    /*流失用户 */
    private String lid;//流失用户编号
    private String lname;//流失用户姓名
    private String lmoney;//用户资产
    private String ltime;//上次登录时间
    private String lentity;//流失状态：即将流失、已流失
    private String lcause;//流失原因

    /*经理信息*/
    private String mid;//经理编号
    private String mname;//经理姓名
    private String mage;//年龄
    private String mphone;//电话号码
    private String memail;//邮箱

    /*新用户*/
    private String nid;//新用户编号
    private String nname;//用户姓名
    private String nphone;//电话号码
    private String ncontent;//咨询内容
    private String nsuccess;//成功率

    /*新用户*/
    private String pid;//产品编号
    private String pname;//产品名
    private String ptype;//产品类型
    private String ptime;//期限
    private String prisk;//风险：0级、1级、2级、3级、4级
    private String pmoney;//起点金额

    /*扩展*/
    private int dcurrent;//活期
    private int dterminal;//定期
    private int dfinancing;//理财
    private int dfund;//基金
    private int dinsurance;//保险
    private int dtotal;

    private String level;//等级

    @Override
    public String toString() {
        return "Tools{" +
                "id=" + id +
                ", cid='" + cid + '\'' +
                ", cname='" + cname + '\'' +
                ", csex='" + csex + '\'' +
                ", cage='" + cage + '\'' +
                ", cIDcard='" + cIDcard + '\'' +
                ", cphone='" + cphone + '\'' +
                ", coccupation='" + coccupation + '\'' +
                ", crisk='" + crisk + '\'' +
                ", cIDnumber='" + cIDnumber + '\'' +
                ", dname='" + dname + '\'' +
                ", did='" + did + '\'' +
                ", dmoney='" + dmoney + '\'' +
                ", ddeadline='" + ddeadline + '\'' +
                ", dtime='" + dtime + '\'' +
                ", dendtime='" + dendtime + '\'' +
                ", ftime='" + ftime + '\'' +
                ", fway='" + fway + '\'' +
                ", fresult='" + fresult + '\'' +
                ", lid='" + lid + '\'' +
                ", lname='" + lname + '\'' +
                ", lmoney='" + lmoney + '\'' +
                ", ltime='" + ltime + '\'' +
                ", lentity='" + lentity + '\'' +
                ", lcause='" + lcause + '\'' +
                ", mid='" + mid + '\'' +
                ", mname='" + mname + '\'' +
                ", mage='" + mage + '\'' +
                ", mphone='" + mphone + '\'' +
                ", memail='" + memail + '\'' +
                ", nid='" + nid + '\'' +
                ", nname='" + nname + '\'' +
                ", nphone='" + nphone + '\'' +
                ", ncontent='" + ncontent + '\'' +
                ", nsuccess='" + nsuccess + '\'' +
                ", pid='" + pid + '\'' +
                ", pname='" + pname + '\'' +
                ", ptype='" + ptype + '\'' +
                ", ptime='" + ptime + '\'' +
                ", prisk='" + prisk + '\'' +
                ", pmoney='" + pmoney + '\'' +
                ", dcurrent=" + dcurrent +
                ", dterminal=" + dterminal +
                ", dfinancing=" + dfinancing +
                ", dfund=" + dfund +
                ", dinsurance=" + dinsurance +
                ", dtotal=" + dtotal +
                ", level='" + level + '\'' +
                '}';
    }

    public String getDendtime() {
        return dendtime;
    }

    public void setDendtime(String dendtime) {
        this.dendtime = dendtime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCsex() {
        return csex;
    }

    public void setCsex(String csex) {
        this.csex = csex;
    }

    public String getCage() {
        return cage;
    }

    public void setCage(String cage) {
        this.cage = cage;
    }

    public String getcIDcard() {
        return cIDcard;
    }

    public void setcIDcard(String cIDcard) {
        this.cIDcard = cIDcard;
    }

    public String getCphone() {
        return cphone;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone;
    }

    public String getCoccupation() {
        return coccupation;
    }

    public void setCoccupation(String coccupation) {
        this.coccupation = coccupation;
    }

    public String getCrisk() {
        return crisk;
    }

    public void setCrisk(String crisk) {
        this.crisk = crisk;
    }

    public String getcIDnumber() {
        return cIDnumber;
    }

    public void setcIDnumber(String cIDnumber) {
        this.cIDnumber = cIDnumber;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getDid() {
        return did;
    }

    public void setDid(String did) {
        this.did = did;
    }

    public String getDmoney() {
        return dmoney;
    }

    public void setDmoney(String dmoney) {
        this.dmoney = dmoney;
    }

    public String getDdeadline() {
        return ddeadline;
    }

    public void setDdeadline(String ddeadline) {
        this.ddeadline = ddeadline;
    }

    public String getDtime() {
        return dtime;
    }

    public void setDtime(String dtime) {
        this.dtime = dtime;
    }

    public String getFtime() {
        return ftime;
    }

    public void setFtime(String ftime) {
        this.ftime = ftime;
    }

    public String getFway() {
        return fway;
    }

    public void setFway(String fway) {
        this.fway = fway;
    }

    public String getFresult() {
        return fresult;
    }

    public void setFresult(String fresult) {
        this.fresult = fresult;
    }

    public String getLid() {
        return lid;
    }

    public void setLid(String lid) {
        this.lid = lid;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getLmoney() {
        return lmoney;
    }

    public void setLmoney(String lmoney) {
        this.lmoney = lmoney;
    }

    public String getLtime() {
        return ltime;
    }

    public void setLtime(String ltime) {
        this.ltime = ltime;
    }

    public String getLentity() {
        return lentity;
    }

    public void setLentity(String lentity) {
        this.lentity = lentity;
    }

    public String getLcause() {
        return lcause;
    }

    public void setLcause(String lcause) {
        this.lcause = lcause;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getMage() {
        return mage;
    }

    public void setMage(String mage) {
        this.mage = mage;
    }

    public String getMphone() {
        return mphone;
    }

    public void setMphone(String mphone) {
        this.mphone = mphone;
    }

    public String getMemail() {
        return memail;
    }

    public void setMemail(String memail) {
        this.memail = memail;
    }

    public String getNid() {
        return nid;
    }

    public void setNid(String nid) {
        this.nid = nid;
    }

    public String getNname() {
        return nname;
    }

    public void setNname(String nname) {
        this.nname = nname;
    }

    public String getNphone() {
        return nphone;
    }

    public void setNphone(String nphone) {
        this.nphone = nphone;
    }

    public String getNcontent() {
        return ncontent;
    }

    public void setNcontent(String ncontent) {
        this.ncontent = ncontent;
    }

    public String getNsuccess() {
        return nsuccess;
    }

    public void setNsuccess(String nsuccess) {
        this.nsuccess = nsuccess;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
    }

    public String getPtime() {
        return ptime;
    }

    public void setPtime(String ptime) {
        this.ptime = ptime;
    }

    public String getPrisk() {
        return prisk;
    }

    public void setPrisk(String prisk) {
        this.prisk = prisk;
    }

    public String getPmoney() {
        return pmoney;
    }

    public void setPmoney(String pmoney) {
        this.pmoney = pmoney;
    }

    public int getDcurrent() {
        return dcurrent;
    }

    public void setDcurrent(int dcurrent) {
        this.dcurrent = dcurrent;
    }

    public int getDterminal() {
        return dterminal;
    }

    public void setDterminal(int dterminal) {
        this.dterminal = dterminal;
    }

    public int getDfinancing() {
        return dfinancing;
    }

    public void setDfinancing(int dfinancing) {
        this.dfinancing = dfinancing;
    }

    public int getDfund() {
        return dfund;
    }

    public void setDfund(int dfund) {
        this.dfund = dfund;
    }

    public int getDinsurance() {
        return dinsurance;
    }

    public void setDinsurance(int dinsurance) {
        this.dinsurance = dinsurance;
    }

    public int getDtotal() {
        return dtotal;
    }

    public void setDtotal(int dtotal) {
        this.dtotal = dtotal;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }
}
