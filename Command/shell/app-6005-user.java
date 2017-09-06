package ooh.bravo.container.spring;

import java.io.File;
import java.io.PrintStream;
import java.lang.management.ManagementFactory;
import java.lang.management.RuntimeMXBean;
import java.lang.reflect.Method;
import java.net.URI;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class Startup
{
  private static final String SERVER_ENV = "server.home";
  private static final String LIB_PATH = "lib";
  private static final String SERVER_CLASS = "ooh.bravo.container.spring.server.StandardServer";
  private static final String START_COMMAND = "start";
  private static final String STOP_COMMAND = "stop";
  private static Startup daemon = null;
  private ClassLoader classLoader;
  private String serverHome;
  private Object server;

  public static void main(String[] args)
    throws Exception
  {
    if (daemon == null) {
      Startup startup = new Startup();
      try {
        startup.init();
      } catch (Throwable t) {
        t.printStackTrace();
        return;
      }
      daemon = startup;
    }
    String command = "start";
    if (args.length > 0)
      command = args[0];
    try
    {
      if ("start".equals(command))
        daemon.start();
      else if ("stop".equals(command))
        daemon.stop();
      else
        System.out.println(new StringBuilder().append("command \"").append(command).append("\" does not exist.").toString());
    }
    catch (Exception e) {
      e.printStackTrace();
      System.exit(1);
    }
  }

  private void init() throws Exception {
    loadingJVMInfo();
    loadingServerHome();
    loadingClassLoader();
    Class serverClass = this.classLoader.loadClass("ooh.bravo.container.spring.server.StandardServer");
    this.server = serverClass.newInstance();
  }

  private void loadingJVMInfo() {
    StringBuilder buffer = new StringBuilder();
    buffer.append(System.getProperty("java.vendor"));
    buffer.append(" ");
    buffer.append(System.getProperty("java.version"));
    buffer.append(" ");
    buffer.append(System.getProperty("java.home"));
    System.out.println(new StringBuilder().append("Java Runtime: ").append(buffer.toString()).toString());
    buffer.setLength(0);
    buffer.append("current=");
    buffer.append(Runtime.getRuntime().totalMemory() / 1024L);
    buffer.append("k  free=");
    buffer.append(Runtime.getRuntime().freeMemory() / 1024L);
    buffer.append("k  max=");
    buffer.append(Runtime.getRuntime().maxMemory() / 1024L);
    buffer.append("k");
    System.out.println(new StringBuilder().append("  Heap sizes: ").append(buffer.toString()).toString());
    buffer.setLength(0);
    List jvmArgs = ManagementFactory.getRuntimeMXBean().getInputArguments();
    for (String string : jvmArgs) {
      buffer.append(" ").append(string);
    }
    System.out.println(new StringBuilder().append("    JVM args:").append(buffer.toString()).toString());
  }

  private void loadingServerHome() throws Exception {
    this.serverHome = System.getProperty("server.home");
    if ((this.serverHome != null) && (this.serverHome.length() > 0))
      System.out.println(new StringBuilder().append("server.home: ").append(this.serverHome).toString());
    else
      throw new Exception("System property(server.home) is not found!");
  }

  private void loadingClassLoader()
  {
    try {
      this.classLoader = createClassLoader(null);
      Thread.currentThread().setContextClassLoader(this.classLoader);
    } catch (Throwable e) {
      e.printStackTrace();
      System.exit(1);
    }
  }

  private ClassLoader createClassLoader(ClassLoader parent) throws Exception {
    File directory = new File(this.serverHome, "lib");
    if ((!directory.exists()) || (!directory.isDirectory()) || (!directory.canRead()))
    {
      throw new Exception(new StringBuilder().append("lib directory specified is not valid directory: ").append(this.serverHome)
        .append(System.getProperty("file.separator"))
        .append("lib").toString());
    }
    File[] files = directory.listFiles();
    Arrays.sort(files);
    List urls = new ArrayList(files.length);
    boolean first = true;
    for (File file : files) {
      if ((file.isFile()) && (file.getName().toLowerCase().endsWith(".jar")) && (file.canRead())) {
        URL url = file.toURI().toURL();
        urls.add(url);
        if (first) {
          System.out.println(new StringBuilder().append("Classpath: ").append(url).toString());
          first = false;
        } else {
          System.out.println(new StringBuilder().append("           ").append(url).toString());
        }
      }
    }
    URL[] array = (URL[])urls.toArray(new URL[urls.size()]);
    if (parent == null) {
      return new URLClassLoader(array);
    }
    return new URLClassLoader(array, parent);
  }

  private void start() throws Exception {
    Method method = this.server.getClass().getMethod("start", new Class[0]);
    method.invoke(this.server, (Object[])null);
  }

  private void stop() throws Exception {
    Method method = this.server.getClass().getMethod("stopServer", new Class[0]);
    method.invoke(this.server, (Object[])null);
  }
}