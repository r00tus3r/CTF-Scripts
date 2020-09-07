package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.GlyphLayout;
import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.actions.Actions;
import com.badlogic.gdx.scenes.scene2d.utils.ArraySelection;
import com.badlogic.gdx.scenes.scene2d.utils.ClickListener;
import com.badlogic.gdx.scenes.scene2d.utils.Disableable;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.OrderedSet;

public class SelectBox<T> extends Widget implements Disableable {
  static final Vector2 temp = new Vector2();
  
  private int alignment = 8;
  
  private ClickListener clickListener;
  
  boolean disabled;
  
  final Array<T> items = new Array();
  
  private float prefHeight;
  
  private float prefWidth;
  
  SelectBoxList<T> selectBoxList;
  
  final ArraySelection<T> selection = new ArraySelection(this.items);
  
  SelectBoxStyle style;
  
  public SelectBox(SelectBoxStyle paramSelectBoxStyle) {
    setStyle(paramSelectBoxStyle);
    setSize(getPrefWidth(), getPrefHeight());
    this.selection.setActor(this);
    this.selection.setRequired(true);
    this.selectBoxList = new SelectBoxList(this);
    ClickListener clickListener1 = new ClickListener() {
        public boolean touchDown(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
          if (param1Int1 == 0 && param1Int2 != 0)
            return false; 
          if (SelectBox.this.disabled)
            return false; 
          if (SelectBox.this.selectBoxList.hasParent()) {
            SelectBox.this.hideList();
          } else {
            SelectBox.this.showList();
          } 
          return true;
        }
      };
    this.clickListener = clickListener1;
    addListener(clickListener1);
  }
  
  public SelectBox(Skin paramSkin) { this((SelectBoxStyle)paramSkin.get(SelectBoxStyle.class)); }
  
  public SelectBox(Skin paramSkin, String paramString) { this((SelectBoxStyle)paramSkin.get(paramString, SelectBoxStyle.class)); }
  
  public void clearItems() {
    if (this.items.size == 0)
      return; 
    this.items.clear();
    this.selection.clear();
    invalidateHierarchy();
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    Color color1;
    Object object;
    validate();
    if (this.disabled && this.style.backgroundDisabled != null) {
      object = this.style.backgroundDisabled;
    } else if (this.selectBoxList.hasParent() && this.style.backgroundOpen != null) {
      object = this.style.backgroundOpen;
    } else if (this.clickListener.isOver() && this.style.backgroundOver != null) {
      object = this.style.backgroundOver;
    } else if (this.style.background != null) {
      object = this.style.background;
    } else {
      object = null;
    } 
    BitmapFont bitmapFont = this.style.font;
    if (this.disabled && this.style.disabledFontColor != null) {
      color1 = this.style.disabledFontColor;
    } else {
      color1 = this.style.fontColor;
    } 
    Color color2 = getColor();
    float f1 = getX();
    float f2 = getY();
    float f3 = getWidth();
    float f4 = getHeight();
    paramBatch.setColor(color2.r, color2.g, color2.b, color2.a * paramFloat);
    if (object != null)
      object.draw(paramBatch, f1, f2, f3, f4); 
    Object object1 = this.selection.first();
    if (object1 != null) {
      float f;
      if (object != null) {
        f3 -= object.getLeftWidth() + object.getRightWidth();
        float f5 = object.getBottomHeight();
        f = object.getTopHeight();
        f1 += object.getLeftWidth();
        f4 = (f4 - f5 + f) / 2.0F + object.getBottomHeight();
        f = (bitmapFont.getData()).capHeight;
      } else {
        f4 /= 2.0F;
        f = (bitmapFont.getData()).capHeight;
      } 
      f4 = (int)(f4 + f / 2.0F);
      bitmapFont.setColor(color1.r, color1.g, color1.b, color1.a * paramFloat);
      drawItem(paramBatch, bitmapFont, object1, f1, f2 + f4, f3);
    } 
  }
  
  protected GlyphLayout drawItem(Batch paramBatch, BitmapFont paramBitmapFont, T paramT, float paramFloat1, float paramFloat2, float paramFloat3) {
    paramT = (T)toString(paramT);
    return paramBitmapFont.draw(paramBatch, paramT, paramFloat1, paramFloat2, 0, paramT.length(), paramFloat3, this.alignment, false, "...");
  }
  
  public Array<T> getItems() { return this.items; }
  
  public List<T> getList() { return this.selectBoxList.list; }
  
  public int getMaxListCount() { return this.selectBoxList.maxListCount; }
  
  public float getPrefHeight() {
    validate();
    return this.prefHeight;
  }
  
  public float getPrefWidth() {
    validate();
    return this.prefWidth;
  }
  
  public ScrollPane getScrollPane() { return this.selectBoxList; }
  
  public T getSelected() { return (T)this.selection.first(); }
  
  public int getSelectedIndex() {
    int i;
    OrderedSet orderedSet = this.selection.items();
    if (orderedSet.size == 0) {
      i = -1;
    } else {
      i = this.items.indexOf(orderedSet.first(), false);
    } 
    return i;
  }
  
  public ArraySelection<T> getSelection() { return this.selection; }
  
  public SelectBoxStyle getStyle() { return this.style; }
  
  public void hideList() { this.selectBoxList.hide(); }
  
  public boolean isDisabled() { return this.disabled; }
  
  public void layout() { // Byte code:
    //   0: aload_0
    //   1: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxStyle;
    //   4: getfield background : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   7: astore_1
    //   8: aload_0
    //   9: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxStyle;
    //   12: getfield font : Lcom/badlogic/gdx/graphics/g2d/BitmapFont;
    //   15: astore_2
    //   16: aload_1
    //   17: ifnull -> 61
    //   20: aload_0
    //   21: aload_1
    //   22: invokeinterface getTopHeight : ()F
    //   27: aload_1
    //   28: invokeinterface getBottomHeight : ()F
    //   33: fadd
    //   34: aload_2
    //   35: invokevirtual getCapHeight : ()F
    //   38: fadd
    //   39: aload_2
    //   40: invokevirtual getDescent : ()F
    //   43: fconst_2
    //   44: fmul
    //   45: fsub
    //   46: aload_1
    //   47: invokeinterface getMinHeight : ()F
    //   52: invokestatic max : (FF)F
    //   55: putfield prefHeight : F
    //   58: goto -> 76
    //   61: aload_0
    //   62: aload_2
    //   63: invokevirtual getCapHeight : ()F
    //   66: aload_2
    //   67: invokevirtual getDescent : ()F
    //   70: fconst_2
    //   71: fmul
    //   72: fsub
    //   73: putfield prefHeight : F
    //   76: ldc_w com/badlogic/gdx/graphics/g2d/GlyphLayout
    //   79: invokestatic get : (Ljava/lang/Class;)Lcom/badlogic/gdx/utils/Pool;
    //   82: astore_3
    //   83: aload_3
    //   84: invokevirtual obtain : ()Ljava/lang/Object;
    //   87: checkcast com/badlogic/gdx/graphics/g2d/GlyphLayout
    //   90: astore #4
    //   92: iconst_0
    //   93: istore #5
    //   95: fconst_0
    //   96: fstore #6
    //   98: fconst_0
    //   99: fstore #7
    //   101: iload #5
    //   103: aload_0
    //   104: getfield items : Lcom/badlogic/gdx/utils/Array;
    //   107: getfield size : I
    //   110: if_icmpge -> 150
    //   113: aload #4
    //   115: aload_2
    //   116: aload_0
    //   117: aload_0
    //   118: getfield items : Lcom/badlogic/gdx/utils/Array;
    //   121: iload #5
    //   123: invokevirtual get : (I)Ljava/lang/Object;
    //   126: invokevirtual toString : (Ljava/lang/Object;)Ljava/lang/String;
    //   129: invokevirtual setText : (Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;)V
    //   132: aload #4
    //   134: getfield width : F
    //   137: fload #7
    //   139: invokestatic max : (FF)F
    //   142: fstore #7
    //   144: iinc #5, 1
    //   147: goto -> 101
    //   150: aload_3
    //   151: aload #4
    //   153: invokevirtual free : (Ljava/lang/Object;)V
    //   156: aload_0
    //   157: fload #7
    //   159: putfield prefWidth : F
    //   162: aload_1
    //   163: ifnull -> 188
    //   166: aload_0
    //   167: aload_0
    //   168: getfield prefWidth : F
    //   171: aload_1
    //   172: invokeinterface getLeftWidth : ()F
    //   177: aload_1
    //   178: invokeinterface getRightWidth : ()F
    //   183: fadd
    //   184: fadd
    //   185: putfield prefWidth : F
    //   188: aload_0
    //   189: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxStyle;
    //   192: getfield listStyle : Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;
    //   195: astore_2
    //   196: aload_0
    //   197: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxStyle;
    //   200: getfield scrollStyle : Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;
    //   203: astore_1
    //   204: fload #7
    //   206: aload_2
    //   207: getfield selection : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   210: invokeinterface getLeftWidth : ()F
    //   215: fadd
    //   216: aload_2
    //   217: getfield selection : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   220: invokeinterface getRightWidth : ()F
    //   225: fadd
    //   226: fstore #8
    //   228: fload #8
    //   230: fstore #7
    //   232: aload_1
    //   233: getfield background : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   236: ifnull -> 263
    //   239: fload #8
    //   241: aload_1
    //   242: getfield background : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   245: invokeinterface getLeftWidth : ()F
    //   250: aload_1
    //   251: getfield background : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   254: invokeinterface getRightWidth : ()F
    //   259: fadd
    //   260: fadd
    //   261: fstore #7
    //   263: aload_0
    //   264: getfield selectBoxList : Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxList;
    //   267: astore_2
    //   268: aload_2
    //   269: ifnull -> 283
    //   272: fload #7
    //   274: fstore #8
    //   276: aload_2
    //   277: getfield disableY : Z
    //   280: ifne -> 361
    //   283: aload_0
    //   284: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxStyle;
    //   287: getfield scrollStyle : Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;
    //   290: getfield vScroll : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   293: ifnull -> 316
    //   296: aload_0
    //   297: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxStyle;
    //   300: getfield scrollStyle : Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;
    //   303: getfield vScroll : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   306: invokeinterface getMinWidth : ()F
    //   311: fstore #8
    //   313: goto -> 319
    //   316: fconst_0
    //   317: fstore #8
    //   319: aload_0
    //   320: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxStyle;
    //   323: getfield scrollStyle : Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;
    //   326: getfield vScrollKnob : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   329: ifnull -> 349
    //   332: aload_0
    //   333: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxStyle;
    //   336: getfield scrollStyle : Lcom/badlogic/gdx/scenes/scene2d/ui/ScrollPane$ScrollPaneStyle;
    //   339: getfield vScrollKnob : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   342: invokeinterface getMinWidth : ()F
    //   347: fstore #6
    //   349: fload #7
    //   351: fload #8
    //   353: fload #6
    //   355: invokestatic max : (FF)F
    //   358: fadd
    //   359: fstore #8
    //   361: aload_0
    //   362: aload_0
    //   363: getfield prefWidth : F
    //   366: fload #8
    //   368: invokestatic max : (FF)F
    //   371: putfield prefWidth : F
    //   374: return }
  
  protected void onHide(Actor paramActor) {
    (paramActor.getColor()).a = 1.0F;
    paramActor.addAction(Actions.sequence(Actions.fadeOut(0.15F, Interpolation.fade), Actions.removeActor()));
  }
  
  protected void onShow(Actor paramActor, boolean paramBoolean) {
    (paramActor.getColor()).a = 0.0F;
    paramActor.addAction(Actions.fadeIn(0.3F, Interpolation.fade));
  }
  
  public void setAlignment(int paramInt) { this.alignment = paramInt; }
  
  public void setDisabled(boolean paramBoolean) {
    if (paramBoolean && !this.disabled)
      hideList(); 
    this.disabled = paramBoolean;
  }
  
  public void setItems(Array<T> paramArray) {
    if (paramArray != null) {
      float f = getPrefWidth();
      Array array = this.items;
      if (paramArray != array) {
        array.clear();
        this.items.addAll(paramArray);
      } 
      this.selection.validate();
      this.selectBoxList.list.setItems(this.items);
      invalidate();
      if (f != getPrefWidth())
        invalidateHierarchy(); 
      return;
    } 
    throw new IllegalArgumentException("newItems cannot be null.");
  }
  
  public void setItems(T... paramVarArgs) {
    if (paramVarArgs != null) {
      float f = getPrefWidth();
      this.items.clear();
      this.items.addAll(paramVarArgs);
      this.selection.validate();
      this.selectBoxList.list.setItems(this.items);
      invalidate();
      if (f != getPrefWidth())
        invalidateHierarchy(); 
      return;
    } 
    throw new IllegalArgumentException("newItems cannot be null.");
  }
  
  public void setMaxListCount(int paramInt) { this.selectBoxList.maxListCount = paramInt; }
  
  public void setScrollingDisabled(boolean paramBoolean) {
    this.selectBoxList.setScrollingDisabled(true, paramBoolean);
    invalidateHierarchy();
  }
  
  public void setSelected(T paramT) {
    if (this.items.contains(paramT, false)) {
      this.selection.set(paramT);
    } else if (this.items.size > 0) {
      this.selection.set(this.items.first());
    } else {
      this.selection.clear();
    } 
  }
  
  public void setSelectedIndex(int paramInt) { this.selection.set(this.items.get(paramInt)); }
  
  protected void setStage(Stage paramStage) {
    if (paramStage == null)
      this.selectBoxList.hide(); 
    super.setStage(paramStage);
  }
  
  public void setStyle(SelectBoxStyle paramSelectBoxStyle) {
    if (paramSelectBoxStyle != null) {
      this.style = paramSelectBoxStyle;
      SelectBoxList selectBoxList1 = this.selectBoxList;
      if (selectBoxList1 != null) {
        selectBoxList1.setStyle(paramSelectBoxStyle.scrollStyle);
        this.selectBoxList.list.setStyle(paramSelectBoxStyle.listStyle);
      } 
      invalidateHierarchy();
      return;
    } 
    throw new IllegalArgumentException("style cannot be null.");
  }
  
  public void showList() {
    if (this.items.size == 0)
      return; 
    if (getStage() != null)
      this.selectBoxList.show(getStage()); 
  }
  
  protected String toString(T paramT) { return paramT.toString(); }
  
  static class SelectBoxList<T> extends ScrollPane {
    private InputListener hideListener;
    
    final List<T> list;
    
    int maxListCount;
    
    private Actor previousScrollFocus;
    
    private final Vector2 screenPosition = new Vector2();
    
    private final SelectBox<T> selectBox;
    
    public SelectBoxList(final SelectBox<T> selectBox) {
      super(null, param1SelectBox.style.scrollStyle);
      this.selectBox = param1SelectBox;
      setOverscroll(false, false);
      setFadeScrollBars(false);
      setScrollingDisabled(true, false);
      this.list = new List<T>(param1SelectBox.style.listStyle) {
          public String toString(T param2T) { return selectBox.toString(param2T); }
        };
      this.list.setTouchable(Touchable.disabled);
      this.list.setTypeToSelect(true);
      setActor(this.list);
      this.list.addListener(new ClickListener() {
            public void clicked(InputEvent param2InputEvent, float param2Float1, float param2Float2) {
              this.val$selectBox.selection.choose(SelectBox.SelectBoxList.this.list.getSelected());
              SelectBox.SelectBoxList.this.hide();
            }
            
            public boolean mouseMoved(InputEvent param2InputEvent, float param2Float1, float param2Float2) {
              int i = SelectBox.SelectBoxList.this.list.getItemIndexAt(param2Float2);
              if (i != -1)
                SelectBox.SelectBoxList.this.list.setSelectedIndex(i); 
              return true;
            }
          });
      addListener(new InputListener() {
            public void exit(InputEvent param2InputEvent, float param2Float1, float param2Float2, int param2Int, Actor param2Actor) {
              if (param2Actor == null || !SelectBox.SelectBoxList.this.isAscendantOf(param2Actor))
                this.this$0.list.selection.set(selectBox.getSelected()); 
            }
          });
      this.hideListener = new InputListener() {
          public boolean keyDown(InputEvent param2InputEvent, int param2Int) {
            if (param2Int != 66) {
              if (param2Int != 131)
                return false; 
            } else {
              this.val$selectBox.selection.choose(SelectBox.SelectBoxList.this.list.getSelected());
            } 
            SelectBox.SelectBoxList.this.hide();
            param2InputEvent.stop();
            return true;
          }
          
          public boolean touchDown(InputEvent param2InputEvent, float param2Float1, float param2Float2, int param2Int1, int param2Int2) {
            Actor actor = param2InputEvent.getTarget();
            if (SelectBox.SelectBoxList.this.isAscendantOf(actor))
              return false; 
            this.this$0.list.selection.set(selectBox.getSelected());
            SelectBox.SelectBoxList.this.hide();
            return false;
          }
        };
    }
    
    public void act(float param1Float) {
      super.act(param1Float);
      toFront();
    }
    
    public void draw(Batch param1Batch, float param1Float) {
      this.selectBox.localToStageCoordinates(SelectBox.temp.set(0.0F, 0.0F));
      if (!SelectBox.temp.equals(this.screenPosition))
        hide(); 
      super.draw(param1Batch, param1Float);
    }
    
    public void hide() {
      if (this.list.isTouchable() && hasParent()) {
        this.list.setTouchable(Touchable.disabled);
        Stage stage = getStage();
        if (stage != null) {
          stage.removeCaptureListener(this.hideListener);
          stage.removeListener(this.list.getKeyListener());
          Actor actor = this.previousScrollFocus;
          if (actor != null && actor.getStage() == null)
            this.previousScrollFocus = null; 
          actor = stage.getScrollFocus();
          if (actor == null || isAscendantOf(actor))
            stage.setScrollFocus(this.previousScrollFocus); 
        } 
        clearActions();
        this.selectBox.onHide(this);
      } 
    }
    
    protected void setStage(Stage param1Stage) {
      Stage stage = getStage();
      if (stage != null) {
        stage.removeCaptureListener(this.hideListener);
        stage.removeListener(this.list.getKeyListener());
      } 
      super.setStage(param1Stage);
    }
    
    public void show(Stage param1Stage) {
      if (this.list.isTouchable())
        return; 
      param1Stage.addActor(this);
      param1Stage.addCaptureListener(this.hideListener);
      param1Stage.addListener(this.list.getKeyListener());
      this.selectBox.localToStageCoordinates(this.screenPosition.set(0.0F, 0.0F));
      float f1 = this.list.getItemHeight();
      int i = this.maxListCount;
      if (i <= 0) {
        i = this.selectBox.items.size;
      } else {
        i = Math.min(i, this.selectBox.items.size);
      } 
      float f2 = i * f1;
      Drawable drawable = (getStyle()).background;
      float f3 = f2;
      if (drawable != null)
        f3 = f2 + drawable.getTopHeight() + drawable.getBottomHeight(); 
      drawable = (this.list.getStyle()).background;
      f2 = f3;
      if (drawable != null)
        f2 = f3 + drawable.getTopHeight() + drawable.getBottomHeight(); 
      float f4 = this.screenPosition.y;
      float f5 = (param1Stage.getCamera()).viewportHeight - this.screenPosition.y - this.selectBox.getHeight();
      byte b = 1;
      f3 = f2;
      int j = b;
      if (f2 > f4)
        if (f5 > f4) {
          j = 0;
          f3 = Math.min(f2, f5);
        } else {
          f3 = f4;
          j = b;
        }  
      if (j != 0) {
        setY(this.screenPosition.y - f3);
      } else {
        setY(this.screenPosition.y + this.selectBox.getHeight());
      } 
      setX(this.screenPosition.x);
      setHeight(f3);
      validate();
      f4 = Math.max(getPrefWidth(), this.selectBox.getWidth());
      f2 = f4;
      if (getPrefHeight() > f3) {
        f2 = f4;
        if (!this.disableY)
          f2 = f4 + getScrollBarWidth(); 
      } 
      setWidth(f2);
      validate();
      scrollTo(0.0F, this.list.getHeight() - this.selectBox.getSelectedIndex() * f1 - f1 / 2.0F, 0.0F, 0.0F, true, true);
      updateVisualScroll();
      this.previousScrollFocus = null;
      Actor actor = param1Stage.getScrollFocus();
      if (actor != null && !actor.isDescendantOf(this))
        this.previousScrollFocus = actor; 
      param1Stage.setScrollFocus(this);
      this.list.selection.set(this.selectBox.getSelected());
      this.list.setTouchable(Touchable.enabled);
      clearActions();
      this.selectBox.onShow(this, j);
    }
  }
  
  class null extends List<T> {
    null(List.ListStyle param1ListStyle) { super(param1ListStyle); }
    
    public String toString(T param1T) { return selectBox.toString(param1T); }
  }
  
  class null extends ClickListener {
    public void clicked(InputEvent param1InputEvent, float param1Float1, float param1Float2) {
      this.val$selectBox.selection.choose(this.this$0.list.getSelected());
      this.this$0.hide();
    }
    
    public boolean mouseMoved(InputEvent param1InputEvent, float param1Float1, float param1Float2) {
      int i = this.this$0.list.getItemIndexAt(param1Float2);
      if (i != -1)
        this.this$0.list.setSelectedIndex(i); 
      return true;
    }
  }
  
  class null extends InputListener {
    public void exit(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int, Actor param1Actor) {
      if (param1Actor == null || !this.this$0.isAscendantOf(param1Actor))
        this.this$0.list.selection.set(selectBox.getSelected()); 
    }
  }
  
  class null extends InputListener {
    public boolean keyDown(InputEvent param1InputEvent, int param1Int) {
      if (param1Int != 66) {
        if (param1Int != 131)
          return false; 
      } else {
        this.val$selectBox.selection.choose(this.this$0.list.getSelected());
      } 
      this.this$0.hide();
      param1InputEvent.stop();
      return true;
    }
    
    public boolean touchDown(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
      Actor actor = param1InputEvent.getTarget();
      if (this.this$0.isAscendantOf(actor))
        return false; 
      this.this$0.list.selection.set(selectBox.getSelected());
      this.this$0.hide();
      return false;
    }
  }
  
  public static class SelectBoxStyle {
    public Drawable background;
    
    public Drawable backgroundDisabled;
    
    public Drawable backgroundOpen;
    
    public Drawable backgroundOver;
    
    public Color disabledFontColor;
    
    public BitmapFont font;
    
    public Color fontColor = new Color(1.0F, 1.0F, 1.0F, 1.0F);
    
    public List.ListStyle listStyle;
    
    public ScrollPane.ScrollPaneStyle scrollStyle;
    
    public SelectBoxStyle() {}
    
    public SelectBoxStyle(BitmapFont param1BitmapFont, Color param1Color, Drawable param1Drawable, ScrollPane.ScrollPaneStyle param1ScrollPaneStyle, List.ListStyle param1ListStyle) {
      this.font = param1BitmapFont;
      this.fontColor.set(param1Color);
      this.background = param1Drawable;
      this.scrollStyle = param1ScrollPaneStyle;
      this.listStyle = param1ListStyle;
    }
    
    public SelectBoxStyle(SelectBoxStyle param1SelectBoxStyle) {
      this.font = param1SelectBoxStyle.font;
      this.fontColor.set(param1SelectBoxStyle.fontColor);
      Color color = param1SelectBoxStyle.disabledFontColor;
      if (color != null)
        this.disabledFontColor = new Color(color); 
      this.background = param1SelectBoxStyle.background;
      this.backgroundOver = param1SelectBoxStyle.backgroundOver;
      this.backgroundOpen = param1SelectBoxStyle.backgroundOpen;
      this.backgroundDisabled = param1SelectBoxStyle.backgroundDisabled;
      this.scrollStyle = new ScrollPane.ScrollPaneStyle(param1SelectBoxStyle.scrollStyle);
      this.listStyle = new List.ListStyle(param1SelectBoxStyle.listStyle);
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/SelectBox.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */