package demo.common.utils;

public interface Constant {
    //当前登录用户
    String LOGIN_USER = "loginUser";

    //未删除标志
    Integer DELETE_FLAG_0 = 0;

    //已激活标志
    Integer ACTIVE_FLAG_1 = 1;
    //yi结束标志
    Integer ACTIVE_FLAG_0 = 0;

    //数据字典-困难等级
    String DICTIONARY_TYPE_DIFFICULTY = "DIFFICULTY";
    //数据字典-审核状态
    String DICTIONARY_TYPE_STATUS = "STATUS";

    //角色id：学生
    Long ROLE_STUDENT = 1L;

    //角色id：学校
    Long ROLE_SCHOOLE = 2L;

    //角色id：学院
    Long ROLE_COLLEGE = 3L;

    //角色id：辅导员
    Long ROLE_TEACHER = 4L;

    //审核状态：待审核
    String STATUS_DSH = "DSH";

    //审核状态：不通过
    String STATUS_BTG = "BTG";

    //审核状态：通过
    String STATUS_TG = "TG";


    //审核节点：辅导员
    Integer NODE_CODE_TEACHER = 1;

    //审核节点：学校
    Integer NODE_CODE_SCHOOL = 3;
}
