/*
 * @(#)test.java 2016年11月24日
 * 
 * Copyright (c), 2016 深圳市万睿智能科技有限公司（Shenzhen Wan Rui Intelligent Technology Co., Ltd.）
 * 
 * 著作权人保留一切权利，任何使用需经授权。
 */
package com.fan.huaSelenium;

/**
 *
 * @author fanhuajun
 * @date 2016年11月24日 上午10:28:31
 * @version V1.0.0
 * description：
 * 
 */
import com.thoughtworks.selenium.DefaultSelenium;  

public class SeleniumDemo01  
{  
  public static void main(String[] args)  
  {  
      String host = "localhost";  
      int port = 4444;  
      String url = "http://www.baidu.com/";  
      String browserType = "*firefox";  
   
      String keyWordsLocator = "document.getElementById('kw')";     
      String search = "document.getElementById('su')";  
      DefaultSelenium selenium = new DefaultSelenium(host,port,browserType,url);  
      selenium.start();  
      selenium.open(url);  
      selenium.type(keyWordsLocator,"java selenium");  
      selenium.click(search);  
      selenium.waitForPageToLoad("50000");  
      //selenium.stop();  
       
  }  
}  