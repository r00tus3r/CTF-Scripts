package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.GlyphLayout;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.Pools;

public class TextArea extends TextField {
  int cursorLine;
  
  int firstLineShowing;
  
  private String lastText;
  
  IntArray linesBreak;
  
  private int linesShowing;
  
  float moveOffset;
  
  private float prefRows;
  
  public TextArea(String paramString, Skin paramSkin) { super(paramString, paramSkin); }
  
  public TextArea(String paramString1, Skin paramSkin, String paramString2) { super(paramString1, paramSkin, paramString2); }
  
  public TextArea(String paramString, TextField.TextFieldStyle paramTextFieldStyle) { super(paramString, paramTextFieldStyle); }
  
  private int calculateCurrentLineIndex(int paramInt) {
    byte b;
    for (b = 0; b < this.linesBreak.size && paramInt > this.linesBreak.items[b]; b++);
    return b;
  }
  
  protected void calculateOffsets() {
    super.calculateOffsets();
    if (!this.text.equals(this.lastText)) {
      float f2;
      this.lastText = this.text;
      BitmapFont bitmapFont = this.style.font;
      float f1 = getWidth();
      if (this.style.background != null) {
        f2 = this.style.background.getLeftWidth() + this.style.background.getRightWidth();
      } else {
        f2 = 0.0F;
      } 
      this.linesBreak.clear();
      Pool pool = Pools.get(GlyphLayout.class);
      GlyphLayout glyphLayout = (GlyphLayout)pool.obtain();
      char c1 = Character.MIN_VALUE;
      char c = Character.MIN_VALUE;
      char c2;
      for (c2 = Character.MIN_VALUE; c1 < this.text.length(); c2 = c3) {
        char c4;
        char c3 = this.text.charAt(c1);
        if (c3 == '\r' || c3 == '\n') {
          this.linesBreak.add(c);
          this.linesBreak.add(c1);
          c4 = c1 + 1;
          c3 = c2;
        } else {
          if (!continueCursor(c1, 0))
            c2 = c1; 
          glyphLayout.setText(bitmapFont, this.text.subSequence(c, c1 + '\001'));
          c4 = c;
          c3 = c2;
          if (glyphLayout.width > f1 - f2) {
            c3 = c2;
            if (c >= c2)
              c3 = c1 - '\001'; 
            this.linesBreak.add(c);
            IntArray intArray = this.linesBreak;
            intArray.add(++c3);
            c4 = c3;
          } 
        } 
        c1++;
        c = c4;
      } 
      pool.free(glyphLayout);
      if (c < this.text.length()) {
        this.linesBreak.add(c);
        this.linesBreak.add(this.text.length());
      } 
      showCursor();
    } 
  }
  
  protected boolean continueCursor(int paramInt1, int paramInt2) { // Byte code:
    //   0: aload_0
    //   1: iload_1
    //   2: iload_2
    //   3: iadd
    //   4: invokespecial calculateCurrentLineIndex : (I)I
    //   7: istore_3
    //   8: aload_0
    //   9: iload_1
    //   10: iload_2
    //   11: invokespecial continueCursor : (II)Z
    //   14: ifeq -> 84
    //   17: iload_3
    //   18: iflt -> 78
    //   21: iload_3
    //   22: aload_0
    //   23: getfield linesBreak : Lcom/badlogic/gdx/utils/IntArray;
    //   26: getfield size : I
    //   29: iconst_2
    //   30: isub
    //   31: if_icmpge -> 78
    //   34: aload_0
    //   35: getfield linesBreak : Lcom/badlogic/gdx/utils/IntArray;
    //   38: getfield items : [I
    //   41: astore #4
    //   43: iload_3
    //   44: iconst_1
    //   45: iadd
    //   46: istore_2
    //   47: aload #4
    //   49: iload_2
    //   50: iaload
    //   51: iload_1
    //   52: if_icmpne -> 78
    //   55: aload_0
    //   56: getfield linesBreak : Lcom/badlogic/gdx/utils/IntArray;
    //   59: getfield items : [I
    //   62: iload_2
    //   63: iaload
    //   64: aload_0
    //   65: getfield linesBreak : Lcom/badlogic/gdx/utils/IntArray;
    //   68: getfield items : [I
    //   71: iload_3
    //   72: iconst_2
    //   73: iadd
    //   74: iaload
    //   75: if_icmpne -> 84
    //   78: iconst_1
    //   79: istore #5
    //   81: goto -> 87
    //   84: iconst_0
    //   85: istore #5
    //   87: iload #5
    //   89: ireturn }
  
  protected InputListener createInputListener() { return new TextAreaListener(); }
  
  protected void drawCursor(Drawable paramDrawable, Batch paramBatch, BitmapFont paramBitmapFont, float paramFloat1, float paramFloat2) {
    float f;
    if (this.cursor >= this.glyphPositions.size || this.cursorLine * 2 >= this.linesBreak.size) {
      f = 0.0F;
    } else {
      f = this.glyphPositions.get(this.cursor) - this.glyphPositions.get(this.linesBreak.items[this.cursorLine * 2]);
    } 
    paramDrawable.draw(paramBatch, paramFloat1 + f + this.fontOffset + (paramBitmapFont.getData()).cursorX, paramFloat2 - paramBitmapFont.getDescent() / 2.0F - (this.cursorLine - this.firstLineShowing + 1) * paramBitmapFont.getLineHeight(), paramDrawable.getMinWidth(), paramBitmapFont.getLineHeight());
  }
  
  protected void drawSelection(Drawable paramDrawable, Batch paramBatch, BitmapFont paramBitmapFont, float paramFloat1, float paramFloat2) {
    int i = this.firstLineShowing * 2;
    int j = Math.min(this.cursor, this.selectionStart);
    int k = Math.max(this.cursor, this.selectionStart);
    float f = 0.0F;
    while (true) {
      int m = i + 1;
      if (m < this.linesBreak.size && i < (this.firstLineShowing + this.linesShowing) * 2) {
        int n = this.linesBreak.get(i);
        int i1 = this.linesBreak.get(m);
        if ((j >= n || j >= i1 || k >= n || k >= i1) && (j <= n || j <= i1 || k <= n || k <= i1)) {
          i1 = Math.max(this.linesBreak.get(i), j);
          m = Math.min(this.linesBreak.get(m), k);
          float f1 = this.glyphPositions.get(i1);
          float f2 = this.glyphPositions.get(this.linesBreak.get(i));
          float f3 = this.glyphPositions.get(m);
          float f4 = this.glyphPositions.get(i1);
          paramDrawable.draw(paramBatch, paramFloat1 + f1 - f2 + this.fontOffset, paramFloat2 - this.textHeight - paramBitmapFont.getDescent() - f, f3 - f4, paramBitmapFont.getLineHeight());
        } 
        f += paramBitmapFont.getLineHeight();
        i += 2;
        continue;
      } 
      break;
    } 
  }
  
  protected void drawText(Batch paramBatch, BitmapFont paramBitmapFont, float paramFloat1, float paramFloat2) {
    int i = this.firstLineShowing * 2;
    float f = 0.0F;
    while (i < (this.firstLineShowing + this.linesShowing) * 2 && i < this.linesBreak.size) {
      paramBitmapFont.draw(paramBatch, this.displayText, paramFloat1, paramFloat2 + f, this.linesBreak.items[i], this.linesBreak.items[i + 1], 0.0F, 8, false);
      f -= paramBitmapFont.getLineHeight();
      i += 2;
    } 
  }
  
  public int getCursorLine() { return this.cursorLine; }
  
  public float getCursorX() { return this.textOffset + this.fontOffset + (this.style.font.getData()).cursorX; }
  
  public float getCursorY() {
    BitmapFont bitmapFont = this.style.font;
    return -(-bitmapFont.getDescent() / 2.0F - (this.cursorLine - this.firstLineShowing + 1) * bitmapFont.getLineHeight());
  }
  
  public int getFirstLineShowing() { return this.firstLineShowing; }
  
  public int getLines() { return this.linesBreak.size / 2 + newLineAtEnd(); }
  
  public int getLinesShowing() { return this.linesShowing; }
  
  public float getPrefHeight() {
    if (this.prefRows <= 0.0F)
      return super.getPrefHeight(); 
    float f1 = this.textHeight * this.prefRows;
    float f2 = f1;
    if (this.style.background != null)
      f2 = Math.max(f1 + this.style.background.getBottomHeight() + this.style.background.getTopHeight(), this.style.background.getMinHeight()); 
    return f2;
  }
  
  protected float getTextY(BitmapFont paramBitmapFont, Drawable paramDrawable) {
    float f1 = getHeight();
    float f2 = f1;
    if (paramDrawable != null)
      f2 = (int)(f1 - paramDrawable.getTopHeight()); 
    return f2;
  }
  
  protected void initialize() {
    super.initialize();
    this.writeEnters = true;
    this.linesBreak = new IntArray();
    this.cursorLine = 0;
    this.firstLineShowing = 0;
    this.moveOffset = -1.0F;
    this.linesShowing = 0;
  }
  
  protected int letterUnderCursor(float paramFloat) {
    if (this.linesBreak.size > 0) {
      if (this.cursorLine * 2 >= this.linesBreak.size)
        return this.text.length(); 
      float[] arrayOfFloat = this.glyphPositions.items;
      int i = this.linesBreak.items[this.cursorLine * 2];
      paramFloat += arrayOfFloat[i];
      int j = this.linesBreak.items[this.cursorLine * 2 + 1];
      while (i < j && arrayOfFloat[i] <= paramFloat)
        i++; 
      return (i > 0 && arrayOfFloat[i] - paramFloat <= paramFloat - arrayOfFloat[i - 1]) ? i : Math.max(0, i - 1);
    } 
    return 0;
  }
  
  protected void moveCursor(boolean paramBoolean1, boolean paramBoolean2) { // Byte code:
    //   0: iload_1
    //   1: ifeq -> 9
    //   4: iconst_1
    //   5: istore_3
    //   6: goto -> 11
    //   9: iconst_m1
    //   10: istore_3
    //   11: aload_0
    //   12: getfield cursorLine : I
    //   15: iconst_2
    //   16: imul
    //   17: iload_3
    //   18: iadd
    //   19: istore #4
    //   21: iload #4
    //   23: iflt -> 105
    //   26: iload #4
    //   28: iconst_1
    //   29: iadd
    //   30: istore #5
    //   32: iload #5
    //   34: aload_0
    //   35: getfield linesBreak : Lcom/badlogic/gdx/utils/IntArray;
    //   38: getfield size : I
    //   41: if_icmpge -> 105
    //   44: aload_0
    //   45: getfield linesBreak : Lcom/badlogic/gdx/utils/IntArray;
    //   48: getfield items : [I
    //   51: iload #4
    //   53: iaload
    //   54: aload_0
    //   55: getfield cursor : I
    //   58: if_icmpne -> 105
    //   61: aload_0
    //   62: getfield linesBreak : Lcom/badlogic/gdx/utils/IntArray;
    //   65: getfield items : [I
    //   68: iload #5
    //   70: iaload
    //   71: aload_0
    //   72: getfield cursor : I
    //   75: if_icmpne -> 105
    //   78: aload_0
    //   79: aload_0
    //   80: getfield cursorLine : I
    //   83: iload_3
    //   84: iadd
    //   85: putfield cursorLine : I
    //   88: iload_2
    //   89: ifeq -> 98
    //   92: aload_0
    //   93: iload_1
    //   94: iload_2
    //   95: invokespecial moveCursor : (ZZ)V
    //   98: aload_0
    //   99: invokevirtual showCursor : ()V
    //   102: goto -> 111
    //   105: aload_0
    //   106: iload_1
    //   107: iload_2
    //   108: invokespecial moveCursor : (ZZ)V
    //   111: aload_0
    //   112: invokevirtual updateCurrentLine : ()V
    //   115: return }
  
  public void moveCursorLine(int paramInt) {
    if (paramInt < 0) {
      this.cursorLine = 0;
      this.cursor = 0;
      this.moveOffset = -1.0F;
    } else if (paramInt >= getLines()) {
      int i = getLines() - 1;
      this.cursor = this.text.length();
      if (paramInt > getLines() || i == this.cursorLine)
        this.moveOffset = -1.0F; 
      this.cursorLine = i;
    } else if (paramInt != this.cursorLine) {
      float f1 = this.moveOffset;
      float f2 = 0.0F;
      if (f1 < 0.0F) {
        if (this.linesBreak.size > this.cursorLine * 2)
          f2 = this.glyphPositions.get(this.cursor) - this.glyphPositions.get(this.linesBreak.get(this.cursorLine * 2)); 
        this.moveOffset = f2;
      } 
      this.cursorLine = paramInt;
      if (this.cursorLine * 2 >= this.linesBreak.size) {
        paramInt = this.text.length();
      } else {
        paramInt = this.linesBreak.get(this.cursorLine * 2);
      } 
      this.cursor = paramInt;
      while (this.cursor < this.text.length() && this.cursor <= this.linesBreak.get(this.cursorLine * 2 + 1) - 1 && this.glyphPositions.get(this.cursor) - this.glyphPositions.get(this.linesBreak.get(this.cursorLine * 2)) < this.moveOffset)
        this.cursor++; 
      showCursor();
    } 
  }
  
  public boolean newLineAtEnd() {
    int i = this.text.length();
    byte b = 1;
    if (i != 0) {
      int j = b;
      if (this.text.charAt(this.text.length() - 1) != '\n') {
        if (this.text.charAt(this.text.length() - 1) == '\r')
          return b; 
      } else {
        return j;
      } 
    } 
    return false;
  }
  
  public void setPrefRows(float paramFloat) { this.prefRows = paramFloat; }
  
  public void setSelection(int paramInt1, int paramInt2) {
    super.setSelection(paramInt1, paramInt2);
    updateCurrentLine();
  }
  
  void showCursor() {
    updateCurrentLine();
    updateFirstLineShowing();
  }
  
  protected void sizeChanged() {
    float f2;
    this.lastText = null;
    BitmapFont bitmapFont = this.style.font;
    Drawable drawable = this.style.background;
    float f1 = getHeight();
    if (drawable == null) {
      f2 = 0.0F;
    } else {
      f2 = drawable.getBottomHeight();
      f2 = drawable.getTopHeight() + f2;
    } 
    this.linesShowing = (int)Math.floor(((f1 - f2) / bitmapFont.getLineHeight()));
  }
  
  void updateCurrentLine() { // Byte code:
    //   0: aload_0
    //   1: aload_0
    //   2: getfield cursor : I
    //   5: invokespecial calculateCurrentLineIndex : (I)I
    //   8: istore_1
    //   9: iload_1
    //   10: iconst_2
    //   11: idiv
    //   12: istore_2
    //   13: iload_1
    //   14: iconst_2
    //   15: irem
    //   16: ifeq -> 71
    //   19: iload_1
    //   20: iconst_1
    //   21: iadd
    //   22: istore_3
    //   23: iload_3
    //   24: aload_0
    //   25: getfield linesBreak : Lcom/badlogic/gdx/utils/IntArray;
    //   28: getfield size : I
    //   31: if_icmpge -> 71
    //   34: aload_0
    //   35: getfield cursor : I
    //   38: aload_0
    //   39: getfield linesBreak : Lcom/badlogic/gdx/utils/IntArray;
    //   42: getfield items : [I
    //   45: iload_1
    //   46: iaload
    //   47: if_icmpne -> 71
    //   50: aload_0
    //   51: getfield linesBreak : Lcom/badlogic/gdx/utils/IntArray;
    //   54: getfield items : [I
    //   57: iload_3
    //   58: iaload
    //   59: aload_0
    //   60: getfield linesBreak : Lcom/badlogic/gdx/utils/IntArray;
    //   63: getfield items : [I
    //   66: iload_1
    //   67: iaload
    //   68: if_icmpeq -> 141
    //   71: iload_2
    //   72: aload_0
    //   73: getfield linesBreak : Lcom/badlogic/gdx/utils/IntArray;
    //   76: getfield size : I
    //   79: iconst_2
    //   80: idiv
    //   81: if_icmplt -> 136
    //   84: aload_0
    //   85: getfield text : Ljava/lang/String;
    //   88: invokevirtual length : ()I
    //   91: ifeq -> 136
    //   94: aload_0
    //   95: getfield text : Ljava/lang/String;
    //   98: aload_0
    //   99: getfield text : Ljava/lang/String;
    //   102: invokevirtual length : ()I
    //   105: iconst_1
    //   106: isub
    //   107: invokevirtual charAt : (I)C
    //   110: bipush #10
    //   112: if_icmpeq -> 136
    //   115: aload_0
    //   116: getfield text : Ljava/lang/String;
    //   119: aload_0
    //   120: getfield text : Ljava/lang/String;
    //   123: invokevirtual length : ()I
    //   126: iconst_1
    //   127: isub
    //   128: invokevirtual charAt : (I)C
    //   131: bipush #13
    //   133: if_icmpne -> 141
    //   136: aload_0
    //   137: iload_2
    //   138: putfield cursorLine : I
    //   141: aload_0
    //   142: invokevirtual updateFirstLineShowing : ()V
    //   145: return }
  
  void updateFirstLineShowing() {
    int i = this.cursorLine;
    int j = this.firstLineShowing;
    if (i != j) {
      if (i >= j) {
        i = 1;
      } else {
        i = -1;
      } 
      while (true) {
        j = this.firstLineShowing;
        int k = this.cursorLine;
        if (j > k || j + this.linesShowing - 1 < k) {
          this.firstLineShowing += i;
          continue;
        } 
        break;
      } 
    } 
  }
  
  public class TextAreaListener extends TextField.TextFieldClickListener {
    public TextAreaListener() { super(TextArea.this); }
    
    protected void goEnd(boolean param1Boolean) {
      if (param1Boolean || TextArea.this.cursorLine >= TextArea.this.getLines()) {
        TextArea textArea = TextArea.this;
        textArea.cursor = textArea.text.length();
        return;
      } 
      if (TextArea.this.cursorLine * 2 + 1 < this.this$0.linesBreak.size) {
        TextArea textArea = TextArea.this;
        textArea.cursor = textArea.linesBreak.get(TextArea.this.cursorLine * 2 + 1);
      } 
    }
    
    protected void goHome(boolean param1Boolean) {
      if (param1Boolean) {
        TextArea.this.cursor = 0;
      } else if (TextArea.this.cursorLine * 2 < this.this$0.linesBreak.size) {
        TextArea textArea = TextArea.this;
        textArea.cursor = textArea.linesBreak.get(TextArea.this.cursorLine * 2);
      } 
    }
    
    public boolean keyDown(InputEvent param1InputEvent, int param1Int) {
      byte b;
      boolean bool = super.keyDown(param1InputEvent, param1Int);
      if (TextArea.this.hasKeyboardFocus()) {
        bool = Gdx.input.isKeyPressed(59);
        byte b1 = 0;
        if (bool || Gdx.input.isKeyPressed(60)) {
          b = 1;
        } else {
          b = 0;
        } 
        if (param1Int == 20) {
          if (b) {
            if (!TextArea.this.hasSelection) {
              TextArea textArea1 = TextArea.this;
              textArea1.selectionStart = textArea1.cursor;
              TextArea.this.hasSelection = true;
            } 
          } else {
            TextArea.this.clearSelection();
          } 
          TextArea textArea = TextArea.this;
          textArea.moveCursorLine(textArea.cursorLine + 1);
        } else if (param1Int == 19) {
          if (b) {
            if (!TextArea.this.hasSelection) {
              TextArea textArea1 = TextArea.this;
              textArea1.selectionStart = textArea1.cursor;
              TextArea.this.hasSelection = true;
            } 
          } else {
            TextArea.this.clearSelection();
          } 
          TextArea textArea = TextArea.this;
          textArea.moveCursorLine(textArea.cursorLine - 1);
        } else {
          TextArea.this.moveOffset = -1.0F;
          b = b1;
          if (b != 0)
            scheduleKeyRepeatTask(param1Int); 
        } 
        b = 1;
      } else {
        return bool;
      } 
      if (b != 0)
        scheduleKeyRepeatTask(param1Int); 
    }
    
    public boolean keyTyped(InputEvent param1InputEvent, char param1Char) {
      boolean bool = super.keyTyped(param1InputEvent, param1Char);
      TextArea.this.showCursor();
      return bool;
    }
    
    protected void setCursorPosition(float param1Float1, float param1Float2) {
      TextArea textArea2 = TextArea.this;
      textArea2.moveOffset = -1.0F;
      Drawable drawable = textArea2.style.background;
      BitmapFont bitmapFont = this.this$0.style.font;
      float f1 = TextArea.this.getHeight();
      float f2 = f1;
      float f3 = param1Float1;
      if (drawable != null) {
        f2 = f1 - drawable.getTopHeight();
        f3 = param1Float1 - drawable.getLeftWidth();
      } 
      f3 = Math.max(0.0F, f3);
      param1Float1 = param1Float2;
      if (drawable != null)
        param1Float1 = param1Float2 - drawable.getTopHeight(); 
      TextArea.this.cursorLine = (int)Math.floor(((f2 - param1Float1) / bitmapFont.getLineHeight())) + TextArea.this.firstLineShowing;
      TextArea textArea1 = TextArea.this;
      textArea1.cursorLine = Math.max(0, Math.min(textArea1.cursorLine, TextArea.this.getLines() - 1));
      super.setCursorPosition(f3, param1Float1);
      TextArea.this.updateCurrentLine();
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/TextArea.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */