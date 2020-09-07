package com.badlogic.gdx.utils.async;

import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

public class AsyncResult<T> extends Object {
  private final Future<T> future;
  
  AsyncResult(Future<T> paramFuture) { this.future = paramFuture; }
  
  public T get() {
    try {
      return (T)this.future.get();
    } catch (InterruptedException interruptedException) {
      return null;
    } catch (ExecutionException executionException) {
      throw new GdxRuntimeException(executionException.getCause());
    } 
  }
  
  public boolean isDone() { return this.future.isDone(); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/async/AsyncResult.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */