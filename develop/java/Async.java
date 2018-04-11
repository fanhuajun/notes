//spring 多线程

@Service
@EnableAsync
public class AsyncTaskExecutorConfig implements AsyncConfigurer {

	/**
	 * 注入一个线程池 设置线程池属性
	 */
	@Override
	public Executor getAsyncExecutor() {
		ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor();
		taskExecutor.setCorePoolSize(5);
		taskExecutor.setMaxPoolSize(20); //线程大小
		taskExecutor.setQueueCapacity(25);
		taskExecutor.initialize();
		return taskExecutor;
	}

	@Override
	public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {
		return null;
	}

}

@Service
public class AsyncTaskService {
	
	/**
     * 线程实例
     * @param i
     */
	@Async
    public void executeAsyncTask1(int i){
		Thread th = Thread.currentThread();
        System.out.println("执行异步任务(1):"+i);
        System.out.println("线程标识(1)："+th.getId());
        
    }
	
    /**
     * 线程实例
     * @param i
     */
    @Async
    public void executeAsyncTask2(int i){
    	Thread th = Thread.currentThread();
        System.out.println("执行异步任务(2):"+(i+i));
        System.out.println("线程标识(2)："+th.getId());
    }

}