import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
 
import org.apache.commons.lang.StringEscapeUtils;
 
public class XSSRequestWrapper extends HttpServletRequestWrapper {
    public XSSRequestWrapper(HttpServletRequest servletRequest) {
        super(servletRequest);
    }
 
    /*
     *重写getParameterValues方法
     */
    @Override
    public String[] getParameterValues(String parameter) {
        String[] values = super.getParameterValues(parameter);  //调用父类getParameterValues 获取原始值
        if ("pageChildren".equals(parameter)) {      //对原始值进行判断做出选择
            return values;
        }
        if (values == null) {
            return null;
        }
        int count = values.length;
        String[] encodedValues = new String[count];  //创建一个字符数组
        for (int i = 0; i < count; i++) {
            encodedValues[i] = stripXSS(values[i]);   //循坏替换 值中的关键字
        }
        return encodedValues;
    }
 
     /* 
      *重写getParameter方法方法
      */
    @Override
    public String getParameter(String parameter) {
        String value = super.getParameter(parameter);  //调用父类获取原始值
        return stripXSS(value); //替换
    }
    
    /*
     *对值中的关键字进行替换
     */
    private String stripXSS(String value) {
        if (null != value) {
            value = value.replaceAll("<", "<").replaceAll(">", ">");
            value = value.replaceAll("\\(", "(").replaceAll("\\)", ")");
            value = value.replaceAll("'", "'");
            value = value.replaceAll("eval\\((.*)\\)", "");
            value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
            value = value.replaceAll("script", "");
            value = StringEscapeUtils.escapeSql(value);
        }
        return value;
    }
}