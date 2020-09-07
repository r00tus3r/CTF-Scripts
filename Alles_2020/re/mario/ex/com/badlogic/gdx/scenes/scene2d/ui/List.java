package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.GlyphLayout;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.utils.ArraySelection;
import com.badlogic.gdx.scenes.scene2d.utils.Cullable;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.UIUtils;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.OrderedSet;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.Pools;

public class List<T> extends Widget implements Cullable {
  private int alignment = 8;
  
  private Rectangle cullingArea;
  
  float itemHeight;
  
  final Array<T> items = new Array();
  
  private InputListener keyListener;
  
  int overIndex = -1;
  
  private float prefHeight;
  
  private float prefWidth;
  
  int pressedIndex = -1;
  
  ArraySelection<T> selection = new ArraySelection(this.items);
  
  ListStyle style;
  
  boolean typeToSelect;
  
  public List(ListStyle paramListStyle) {
    this.selection.setActor(this);
    this.selection.setRequired(true);
    setStyle(paramListStyle);
    setSize(getPrefWidth(), getPrefHeight());
    InputListener inputListener = new InputListener() {
        String prefix;
        
        long typeTimeout;
        
        public boolean keyDown(InputEvent param1InputEvent, int param1Int) {
          if (List.this.items.isEmpty())
            return false; 
          if (param1Int != 3) {
            if (param1Int != 29) {
              if (param1Int != 19) {
                if (param1Int != 20) {
                  if (param1Int != 131) {
                    if (param1Int == 132) {
                      List list = List.this;
                      list.setSelectedIndex(list.items.size - 1);
                      return true;
                    } 
                  } else {
                    if (List.this.getStage() != null)
                      List.this.getStage().setKeyboardFocus(null); 
                    return true;
                  } 
                } else {
                  int i = List.this.items.indexOf(List.this.getSelected(), false) + 1;
                  param1Int = i;
                  if (i >= this.this$0.items.size)
                    param1Int = 0; 
                  List.this.setSelectedIndex(param1Int);
                  return true;
                } 
              } else {
                int i = List.this.items.indexOf(List.this.getSelected(), false) - 1;
                param1Int = i;
                if (i < 0)
                  param1Int = this.this$0.items.size - 1; 
                List.this.setSelectedIndex(param1Int);
                return true;
              } 
            } else if (UIUtils.ctrl() && List.this.selection.getMultiple()) {
              List.this.selection.clear();
              List.this.selection.addAll(List.this.items);
              return true;
            } 
            return false;
          } 
          List.this.setSelectedIndex(0);
          return true;
        }
        
        public boolean keyTyped(InputEvent param1InputEvent, char param1Char) {
          if (!List.this.typeToSelect)
            return false; 
          long l = System.currentTimeMillis();
          if (l > this.typeTimeout)
            this.prefix = ""; 
          this.typeTimeout = l + 300L;
          StringBuilder stringBuilder = new StringBuilder();
          stringBuilder.append(this.prefix);
          stringBuilder.append(Character.toLowerCase(param1Char));
          this.prefix = stringBuilder.toString();
          int i = this.this$0.items.size;
          for (byte b = 0; b < i; b++) {
            List list = List.this;
            if (list.toString(list.items.get(b)).toLowerCase().startsWith(this.prefix)) {
              List.this.setSelectedIndex(b);
              break;
            } 
          } 
          return false;
        }
      };
    this.keyListener = inputListener;
    addListener(inputListener);
    addListener(new InputListener() {
          public void exit(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int, Actor param1Actor) {
            if (param1Int == 0)
              List.this.pressedIndex = -1; 
            if (param1Int == -1)
              List.this.overIndex = -1; 
          }
          
          public boolean mouseMoved(InputEvent param1InputEvent, float param1Float1, float param1Float2) {
            List list = List.this;
            list.overIndex = list.getItemIndexAt(param1Float2);
            return false;
          }
          
          public boolean touchDown(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
            if (param1Int1 == 0 && param1Int2 == 0) {
              if (List.this.selection.isDisabled())
                return true; 
              if (List.this.getStage() != null)
                List.this.getStage().setKeyboardFocus(List.this); 
              if (this.this$0.items.size == 0)
                return true; 
              param1Int1 = List.this.getItemIndexAt(param1Float2);
              if (param1Int1 == -1)
                return true; 
              List.this.selection.choose(List.this.items.get(param1Int1));
              List.this.pressedIndex = param1Int1;
            } 
            return true;
          }
          
          public void touchDragged(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int) {
            List list = List.this;
            list.overIndex = list.getItemIndexAt(param1Float2);
          }
          
          public void touchUp(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
            if (param1Int1 == 0 && param1Int2 == 0)
              List.this.pressedIndex = -1; 
          }
        });
  }
  
  public List(Skin paramSkin) { this((ListStyle)paramSkin.get(ListStyle.class)); }
  
  public List(Skin paramSkin, String paramString) { this((ListStyle)paramSkin.get(paramString, ListStyle.class)); }
  
  public void clearItems() {
    if (this.items.size == 0)
      return; 
    this.items.clear();
    this.overIndex = -1;
    this.pressedIndex = -1;
    this.selection.clear();
    invalidateHierarchy();
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    validate();
    drawBackground(paramBatch, paramFloat);
    BitmapFont bitmapFont = this.style.font;
    Drawable drawable1 = this.style.selection;
    Color color1 = this.style.fontColorSelected;
    Color color2 = this.style.fontColorUnselected;
    Color color3 = getColor();
    paramBatch.setColor(color3.r, color3.g, color3.b, color3.a * paramFloat);
    float f1 = getX();
    float f2 = getY();
    float f3 = getWidth();
    float f4 = getHeight();
    Drawable drawable2 = this.style.background;
    float f5 = f1;
    float f6 = f3;
    float f7 = f4;
    if (drawable2 != null) {
      f6 = drawable2.getLeftWidth();
      f5 = f1 + f6;
      f7 = f4 - drawable2.getTopHeight();
      f6 = f3 - f6 + drawable2.getRightWidth();
    } 
    f3 = drawable1.getLeftWidth();
    f4 = drawable1.getRightWidth();
    float f8 = drawable1.getTopHeight();
    f1 = bitmapFont.getDescent();
    bitmapFont.setColor(color2.r, color2.g, color2.b, color2.a * paramFloat);
    for (byte b = 0; b < this.items.size; b++) {
      Rectangle rectangle = this.cullingArea;
      if (rectangle == null || (f7 - this.itemHeight <= rectangle.y + this.cullingArea.height && f7 >= this.cullingArea.y)) {
        Drawable drawable;
        Object object = this.items.get(b);
        boolean bool = this.selection.contains(object);
        Rectangle rectangle1 = null;
        if (this.pressedIndex == b && this.style.down != null) {
          drawable = this.style.down;
        } else if (bool) {
          bitmapFont.setColor(color1.r, color1.g, color1.b, color1.a * paramFloat);
          drawable = drawable1;
        } else {
          rectangle = rectangle1;
          if (this.overIndex == b) {
            rectangle = rectangle1;
            if (this.style.over != null)
              drawable = this.style.over; 
          } 
        } 
        if (drawable != null) {
          float f = this.itemHeight;
          drawable.draw(paramBatch, f5, f2 + f7 - f, f6, f);
        } 
        drawItem(paramBatch, bitmapFont, b, object, f5 + f3, f2 + f7 - f8 - f1, f6 - f3 - f4);
        if (bool)
          bitmapFont.setColor(color2.r, color2.g, color2.b, color2.a * paramFloat); 
      } else if (f7 < this.cullingArea.y) {
        break;
      } 
      f7 -= this.itemHeight;
    } 
  }
  
  protected void drawBackground(Batch paramBatch, float paramFloat) {
    if (this.style.background != null) {
      Color color = getColor();
      paramBatch.setColor(color.r, color.g, color.b, color.a * paramFloat);
      this.style.background.draw(paramBatch, getX(), getY(), getWidth(), getHeight());
    } 
  }
  
  protected GlyphLayout drawItem(Batch paramBatch, BitmapFont paramBitmapFont, int paramInt, T paramT, float paramFloat1, float paramFloat2, float paramFloat3) {
    paramT = (T)toString(paramT);
    return paramBitmapFont.draw(paramBatch, paramT, paramFloat1, paramFloat2, 0, paramT.length(), paramFloat3, this.alignment, false, "...");
  }
  
  public Rectangle getCullingArea() { return this.cullingArea; }
  
  public T getItemAt(float paramFloat) {
    int i = getItemIndexAt(paramFloat);
    return (i == -1) ? null : (T)this.items.get(i);
  }
  
  public float getItemHeight() { return this.itemHeight; }
  
  public int getItemIndexAt(float paramFloat) {
    float f1 = getHeight();
    Drawable drawable = this.style.background;
    float f2 = f1;
    float f3 = paramFloat;
    if (drawable != null) {
      f2 = f1 - drawable.getTopHeight() + drawable.getBottomHeight();
      f3 = paramFloat - drawable.getBottomHeight();
    } 
    int i = (int)((f2 - f3) / this.itemHeight);
    return (i < 0 || i >= this.items.size) ? -1 : i;
  }
  
  public Array<T> getItems() { return this.items; }
  
  public InputListener getKeyListener() { return this.keyListener; }
  
  public T getOverItem() {
    Object object;
    int i = this.overIndex;
    if (i == -1) {
      object = null;
    } else {
      object = this.items.get(i);
    } 
    return (T)object;
  }
  
  public float getPrefHeight() {
    validate();
    return this.prefHeight;
  }
  
  public float getPrefWidth() {
    validate();
    return this.prefWidth;
  }
  
  public T getPressedItem() {
    Object object;
    int i = this.pressedIndex;
    if (i == -1) {
      object = null;
    } else {
      object = this.items.get(i);
    } 
    return (T)object;
  }
  
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
  
  public ListStyle getStyle() { return this.style; }
  
  public void layout() {
    BitmapFont bitmapFont = this.style.font;
    Drawable drawable = this.style.selection;
    this.itemHeight = bitmapFont.getCapHeight() - bitmapFont.getDescent() * 2.0F;
    this.itemHeight += drawable.getTopHeight() + drawable.getBottomHeight();
    this.prefWidth = 0.0F;
    Pool pool = Pools.get(GlyphLayout.class);
    GlyphLayout glyphLayout = (GlyphLayout)pool.obtain();
    for (byte b = 0; b < this.items.size; b++) {
      glyphLayout.setText(bitmapFont, toString(this.items.get(b)));
      this.prefWidth = Math.max(glyphLayout.width, this.prefWidth);
    } 
    pool.free(glyphLayout);
    this.prefWidth += drawable.getLeftWidth() + drawable.getRightWidth();
    this.prefHeight = this.items.size * this.itemHeight;
    drawable = this.style.background;
    if (drawable != null) {
      this.prefWidth += drawable.getLeftWidth() + drawable.getRightWidth();
      this.prefHeight += drawable.getTopHeight() + drawable.getBottomHeight();
    } 
  }
  
  public void setAlignment(int paramInt) { this.alignment = paramInt; }
  
  public void setCullingArea(Rectangle paramRectangle) { this.cullingArea = paramRectangle; }
  
  public void setItems(Array paramArray) {
    if (paramArray != null) {
      float f1 = getPrefWidth();
      float f2 = getPrefHeight();
      Array array = this.items;
      if (paramArray != array) {
        array.clear();
        this.items.addAll(paramArray);
      } 
      this.overIndex = -1;
      this.pressedIndex = -1;
      this.selection.validate();
      invalidate();
      if (f1 != getPrefWidth() || f2 != getPrefHeight())
        invalidateHierarchy(); 
      return;
    } 
    throw new IllegalArgumentException("newItems cannot be null.");
  }
  
  public void setItems(T... paramVarArgs) {
    if (paramVarArgs != null) {
      float f1 = getPrefWidth();
      float f2 = getPrefHeight();
      this.items.clear();
      this.items.addAll(paramVarArgs);
      this.overIndex = -1;
      this.pressedIndex = -1;
      this.selection.validate();
      invalidate();
      if (f1 != getPrefWidth() || f2 != getPrefHeight())
        invalidateHierarchy(); 
      return;
    } 
    throw new IllegalArgumentException("newItems cannot be null.");
  }
  
  public void setSelected(T paramT) {
    if (this.items.contains(paramT, false)) {
      this.selection.set(paramT);
    } else if (this.selection.getRequired() && this.items.size > 0) {
      this.selection.set(this.items.first());
    } else {
      this.selection.clear();
    } 
  }
  
  public void setSelectedIndex(int paramInt) {
    if (paramInt >= -1 && paramInt < this.items.size) {
      if (paramInt == -1) {
        this.selection.clear();
      } else {
        this.selection.set(this.items.get(paramInt));
      } 
      return;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("index must be >= -1 and < ");
    stringBuilder.append(this.items.size);
    stringBuilder.append(": ");
    stringBuilder.append(paramInt);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public void setSelection(ArraySelection<T> paramArraySelection) { this.selection = paramArraySelection; }
  
  public void setStyle(ListStyle paramListStyle) {
    if (paramListStyle != null) {
      this.style = paramListStyle;
      invalidateHierarchy();
      return;
    } 
    throw new IllegalArgumentException("style cannot be null.");
  }
  
  public void setTypeToSelect(boolean paramBoolean) { this.typeToSelect = paramBoolean; }
  
  public String toString(T paramT) { return paramT.toString(); }
  
  public static class ListStyle {
    public Drawable background;
    
    public Drawable down;
    
    public BitmapFont font;
    
    public Color fontColorSelected = new Color(1.0F, 1.0F, 1.0F, 1.0F);
    
    public Color fontColorUnselected = new Color(1.0F, 1.0F, 1.0F, 1.0F);
    
    public Drawable over;
    
    public Drawable selection;
    
    public ListStyle() {}
    
    public ListStyle(BitmapFont param1BitmapFont, Color param1Color1, Color param1Color2, Drawable param1Drawable) {
      this.font = param1BitmapFont;
      this.fontColorSelected.set(param1Color1);
      this.fontColorUnselected.set(param1Color2);
      this.selection = param1Drawable;
    }
    
    public ListStyle(ListStyle param1ListStyle) {
      this.font = param1ListStyle.font;
      this.fontColorSelected.set(param1ListStyle.fontColorSelected);
      this.fontColorUnselected.set(param1ListStyle.fontColorUnselected);
      this.selection = param1ListStyle.selection;
      this.down = param1ListStyle.down;
      this.over = param1ListStyle.over;
      this.background = param1ListStyle.background;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/List.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */