package com.badlogic.gdx.utils.async;

import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;

public class AsyncExecutor implements Disposable {
  private final ExecutorService executor;
  
  public AsyncExecutor(int paramInt) { this(paramInt, "AsynchExecutor-Thread"); }
  
  public AsyncExecutor(int paramInt, final String name) { this.executor = Executors.newFixedThreadPool(paramInt, new ThreadFactory() {
          public Thread newThread(Runnable param1Runnable) {
            param1Runnable = new Thread(param1Runnable, name);
            param1Runnable.setDaemon(true);
            return param1Runnable;
          }
        }); }
  
  public void dispose() {
    this.executor.shutdown();
    try {
      this.executor.awaitTermination(Float.MAX_VALUE, TimeUnit.SECONDS);
      return;
    } catch (InterruptedException interruptedException) {
      throw new GdxRuntimeException("Couldn't shutdown loading thread", interruptedException);
    } 
  }
  
  public <T> AsyncResult<T> submit(AsyncTask<T> paramAsyncTask) {
    if (!this.executor.isShutdown())
      return new AsyncResult(this.executor.submit(new Callable<T>(this, paramAsyncTask) {
              public T call() throws Exception { return (T)task.call(); }
            })); 
    throw new GdxRuntimeException("Cannot run tasks on an executor that has been shutdown (disposed)");
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/async/AsyncExecutor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */