package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.Files;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.utils.Pool;

public class Cell<T extends Actor> extends Object implements Pool.Poolable {
  private static final Integer bottomi;
  
  private static final Integer centeri;
  
  private static Cell defaults;
  
  private static Files files;
  
  private static final Integer lefti;
  
  private static final Float onef = (zerof = Float.valueOf(0.0F)).valueOf(1.0F);
  
  private static final Integer onei = (zeroi = Integer.valueOf(0)).valueOf(1);
  
  private static final Integer righti = (lefti = (bottomi = (topi = (centeri = onei).valueOf(2)).valueOf(4)).valueOf(8)).valueOf(16);
  
  private static final Integer topi;
  
  private static final Float zerof;
  
  private static final Integer zeroi;
  
  Actor actor;
  
  float actorHeight;
  
  float actorWidth;
  
  float actorX;
  
  float actorY;
  
  Integer align;
  
  int cellAboveIndex = -1;
  
  Integer colspan;
  
  int column;
  
  float computedPadBottom;
  
  float computedPadLeft;
  
  float computedPadRight;
  
  float computedPadTop;
  
  boolean endRow;
  
  Integer expandX;
  
  Integer expandY;
  
  Float fillX;
  
  Float fillY;
  
  Value maxHeight;
  
  Value maxWidth;
  
  Value minHeight;
  
  Value minWidth;
  
  Value padBottom;
  
  Value padLeft;
  
  Value padRight;
  
  Value padTop;
  
  Value prefHeight;
  
  Value prefWidth;
  
  int row;
  
  Value spaceBottom;
  
  Value spaceLeft;
  
  Value spaceRight;
  
  Value spaceTop;
  
  private Table table;
  
  Boolean uniformX;
  
  Boolean uniformY;
  
  public Cell() {
    Cell cell = defaults();
    if (cell != null)
      set(cell); 
  }
  
  public static Cell defaults() {
    Files files1 = files;
    if (files1 == null || files1 != Gdx.files) {
      files = Gdx.files;
      defaults = new Cell();
      defaults.minWidth = Value.minWidth;
      defaults.minHeight = Value.minHeight;
      defaults.prefWidth = Value.prefWidth;
      defaults.prefHeight = Value.prefHeight;
      defaults.maxWidth = Value.maxWidth;
      defaults.maxHeight = Value.maxHeight;
      defaults.spaceTop = Value.zero;
      defaults.spaceLeft = Value.zero;
      defaults.spaceBottom = Value.zero;
      defaults.spaceRight = Value.zero;
      defaults.padTop = Value.zero;
      defaults.padLeft = Value.zero;
      defaults.padBottom = Value.zero;
      defaults.padRight = Value.zero;
      Cell cell = defaults;
      Float float = zerof;
      cell.fillX = float;
      cell.fillY = float;
      cell.align = centeri;
      Integer integer = zeroi;
      cell.expandX = integer;
      cell.expandY = integer;
      cell.colspan = onei;
      cell.uniformX = null;
      cell.uniformY = null;
    } 
    return defaults;
  }
  
  public Cell<T> align(int paramInt) {
    this.align = Integer.valueOf(paramInt);
    return this;
  }
  
  public Cell<T> bottom() {
    Integer integer = this.align;
    if (integer == null) {
      this.align = bottomi;
    } else {
      this.align = Integer.valueOf((integer.intValue() | 0x4) & 0xFFFFFFFD);
    } 
    return this;
  }
  
  public Cell<T> center() {
    this.align = centeri;
    return this;
  }
  
  void clear() {
    this.minWidth = null;
    this.minHeight = null;
    this.prefWidth = null;
    this.prefHeight = null;
    this.maxWidth = null;
    this.maxHeight = null;
    this.spaceTop = null;
    this.spaceLeft = null;
    this.spaceBottom = null;
    this.spaceRight = null;
    this.padTop = null;
    this.padLeft = null;
    this.padBottom = null;
    this.padRight = null;
    this.fillX = null;
    this.fillY = null;
    this.align = null;
    this.expandX = null;
    this.expandY = null;
    this.colspan = null;
    this.uniformX = null;
    this.uniformY = null;
  }
  
  public Cell<T> clearActor() {
    setActor(null);
    return this;
  }
  
  public Cell<T> colspan(int paramInt) {
    this.colspan = Integer.valueOf(paramInt);
    return this;
  }
  
  public Cell<T> expand() {
    Integer integer = onei;
    this.expandX = integer;
    this.expandY = integer;
    return this;
  }
  
  public Cell<T> expand(int paramInt1, int paramInt2) {
    this.expandY = (this.expandX = Integer.valueOf(paramInt1)).valueOf(paramInt2);
    return this;
  }
  
  public Cell<T> expand(boolean paramBoolean1, boolean paramBoolean2) {
    Integer integer;
    if (paramBoolean1) {
      integer = onei;
    } else {
      integer = zeroi;
    } 
    this.expandX = integer;
    if (paramBoolean2) {
      integer = onei;
    } else {
      integer = zeroi;
    } 
    this.expandY = integer;
    return this;
  }
  
  public Cell<T> expandX() {
    this.expandX = onei;
    return this;
  }
  
  public Cell<T> expandY() {
    this.expandY = onei;
    return this;
  }
  
  public Cell<T> fill() {
    Float float = onef;
    this.fillX = float;
    this.fillY = float;
    return this;
  }
  
  public Cell<T> fill(float paramFloat1, float paramFloat2) {
    this.fillY = (this.fillX = Float.valueOf(paramFloat1)).valueOf(paramFloat2);
    return this;
  }
  
  public Cell<T> fill(boolean paramBoolean) {
    Float float;
    if (paramBoolean) {
      float = onef;
    } else {
      float = zerof;
    } 
    this.fillX = float;
    if (paramBoolean) {
      float = onef;
    } else {
      float = zerof;
    } 
    this.fillY = float;
    return this;
  }
  
  public Cell<T> fill(boolean paramBoolean1, boolean paramBoolean2) {
    Float float;
    if (paramBoolean1) {
      float = onef;
    } else {
      float = zerof;
    } 
    this.fillX = float;
    if (paramBoolean2) {
      float = onef;
    } else {
      float = zerof;
    } 
    this.fillY = float;
    return this;
  }
  
  public Cell<T> fillX() {
    this.fillX = onef;
    return this;
  }
  
  public Cell<T> fillY() {
    this.fillY = onef;
    return this;
  }
  
  public T getActor() { return (T)this.actor; }
  
  public float getActorHeight() { return this.actorHeight; }
  
  public float getActorWidth() { return this.actorWidth; }
  
  public float getActorX() { return this.actorX; }
  
  public float getActorY() { return this.actorY; }
  
  public int getAlign() { return this.align.intValue(); }
  
  public int getColspan() { return this.colspan.intValue(); }
  
  public int getColumn() { return this.column; }
  
  public float getComputedPadBottom() { return this.computedPadBottom; }
  
  public float getComputedPadLeft() { return this.computedPadLeft; }
  
  public float getComputedPadRight() { return this.computedPadRight; }
  
  public float getComputedPadTop() { return this.computedPadTop; }
  
  public int getExpandX() { return this.expandX.intValue(); }
  
  public int getExpandY() { return this.expandY.intValue(); }
  
  public float getFillX() { return this.fillX.floatValue(); }
  
  public float getFillY() { return this.fillY.floatValue(); }
  
  public float getMaxHeight() { return this.maxHeight.get(this.actor); }
  
  public Value getMaxHeightValue() { return this.maxHeight; }
  
  public float getMaxWidth() { return this.maxWidth.get(this.actor); }
  
  public Value getMaxWidthValue() { return this.maxWidth; }
  
  public float getMinHeight() { return this.minHeight.get(this.actor); }
  
  public Value getMinHeightValue() { return this.minHeight; }
  
  public float getMinWidth() { return this.minWidth.get(this.actor); }
  
  public Value getMinWidthValue() { return this.minWidth; }
  
  public float getPadBottom() { return this.padBottom.get(this.actor); }
  
  public Value getPadBottomValue() { return this.padBottom; }
  
  public float getPadLeft() { return this.padLeft.get(this.actor); }
  
  public Value getPadLeftValue() { return this.padLeft; }
  
  public float getPadRight() { return this.padRight.get(this.actor); }
  
  public Value getPadRightValue() { return this.padRight; }
  
  public float getPadTop() { return this.padTop.get(this.actor); }
  
  public Value getPadTopValue() { return this.padTop; }
  
  public float getPadX() { return this.padLeft.get(this.actor) + this.padRight.get(this.actor); }
  
  public float getPadY() { return this.padTop.get(this.actor) + this.padBottom.get(this.actor); }
  
  public float getPrefHeight() { return this.prefHeight.get(this.actor); }
  
  public Value getPrefHeightValue() { return this.prefHeight; }
  
  public float getPrefWidth() { return this.prefWidth.get(this.actor); }
  
  public Value getPrefWidthValue() { return this.prefWidth; }
  
  public int getRow() { return this.row; }
  
  public float getSpaceBottom() { return this.spaceBottom.get(this.actor); }
  
  public Value getSpaceBottomValue() { return this.spaceBottom; }
  
  public float getSpaceLeft() { return this.spaceLeft.get(this.actor); }
  
  public Value getSpaceLeftValue() { return this.spaceLeft; }
  
  public float getSpaceRight() { return this.spaceRight.get(this.actor); }
  
  public Value getSpaceRightValue() { return this.spaceRight; }
  
  public float getSpaceTop() { return this.spaceTop.get(this.actor); }
  
  public Value getSpaceTopValue() { return this.spaceTop; }
  
  public Table getTable() { return this.table; }
  
  public boolean getUniformX() { return this.uniformX.booleanValue(); }
  
  public boolean getUniformY() { return this.uniformY.booleanValue(); }
  
  public Cell<T> grow() {
    Integer integer = onei;
    this.expandX = integer;
    this.expandY = integer;
    Float float = onef;
    this.fillX = float;
    this.fillY = float;
    return this;
  }
  
  public Cell<T> growX() {
    this.expandX = onei;
    this.fillX = onef;
    return this;
  }
  
  public Cell<T> growY() {
    this.expandY = onei;
    this.fillY = onef;
    return this;
  }
  
  public boolean hasActor() {
    boolean bool;
    if (this.actor != null) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public Cell<T> height(float paramFloat) {
    height(Value.Fixed.valueOf(paramFloat));
    return this;
  }
  
  public Cell<T> height(Value paramValue) {
    if (paramValue != null) {
      this.minHeight = paramValue;
      this.prefHeight = paramValue;
      this.maxHeight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("height cannot be null.");
  }
  
  public boolean isEndRow() { return this.endRow; }
  
  public Cell<T> left() {
    Integer integer = this.align;
    if (integer == null) {
      this.align = lefti;
    } else {
      this.align = Integer.valueOf((integer.intValue() | 0x8) & 0xFFFFFFEF);
    } 
    return this;
  }
  
  public Cell<T> maxHeight(float paramFloat) {
    this.maxHeight = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Cell<T> maxHeight(Value paramValue) {
    if (paramValue != null) {
      this.maxHeight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("maxHeight cannot be null.");
  }
  
  public Cell<T> maxSize(float paramFloat) {
    maxSize(Value.Fixed.valueOf(paramFloat));
    return this;
  }
  
  public Cell<T> maxSize(float paramFloat1, float paramFloat2) {
    maxSize(Value.Fixed.valueOf(paramFloat1), Value.Fixed.valueOf(paramFloat2));
    return this;
  }
  
  public Cell<T> maxSize(Value paramValue) {
    if (paramValue != null) {
      this.maxWidth = paramValue;
      this.maxHeight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("size cannot be null.");
  }
  
  public Cell<T> maxSize(Value paramValue1, Value paramValue2) {
    if (paramValue1 != null) {
      if (paramValue2 != null) {
        this.maxWidth = paramValue1;
        this.maxHeight = paramValue2;
        return this;
      } 
      throw new IllegalArgumentException("height cannot be null.");
    } 
    throw new IllegalArgumentException("width cannot be null.");
  }
  
  public Cell<T> maxWidth(float paramFloat) {
    this.maxWidth = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Cell<T> maxWidth(Value paramValue) {
    if (paramValue != null) {
      this.maxWidth = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("maxWidth cannot be null.");
  }
  
  void merge(Cell paramCell) {
    if (paramCell == null)
      return; 
    Value value = paramCell.minWidth;
    if (value != null)
      this.minWidth = value; 
    value = paramCell.minHeight;
    if (value != null)
      this.minHeight = value; 
    value = paramCell.prefWidth;
    if (value != null)
      this.prefWidth = value; 
    value = paramCell.prefHeight;
    if (value != null)
      this.prefHeight = value; 
    value = paramCell.maxWidth;
    if (value != null)
      this.maxWidth = value; 
    value = paramCell.maxHeight;
    if (value != null)
      this.maxHeight = value; 
    value = paramCell.spaceTop;
    if (value != null)
      this.spaceTop = value; 
    value = paramCell.spaceLeft;
    if (value != null)
      this.spaceLeft = value; 
    value = paramCell.spaceBottom;
    if (value != null)
      this.spaceBottom = value; 
    value = paramCell.spaceRight;
    if (value != null)
      this.spaceRight = value; 
    value = paramCell.padTop;
    if (value != null)
      this.padTop = value; 
    value = paramCell.padLeft;
    if (value != null)
      this.padLeft = value; 
    value = paramCell.padBottom;
    if (value != null)
      this.padBottom = value; 
    value = paramCell.padRight;
    if (value != null)
      this.padRight = value; 
    Float float = paramCell.fillX;
    if (float != null)
      this.fillX = float; 
    float = paramCell.fillY;
    if (float != null)
      this.fillY = float; 
    Integer integer = paramCell.align;
    if (integer != null)
      this.align = integer; 
    integer = paramCell.expandX;
    if (integer != null)
      this.expandX = integer; 
    integer = paramCell.expandY;
    if (integer != null)
      this.expandY = integer; 
    integer = paramCell.colspan;
    if (integer != null)
      this.colspan = integer; 
    Boolean bool2 = paramCell.uniformX;
    if (bool2 != null)
      this.uniformX = bool2; 
    Boolean bool1 = paramCell.uniformY;
    if (bool1 != null)
      this.uniformY = bool1; 
  }
  
  public Cell<T> minHeight(float paramFloat) {
    this.minHeight = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Cell<T> minHeight(Value paramValue) {
    if (paramValue != null) {
      this.minHeight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("minHeight cannot be null.");
  }
  
  public Cell<T> minSize(float paramFloat) {
    minSize(Value.Fixed.valueOf(paramFloat));
    return this;
  }
  
  public Cell<T> minSize(float paramFloat1, float paramFloat2) {
    minSize(Value.Fixed.valueOf(paramFloat1), Value.Fixed.valueOf(paramFloat2));
    return this;
  }
  
  public Cell<T> minSize(Value paramValue) {
    if (paramValue != null) {
      this.minWidth = paramValue;
      this.minHeight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("size cannot be null.");
  }
  
  public Cell<T> minSize(Value paramValue1, Value paramValue2) {
    if (paramValue1 != null) {
      if (paramValue2 != null) {
        this.minWidth = paramValue1;
        this.minHeight = paramValue2;
        return this;
      } 
      throw new IllegalArgumentException("height cannot be null.");
    } 
    throw new IllegalArgumentException("width cannot be null.");
  }
  
  public Cell<T> minWidth(float paramFloat) {
    this.minWidth = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Cell<T> minWidth(Value paramValue) {
    if (paramValue != null) {
      this.minWidth = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("minWidth cannot be null.");
  }
  
  public Cell<T> pad(float paramFloat) {
    pad(Value.Fixed.valueOf(paramFloat));
    return this;
  }
  
  public Cell<T> pad(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    pad(Value.Fixed.valueOf(paramFloat1), Value.Fixed.valueOf(paramFloat2), Value.Fixed.valueOf(paramFloat3), Value.Fixed.valueOf(paramFloat4));
    return this;
  }
  
  public Cell<T> pad(Value paramValue) {
    if (paramValue != null) {
      this.padTop = paramValue;
      this.padLeft = paramValue;
      this.padBottom = paramValue;
      this.padRight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("pad cannot be null.");
  }
  
  public Cell<T> pad(Value paramValue1, Value paramValue2, Value paramValue3, Value paramValue4) {
    if (paramValue1 != null) {
      if (paramValue2 != null) {
        if (paramValue3 != null) {
          if (paramValue4 != null) {
            this.padTop = paramValue1;
            this.padLeft = paramValue2;
            this.padBottom = paramValue3;
            this.padRight = paramValue4;
            return this;
          } 
          throw new IllegalArgumentException("right cannot be null.");
        } 
        throw new IllegalArgumentException("bottom cannot be null.");
      } 
      throw new IllegalArgumentException("left cannot be null.");
    } 
    throw new IllegalArgumentException("top cannot be null.");
  }
  
  public Cell<T> padBottom(float paramFloat) {
    this.padBottom = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Cell<T> padBottom(Value paramValue) {
    if (paramValue != null) {
      this.padBottom = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("padBottom cannot be null.");
  }
  
  public Cell<T> padLeft(float paramFloat) {
    this.padLeft = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Cell<T> padLeft(Value paramValue) {
    if (paramValue != null) {
      this.padLeft = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("padLeft cannot be null.");
  }
  
  public Cell<T> padRight(float paramFloat) {
    this.padRight = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Cell<T> padRight(Value paramValue) {
    if (paramValue != null) {
      this.padRight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("padRight cannot be null.");
  }
  
  public Cell<T> padTop(float paramFloat) {
    this.padTop = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Cell<T> padTop(Value paramValue) {
    if (paramValue != null) {
      this.padTop = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("padTop cannot be null.");
  }
  
  public Cell<T> prefHeight(float paramFloat) {
    this.prefHeight = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Cell<T> prefHeight(Value paramValue) {
    if (paramValue != null) {
      this.prefHeight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("prefHeight cannot be null.");
  }
  
  public Cell<T> prefSize(float paramFloat) {
    prefSize(Value.Fixed.valueOf(paramFloat));
    return this;
  }
  
  public Cell<T> prefSize(float paramFloat1, float paramFloat2) {
    prefSize(Value.Fixed.valueOf(paramFloat1), Value.Fixed.valueOf(paramFloat2));
    return this;
  }
  
  public Cell<T> prefSize(Value paramValue) {
    if (paramValue != null) {
      this.prefWidth = paramValue;
      this.prefHeight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("size cannot be null.");
  }
  
  public Cell<T> prefSize(Value paramValue1, Value paramValue2) {
    if (paramValue1 != null) {
      if (paramValue2 != null) {
        this.prefWidth = paramValue1;
        this.prefHeight = paramValue2;
        return this;
      } 
      throw new IllegalArgumentException("height cannot be null.");
    } 
    throw new IllegalArgumentException("width cannot be null.");
  }
  
  public Cell<T> prefWidth(float paramFloat) {
    this.prefWidth = Value.Fixed.valueOf(paramFloat);
    return this;
  }
  
  public Cell<T> prefWidth(Value paramValue) {
    if (paramValue != null) {
      this.prefWidth = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("prefWidth cannot be null.");
  }
  
  public void reset() {
    this.actor = null;
    this.table = null;
    this.endRow = false;
    this.cellAboveIndex = -1;
    set(defaults());
  }
  
  public Cell<T> right() {
    Integer integer = this.align;
    if (integer == null) {
      this.align = righti;
    } else {
      this.align = Integer.valueOf((integer.intValue() | 0x10) & 0xFFFFFFF7);
    } 
    return this;
  }
  
  public void row() { this.table.row(); }
  
  void set(Cell paramCell) {
    this.minWidth = paramCell.minWidth;
    this.minHeight = paramCell.minHeight;
    this.prefWidth = paramCell.prefWidth;
    this.prefHeight = paramCell.prefHeight;
    this.maxWidth = paramCell.maxWidth;
    this.maxHeight = paramCell.maxHeight;
    this.spaceTop = paramCell.spaceTop;
    this.spaceLeft = paramCell.spaceLeft;
    this.spaceBottom = paramCell.spaceBottom;
    this.spaceRight = paramCell.spaceRight;
    this.padTop = paramCell.padTop;
    this.padLeft = paramCell.padLeft;
    this.padBottom = paramCell.padBottom;
    this.padRight = paramCell.padRight;
    this.fillX = paramCell.fillX;
    this.fillY = paramCell.fillY;
    this.align = paramCell.align;
    this.expandX = paramCell.expandX;
    this.expandY = paramCell.expandY;
    this.colspan = paramCell.colspan;
    this.uniformX = paramCell.uniformX;
    this.uniformY = paramCell.uniformY;
  }
  
  public <A extends Actor> Cell<A> setActor(A paramA) {
    Actor actor1 = this.actor;
    if (actor1 != paramA) {
      if (actor1 != null && actor1.getParent() == this.table)
        this.actor.remove(); 
      this.actor = paramA;
      if (paramA != null)
        this.table.addActor(paramA); 
    } 
    return this;
  }
  
  public void setActorBounds(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.actorX = paramFloat1;
    this.actorY = paramFloat2;
    this.actorWidth = paramFloat3;
    this.actorHeight = paramFloat4;
  }
  
  public void setActorHeight(float paramFloat) { this.actorHeight = paramFloat; }
  
  public void setActorWidth(float paramFloat) { this.actorWidth = paramFloat; }
  
  public void setActorX(float paramFloat) { this.actorX = paramFloat; }
  
  public void setActorY(float paramFloat) { this.actorY = paramFloat; }
  
  public void setTable(Table paramTable) { this.table = paramTable; }
  
  public Cell<T> size(float paramFloat) {
    size(Value.Fixed.valueOf(paramFloat));
    return this;
  }
  
  public Cell<T> size(float paramFloat1, float paramFloat2) {
    size(Value.Fixed.valueOf(paramFloat1), Value.Fixed.valueOf(paramFloat2));
    return this;
  }
  
  public Cell<T> size(Value paramValue) {
    if (paramValue != null) {
      this.minWidth = paramValue;
      this.minHeight = paramValue;
      this.prefWidth = paramValue;
      this.prefHeight = paramValue;
      this.maxWidth = paramValue;
      this.maxHeight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("size cannot be null.");
  }
  
  public Cell<T> size(Value paramValue1, Value paramValue2) {
    if (paramValue1 != null) {
      if (paramValue2 != null) {
        this.minWidth = paramValue1;
        this.minHeight = paramValue2;
        this.prefWidth = paramValue1;
        this.prefHeight = paramValue2;
        this.maxWidth = paramValue1;
        this.maxHeight = paramValue2;
        return this;
      } 
      throw new IllegalArgumentException("height cannot be null.");
    } 
    throw new IllegalArgumentException("width cannot be null.");
  }
  
  public Cell<T> space(float paramFloat) {
    if (paramFloat >= 0.0F) {
      space(Value.Fixed.valueOf(paramFloat));
      return this;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("space cannot be < 0: ");
    stringBuilder.append(paramFloat);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public Cell<T> space(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    if (paramFloat1 >= 0.0F) {
      if (paramFloat2 >= 0.0F) {
        if (paramFloat3 >= 0.0F) {
          if (paramFloat4 >= 0.0F) {
            space(Value.Fixed.valueOf(paramFloat1), Value.Fixed.valueOf(paramFloat2), Value.Fixed.valueOf(paramFloat3), Value.Fixed.valueOf(paramFloat4));
            return this;
          } 
          StringBuilder stringBuilder3 = new StringBuilder();
          stringBuilder3.append("right cannot be < 0: ");
          stringBuilder3.append(paramFloat4);
          throw new IllegalArgumentException(stringBuilder3.toString());
        } 
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("bottom cannot be < 0: ");
        stringBuilder2.append(paramFloat3);
        throw new IllegalArgumentException(stringBuilder2.toString());
      } 
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append("left cannot be < 0: ");
      stringBuilder1.append(paramFloat2);
      throw new IllegalArgumentException(stringBuilder1.toString());
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("top cannot be < 0: ");
    stringBuilder.append(paramFloat1);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public Cell<T> space(Value paramValue) {
    if (paramValue != null) {
      this.spaceTop = paramValue;
      this.spaceLeft = paramValue;
      this.spaceBottom = paramValue;
      this.spaceRight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("space cannot be null.");
  }
  
  public Cell<T> space(Value paramValue1, Value paramValue2, Value paramValue3, Value paramValue4) {
    if (paramValue1 != null) {
      if (paramValue2 != null) {
        if (paramValue3 != null) {
          if (paramValue4 != null) {
            this.spaceTop = paramValue1;
            this.spaceLeft = paramValue2;
            this.spaceBottom = paramValue3;
            this.spaceRight = paramValue4;
            return this;
          } 
          throw new IllegalArgumentException("right cannot be null.");
        } 
        throw new IllegalArgumentException("bottom cannot be null.");
      } 
      throw new IllegalArgumentException("left cannot be null.");
    } 
    throw new IllegalArgumentException("top cannot be null.");
  }
  
  public Cell<T> spaceBottom(float paramFloat) {
    if (paramFloat >= 0.0F) {
      this.spaceBottom = Value.Fixed.valueOf(paramFloat);
      return this;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("spaceBottom cannot be < 0: ");
    stringBuilder.append(paramFloat);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public Cell<T> spaceBottom(Value paramValue) {
    if (paramValue != null) {
      this.spaceBottom = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("spaceBottom cannot be null.");
  }
  
  public Cell<T> spaceLeft(float paramFloat) {
    if (paramFloat >= 0.0F) {
      this.spaceLeft = Value.Fixed.valueOf(paramFloat);
      return this;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("spaceLeft cannot be < 0: ");
    stringBuilder.append(paramFloat);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public Cell<T> spaceLeft(Value paramValue) {
    if (paramValue != null) {
      this.spaceLeft = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("spaceLeft cannot be null.");
  }
  
  public Cell<T> spaceRight(float paramFloat) {
    if (paramFloat >= 0.0F) {
      this.spaceRight = Value.Fixed.valueOf(paramFloat);
      return this;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("spaceRight cannot be < 0: ");
    stringBuilder.append(paramFloat);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public Cell<T> spaceRight(Value paramValue) {
    if (paramValue != null) {
      this.spaceRight = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("spaceRight cannot be null.");
  }
  
  public Cell<T> spaceTop(float paramFloat) {
    if (paramFloat >= 0.0F) {
      this.spaceTop = Value.Fixed.valueOf(paramFloat);
      return this;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("spaceTop cannot be < 0: ");
    stringBuilder.append(paramFloat);
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public Cell<T> spaceTop(Value paramValue) {
    if (paramValue != null) {
      this.spaceTop = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("spaceTop cannot be null.");
  }
  
  public String toString() {
    String str = this.actor;
    if (str != null) {
      String str1 = str.toString();
    } else {
      str = super.toString();
    } 
    return str;
  }
  
  public Cell<T> top() {
    Integer integer = this.align;
    if (integer == null) {
      this.align = topi;
    } else {
      this.align = Integer.valueOf((integer.intValue() | 0x2) & 0xFFFFFFFB);
    } 
    return this;
  }
  
  public Cell<T> uniform() {
    this.uniformX = Boolean.TRUE;
    this.uniformY = Boolean.TRUE;
    return this;
  }
  
  public Cell<T> uniform(boolean paramBoolean) {
    this.uniformY = (this.uniformX = Boolean.valueOf(paramBoolean)).valueOf(paramBoolean);
    return this;
  }
  
  public Cell<T> uniform(boolean paramBoolean1, boolean paramBoolean2) {
    this.uniformY = (this.uniformX = Boolean.valueOf(paramBoolean1)).valueOf(paramBoolean2);
    return this;
  }
  
  public Cell<T> uniformX() {
    this.uniformX = Boolean.TRUE;
    return this;
  }
  
  public Cell<T> uniformY() {
    this.uniformY = Boolean.TRUE;
    return this;
  }
  
  public Cell<T> width(float paramFloat) {
    width(Value.Fixed.valueOf(paramFloat));
    return this;
  }
  
  public Cell<T> width(Value paramValue) {
    if (paramValue != null) {
      this.minWidth = paramValue;
      this.prefWidth = paramValue;
      this.maxWidth = paramValue;
      return this;
    } 
    throw new IllegalArgumentException("width cannot be null.");
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/Cell.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */