package demo.common.utils;

public class StringUtils {
    public static Boolean isNull(String s){
        if (s==null) return true;
        if (s.length()==0) return true;
        return false;
    }
}
