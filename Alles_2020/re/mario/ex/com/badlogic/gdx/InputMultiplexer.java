package com.badlogic.gdx;

import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.SnapshotArray;

public class InputMultiplexer implements InputProcessor {
  private SnapshotArray<InputProcessor> processors = new SnapshotArray(4);
  
  public InputMultiplexer() {}
  
  public InputMultiplexer(InputProcessor... paramVarArgs) { this.processors.addAll(paramVarArgs); }
  
  public void addProcessor(int paramInt, InputProcessor paramInputProcessor) {
    if (paramInputProcessor != null) {
      this.processors.insert(paramInt, paramInputProcessor);
      return;
    } 
    throw new NullPointerException("processor cannot be null");
  }
  
  public void addProcessor(InputProcessor paramInputProcessor) {
    if (paramInputProcessor != null) {
      this.processors.add(paramInputProcessor);
      return;
    } 
    throw new NullPointerException("processor cannot be null");
  }
  
  public void clear() { this.processors.clear(); }
  
  public SnapshotArray<InputProcessor> getProcessors() { return this.processors; }
  
  public boolean keyDown(int paramInt) {
    null = this.processors.begin();
    try {
      int i = this.processors.size;
      for (byte b = 0; b < i; b++) {
        boolean bool = ((InputProcessor)null[b]).keyDown(paramInt);
        if (bool)
          return true; 
      } 
      return false;
    } finally {
      this.processors.end();
    } 
  }
  
  public boolean keyTyped(char paramChar) {
    null = this.processors.begin();
    try {
      int i = this.processors.size;
      for (byte b = 0; b < i; b++) {
        boolean bool = ((InputProcessor)null[b]).keyTyped(paramChar);
        if (bool)
          return true; 
      } 
      return false;
    } finally {
      this.processors.end();
    } 
  }
  
  public boolean keyUp(int paramInt) {
    null = this.processors.begin();
    try {
      int i = this.processors.size;
      for (byte b = 0; b < i; b++) {
        boolean bool = ((InputProcessor)null[b]).keyUp(paramInt);
        if (bool)
          return true; 
      } 
      return false;
    } finally {
      this.processors.end();
    } 
  }
  
  public boolean mouseMoved(int paramInt1, int paramInt2) {
    null = this.processors.begin();
    try {
      int i = this.processors.size;
      for (byte b = 0; b < i; b++) {
        boolean bool = ((InputProcessor)null[b]).mouseMoved(paramInt1, paramInt2);
        if (bool)
          return true; 
      } 
      return false;
    } finally {
      this.processors.end();
    } 
  }
  
  public void removeProcessor(int paramInt) { this.processors.removeIndex(paramInt); }
  
  public void removeProcessor(InputProcessor paramInputProcessor) { this.processors.removeValue(paramInputProcessor, true); }
  
  public boolean scrolled(int paramInt) {
    null = this.processors.begin();
    try {
      int i = this.processors.size;
      for (byte b = 0; b < i; b++) {
        boolean bool = ((InputProcessor)null[b]).scrolled(paramInt);
        if (bool)
          return true; 
      } 
      return false;
    } finally {
      this.processors.end();
    } 
  }
  
  public void setProcessors(Array<InputProcessor> paramArray) {
    this.processors.clear();
    this.processors.addAll(paramArray);
  }
  
  public void setProcessors(InputProcessor... paramVarArgs) {
    this.processors.clear();
    this.processors.addAll(paramVarArgs);
  }
  
  public int size() { return this.processors.size; }
  
  public boolean touchDown(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    null = this.processors.begin();
    try {
      int i = this.processors.size;
      for (byte b = 0; b < i; b++) {
        boolean bool = ((InputProcessor)null[b]).touchDown(paramInt1, paramInt2, paramInt3, paramInt4);
        if (bool)
          return true; 
      } 
      return false;
    } finally {
      this.processors.end();
    } 
  }
  
  public boolean touchDragged(int paramInt1, int paramInt2, int paramInt3) {
    null = this.processors.begin();
    try {
      int i = this.processors.size;
      for (byte b = 0; b < i; b++) {
        boolean bool = ((InputProcessor)null[b]).touchDragged(paramInt1, paramInt2, paramInt3);
        if (bool)
          return true; 
      } 
      return false;
    } finally {
      this.processors.end();
    } 
  }
  
  public boolean touchUp(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    null = this.processors.begin();
    try {
      int i = this.processors.size;
      for (byte b = 0; b < i; b++) {
        boolean bool = ((InputProcessor)null[b]).touchUp(paramInt1, paramInt2, paramInt3, paramInt4);
        if (bool)
          return true; 
      } 
      return false;
    } finally {
      this.processors.end();
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/InputMultiplexer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */