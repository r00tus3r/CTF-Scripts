package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.GlyphLayout;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.utils.ChangeListener;
import com.badlogic.gdx.scenes.scene2d.utils.ClickListener;
import com.badlogic.gdx.scenes.scene2d.utils.Disableable;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.UIUtils;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Clipboard;
import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.Pools;
import com.badlogic.gdx.utils.Timer;

public class TextField extends Widget implements Disableable {
  private static final char BACKSPACE = '\b';
  
  private static final char BULLET = '';
  
  private static final char DELETE = '';
  
  protected static final char ENTER_ANDROID = '\n';
  
  protected static final char ENTER_DESKTOP = '\r';
  
  private static final char TAB = '\t';
  
  public static float keyRepeatInitialTime;
  
  public static float keyRepeatTime;
  
  private static final Vector2 tmp1 = new Vector2();
  
  private static final Vector2 tmp2 = new Vector2();
  
  private static final Vector2 tmp3 = new Vector2();
  
  final Timer.Task blinkTask = new Timer.Task() {
      public void run() {
        TextField textField = TextField.this;
        textField.cursorOn ^= true;
        Gdx.graphics.requestRendering();
      }
    };
  
  float blinkTime = 0.32F;
  
  Clipboard clipboard;
  
  protected int cursor;
  
  boolean cursorOn;
  
  boolean disabled;
  
  protected CharSequence displayText;
  
  TextFieldFilter filter;
  
  boolean focusTraversal = true;
  
  boolean focused;
  
  protected float fontOffset;
  
  protected final FloatArray glyphPositions = new FloatArray();
  
  protected boolean hasSelection;
  
  InputListener inputListener;
  
  final KeyRepeatTask keyRepeatTask = new KeyRepeatTask();
  
  OnscreenKeyboard keyboard = new DefaultOnscreenKeyboard();
  
  long lastChangeTime;
  
  protected final GlyphLayout layout = new GlyphLayout();
  
  TextFieldListener listener;
  
  private int maxLength = 0;
  
  private String messageText;
  
  boolean onlyFontChars = true;
  
  private StringBuilder passwordBuffer;
  
  private char passwordCharacter = (char)'';
  
  boolean passwordMode;
  
  boolean programmaticChangeEvents;
  
  float renderOffset;
  
  protected int selectionStart;
  
  private float selectionWidth;
  
  private float selectionX;
  
  TextFieldStyle style;
  
  protected String text;
  
  private int textHAlign = 8;
  
  protected float textHeight;
  
  protected float textOffset;
  
  String undoText = "";
  
  private int visibleTextEnd;
  
  private int visibleTextStart;
  
  protected boolean writeEnters;
  
  static  {
    keyRepeatInitialTime = 0.4F;
    keyRepeatTime = 0.1F;
  }
  
  public TextField(String paramString, Skin paramSkin) { this(paramString, (TextFieldStyle)paramSkin.get(TextFieldStyle.class)); }
  
  public TextField(String paramString1, Skin paramSkin, String paramString2) { this(paramString1, (TextFieldStyle)paramSkin.get(paramString2, TextFieldStyle.class)); }
  
  public TextField(String paramString, TextFieldStyle paramTextFieldStyle) {
    setStyle(paramTextFieldStyle);
    this.clipboard = Gdx.app.getClipboard();
    initialize();
    setText(paramString);
    setSize(getPrefWidth(), getPrefHeight());
  }
  
  private TextField findNextTextField(Array<Actor> paramArray, TextField paramTextField, Vector2 paramVector21, Vector2 paramVector22, boolean paramBoolean) { // Byte code:
    //   0: aload_1
    //   1: getfield size : I
    //   4: istore #6
    //   6: iconst_0
    //   7: istore #7
    //   9: iload #7
    //   11: iload #6
    //   13: if_icmpge -> 424
    //   16: aload_1
    //   17: iload #7
    //   19: invokevirtual get : (I)Ljava/lang/Object;
    //   22: checkcast com/badlogic/gdx/scenes/scene2d/Actor
    //   25: astore #8
    //   27: aload #8
    //   29: instanceof com/badlogic/gdx/scenes/scene2d/ui/TextField
    //   32: ifeq -> 384
    //   35: aload #8
    //   37: aload_0
    //   38: if_acmpne -> 47
    //   41: aload_2
    //   42: astore #9
    //   44: goto -> 415
    //   47: aload #8
    //   49: checkcast com/badlogic/gdx/scenes/scene2d/ui/TextField
    //   52: astore #10
    //   54: aload_2
    //   55: astore #9
    //   57: aload #10
    //   59: invokevirtual isDisabled : ()Z
    //   62: ifne -> 415
    //   65: aload_2
    //   66: astore #9
    //   68: aload #10
    //   70: getfield focusTraversal : Z
    //   73: ifeq -> 415
    //   76: aload #10
    //   78: invokevirtual ancestorsVisible : ()Z
    //   81: ifne -> 90
    //   84: aload_2
    //   85: astore #9
    //   87: goto -> 415
    //   90: aload #8
    //   92: invokevirtual getParent : ()Lcom/badlogic/gdx/scenes/scene2d/Group;
    //   95: getstatic com/badlogic/gdx/scenes/scene2d/ui/TextField.tmp3 : Lcom/badlogic/gdx/math/Vector2;
    //   98: aload #8
    //   100: invokevirtual getX : ()F
    //   103: aload #8
    //   105: invokevirtual getY : ()F
    //   108: invokevirtual set : (FF)Lcom/badlogic/gdx/math/Vector2;
    //   111: invokevirtual localToStageCoordinates : (Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    //   114: astore #9
    //   116: aload #9
    //   118: getfield y : F
    //   121: aload #4
    //   123: getfield y : F
    //   126: fcmpl
    //   127: ifeq -> 167
    //   130: aload #9
    //   132: getfield y : F
    //   135: aload #4
    //   137: getfield y : F
    //   140: fcmpg
    //   141: ifge -> 150
    //   144: iconst_1
    //   145: istore #11
    //   147: goto -> 153
    //   150: iconst_0
    //   151: istore #11
    //   153: iload #11
    //   155: iload #5
    //   157: ixor
    //   158: ifeq -> 167
    //   161: iconst_1
    //   162: istore #11
    //   164: goto -> 170
    //   167: iconst_0
    //   168: istore #11
    //   170: aload #9
    //   172: getfield y : F
    //   175: aload #4
    //   177: getfield y : F
    //   180: fcmpl
    //   181: ifne -> 221
    //   184: aload #9
    //   186: getfield x : F
    //   189: aload #4
    //   191: getfield x : F
    //   194: fcmpl
    //   195: ifle -> 204
    //   198: iconst_1
    //   199: istore #12
    //   201: goto -> 207
    //   204: iconst_0
    //   205: istore #12
    //   207: iload #12
    //   209: iload #5
    //   211: ixor
    //   212: ifeq -> 221
    //   215: iconst_1
    //   216: istore #12
    //   218: goto -> 224
    //   221: iconst_0
    //   222: istore #12
    //   224: iload #11
    //   226: ifne -> 240
    //   229: iload #12
    //   231: ifne -> 240
    //   234: aload_2
    //   235: astore #9
    //   237: goto -> 415
    //   240: aload_2
    //   241: ifnull -> 296
    //   244: aload #9
    //   246: getfield y : F
    //   249: aload_3
    //   250: getfield y : F
    //   253: fcmpl
    //   254: ifeq -> 290
    //   257: aload #9
    //   259: getfield y : F
    //   262: aload_3
    //   263: getfield y : F
    //   266: fcmpl
    //   267: ifle -> 276
    //   270: iconst_1
    //   271: istore #11
    //   273: goto -> 279
    //   276: iconst_0
    //   277: istore #11
    //   279: iload #11
    //   281: iload #5
    //   283: ixor
    //   284: ifeq -> 290
    //   287: goto -> 296
    //   290: iconst_0
    //   291: istore #12
    //   293: goto -> 299
    //   296: iconst_1
    //   297: istore #12
    //   299: iload #12
    //   301: istore #11
    //   303: iload #12
    //   305: ifne -> 360
    //   308: aload #9
    //   310: getfield y : F
    //   313: aload_3
    //   314: getfield y : F
    //   317: fcmpl
    //   318: ifne -> 357
    //   321: aload #9
    //   323: getfield x : F
    //   326: aload_3
    //   327: getfield x : F
    //   330: fcmpg
    //   331: ifge -> 340
    //   334: iconst_1
    //   335: istore #11
    //   337: goto -> 343
    //   340: iconst_0
    //   341: istore #11
    //   343: iload #11
    //   345: iload #5
    //   347: ixor
    //   348: ifeq -> 357
    //   351: iconst_1
    //   352: istore #11
    //   354: goto -> 360
    //   357: iconst_0
    //   358: istore #11
    //   360: iload #11
    //   362: ifeq -> 378
    //   365: aload_3
    //   366: aload #9
    //   368: invokevirtual set : (Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    //   371: pop
    //   372: aload #10
    //   374: astore_2
    //   375: goto -> 378
    //   378: aload_2
    //   379: astore #9
    //   381: goto -> 415
    //   384: aload_2
    //   385: astore #9
    //   387: aload #8
    //   389: instanceof com/badlogic/gdx/scenes/scene2d/Group
    //   392: ifeq -> 415
    //   395: aload_0
    //   396: aload #8
    //   398: checkcast com/badlogic/gdx/scenes/scene2d/Group
    //   401: invokevirtual getChildren : ()Lcom/badlogic/gdx/utils/SnapshotArray;
    //   404: aload_2
    //   405: aload_3
    //   406: aload #4
    //   408: iload #5
    //   410: invokespecial findNextTextField : (Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Z)Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
    //   413: astore #9
    //   415: iinc #7, 1
    //   418: aload #9
    //   420: astore_2
    //   421: goto -> 9
    //   424: aload_2
    //   425: areturn }
  
  private Drawable getBackgroundDrawable() {
    Drawable drawable;
    boolean bool = hasKeyboardFocus();
    if (this.disabled && this.style.disabledBackground != null) {
      drawable = this.style.disabledBackground;
    } else if (bool && this.style.focusedBackground != null) {
      drawable = this.style.focusedBackground;
    } else {
      drawable = this.style.background;
    } 
    return drawable;
  }
  
  public void appendText(String paramString) {
    String str = paramString;
    if (paramString == null)
      str = ""; 
    clearSelection();
    this.cursor = this.text.length();
    paste(str, this.programmaticChangeEvents);
  }
  
  protected void calculateOffsets() {
    float f1 = getWidth();
    Drawable drawable = getBackgroundDrawable();
    float f2 = f1;
    if (drawable != null)
      f2 = f1 - drawable.getLeftWidth() + drawable.getRightWidth(); 
    int i = this.glyphPositions.size;
    float[] arrayOfFloat = this.glyphPositions.items;
    float f3 = arrayOfFloat[Math.max(0, this.cursor - 1)];
    f1 = this.renderOffset;
    float f4 = f3 + f1;
    f3 = 0.0F;
    if (f4 <= 0.0F) {
      this.renderOffset = f1 - f4;
    } else {
      f1 = arrayOfFloat[Math.min(i - 1, this.cursor + 1)] - f2;
      if (-this.renderOffset < f1)
        this.renderOffset = -f1; 
    } 
    float f5 = arrayOfFloat[i - 1];
    int j = i - 2;
    for (f1 = 0.0F; j >= 0; f1 = f4) {
      f4 = arrayOfFloat[j];
      if (f5 - f4 > f2)
        break; 
      j--;
    } 
    if (-this.renderOffset > f1)
      this.renderOffset = -f1; 
    this.visibleTextStart = 0;
    j = 0;
    while (true) {
      f1 = f3;
      if (j < i) {
        if (arrayOfFloat[j] >= -this.renderOffset) {
          this.visibleTextStart = j;
          f1 = arrayOfFloat[j];
          break;
        } 
        j++;
        continue;
      } 
      break;
    } 
    j = this.visibleTextStart + 1;
    f3 = this.renderOffset;
    i = Math.min(this.displayText.length(), i);
    while (j <= i && arrayOfFloat[j] <= f2 - f3)
      j++; 
    this.visibleTextEnd = Math.max(0, j - 1);
    j = this.textHAlign;
    if ((j & 0x8) == 0) {
      this.textOffset = f2 - arrayOfFloat[this.visibleTextEnd] - f1;
      if ((j & true) != 0)
        this.textOffset = Math.round(this.textOffset * 0.5F); 
    } else {
      this.textOffset = f1 + this.renderOffset;
    } 
    if (this.hasSelection) {
      j = Math.min(this.cursor, this.selectionStart);
      i = Math.max(this.cursor, this.selectionStart);
      f1 = Math.max(arrayOfFloat[j] - arrayOfFloat[this.visibleTextStart], -this.textOffset);
      f2 = Math.min(arrayOfFloat[i] - arrayOfFloat[this.visibleTextStart], f2 - this.textOffset);
      this.selectionX = f1;
      this.selectionWidth = f2 - f1 - (this.style.font.getData()).cursorX;
    } 
  }
  
  boolean changeText(String paramString1, String paramString2) {
    if (paramString2.equals(paramString1))
      return false; 
    this.text = paramString2;
    ChangeListener.ChangeEvent changeEvent = (ChangeListener.ChangeEvent)Pools.obtain(ChangeListener.ChangeEvent.class);
    boolean bool = fire(changeEvent);
    if (!bool)
      paramString1 = paramString2; 
    this.text = paramString1;
    Pools.free(changeEvent);
    return bool ^ true;
  }
  
  public void clearSelection() { this.hasSelection = false; }
  
  protected boolean continueCursor(int paramInt1, int paramInt2) { return isWordCharacter(this.text.charAt(paramInt1 + paramInt2)); }
  
  public void copy() {
    if (this.hasSelection && !this.passwordMode)
      this.clipboard.setContents(this.text.substring(Math.min(this.cursor, this.selectionStart), Math.max(this.cursor, this.selectionStart))); 
  }
  
  protected InputListener createInputListener() { return new TextFieldClickListener(); }
  
  public void cut() { cut(this.programmaticChangeEvents); }
  
  void cut(boolean paramBoolean) {
    if (this.hasSelection && !this.passwordMode) {
      copy();
      this.cursor = delete(paramBoolean);
      updateDisplayText();
    } 
  }
  
  int delete(boolean paramBoolean) {
    int i = this.selectionStart;
    int j = this.cursor;
    int k = Math.min(i, j);
    i = Math.max(i, j);
    StringBuilder stringBuilder = new StringBuilder();
    String str1 = "";
    if (k > 0) {
      str2 = this.text.substring(0, k);
    } else {
      str2 = "";
    } 
    stringBuilder.append(str2);
    String str2 = str1;
    if (i < this.text.length()) {
      str2 = this.text;
      str2 = str2.substring(i, str2.length());
    } 
    stringBuilder.append(str2);
    str2 = stringBuilder.toString();
    if (paramBoolean) {
      changeText(this.text, str2);
    } else {
      this.text = str2;
    } 
    clearSelection();
    return k;
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    float f7;
    float f5;
    BitmapFont bitmapFont1;
    boolean bool = hasKeyboardFocus();
    if (bool != this.focused) {
      this.focused = bool;
      this.blinkTask.cancel();
      this.cursorOn = bool;
      if (bool) {
        bitmapFont1 = this.blinkTask;
        float f = this.blinkTime;
        Timer.schedule(bitmapFont1, f, f);
      } else {
        this.keyRepeatTask.cancel();
      } 
    } else if (!bool) {
      this.cursorOn = false;
    } 
    BitmapFont bitmapFont2 = this.style.font;
    if (this.disabled && this.style.disabledFontColor != null) {
      bitmapFont1 = this.style.disabledFontColor;
    } else if (bool && this.style.focusedFontColor != null) {
      bitmapFont1 = this.style.focusedFontColor;
    } else {
      bitmapFont1 = this.style.fontColor;
    } 
    Drawable drawable1 = this.style.selection;
    Drawable drawable2 = this.style.cursor;
    Drawable drawable3 = getBackgroundDrawable();
    Color color = getColor();
    float f2 = getX();
    float f3 = getY();
    float f4 = getWidth();
    float f1 = getHeight();
    paramBatch.setColor(color.r, color.g, color.b, color.a * paramFloat);
    if (drawable3 != null) {
      drawable3.draw(paramBatch, f2, f3, f4, f1);
      f1 = drawable3.getLeftWidth();
      f5 = drawable3.getRightWidth();
    } else {
      f1 = 0.0F;
      f5 = 0.0F;
    } 
    float f6 = getTextY(bitmapFont2, drawable3);
    calculateOffsets();
    if (bool && this.hasSelection && drawable1 != null)
      drawSelection(drawable1, paramBatch, bitmapFont2, f2 + f1, f3 + f6); 
    if (bitmapFont2.isFlipped()) {
      f7 = -this.textHeight;
    } else {
      f7 = 0.0F;
    } 
    if (this.displayText.length() == 0) {
      if (!bool && this.messageText != null) {
        if (this.style.messageFont != null) {
          bitmapFont1 = this.style.messageFont;
        } else {
          bitmapFont1 = bitmapFont2;
        } 
        if (this.style.messageFontColor != null) {
          bitmapFont1.setColor(this.style.messageFontColor.r, this.style.messageFontColor.g, this.style.messageFontColor.b, this.style.messageFontColor.a * color.a * paramFloat);
        } else {
          bitmapFont1.setColor(0.7F, 0.7F, 0.7F, color.a * paramFloat);
        } 
        drawMessageText(paramBatch, bitmapFont1, f2 + f1, f3 + f6 + f7, f4 - f1 - f5);
      } 
    } else {
      bitmapFont2.setColor(bitmapFont1.r, bitmapFont1.g, bitmapFont1.b, bitmapFont1.a * color.a * paramFloat);
      drawText(paramBatch, bitmapFont2, f2 + f1, f3 + f6 + f7);
    } 
    if (!this.disabled && this.cursorOn && drawable2 != null)
      drawCursor(drawable2, paramBatch, bitmapFont2, f2 + f1, f3 + f6); 
  }
  
  protected void drawCursor(Drawable paramDrawable, Batch paramBatch, BitmapFont paramBitmapFont, float paramFloat1, float paramFloat2) { paramDrawable.draw(paramBatch, paramFloat1 + this.textOffset + this.glyphPositions.get(this.cursor) - this.glyphPositions.get(this.visibleTextStart) + this.fontOffset + (paramBitmapFont.getData()).cursorX, paramFloat2 - this.textHeight - paramBitmapFont.getDescent(), paramDrawable.getMinWidth(), this.textHeight); }
  
  protected void drawMessageText(Batch paramBatch, BitmapFont paramBitmapFont, float paramFloat1, float paramFloat2, float paramFloat3) {
    String str = this.messageText;
    paramBitmapFont.draw(paramBatch, str, paramFloat1, paramFloat2, 0, str.length(), paramFloat3, this.textHAlign, false, "...");
  }
  
  protected void drawSelection(Drawable paramDrawable, Batch paramBatch, BitmapFont paramBitmapFont, float paramFloat1, float paramFloat2) { paramDrawable.draw(paramBatch, paramFloat1 + this.textOffset + this.selectionX + this.fontOffset, paramFloat2 - this.textHeight - paramBitmapFont.getDescent(), this.selectionWidth, this.textHeight); }
  
  protected void drawText(Batch paramBatch, BitmapFont paramBitmapFont, float paramFloat1, float paramFloat2) { paramBitmapFont.draw(paramBatch, this.displayText, paramFloat1 + this.textOffset, paramFloat2, this.visibleTextStart, this.visibleTextEnd, 0.0F, 8, false); }
  
  public int getAlignment() { return this.textHAlign; }
  
  public int getCursorPosition() { return this.cursor; }
  
  public InputListener getDefaultInputListener() { return this.inputListener; }
  
  public int getMaxLength() { return this.maxLength; }
  
  public String getMessageText() { return this.messageText; }
  
  public OnscreenKeyboard getOnscreenKeyboard() { return this.keyboard; }
  
  public float getPrefHeight() {
    Drawable drawable = this.style.background;
    float f1 = 0.0F;
    if (drawable != null) {
      f2 = Math.max(0.0F, this.style.background.getBottomHeight() + this.style.background.getTopHeight());
      f1 = Math.max(0.0F, this.style.background.getMinHeight());
    } else {
      f2 = 0.0F;
    } 
    float f3 = f2;
    float f4 = f1;
    if (this.style.focusedBackground != null) {
      f3 = Math.max(f2, this.style.focusedBackground.getBottomHeight() + this.style.focusedBackground.getTopHeight());
      f4 = Math.max(f1, this.style.focusedBackground.getMinHeight());
    } 
    float f2 = f3;
    f1 = f4;
    if (this.style.disabledBackground != null) {
      f2 = Math.max(f3, this.style.disabledBackground.getBottomHeight() + this.style.disabledBackground.getTopHeight());
      f1 = Math.max(f4, this.style.disabledBackground.getMinHeight());
    } 
    return Math.max(f2 + this.textHeight, f1);
  }
  
  public float getPrefWidth() { return 150.0F; }
  
  public boolean getProgrammaticChangeEvents() { return this.programmaticChangeEvents; }
  
  public String getSelection() {
    String str;
    if (this.hasSelection) {
      str = this.text.substring(Math.min(this.selectionStart, this.cursor), Math.max(this.selectionStart, this.cursor));
    } else {
      str = "";
    } 
    return str;
  }
  
  public int getSelectionStart() { return this.selectionStart; }
  
  public TextFieldStyle getStyle() { return this.style; }
  
  public String getText() { return this.text; }
  
  public TextFieldFilter getTextFieldFilter() { return this.filter; }
  
  protected float getTextY(BitmapFont paramBitmapFont, Drawable paramDrawable) {
    float f1 = getHeight();
    float f2 = this.textHeight / 2.0F + paramBitmapFont.getDescent();
    if (paramDrawable != null) {
      float f = paramDrawable.getBottomHeight();
      f1 = f2 + (f1 - paramDrawable.getTopHeight() - f) / 2.0F + f;
    } else {
      f1 = f2 + f1 / 2.0F;
    } 
    float f3 = f1;
    if (paramBitmapFont.usesIntegerPositions())
      f3 = (int)f1; 
    return f3;
  }
  
  protected void initialize() {
    InputListener inputListener1 = createInputListener();
    this.inputListener = inputListener1;
    addListener(inputListener1);
  }
  
  String insert(int paramInt, CharSequence paramCharSequence, String paramString) {
    if (paramString.length() == 0)
      return paramCharSequence.toString(); 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(paramString.substring(0, paramInt));
    stringBuilder.append(paramCharSequence);
    stringBuilder.append(paramString.substring(paramInt, paramString.length()));
    return stringBuilder.toString();
  }
  
  public boolean isDisabled() { return this.disabled; }
  
  public boolean isPasswordMode() { return this.passwordMode; }
  
  protected boolean isWordCharacter(char paramChar) { return Character.isLetterOrDigit(paramChar); }
  
  protected int letterUnderCursor(float paramFloat) {
    float f = paramFloat - this.textOffset + this.fontOffset - (this.style.font.getData()).cursorX - this.glyphPositions.get(this.visibleTextStart);
    paramFloat = f;
    if (getBackgroundDrawable() != null)
      paramFloat = f - this.style.background.getLeftWidth(); 
    int i = this.glyphPositions.size;
    float[] arrayOfFloat = this.glyphPositions.items;
    for (byte b = 1; b < i; b++) {
      if (arrayOfFloat[b] > paramFloat) {
        f = arrayOfFloat[b];
        i = b - true;
        return (f - paramFloat <= paramFloat - arrayOfFloat[i]) ? b : i;
      } 
    } 
    return i - 1;
  }
  
  protected void moveCursor(boolean paramBoolean1, boolean paramBoolean2) {
    boolean bool;
    byte b = 0;
    if (paramBoolean1) {
      bool = this.text.length();
    } else {
      bool = false;
    } 
    if (!paramBoolean1)
      b = -1; 
    while (true) {
      if (paramBoolean1) {
        int j = this.cursor + 1;
        this.cursor = j;
        if (j < bool)
          continue; 
        break;
      } 
      int i = this.cursor - 1;
      this.cursor = i;
      if (i > bool)
        continue; 
      break;
      if (!paramBoolean2 || !continueCursor(this.cursor, b))
        break; 
    } 
  }
  
  public void next(boolean paramBoolean) {
    Stage stage = getStage();
    if (stage == null)
      return; 
    Vector2 vector21 = getParent().localToStageCoordinates(tmp2.set(getX(), getY()));
    Vector2 vector22 = tmp1;
    TextField textField = this;
    while (true) {
      TextField textField1 = textField.findNextTextField(stage.getActors(), null, vector22, vector21, paramBoolean);
      TextField textField2 = textField1;
      if (textField1 == null) {
        if (paramBoolean) {
          vector21.set(-3.4028235E38F, -3.4028235E38F);
        } else {
          vector21.set(Float.MAX_VALUE, Float.MAX_VALUE);
        } 
        textField2 = textField.findNextTextField(stage.getActors(), null, vector22, vector21, paramBoolean);
      } 
      if (textField2 == null) {
        Gdx.input.setOnscreenKeyboardVisible(false);
      } else {
        if (stage.setKeyboardFocus(textField2)) {
          textField2.selectAll();
          return;
        } 
        vector21.set(vector22);
        TextField textField3 = textField2;
        continue;
      } 
      return;
    } 
  }
  
  void paste(String paramString, boolean paramBoolean) {
    if (paramString == null)
      return; 
    StringBuilder stringBuilder = new StringBuilder();
    int i = this.text.length();
    int j = i;
    if (this.hasSelection)
      j = i - Math.abs(this.cursor - this.selectionStart); 
    BitmapFont.BitmapFontData bitmapFontData = this.style.font.getData();
    i = 0;
    int k = paramString.length();
    while (i < k && withinMaxLength(stringBuilder.length() + j)) {
      char c = paramString.charAt(i);
      if (!this.writeEnters || (c != '\n' && c != '\r')) {
        if (c == '\r' || c == '\n' || (this.onlyFontChars && !bitmapFontData.hasGlyph(c)))
          continue; 
        TextFieldFilter textFieldFilter = this.filter;
        if (textFieldFilter != null && !textFieldFilter.acceptChar(this, c))
          continue; 
      } 
      stringBuilder.append(c);
      continue;
      i++;
    } 
    paramString = stringBuilder.toString();
    if (this.hasSelection)
      this.cursor = delete(paramBoolean); 
    if (paramBoolean) {
      String str = this.text;
      changeText(str, insert(this.cursor, paramString, str));
    } else {
      this.text = insert(this.cursor, paramString, this.text);
    } 
    updateDisplayText();
    this.cursor += paramString.length();
  }
  
  public void selectAll() { setSelection(0, this.text.length()); }
  
  public void setAlignment(int paramInt) { this.textHAlign = paramInt; }
  
  public void setBlinkTime(float paramFloat) { this.blinkTime = paramFloat; }
  
  public void setClipboard(Clipboard paramClipboard) { this.clipboard = paramClipboard; }
  
  public void setCursorPosition(int paramInt) {
    if (paramInt >= 0) {
      clearSelection();
      this.cursor = Math.min(paramInt, this.text.length());
      return;
    } 
    throw new IllegalArgumentException("cursorPosition must be >= 0");
  }
  
  public void setDisabled(boolean paramBoolean) { this.disabled = paramBoolean; }
  
  public void setFocusTraversal(boolean paramBoolean) { this.focusTraversal = paramBoolean; }
  
  public void setMaxLength(int paramInt) { this.maxLength = paramInt; }
  
  public void setMessageText(String paramString) { this.messageText = paramString; }
  
  public void setOnlyFontChars(boolean paramBoolean) { this.onlyFontChars = paramBoolean; }
  
  public void setOnscreenKeyboard(OnscreenKeyboard paramOnscreenKeyboard) { this.keyboard = paramOnscreenKeyboard; }
  
  public void setPasswordCharacter(char paramChar) {
    this.passwordCharacter = (char)paramChar;
    if (this.passwordMode)
      updateDisplayText(); 
  }
  
  public void setPasswordMode(boolean paramBoolean) {
    this.passwordMode = paramBoolean;
    updateDisplayText();
  }
  
  public void setProgrammaticChangeEvents(boolean paramBoolean) { this.programmaticChangeEvents = paramBoolean; }
  
  public void setSelection(int paramInt1, int paramInt2) {
    if (paramInt1 >= 0) {
      if (paramInt2 >= 0) {
        int i = Math.min(this.text.length(), paramInt1);
        paramInt2 = Math.min(this.text.length(), paramInt2);
        if (paramInt2 == i) {
          clearSelection();
          return;
        } 
        int j = i;
        paramInt1 = paramInt2;
        if (paramInt2 < i) {
          paramInt1 = i;
          j = paramInt2;
        } 
        this.hasSelection = true;
        this.selectionStart = j;
        this.cursor = paramInt1;
        return;
      } 
      throw new IllegalArgumentException("selectionEnd must be >= 0");
    } 
    throw new IllegalArgumentException("selectionStart must be >= 0");
  }
  
  public void setStyle(TextFieldStyle paramTextFieldStyle) {
    if (paramTextFieldStyle != null) {
      this.style = paramTextFieldStyle;
      this.textHeight = paramTextFieldStyle.font.getCapHeight() - paramTextFieldStyle.font.getDescent() * 2.0F;
      invalidateHierarchy();
      return;
    } 
    throw new IllegalArgumentException("style cannot be null.");
  }
  
  public void setText(String paramString) {
    String str = paramString;
    if (paramString == null)
      str = ""; 
    if (str.equals(this.text))
      return; 
    clearSelection();
    paramString = this.text;
    this.text = "";
    paste(str, false);
    if (this.programmaticChangeEvents)
      changeText(paramString, this.text); 
    this.cursor = 0;
  }
  
  public void setTextFieldFilter(TextFieldFilter paramTextFieldFilter) { this.filter = paramTextFieldFilter; }
  
  public void setTextFieldListener(TextFieldListener paramTextFieldListener) { this.listener = paramTextFieldListener; }
  
  void updateDisplayText() {
    BitmapFont bitmapFont = this.style.font;
    BitmapFont.BitmapFontData bitmapFontData = bitmapFont.getData();
    String str = this.text;
    int i = str.length();
    StringBuilder stringBuilder = new StringBuilder();
    int j = 0;
    while (true) {
      char c = ' ';
      if (j < i) {
        char c1 = str.charAt(j);
        char c2 = c;
        if (bitmapFontData.hasGlyph(c1)) {
          c = c1;
          c2 = c;
        } 
        stringBuilder.append(c2);
        j++;
        continue;
      } 
      break;
    } 
    str = stringBuilder.toString();
    if (this.passwordMode && bitmapFontData.hasGlyph(this.passwordCharacter)) {
      if (this.passwordBuffer == null)
        this.passwordBuffer = new StringBuilder(str.length()); 
      if (this.passwordBuffer.length() > i) {
        this.passwordBuffer.setLength(i);
      } else {
        for (j = this.passwordBuffer.length(); j < i; j++)
          this.passwordBuffer.append(this.passwordCharacter); 
      } 
      this.displayText = this.passwordBuffer;
    } else {
      this.displayText = str;
    } 
    this.layout.setText(bitmapFont, this.displayText.toString().replace('\r', ' ').replace('\n', ' '));
    this.glyphPositions.clear();
    j = this.layout.runs.size;
    float f = 0.0F;
    if (j > 0) {
      FloatArray floatArray = ((GlyphLayout.GlyphRun)this.layout.runs.first()).xAdvances;
      this.fontOffset = floatArray.first();
      int k = floatArray.size;
      j = 1;
      f = 0.0F;
      while (j < k) {
        this.glyphPositions.add(f);
        f += floatArray.get(j);
        j++;
      } 
    } else {
      this.fontOffset = 0.0F;
    } 
    this.glyphPositions.add(f);
    this.visibleTextStart = Math.min(this.visibleTextStart, this.glyphPositions.size - 1);
    this.visibleTextEnd = MathUtils.clamp(this.visibleTextEnd, this.visibleTextStart, this.glyphPositions.size - 1);
    if (this.selectionStart > str.length())
      this.selectionStart = i; 
  }
  
  boolean withinMaxLength(int paramInt) {
    int i = this.maxLength;
    return (i <= 0 || paramInt < i);
  }
  
  int[] wordUnderCursor(float paramFloat) { return wordUnderCursor(letterUnderCursor(paramFloat)); }
  
  protected int[] wordUnderCursor(int paramInt) {
    int j;
    String str = this.text;
    int i = str.length();
    if (paramInt >= str.length()) {
      paramInt = str.length();
      j = 0;
    } else {
      int k = paramInt;
      while (true) {
        j = i;
        if (k < i) {
          if (!isWordCharacter(str.charAt(k))) {
            j = k;
            break;
          } 
          k++;
          continue;
        } 
        break;
      } 
      paramInt--;
      while (true) {
        if (paramInt > -1) {
          if (!isWordCharacter(str.charAt(paramInt))) {
            paramInt++;
            break;
          } 
          paramInt--;
          continue;
        } 
        paramInt = 0;
        break;
      } 
    } 
    return new int[] { paramInt, j };
  }
  
  public static class DefaultOnscreenKeyboard implements OnscreenKeyboard {
    public void show(boolean param1Boolean) { Gdx.input.setOnscreenKeyboardVisible(param1Boolean); }
  }
  
  class KeyRepeatTask extends Timer.Task {
    int keycode;
    
    public void run() { TextField.this.inputListener.keyDown(null, this.keycode); }
  }
  
  public static interface OnscreenKeyboard {
    void show(boolean param1Boolean);
  }
  
  public class TextFieldClickListener extends ClickListener {
    public void clicked(InputEvent param1InputEvent, float param1Float1, float param1Float2) {
      int i = getTapCount() % 4;
      if (i == 0)
        TextField.this.clearSelection(); 
      if (i == 2) {
        int[] arrayOfInt = TextField.this.wordUnderCursor(param1Float1);
        TextField.this.setSelection(arrayOfInt[0], arrayOfInt[1]);
      } 
      if (i == 3)
        TextField.this.selectAll(); 
    }
    
    protected void goEnd(boolean param1Boolean) {
      TextField textField = TextField.this;
      textField.cursor = textField.text.length();
    }
    
    protected void goHome(boolean param1Boolean) { TextField.this.cursor = 0; }
    
    public boolean keyDown(InputEvent param1InputEvent, int param1Int) { // Byte code:
      //   0: aload_0
      //   1: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   4: getfield disabled : Z
      //   7: ifeq -> 12
      //   10: iconst_0
      //   11: ireturn
      //   12: aload_0
      //   13: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   16: astore_1
      //   17: aload_1
      //   18: aload_1
      //   19: getfield focused : Z
      //   22: putfield cursorOn : Z
      //   25: aload_0
      //   26: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   29: getfield blinkTask : Lcom/badlogic/gdx/utils/Timer$Task;
      //   32: invokevirtual cancel : ()V
      //   35: aload_0
      //   36: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   39: getfield focused : Z
      //   42: ifeq -> 70
      //   45: aload_0
      //   46: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   49: getfield blinkTask : Lcom/badlogic/gdx/utils/Timer$Task;
      //   52: aload_0
      //   53: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   56: getfield blinkTime : F
      //   59: aload_0
      //   60: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   63: getfield blinkTime : F
      //   66: invokestatic schedule : (Lcom/badlogic/gdx/utils/Timer$Task;FF)Lcom/badlogic/gdx/utils/Timer$Task;
      //   69: pop
      //   70: aload_0
      //   71: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   74: invokevirtual hasKeyboardFocus : ()Z
      //   77: ifne -> 82
      //   80: iconst_0
      //   81: ireturn
      //   82: invokestatic ctrl : ()Z
      //   85: istore_3
      //   86: iconst_1
      //   87: istore #4
      //   89: iload_3
      //   90: ifeq -> 109
      //   93: aload_0
      //   94: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   97: getfield passwordMode : Z
      //   100: ifne -> 109
      //   103: iconst_1
      //   104: istore #5
      //   106: goto -> 112
      //   109: iconst_0
      //   110: istore #5
      //   112: iload_3
      //   113: ifeq -> 257
      //   116: iload_2
      //   117: bipush #29
      //   119: if_icmpeq -> 248
      //   122: iload_2
      //   123: bipush #31
      //   125: if_icmpeq -> 239
      //   128: iload_2
      //   129: bipush #50
      //   131: if_icmpeq -> 214
      //   134: iload_2
      //   135: bipush #52
      //   137: if_icmpeq -> 204
      //   140: iload_2
      //   141: bipush #54
      //   143: if_icmpeq -> 161
      //   146: iload_2
      //   147: sipush #133
      //   150: if_icmpeq -> 239
      //   153: iconst_0
      //   154: istore #6
      //   156: iconst_0
      //   157: istore_3
      //   158: goto -> 262
      //   161: aload_0
      //   162: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   165: getfield text : Ljava/lang/String;
      //   168: astore_1
      //   169: aload_0
      //   170: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   173: astore #7
      //   175: aload #7
      //   177: aload #7
      //   179: getfield undoText : Ljava/lang/String;
      //   182: invokevirtual setText : (Ljava/lang/String;)V
      //   185: aload_0
      //   186: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   189: astore #7
      //   191: aload #7
      //   193: aload_1
      //   194: putfield undoText : Ljava/lang/String;
      //   197: aload #7
      //   199: invokevirtual updateDisplayText : ()V
      //   202: iconst_1
      //   203: ireturn
      //   204: aload_0
      //   205: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   208: iconst_1
      //   209: invokevirtual cut : (Z)V
      //   212: iconst_1
      //   213: ireturn
      //   214: aload_0
      //   215: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   218: astore_1
      //   219: aload_1
      //   220: aload_1
      //   221: getfield clipboard : Lcom/badlogic/gdx/utils/Clipboard;
      //   224: invokeinterface getContents : ()Ljava/lang/String;
      //   229: iconst_1
      //   230: invokevirtual paste : (Ljava/lang/String;Z)V
      //   233: iconst_1
      //   234: istore #6
      //   236: goto -> 260
      //   239: aload_0
      //   240: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   243: invokevirtual copy : ()V
      //   246: iconst_1
      //   247: ireturn
      //   248: aload_0
      //   249: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   252: invokevirtual selectAll : ()V
      //   255: iconst_1
      //   256: ireturn
      //   257: iconst_0
      //   258: istore #6
      //   260: iconst_1
      //   261: istore_3
      //   262: invokestatic shift : ()Z
      //   265: ifeq -> 445
      //   268: iload_2
      //   269: bipush #112
      //   271: if_icmpeq -> 306
      //   274: iload_2
      //   275: sipush #133
      //   278: if_icmpeq -> 284
      //   281: goto -> 314
      //   284: aload_0
      //   285: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   288: astore_1
      //   289: aload_1
      //   290: aload_1
      //   291: getfield clipboard : Lcom/badlogic/gdx/utils/Clipboard;
      //   294: invokeinterface getContents : ()Ljava/lang/String;
      //   299: iconst_1
      //   300: invokevirtual paste : (Ljava/lang/String;Z)V
      //   303: goto -> 314
      //   306: aload_0
      //   307: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   310: iconst_1
      //   311: invokevirtual cut : (Z)V
      //   314: aload_0
      //   315: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   318: getfield cursor : I
      //   321: istore #8
      //   323: iload_2
      //   324: iconst_3
      //   325: if_icmpeq -> 392
      //   328: iload_2
      //   329: sipush #132
      //   332: if_icmpeq -> 379
      //   335: iload_2
      //   336: bipush #21
      //   338: if_icmpeq -> 363
      //   341: iload_2
      //   342: bipush #22
      //   344: if_icmpeq -> 350
      //   347: goto -> 469
      //   350: aload_0
      //   351: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   354: iconst_1
      //   355: iload #5
      //   357: invokevirtual moveCursor : (ZZ)V
      //   360: goto -> 373
      //   363: aload_0
      //   364: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   367: iconst_0
      //   368: iload #5
      //   370: invokevirtual moveCursor : (ZZ)V
      //   373: iconst_1
      //   374: istore #9
      //   376: goto -> 402
      //   379: aload_0
      //   380: iload #5
      //   382: invokevirtual goEnd : (Z)V
      //   385: iload #6
      //   387: istore #9
      //   389: goto -> 402
      //   392: aload_0
      //   393: iload #5
      //   395: invokevirtual goHome : (Z)V
      //   398: iload #6
      //   400: istore #9
      //   402: iload #4
      //   404: istore_3
      //   405: iload #9
      //   407: istore #6
      //   409: aload_0
      //   410: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   413: getfield hasSelection : Z
      //   416: ifne -> 553
      //   419: aload_0
      //   420: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   423: astore_1
      //   424: aload_1
      //   425: iload #8
      //   427: putfield selectionStart : I
      //   430: aload_1
      //   431: iconst_1
      //   432: putfield hasSelection : Z
      //   435: iload #4
      //   437: istore_3
      //   438: iload #9
      //   440: istore #6
      //   442: goto -> 553
      //   445: iload_2
      //   446: iconst_3
      //   447: if_icmpeq -> 537
      //   450: iload_2
      //   451: sipush #132
      //   454: if_icmpeq -> 518
      //   457: iload_2
      //   458: bipush #21
      //   460: if_icmpeq -> 492
      //   463: iload_2
      //   464: bipush #22
      //   466: if_icmpeq -> 472
      //   469: goto -> 553
      //   472: aload_0
      //   473: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   476: iconst_1
      //   477: iload #5
      //   479: invokevirtual moveCursor : (ZZ)V
      //   482: aload_0
      //   483: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   486: invokevirtual clearSelection : ()V
      //   489: goto -> 509
      //   492: aload_0
      //   493: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   496: iconst_0
      //   497: iload #5
      //   499: invokevirtual moveCursor : (ZZ)V
      //   502: aload_0
      //   503: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   506: invokevirtual clearSelection : ()V
      //   509: iconst_1
      //   510: istore #6
      //   512: iload #4
      //   514: istore_3
      //   515: goto -> 553
      //   518: aload_0
      //   519: iload #5
      //   521: invokevirtual goEnd : (Z)V
      //   524: aload_0
      //   525: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   528: invokevirtual clearSelection : ()V
      //   531: iload #4
      //   533: istore_3
      //   534: goto -> 553
      //   537: aload_0
      //   538: iload #5
      //   540: invokevirtual goHome : (Z)V
      //   543: aload_0
      //   544: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   547: invokevirtual clearSelection : ()V
      //   550: iload #4
      //   552: istore_3
      //   553: aload_0
      //   554: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   557: astore_1
      //   558: aload_1
      //   559: aload_1
      //   560: getfield cursor : I
      //   563: iconst_0
      //   564: aload_0
      //   565: getfield this$0 : Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
      //   568: getfield text : Ljava/lang/String;
      //   571: invokevirtual length : ()I
      //   574: invokestatic clamp : (III)I
      //   577: putfield cursor : I
      //   580: iload #6
      //   582: ifeq -> 590
      //   585: aload_0
      //   586: iload_2
      //   587: invokevirtual scheduleKeyRepeatTask : (I)V
      //   590: iload_3
      //   591: ireturn }
    
    public boolean keyTyped(InputEvent param1InputEvent, char param1Char) {
      if (TextField.this.disabled)
        return false; 
      if (param1Char != '\r')
        switch (param1Char) {
          default:
            if (param1Char < ' ')
              return false; 
            break;
          case '\b':
          case '\t':
          case '\n':
            break;
        }  
      if (!TextField.this.hasKeyboardFocus())
        return false; 
      if (UIUtils.isMac && Gdx.input.isKeyPressed(63))
        return true; 
      if ((param1Char == '\t' || param1Char == '\n') && TextField.this.focusTraversal) {
        TextField.this.next(UIUtils.shift());
      } else {
        boolean bool3;
        boolean bool2;
        boolean bool1;
        int j;
        int i;
        if (param1Char == '') {
          i = 1;
        } else {
          i = 0;
        } 
        if (param1Char == '\b') {
          j = 1;
        } else {
          j = 0;
        } 
        if (param1Char == '\r' || param1Char == '\n') {
          bool1 = true;
        } else {
          bool1 = false;
        } 
        if (bool1) {
          bool2 = TextField.this.writeEnters;
        } else if (!TextField.this.onlyFontChars || this.this$0.style.font.getData().hasGlyph(param1Char)) {
          bool2 = true;
        } else {
          bool2 = false;
        } 
        if (j || i) {
          bool3 = true;
        } else {
          bool3 = false;
        } 
        if (bool2 || bool3) {
          String str2 = TextField.this.text;
          int k = TextField.this.cursor;
          if (bool3)
            if (TextField.this.hasSelection) {
              TextField textField1 = TextField.this;
              textField1.cursor = textField1.delete(false);
            } else {
              if (j && TextField.this.cursor > 0) {
                TextField textField1 = TextField.this;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(TextField.this.text.substring(0, TextField.this.cursor - 1));
                String str = TextField.this.text;
                TextField textField2 = TextField.this;
                j = textField2.cursor;
                textField2.cursor = j - 1;
                stringBuilder.append(str.substring(j));
                textField1.text = stringBuilder.toString();
                TextField.this.renderOffset = 0.0F;
              } 
              if (i && TextField.this.cursor < TextField.this.text.length()) {
                TextField textField1 = TextField.this;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(TextField.this.text.substring(0, TextField.this.cursor));
                stringBuilder.append(TextField.this.text.substring(TextField.this.cursor + 1));
                textField1.text = stringBuilder.toString();
              } 
            }  
          if (bool2 && !bool3) {
            if (!bool1 && TextField.this.filter != null && !TextField.this.filter.acceptChar(TextField.this, param1Char))
              return true; 
            String str = TextField.this;
            if (!str.withinMaxLength(str.text.length()))
              return true; 
            if (TextField.this.hasSelection) {
              str = TextField.this;
              str.cursor = str.delete(false);
            } 
            if (bool1) {
              String str3 = "\n";
            } else {
              str = String.valueOf(param1Char);
            } 
            TextField textField1 = TextField.this;
            i = textField1.cursor;
            textField1.cursor = i + 1;
            textField1.text = textField1.insert(i, str, TextField.this.text);
          } 
          String str1 = TextField.this.undoText;
          TextField textField = TextField.this;
          if (textField.changeText(str2, textField.text)) {
            long l = System.currentTimeMillis();
            if (l - 750L > TextField.this.lastChangeTime)
              TextField.this.undoText = str2; 
            TextField.this.lastChangeTime = l;
          } else {
            TextField.this.cursor = k;
          } 
          TextField.this.updateDisplayText();
        } 
      } 
      if (TextField.this.listener != null)
        TextField.this.listener.keyTyped(TextField.this, param1Char); 
      return true;
    }
    
    public boolean keyUp(InputEvent param1InputEvent, int param1Int) {
      if (TextField.this.disabled)
        return false; 
      TextField.this.keyRepeatTask.cancel();
      return true;
    }
    
    protected void scheduleKeyRepeatTask(int param1Int) {
      if (!TextField.this.keyRepeatTask.isScheduled() || this.this$0.keyRepeatTask.keycode != param1Int) {
        this.this$0.keyRepeatTask.keycode = param1Int;
        TextField.this.keyRepeatTask.cancel();
        Timer.schedule(TextField.this.keyRepeatTask, TextField.keyRepeatInitialTime, TextField.keyRepeatTime);
      } 
    }
    
    protected void setCursorPosition(float param1Float1, float param1Float2) {
      TextField textField = TextField.this;
      textField.cursor = textField.letterUnderCursor(param1Float1);
      textField = TextField.this;
      textField.cursorOn = textField.focused;
      TextField.this.blinkTask.cancel();
      if (TextField.this.focused)
        Timer.schedule(TextField.this.blinkTask, TextField.this.blinkTime, TextField.this.blinkTime); 
    }
    
    public boolean touchDown(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
      if (!super.touchDown(param1InputEvent, param1Float1, param1Float2, param1Int1, param1Int2))
        return false; 
      if (param1Int1 == 0 && param1Int2 != 0)
        return false; 
      if (TextField.this.disabled)
        return true; 
      setCursorPosition(param1Float1, param1Float2);
      TextField textField = TextField.this;
      textField.selectionStart = textField.cursor;
      Stage stage = TextField.this.getStage();
      if (stage != null)
        stage.setKeyboardFocus(TextField.this); 
      TextField.this.keyboard.show(true);
      TextField.this.hasSelection = true;
      return true;
    }
    
    public void touchDragged(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int) {
      super.touchDragged(param1InputEvent, param1Float1, param1Float2, param1Int);
      setCursorPosition(param1Float1, param1Float2);
    }
    
    public void touchUp(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
      if (TextField.this.selectionStart == TextField.this.cursor)
        TextField.this.hasSelection = false; 
      super.touchUp(param1InputEvent, param1Float1, param1Float2, param1Int1, param1Int2);
    }
  }
  
  public static interface TextFieldFilter {
    boolean acceptChar(TextField param1TextField, char param1Char);
    
    public static class DigitsOnlyFilter implements TextFieldFilter {
      public boolean acceptChar(TextField param2TextField, char param2Char) { return Character.isDigit(param2Char); }
    }
  }
  
  public static class DigitsOnlyFilter implements TextFieldFilter {
    public boolean acceptChar(TextField param1TextField, char param1Char) { return Character.isDigit(param1Char); }
  }
  
  public static interface TextFieldListener {
    void keyTyped(TextField param1TextField, char param1Char);
  }
  
  public static class TextFieldStyle {
    public Drawable background;
    
    public Drawable cursor;
    
    public Drawable disabledBackground;
    
    public Color disabledFontColor;
    
    public Drawable focusedBackground;
    
    public Color focusedFontColor;
    
    public BitmapFont font;
    
    public Color fontColor;
    
    public BitmapFont messageFont;
    
    public Color messageFontColor;
    
    public Drawable selection;
    
    public TextFieldStyle() {}
    
    public TextFieldStyle(BitmapFont param1BitmapFont, Color param1Color, Drawable param1Drawable1, Drawable param1Drawable2, Drawable param1Drawable3) {
      this.background = param1Drawable3;
      this.cursor = param1Drawable1;
      this.font = param1BitmapFont;
      this.fontColor = param1Color;
      this.selection = param1Drawable2;
    }
    
    public TextFieldStyle(TextFieldStyle param1TextFieldStyle) {
      this.messageFont = param1TextFieldStyle.messageFont;
      Color color = param1TextFieldStyle.messageFontColor;
      if (color != null)
        this.messageFontColor = new Color(color); 
      this.background = param1TextFieldStyle.background;
      this.focusedBackground = param1TextFieldStyle.focusedBackground;
      this.disabledBackground = param1TextFieldStyle.disabledBackground;
      this.cursor = param1TextFieldStyle.cursor;
      this.font = param1TextFieldStyle.font;
      color = param1TextFieldStyle.fontColor;
      if (color != null)
        this.fontColor = new Color(color); 
      color = param1TextFieldStyle.focusedFontColor;
      if (color != null)
        this.focusedFontColor = new Color(color); 
      color = param1TextFieldStyle.disabledFontColor;
      if (color != null)
        this.disabledFontColor = new Color(color); 
      this.selection = param1TextFieldStyle.selection;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/TextField.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */