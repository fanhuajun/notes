import java.io.IOException;
 
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
 
import com.soufun.wap.servlet.XSSRequestWrapper;
 
public class SqlXssFilter implements Filter {
 
    private FilterConfig config = null;    //配置文件（可以从 web中获取参数）
    
   @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.config = filterConfig;
    }
 
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
       //对不是 get请求和post 请求 进行拦截
      if(!(req.getMethod().equalsIgnoreCase("get")||req.getMethod().equalsIgnoreCase("post"))) {  //
			return;
	  }
        chain.doFilter(new XSSRequestWrapper(req), response); //放行
    }
 
    public void destroy() {
    }

    /**
     *  获取敏感字
     *  在 web.xml 中获取获取敏感字符所在的路径
     *  在把它变为流 读进集合里面
     */
    private List<String> getDirtyWords(){
        List<String> dirtyWords = new ArrayList<String>();
        String dirtyWordPath = config.getInitParameter("dirtyWord");  //获取参数值
        InputStream inputStream = config.getServletContext().getResourceAsStream(dirtyWordPath); //传入路径变为流
        InputStreamReader is = null;
        try {
            is = new InputStreamReader(inputStream,"UTF-8");   //把流转换为utf-8编码
        } catch (UnsupportedEncodingException e2) {
            e2.printStackTrace();
        }
        BufferedReader reader = new BufferedReader(is);
        String line;
        try {
            while ((line = reader.readLine())!= null) {//如果 line为空说明读完了
                dirtyWords.add(line);  //把敏感字符丢进集合里面
            }
        } catch (IOException e) {
            e.printStackTrace();
        } 
        return dirtyWords;
    }



}