/*
 * @(#)SuggestServiceTest.java 2016年10月18日
 * 
 * Copyright (c), 2016 深圳市万睿智能科技有限公司（Shenzhen Wan Rui Intelligent Technology Co., Ltd.）
 * 
 * 著作权人保留一切权利，任何使用需经授权。
 */

/**
 *
 * @author fanhuajun
 * @date 2016年10月18日 下午6:34:23
 * @version V1.0.0 description：+
 * 
 */
public class regEx {

    

    public static void main(String[] args) {
        int count = 0;
        String regEx = "[A-Za-z0-9_\\-\\u4e00-\\u9fa5]";
        String str = "中文nihao3-";
        
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        
        System.out.println("字符长度"+str.length()); 
        while (m.find()) {
            count = count + 1;
            System.out.print(m.groupCount());
            System.out.print(m.group());
            System.out.print("  ");
        }
        System.out.println("共有 " + count + "个 ");
    }

}
