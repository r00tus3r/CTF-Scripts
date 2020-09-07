package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;

public class Window extends Table {
  private static final int MOVE = 32;
  
  private static final Vector2 tmpPosition = new Vector2();
  
  private static final Vector2 tmpSize = new Vector2();
  
  protected boolean dragging;
  
  boolean drawTitleTable;
  
  protected int edge;
  
  boolean isModal;
  
  boolean isMovable = true;
  
  boolean isResizable;
  
  boolean keepWithinStage = true;
  
  int resizeBorder = 8;
  
  private WindowStyle style;
  
  Label titleLabel;
  
  Table titleTable;
  
  public Window(String paramString, Skin paramSkin) {
    this(paramString, (WindowStyle)paramSkin.get(WindowStyle.class));
    setSkin(paramSkin);
  }
  
  public Window(String paramString1, Skin paramSkin, String paramString2) {
    this(paramString1, (WindowStyle)paramSkin.get(paramString2, WindowStyle.class));
    setSkin(paramSkin);
  }
  
  public Window(String paramString, WindowStyle paramWindowStyle) {
    if (paramString != null) {
      setTouchable(Touchable.enabled);
      setClip(true);
      this.titleLabel = new Label(paramString, new Label.LabelStyle(paramWindowStyle.titleFont, paramWindowStyle.titleFontColor));
      this.titleLabel.setEllipsis(true);
      this.titleTable = new Table() {
          public void draw(Batch param1Batch, float param1Float) {
            if (Window.this.drawTitleTable)
              super.draw(param1Batch, param1Float); 
          }
        };
      this.titleTable.add(this.titleLabel).expandX().fillX().minWidth(0.0F);
      addActor(this.titleTable);
      setStyle(paramWindowStyle);
      setWidth(150.0F);
      setHeight(150.0F);
      addCaptureListener(new InputListener() {
            public boolean touchDown(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
              Window.this.toFront();
              return false;
            }
          });
      addListener(new InputListener() {
            float lastX;
            
            float lastY;
            
            float startX;
            
            float startY;
            
            private void updateEdge(float param1Float1, float param1Float2) {
              float f1 = Window.this.resizeBorder / 2.0F;
              float f2 = Window.this.getWidth();
              float f3 = Window.this.getHeight();
              float f4 = Window.this.getPadTop();
              float f5 = Window.this.getPadLeft();
              float f6 = Window.this.getPadBottom();
              float f7 = f2 - Window.this.getPadRight();
              Window window = Window.this;
              window.edge = 0;
              if (window.isResizable && param1Float1 >= f5 - f1 && param1Float1 <= f7 + f1 && param1Float2 >= f6 - f1) {
                if (param1Float1 < f5 + f1) {
                  window = Window.this;
                  window.edge |= 0x8;
                } 
                if (param1Float1 > f7 - f1) {
                  window = Window.this;
                  window.edge |= 0x10;
                } 
                if (param1Float2 < f6 + f1) {
                  window = Window.this;
                  window.edge |= 0x4;
                } 
                f2 = f1;
                if (Window.this.edge != 0)
                  f2 = f1 + 25.0F; 
                if (param1Float1 < f5 + f2) {
                  window = Window.this;
                  window.edge |= 0x8;
                } 
                if (param1Float1 > f7 - f2) {
                  window = Window.this;
                  window.edge |= 0x10;
                } 
                if (param1Float2 < f6 + f2) {
                  window = Window.this;
                  window.edge |= 0x4;
                } 
              } 
              if (Window.this.isMovable && Window.this.edge == 0 && param1Float2 <= f3 && param1Float2 >= f3 - f4 && param1Float1 >= f5 && param1Float1 <= f7)
                Window.this.edge = 32; 
            }
            
            public boolean keyDown(InputEvent param1InputEvent, int param1Int) { return Window.this.isModal; }
            
            public boolean keyTyped(InputEvent param1InputEvent, char param1Char) { return Window.this.isModal; }
            
            public boolean keyUp(InputEvent param1InputEvent, int param1Int) { return Window.this.isModal; }
            
            public boolean mouseMoved(InputEvent param1InputEvent, float param1Float1, float param1Float2) {
              updateEdge(param1Float1, param1Float2);
              return Window.this.isModal;
            }
            
            public boolean scrolled(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int) { return Window.this.isModal; }
            
            public boolean touchDown(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
              boolean bool = false;
              if (param1Int2 == 0) {
                boolean bool1;
                updateEdge(param1Float1, param1Float2);
                Window window = Window.this;
                if (window.edge != 0) {
                  bool1 = true;
                } else {
                  bool1 = false;
                } 
                window.dragging = bool1;
                this.startX = param1Float1;
                this.startY = param1Float2;
                this.lastX = param1Float1 - Window.this.getWidth();
                this.lastY = param1Float2 - Window.this.getHeight();
              } 
              if (Window.this.edge == 0) {
                boolean bool1 = bool;
                return Window.this.isModal ? true : bool1;
              } 
              return true;
            }
            
            public void touchDragged(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int) {
              if (!Window.this.dragging)
                return; 
              float f1 = Window.this.getWidth();
              float f2 = Window.this.getHeight();
              float f3 = Window.this.getX();
              float f4 = Window.this.getY();
              float f5 = Window.this.getMinWidth();
              Window.this.getMaxWidth();
              float f6 = Window.this.getMinHeight();
              Window.this.getMaxHeight();
              Stage stage = Window.this.getStage();
              if (Window.this.keepWithinStage && stage != null && Window.this.getParent() == stage.getRoot()) {
                param1Int = 1;
              } else {
                param1Int = 0;
              } 
              float f7 = f3;
              float f8 = f4;
              if ((Window.this.edge & 0x20) != 0) {
                f7 = this.startX;
                f8 = this.startY;
                f7 = f3 + param1Float1 - f7;
                f8 = f4 + param1Float2 - f8;
              } 
              f3 = f7;
              f4 = f1;
              if ((Window.this.edge & 0x8) != 0) {
                f3 = param1Float1 - this.startX;
                f4 = f3;
                if (f1 - f3 < f5)
                  f4 = -(f5 - f1); 
                f3 = f4;
                if (param1Int != 0) {
                  f3 = f4;
                  if (f7 + f4 < 0.0F)
                    f3 = -f7; 
                } 
                f4 = f1 - f3;
                f3 = f7 + f3;
              } 
              f1 = f8;
              f7 = f2;
              if ((Window.this.edge & 0x4) != 0) {
                f1 = param1Float2 - this.startY;
                f7 = f1;
                if (f2 - f1 < f6)
                  f7 = -(f6 - f2); 
                f1 = f7;
                if (param1Int != 0) {
                  f1 = f7;
                  if (f8 + f7 < 0.0F)
                    f1 = -f8; 
                } 
                f7 = f2 - f1;
                f1 = f8 + f1;
              } 
              f8 = f4;
              if ((Window.this.edge & 0x10) != 0) {
                f8 = param1Float1 - this.lastX - f4;
                param1Float1 = f8;
                if (f4 + f8 < f5)
                  param1Float1 = f5 - f4; 
                f8 = param1Float1;
                if (param1Int != 0) {
                  f8 = param1Float1;
                  if (f3 + f4 + param1Float1 > stage.getWidth())
                    f8 = stage.getWidth() - f3 - f4; 
                } 
                f8 = f4 + f8;
              } 
              param1Float1 = f7;
              if ((Window.this.edge & 0x2) != 0) {
                param1Float2 = param1Float2 - this.lastY - f7;
                param1Float1 = param1Float2;
                if (f7 + param1Float2 < f6)
                  param1Float1 = f6 - f7; 
                param1Float2 = param1Float1;
                if (param1Int != 0) {
                  param1Float2 = param1Float1;
                  if (f1 + f7 + param1Float1 > stage.getHeight())
                    param1Float2 = stage.getHeight() - f1 - f7; 
                } 
                param1Float1 = f7 + param1Float2;
              } 
              Window.this.setBounds(Math.round(f3), Math.round(f1), Math.round(f8), Math.round(param1Float1));
            }
            
            public void touchUp(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) { Window.this.dragging = false; }
          });
      return;
    } 
    throw new IllegalArgumentException("title cannot be null.");
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    Stage stage = getStage();
    if (stage != null && stage.getKeyboardFocus() == null)
      stage.setKeyboardFocus(this); 
    keepWithinStage();
    if (this.style.stageBackground != null) {
      stageToLocalCoordinates(tmpPosition.set(0.0F, 0.0F));
      stageToLocalCoordinates(tmpSize.set(stage.getWidth(), stage.getHeight()));
      drawStageBackground(paramBatch, paramFloat, getX() + tmpPosition.x, getY() + tmpPosition.y, getX() + tmpSize.x, getY() + tmpSize.y);
    } 
    super.draw(paramBatch, paramFloat);
  }
  
  protected void drawBackground(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3) {
    super.drawBackground(paramBatch, paramFloat1, paramFloat2, paramFloat3);
    (this.titleTable.getColor()).a = (getColor()).a;
    paramFloat3 = getPadTop();
    paramFloat2 = getPadLeft();
    this.titleTable.setSize(getWidth() - paramFloat2 - getPadRight(), paramFloat3);
    this.titleTable.setPosition(paramFloat2, getHeight() - paramFloat3);
    this.drawTitleTable = true;
    this.titleTable.draw(paramBatch, paramFloat1);
    this.drawTitleTable = false;
  }
  
  protected void drawStageBackground(Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) {
    Color color = getColor();
    paramBatch.setColor(color.r, color.g, color.b, color.a * paramFloat1);
    this.style.stageBackground.draw(paramBatch, paramFloat2, paramFloat3, paramFloat4, paramFloat5);
  }
  
  public float getPrefWidth() { return Math.max(super.getPrefWidth(), this.titleTable.getPrefWidth() + getPadLeft() + getPadRight()); }
  
  public WindowStyle getStyle() { return this.style; }
  
  public Label getTitleLabel() { return this.titleLabel; }
  
  public Table getTitleTable() { return this.titleTable; }
  
  public Actor hit(float paramFloat1, float paramFloat2, boolean paramBoolean) {
    if (!isVisible())
      return null; 
    Actor actor = super.hit(paramFloat1, paramFloat2, paramBoolean);
    if (actor == null && this.isModal && (!paramBoolean || getTouchable() == Touchable.enabled))
      return this; 
    float f = getHeight();
    if (actor != null && actor != this && paramFloat2 <= f && paramFloat2 >= f - getPadTop() && paramFloat1 >= 0.0F && paramFloat1 <= getWidth()) {
      Group group = actor;
      while (group.getParent() != this)
        group = group.getParent(); 
      if (getCell(group) != null)
        return this; 
    } 
    return actor;
  }
  
  public boolean isDragging() { return this.dragging; }
  
  public boolean isModal() { return this.isModal; }
  
  public boolean isMovable() { return this.isMovable; }
  
  public boolean isResizable() { return this.isResizable; }
  
  public void keepWithinStage() {
    if (!this.keepWithinStage)
      return; 
    Stage stage = getStage();
    if (stage == null)
      return; 
    Camera camera = stage.getCamera();
    if (camera instanceof OrthographicCamera) {
      OrthographicCamera orthographicCamera = (OrthographicCamera)camera;
      float f1 = stage.getWidth();
      float f2 = stage.getHeight();
      float f3 = getX(16);
      float f4 = camera.position.x;
      float f5 = f1 / 2.0F;
      if (f3 - f4 > f5 / orthographicCamera.zoom)
        setPosition(camera.position.x + f5 / orthographicCamera.zoom, getY(16), 16); 
      if (getX(8) - camera.position.x < -f1 / 2.0F / orthographicCamera.zoom)
        setPosition(camera.position.x - f5 / orthographicCamera.zoom, getY(8), 8); 
      f5 = getY(2);
      f3 = camera.position.y;
      f1 = f2 / 2.0F;
      if (f5 - f3 > f1 / orthographicCamera.zoom)
        setPosition(getX(2), camera.position.y + f1 / orthographicCamera.zoom, 2); 
      if (getY(4) - camera.position.y < -f2 / 2.0F / orthographicCamera.zoom)
        setPosition(getX(4), camera.position.y - f1 / orthographicCamera.zoom, 4); 
    } else if (getParent() == stage.getRoot()) {
      float f1 = stage.getWidth();
      float f2 = stage.getHeight();
      if (getX() < 0.0F)
        setX(0.0F); 
      if (getRight() > f1)
        setX(f1 - getWidth()); 
      if (getY() < 0.0F)
        setY(0.0F); 
      if (getTop() > f2)
        setY(f2 - getHeight()); 
    } 
  }
  
  public void setKeepWithinStage(boolean paramBoolean) { this.keepWithinStage = paramBoolean; }
  
  public void setModal(boolean paramBoolean) { this.isModal = paramBoolean; }
  
  public void setMovable(boolean paramBoolean) { this.isMovable = paramBoolean; }
  
  public void setResizable(boolean paramBoolean) { this.isResizable = paramBoolean; }
  
  public void setResizeBorder(int paramInt) { this.resizeBorder = paramInt; }
  
  public void setStyle(WindowStyle paramWindowStyle) {
    if (paramWindowStyle != null) {
      this.style = paramWindowStyle;
      setBackground(paramWindowStyle.background);
      this.titleLabel.setStyle(new Label.LabelStyle(paramWindowStyle.titleFont, paramWindowStyle.titleFontColor));
      invalidateHierarchy();
      return;
    } 
    throw new IllegalArgumentException("style cannot be null.");
  }
  
  public static class WindowStyle {
    public Drawable background;
    
    public Drawable stageBackground;
    
    public BitmapFont titleFont;
    
    public Color titleFontColor = new Color(1.0F, 1.0F, 1.0F, 1.0F);
    
    public WindowStyle() {}
    
    public WindowStyle(BitmapFont param1BitmapFont, Color param1Color, Drawable param1Drawable) {
      this.background = param1Drawable;
      this.titleFont = param1BitmapFont;
      this.titleFontColor.set(param1Color);
    }
    
    public WindowStyle(WindowStyle param1WindowStyle) {
      this.background = param1WindowStyle.background;
      this.titleFont = param1WindowStyle.titleFont;
      this.titleFontColor = new Color(param1WindowStyle.titleFontColor);
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/Window.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */