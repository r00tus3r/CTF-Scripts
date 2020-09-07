package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.utils.Array;

public class ButtonGroup<T extends Button> extends Object {
  private final Array<T> buttons = new Array();
  
  private Array<T> checkedButtons = new Array(true);
  
  private T lastChecked;
  
  private int maxCheckCount = 1;
  
  private int minCheckCount = 1;
  
  private boolean uncheckLast = true;
  
  public ButtonGroup() {}
  
  public ButtonGroup(T... paramVarArgs) {
    add(paramVarArgs);
    this.minCheckCount = 1;
  }
  
  public void add(T paramT) {
    if (paramT != null) {
      boolean bool;
      paramT.buttonGroup = null;
      if (paramT.isChecked() || this.buttons.size < this.minCheckCount) {
        bool = true;
      } else {
        bool = false;
      } 
      paramT.setChecked(false);
      paramT.buttonGroup = this;
      this.buttons.add(paramT);
      paramT.setChecked(bool);
      return;
    } 
    throw new IllegalArgumentException("button cannot be null.");
  }
  
  public void add(T... paramVarArgs) { // Byte code:
    //   0: aload_1
    //   1: ifnull -> 28
    //   4: iconst_0
    //   5: istore_2
    //   6: aload_1
    //   7: arraylength
    //   8: istore_3
    //   9: iload_2
    //   10: iload_3
    //   11: if_icmpge -> 27
    //   14: aload_0
    //   15: aload_1
    //   16: iload_2
    //   17: aaload
    //   18: invokevirtual add : (Lcom/badlogic/gdx/scenes/scene2d/ui/Button;)V
    //   21: iinc #2, 1
    //   24: goto -> 9
    //   27: return
    //   28: new java/lang/IllegalArgumentException
    //   31: dup
    //   32: ldc 'buttons cannot be null.'
    //   34: invokespecial <init> : (Ljava/lang/String;)V
    //   37: astore_1
    //   38: goto -> 43
    //   41: aload_1
    //   42: athrow
    //   43: goto -> 41 }
  
  protected boolean canCheck(T paramT, boolean paramBoolean) {
    if (paramT.isChecked == paramBoolean)
      return false; 
    if (!paramBoolean) {
      if (this.checkedButtons.size <= this.minCheckCount)
        return false; 
      this.checkedButtons.removeValue(paramT, true);
    } else {
      if (this.maxCheckCount != -1 && this.checkedButtons.size >= this.maxCheckCount)
        if (this.uncheckLast) {
          int i = this.minCheckCount;
          this.minCheckCount = 0;
          this.lastChecked.setChecked(false);
          this.minCheckCount = i;
        } else {
          return false;
        }  
      this.checkedButtons.add(paramT);
      this.lastChecked = paramT;
    } 
    return true;
  }
  
  public void clear() {
    this.buttons.clear();
    this.checkedButtons.clear();
  }
  
  public Array<T> getAllChecked() { return this.checkedButtons; }
  
  public Array<T> getButtons() { return this.buttons; }
  
  public T getChecked() { return (this.checkedButtons.size > 0) ? (T)(Button)this.checkedButtons.get(0) : null; }
  
  public int getCheckedIndex() { return (this.checkedButtons.size > 0) ? this.buttons.indexOf(this.checkedButtons.get(0), true) : -1; }
  
  public void remove(T paramT) {
    if (paramT != null) {
      paramT.buttonGroup = null;
      this.buttons.removeValue(paramT, true);
      this.checkedButtons.removeValue(paramT, true);
      return;
    } 
    throw new IllegalArgumentException("button cannot be null.");
  }
  
  public void remove(T... paramVarArgs) { // Byte code:
    //   0: aload_1
    //   1: ifnull -> 28
    //   4: iconst_0
    //   5: istore_2
    //   6: aload_1
    //   7: arraylength
    //   8: istore_3
    //   9: iload_2
    //   10: iload_3
    //   11: if_icmpge -> 27
    //   14: aload_0
    //   15: aload_1
    //   16: iload_2
    //   17: aaload
    //   18: invokevirtual remove : (Lcom/badlogic/gdx/scenes/scene2d/ui/Button;)V
    //   21: iinc #2, 1
    //   24: goto -> 9
    //   27: return
    //   28: new java/lang/IllegalArgumentException
    //   31: dup
    //   32: ldc 'buttons cannot be null.'
    //   34: invokespecial <init> : (Ljava/lang/String;)V
    //   37: astore_1
    //   38: goto -> 43
    //   41: aload_1
    //   42: athrow
    //   43: goto -> 41 }
  
  public void setChecked(String paramString) {
    if (paramString != null) {
      byte b = 0;
      int i = this.buttons.size;
      while (b < i) {
        Button button = (Button)this.buttons.get(b);
        if (button instanceof TextButton && paramString.contentEquals(((TextButton)button).getText())) {
          button.setChecked(true);
          return;
        } 
        b++;
      } 
      return;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("text cannot be null.");
    throw illegalArgumentException;
  }
  
  public void setMaxCheckCount(int paramInt) {
    int i = paramInt;
    if (paramInt == 0)
      i = -1; 
    this.maxCheckCount = i;
  }
  
  public void setMinCheckCount(int paramInt) { this.minCheckCount = paramInt; }
  
  public void setUncheckLast(boolean paramBoolean) { this.uncheckLast = paramBoolean; }
  
  public void uncheckAll() {
    int i = this.minCheckCount;
    this.minCheckCount = 0;
    int j = this.buttons.size;
    for (byte b = 0; b < j; b++)
      ((Button)this.buttons.get(b)).setChecked(false); 
    this.minCheckCount = i;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/ButtonGroup.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */