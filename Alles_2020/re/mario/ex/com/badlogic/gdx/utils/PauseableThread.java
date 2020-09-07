package com.badlogic.gdx.utils;

public class PauseableThread extends Thread {
  boolean exit = false;
  
  boolean paused = false;
  
  final Runnable runnable;
  
  public PauseableThread(Runnable paramRunnable) { this.runnable = paramRunnable; }
  
  public boolean isPaused() { return this.paused; }
  
  public void onPause() { this.paused = true; }
  
  public void onResume() { // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: iconst_0
    //   4: putfield paused : Z
    //   7: aload_0
    //   8: invokevirtual notifyAll : ()V
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: astore_1
    //   15: aload_0
    //   16: monitorexit
    //   17: aload_1
    //   18: athrow
    // Exception table:
    //   from	to	target	type
    //   2	13	14	finally
    //   15	17	14	finally }
  
  public void run() {
    /* monitor enter ThisExpression{ObjectType{com/badlogic/gdx/utils/PauseableThread}} */
    while (true) {
      try {
        while (this.paused)
          wait(); 
      } catch (InterruptedException interruptedException) {
        interruptedException.printStackTrace();
      } finally {
        Object object;
      } 
      /* monitor exit ThisExpression{ObjectType{com/badlogic/gdx/utils/PauseableThread}} */
      if (this.exit)
        return; 
      this.runnable.run();
    } 
  }
  
  public void stopThread() {
    this.exit = true;
    if (this.paused)
      onResume(); 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/PauseableThread.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */