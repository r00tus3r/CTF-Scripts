package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.utils.ClickListener;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;
import com.badlogic.gdx.scenes.scene2d.utils.Selection;
import com.badlogic.gdx.scenes.scene2d.utils.UIUtils;
import com.badlogic.gdx.utils.Array;

public class Tree<N extends Tree.Node, V> extends WidgetGroup {
  private static final Vector2 tmp = new Vector2();
  
  private ClickListener clickListener;
  
  private N foundNode;
  
  float iconSpacingLeft = 2.0F;
  
  float iconSpacingRight = 2.0F;
  
  float indentSpacing;
  
  private N overNode;
  
  float paddingLeft;
  
  float paddingRight;
  
  private float prefHeight;
  
  private float prefWidth;
  
  N rangeStart;
  
  final Array<N> rootNodes = new Array();
  
  final Selection<N> selection = new Selection<N>() {
      protected void changed() {
        int i = size();
        if (i != 0) {
          if (i == 1)
            Tree.this.rangeStart = (Tree.Node)first(); 
        } else {
          Tree.this.rangeStart = null;
        } 
      }
    };
  
  private boolean sizeInvalid = true;
  
  TreeStyle style;
  
  float ySpacing = 4.0F;
  
  public Tree(Skin paramSkin) { this((TreeStyle)paramSkin.get(TreeStyle.class)); }
  
  public Tree(Skin paramSkin, String paramString) { this((TreeStyle)paramSkin.get(paramString, TreeStyle.class)); }
  
  public Tree(TreeStyle paramTreeStyle) {
    this.selection.setActor(this);
    this.selection.setMultiple(true);
    setStyle(paramTreeStyle);
    initialize();
  }
  
  static void collapseAll(Array<? extends Node> paramArray) {
    int i = paramArray.size;
    for (byte b = 0; b < i; b++) {
      Node node = (Node)paramArray.get(b);
      node.setExpanded(false);
      collapseAll(node.children);
    } 
  }
  
  private void computeSize() {
    this.sizeInvalid = false;
    this.prefWidth = plusMinusWidth();
    this.prefHeight = 0.0F;
    computeSize(this.rootNodes, 0.0F, this.prefWidth);
    this.prefWidth += this.paddingLeft + this.paddingRight;
  }
  
  private void computeSize(Array<N> paramArray, float paramFloat1, float paramFloat2) {
    float f1 = this.ySpacing;
    float f2 = this.iconSpacingLeft;
    float f3 = this.iconSpacingRight;
    int i = paramArray.size;
    for (byte b = 0; b < i; b++) {
      Node node = (Node)paramArray.get(b);
      float f4 = paramFloat1 + paramFloat2;
      Layout layout = node.actor;
      if (layout instanceof Layout) {
        layout = (Layout)layout;
        f4 += layout.getPrefWidth();
        node.height = layout.getPrefHeight();
      } else {
        f4 += layout.getWidth();
        node.height = layout.getHeight();
      } 
      float f5 = f4;
      if (node.icon != null) {
        f5 = f4 + node.icon.getMinWidth() + f2 + f3;
        node.height = Math.max(node.height, node.icon.getMinHeight());
      } 
      this.prefWidth = Math.max(this.prefWidth, f5);
      this.prefHeight += node.height + f1;
      if (node.expanded)
        computeSize(node.children, this.indentSpacing + paramFloat1, paramFloat2); 
    } 
  }
  
  private void draw(Batch paramBatch, Array<N> paramArray, float paramFloat1, float paramFloat2) {
    float f3;
    float f2;
    Rectangle rectangle = getCullingArea();
    if (rectangle != null) {
      float f = rectangle.y;
      f2 = rectangle.height;
      f3 = f;
      f2 += f;
    } else {
      f3 = 0.0F;
      f2 = 0.0F;
    } 
    TreeStyle treeStyle = this.style;
    float f4 = getX();
    float f5 = getY();
    float f6 = f4 + paramFloat1;
    float f1 = f6 + paramFloat2 + this.iconSpacingLeft;
    int i = paramArray.size;
    for (byte b = 0; b < i; b++) {
      Node node = (Node)paramArray.get(b);
      Actor actor = node.actor;
      float f7 = actor.getY();
      float f8 = node.height;
      if (rectangle == null || (f7 + f8 >= f3 && f7 <= f2)) {
        if (this.selection.contains(node) && treeStyle.selection != null) {
          drawSelection(node, treeStyle.selection, paramBatch, f4, f5 + f7 - this.ySpacing / 2.0F, getWidth(), f8 + this.ySpacing);
        } else {
          Node node2 = node;
          if (node2 == this.overNode && treeStyle.over != null)
            drawOver(node2, treeStyle.over, paramBatch, f4, f5 + f7 - this.ySpacing / 2.0F, getWidth(), f8 + this.ySpacing); 
        } 
        Node node1 = node;
        if (node1.icon != null) {
          float f = Math.round((f8 - node1.icon.getMinHeight()) / 2.0F);
          paramBatch.setColor(actor.getColor());
          drawIcon(node1, node1.icon, paramBatch, f1, f5 + f7 + f);
          paramBatch.setColor(1.0F, 1.0F, 1.0F, 1.0F);
        } 
        if (node1.children.size > 0) {
          Drawable drawable = getExpandIcon(node1, f1);
          drawExpandIcon(node1, drawable, paramBatch, f6, f5 + f7 + Math.round((f8 - drawable.getMinHeight()) / 2.0F));
        } 
      } else if (f7 < f3) {
        return;
      } 
      if (node.expanded && node.children.size > 0)
        draw(paramBatch, node.children, paramFloat1 + this.indentSpacing, paramFloat2); 
    } 
  }
  
  static void expandAll(Array<? extends Node> paramArray) {
    int i = paramArray.size;
    for (byte b = 0; b < i; b++)
      ((Node)paramArray.get(b)).expandAll(); 
  }
  
  static boolean findExpandedValues(Array<? extends Node> paramArray1, Array paramArray2) {
    int i = paramArray1.size;
    for (byte b = 0; b < i; b++) {
      Node node = (Node)paramArray1.get(b);
      if (node.expanded && !findExpandedValues(node.children, paramArray2))
        paramArray2.add(node.value); 
    } 
    return false;
  }
  
  static Node findNode(Array<? extends Node> paramArray, Object paramObject) {
    int i = paramArray.size;
    byte b1 = 0;
    byte b2;
    for (b2 = 0; b2 < i; b2++) {
      Node node = (Node)paramArray.get(b2);
      if (paramObject.equals(node.value))
        return node; 
    } 
    i = paramArray.size;
    for (b2 = b1; b2 < i; b2++) {
      Node node = findNode(((Node)paramArray.get(b2)).children, paramObject);
      if (node != null)
        return node; 
    } 
    return null;
  }
  
  private float getNodeAt(Array<N> paramArray, float paramFloat1, float paramFloat2) {
    int i = paramArray.size;
    for (byte b = 0; b < i; b++) {
      Node node = (Node)paramArray.get(b);
      float f = node.height;
      paramFloat2 -= node.getHeight() - f;
      if (paramFloat1 >= paramFloat2 - f - this.ySpacing && paramFloat1 < paramFloat2) {
        this.foundNode = node;
        return -1.0F;
      } 
      f = paramFloat2 - f + this.ySpacing;
      paramFloat2 = f;
      if (node.expanded) {
        f = getNodeAt(node.children, paramFloat1, f);
        paramFloat2 = f;
        if (f == -1.0F)
          return -1.0F; 
      } 
    } 
    return paramFloat2;
  }
  
  private void initialize() {
    ClickListener clickListener1 = new ClickListener() {
        public void clicked(InputEvent param1InputEvent, float param1Float1, float param1Float2) {
          Tree tree = Tree.this.getNodeAt(param1Float2);
          if (tree == null)
            return; 
          if (tree != Tree.this.getNodeAt(getTouchDownY()))
            return; 
          if (Tree.this.selection.getMultiple() && Tree.this.selection.notEmpty() && UIUtils.shift()) {
            if (Tree.this.rangeStart == null)
              Tree.this.rangeStart = tree; 
            Tree.Node node = Tree.this.rangeStart;
            if (!UIUtils.ctrl())
              Tree.this.selection.clear(); 
            param1Float2 = node.actor.getY();
            param1Float1 = tree.actor.getY();
            if (param1Float2 > param1Float1) {
              Tree tree1 = Tree.this;
              tree1.selectNodes(tree1.rootNodes, param1Float1, param1Float2);
            } else {
              tree = Tree.this;
              tree.selectNodes(tree.rootNodes, param1Float2, param1Float1);
              Tree.this.selection.items().orderedItems().reverse();
            } 
            Tree.this.selection.fireChangeEvent();
            Tree.this.rangeStart = node;
            return;
          } 
          if (tree.children.size > 0 && (!Tree.this.selection.getMultiple() || !UIUtils.ctrl())) {
            float f = tree.actor.getX();
            param1Float2 = f;
            if (tree.icon != null)
              param1Float2 = f - Tree.this.iconSpacingRight + tree.icon.getMinWidth(); 
            if (param1Float1 < param1Float2) {
              tree.setExpanded(tree.expanded ^ true);
              return;
            } 
          } 
          if (!tree.isSelectable())
            return; 
          Tree.this.selection.choose(tree);
          if (!Tree.this.selection.isEmpty())
            Tree.this.rangeStart = tree; 
        }
        
        public void enter(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int, Actor param1Actor) {
          super.enter(param1InputEvent, param1Float1, param1Float2, param1Int, param1Actor);
          Tree tree = Tree.this;
          tree.setOverNode(tree.getNodeAt(param1Float2));
        }
        
        public void exit(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int, Actor param1Actor) {
          super.exit(param1InputEvent, param1Float1, param1Float2, param1Int, param1Actor);
          if (param1Actor == null || !param1Actor.isDescendantOf(Tree.this))
            Tree.this.setOverNode(null); 
        }
        
        public boolean mouseMoved(InputEvent param1InputEvent, float param1Float1, float param1Float2) {
          Tree tree = Tree.this;
          tree.setOverNode(tree.getNodeAt(param1Float2));
          return false;
        }
      };
    this.clickListener = clickListener1;
    addListener(clickListener1);
  }
  
  private float layout(Array<N> paramArray, float paramFloat1, float paramFloat2, float paramFloat3) {
    float f1 = this.ySpacing;
    float f2 = this.iconSpacingLeft;
    float f3 = this.iconSpacingRight;
    int i = paramArray.size;
    for (byte b = 0; b < i; b++) {
      Node node = (Node)paramArray.get(b);
      float f4 = paramFloat1 + paramFloat3;
      float f5 = f4;
      if (node.icon != null)
        f5 = f4 + node.icon.getMinWidth() + f2 + f3; 
      if (node.actor instanceof Layout)
        ((Layout)node.actor).pack(); 
      paramFloat2 -= node.getHeight();
      node.actor.setPosition(f5, paramFloat2);
      f5 = paramFloat2 - f1;
      paramFloat2 = f5;
      if (node.expanded)
        paramFloat2 = layout(node.children, this.indentSpacing + paramFloat1, f5, paramFloat3); 
    } 
    return paramFloat2;
  }
  
  private float plusMinusWidth() {
    float f1 = Math.max(this.style.plus.getMinWidth(), this.style.minus.getMinWidth());
    float f2 = f1;
    if (this.style.plusOver != null)
      f2 = Math.max(f1, this.style.plusOver.getMinWidth()); 
    f1 = f2;
    if (this.style.minusOver != null)
      f1 = Math.max(f2, this.style.minusOver.getMinWidth()); 
    return f1;
  }
  
  public void add(N paramN) { insert(this.rootNodes.size, paramN); }
  
  public void clearChildren() {
    super.clearChildren();
    setOverNode(null);
    this.rootNodes.clear();
    this.selection.clear();
  }
  
  public void collapseAll() { collapseAll(this.rootNodes); }
  
  public void draw(Batch paramBatch, float paramFloat) {
    drawBackground(paramBatch, paramFloat);
    Color color = getColor();
    paramBatch.setColor(color.r, color.g, color.b, color.a * paramFloat);
    draw(paramBatch, this.rootNodes, this.paddingLeft, plusMinusWidth());
    super.draw(paramBatch, paramFloat);
  }
  
  protected void drawBackground(Batch paramBatch, float paramFloat) {
    if (this.style.background != null) {
      Color color = getColor();
      paramBatch.setColor(color.r, color.g, color.b, color.a * paramFloat);
      this.style.background.draw(paramBatch, getX(), getY(), getWidth(), getHeight());
    } 
  }
  
  protected void drawExpandIcon(N paramN, Drawable paramDrawable, Batch paramBatch, float paramFloat1, float paramFloat2) { paramDrawable.draw(paramBatch, paramFloat1, paramFloat2, paramDrawable.getMinWidth(), paramDrawable.getMinHeight()); }
  
  protected void drawIcon(N paramN, Drawable paramDrawable, Batch paramBatch, float paramFloat1, float paramFloat2) { paramDrawable.draw(paramBatch, paramFloat1, paramFloat2, paramDrawable.getMinWidth(), paramDrawable.getMinHeight()); }
  
  protected void drawOver(N paramN, Drawable paramDrawable, Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { paramDrawable.draw(paramBatch, paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  protected void drawSelection(N paramN, Drawable paramDrawable, Batch paramBatch, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { paramDrawable.draw(paramBatch, paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void expandAll() { expandAll(this.rootNodes); }
  
  public void findExpandedValues(Array<V> paramArray) { findExpandedValues(this.rootNodes, paramArray); }
  
  public N findNode(V paramV) {
    if (paramV != null)
      return (N)findNode(this.rootNodes, paramV); 
    throw new IllegalArgumentException("value cannot be null.");
  }
  
  public ClickListener getClickListener() { return this.clickListener; }
  
  protected Drawable getExpandIcon(N paramN, float paramFloat) { // Byte code:
    //   0: aload_1
    //   1: aload_0
    //   2: getfield overNode : Lcom/badlogic/gdx/scenes/scene2d/ui/Tree$Node;
    //   5: if_acmpne -> 86
    //   8: getstatic com/badlogic/gdx/Gdx.app : Lcom/badlogic/gdx/Application;
    //   11: invokeinterface getType : ()Lcom/badlogic/gdx/Application$ApplicationType;
    //   16: getstatic com/badlogic/gdx/Application$ApplicationType.Desktop : Lcom/badlogic/gdx/Application$ApplicationType;
    //   19: if_acmpne -> 86
    //   22: aload_0
    //   23: getfield selection : Lcom/badlogic/gdx/scenes/scene2d/utils/Selection;
    //   26: invokevirtual getMultiple : ()Z
    //   29: ifeq -> 44
    //   32: invokestatic ctrl : ()Z
    //   35: ifne -> 86
    //   38: invokestatic shift : ()Z
    //   41: ifne -> 86
    //   44: aload_0
    //   45: getstatic com/badlogic/gdx/scenes/scene2d/ui/Tree.tmp : Lcom/badlogic/gdx/math/Vector2;
    //   48: getstatic com/badlogic/gdx/Gdx.input : Lcom/badlogic/gdx/Input;
    //   51: invokeinterface getX : ()I
    //   56: i2f
    //   57: fconst_0
    //   58: invokevirtual set : (FF)Lcom/badlogic/gdx/math/Vector2;
    //   61: invokevirtual screenToLocalCoordinates : (Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    //   64: getfield x : F
    //   67: fstore_3
    //   68: fload_3
    //   69: fconst_0
    //   70: fcmpl
    //   71: iflt -> 86
    //   74: fload_3
    //   75: fload_2
    //   76: fcmpg
    //   77: ifge -> 86
    //   80: iconst_1
    //   81: istore #4
    //   83: goto -> 89
    //   86: iconst_0
    //   87: istore #4
    //   89: iload #4
    //   91: ifeq -> 130
    //   94: aload_1
    //   95: getfield expanded : Z
    //   98: ifeq -> 113
    //   101: aload_0
    //   102: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/Tree$TreeStyle;
    //   105: getfield minusOver : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   108: astore #5
    //   110: goto -> 122
    //   113: aload_0
    //   114: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/Tree$TreeStyle;
    //   117: getfield plusOver : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   120: astore #5
    //   122: aload #5
    //   124: ifnull -> 130
    //   127: aload #5
    //   129: areturn
    //   130: aload_1
    //   131: getfield expanded : Z
    //   134: ifeq -> 148
    //   137: aload_0
    //   138: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/Tree$TreeStyle;
    //   141: getfield minus : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   144: astore_1
    //   145: goto -> 156
    //   148: aload_0
    //   149: getfield style : Lcom/badlogic/gdx/scenes/scene2d/ui/Tree$TreeStyle;
    //   152: getfield plus : Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    //   155: astore_1
    //   156: aload_1
    //   157: areturn }
  
  public float getIndentSpacing() { return this.indentSpacing; }
  
  public N getNodeAt(float paramFloat) {
    this.foundNode = null;
    getNodeAt(this.rootNodes, paramFloat, getHeight());
    return (N)this.foundNode;
  }
  
  public Array<N> getNodes() { return this.rootNodes; }
  
  public N getOverNode() { return (N)this.overNode; }
  
  public V getOverValue() {
    Node node = this.overNode;
    return (node == null) ? null : (V)node.getValue();
  }
  
  public float getPrefHeight() {
    if (this.sizeInvalid)
      computeSize(); 
    return this.prefHeight;
  }
  
  public float getPrefWidth() {
    if (this.sizeInvalid)
      computeSize(); 
    return this.prefWidth;
  }
  
  public Array<N> getRootNodes() { return this.rootNodes; }
  
  public N getSelectedNode() { return (N)(Node)this.selection.first(); }
  
  public V getSelectedValue() {
    Object object = (Node)this.selection.first();
    if (object == null) {
      object = null;
    } else {
      object = object.getValue();
    } 
    return (V)object;
  }
  
  public Selection<N> getSelection() { return this.selection; }
  
  public TreeStyle getStyle() { return this.style; }
  
  public float getYSpacing() { return this.ySpacing; }
  
  public void insert(int paramInt, N paramN) {
    int i = this.rootNodes.indexOf(paramN, true);
    int j = paramInt;
    if (i != -1) {
      j = paramInt;
      if (i < paramInt)
        j = paramInt - 1; 
    } 
    remove(paramN);
    paramN.parent = null;
    this.rootNodes.insert(j, paramN);
    paramN.addToTree(this);
    invalidateHierarchy();
  }
  
  public void invalidate() {
    super.invalidate();
    this.sizeInvalid = true;
  }
  
  public void layout() {
    if (this.sizeInvalid)
      computeSize(); 
    layout(this.rootNodes, this.paddingLeft, getHeight() - this.ySpacing / 2.0F, plusMinusWidth());
  }
  
  public void remove(N paramN) {
    if (paramN.parent != null) {
      paramN.parent.remove(paramN);
      return;
    } 
    this.rootNodes.removeValue(paramN, true);
    paramN.removeFromTree(this);
    invalidateHierarchy();
  }
  
  public void restoreExpandedValues(Array<V> paramArray) {
    int i = paramArray.size;
    for (byte b = 0; b < i; b++) {
      Node node = findNode(paramArray.get(b));
      if (node != null) {
        node.setExpanded(true);
        node.expandTo();
      } 
    } 
  }
  
  void selectNodes(Array<N> paramArray, float paramFloat1, float paramFloat2) {
    int i = paramArray.size;
    for (byte b = 0; b < i; b++) {
      Node node = (Node)paramArray.get(b);
      if (node.actor.getY() < paramFloat1)
        break; 
      if (node.isSelectable()) {
        if (node.actor.getY() <= paramFloat2)
          this.selection.add(node); 
        if (node.expanded)
          selectNodes(node.children, paramFloat1, paramFloat2); 
      } 
    } 
  }
  
  public void setIconSpacing(float paramFloat1, float paramFloat2) {
    this.iconSpacingLeft = paramFloat1;
    this.iconSpacingRight = paramFloat2;
  }
  
  public void setIndentSpacing(float paramFloat) { this.indentSpacing = paramFloat; }
  
  public void setOverNode(N paramN) { this.overNode = paramN; }
  
  public void setPadding(float paramFloat) {
    this.paddingLeft = paramFloat;
    this.paddingRight = paramFloat;
  }
  
  public void setPadding(float paramFloat1, float paramFloat2) {
    this.paddingLeft = paramFloat1;
    this.paddingRight = paramFloat2;
  }
  
  public void setStyle(TreeStyle paramTreeStyle) {
    this.style = paramTreeStyle;
    if (this.indentSpacing == 0.0F)
      this.indentSpacing = plusMinusWidth(); 
  }
  
  public void setYSpacing(float paramFloat) { this.ySpacing = paramFloat; }
  
  public void updateRootNodes() {
    int i;
    for (i = this.rootNodes.size - 1; i >= 0; i--)
      ((Node)this.rootNodes.get(i)).removeFromTree(this); 
    i = 0;
    int j = this.rootNodes.size;
    while (i < j) {
      ((Node)this.rootNodes.get(i)).addToTree(this);
      i++;
    } 
  }
  
  public static abstract class Node<N extends Node, V, A extends Actor> extends Object {
    A actor;
    
    final Array<N> children = new Array(false);
    
    boolean expanded;
    
    float height;
    
    Drawable icon;
    
    N parent;
    
    boolean selectable = true;
    
    V value;
    
    public Node() {}
    
    public Node(A param1A) {
      if (param1A != null) {
        this.actor = param1A;
        return;
      } 
      throw new IllegalArgumentException("actor cannot be null.");
    }
    
    public void add(N param1N) { insert(this.children.size, param1N); }
    
    public void addAll(Array<N> param1Array) {
      int i = param1Array.size;
      for (byte b = 0; b < i; b++)
        insert(this.children.size, (Node)param1Array.get(b)); 
    }
    
    protected void addToTree(Tree<N, V> param1Tree) {
      param1Tree.addActor(this.actor);
      if (!this.expanded)
        return; 
      Object[] arrayOfObject = this.children.items;
      for (int i = this.children.size - 1; i >= 0; i--)
        ((Node)arrayOfObject[i]).addToTree(param1Tree); 
    }
    
    public void collapseAll() {
      setExpanded(false);
      Tree.collapseAll(this.children);
    }
    
    public void expandAll() {
      setExpanded(true);
      if (this.children.size > 0)
        Tree.expandAll(this.children); 
    }
    
    public void expandTo() {
      for (Node node = this.parent; node != null; node = node.parent)
        node.setExpanded(true); 
    }
    
    public void findExpandedValues(Array<V> param1Array) {
      if (this.expanded && !Tree.findExpandedValues(this.children, param1Array))
        param1Array.add(this.value); 
    }
    
    public N findNode(V param1V) {
      if (param1V != null)
        return param1V.equals(this.value) ? (N)this : (N)Tree.findNode(this.children, param1V); 
      throw new IllegalArgumentException("value cannot be null.");
    }
    
    public A getActor() { return (A)this.actor; }
    
    public Array<N> getChildren() { return this.children; }
    
    public float getHeight() { return this.height; }
    
    public Drawable getIcon() { return this.icon; }
    
    public int getLevel() {
      Node node2;
      byte b2;
      byte b1 = 0;
      Node node1 = this;
      do {
        b2 = b1 + true;
        node2 = node1.getParent();
        b1 = b2;
        node1 = node2;
      } while (node2 != null);
      return b2;
    }
    
    public N getParent() { return (N)this.parent; }
    
    public Tree<N, V> getTree() {
      Group group = this.actor.getParent();
      return (group instanceof Tree) ? (Tree)group : null;
    }
    
    public V getValue() { return (V)this.value; }
    
    public boolean hasChildren() {
      boolean bool;
      if (this.children.size > 0) {
        bool = true;
      } else {
        bool = false;
      } 
      return bool;
    }
    
    public void insert(int param1Int, N param1N) {
      param1N.parent = this;
      this.children.insert(param1Int, param1N);
      updateChildren();
    }
    
    public boolean isAscendantOf(N param1N) { // Byte code:
      //   0: aload_1
      //   1: ifnull -> 24
      //   4: aload_1
      //   5: aload_0
      //   6: if_acmpne -> 11
      //   9: iconst_1
      //   10: ireturn
      //   11: aload_1
      //   12: getfield parent : Lcom/badlogic/gdx/scenes/scene2d/ui/Tree$Node;
      //   15: astore_2
      //   16: aload_2
      //   17: astore_1
      //   18: aload_2
      //   19: ifnonnull -> 4
      //   22: iconst_0
      //   23: ireturn
      //   24: new java/lang/IllegalArgumentException
      //   27: dup
      //   28: ldc 'node cannot be null.'
      //   30: invokespecial <init> : (Ljava/lang/String;)V
      //   33: astore_1
      //   34: goto -> 39
      //   37: aload_1
      //   38: athrow
      //   39: goto -> 37 }
    
    public boolean isDescendantOf(N param1N) { // Byte code:
      //   0: aload_1
      //   1: ifnull -> 26
      //   4: aload_0
      //   5: astore_2
      //   6: aload_2
      //   7: aload_1
      //   8: if_acmpne -> 13
      //   11: iconst_1
      //   12: ireturn
      //   13: aload_2
      //   14: getfield parent : Lcom/badlogic/gdx/scenes/scene2d/ui/Tree$Node;
      //   17: astore_3
      //   18: aload_3
      //   19: astore_2
      //   20: aload_3
      //   21: ifnonnull -> 6
      //   24: iconst_0
      //   25: ireturn
      //   26: new java/lang/IllegalArgumentException
      //   29: dup
      //   30: ldc 'node cannot be null.'
      //   32: invokespecial <init> : (Ljava/lang/String;)V
      //   35: astore_1
      //   36: goto -> 41
      //   39: aload_1
      //   40: athrow
      //   41: goto -> 39 }
    
    public boolean isExpanded() { return this.expanded; }
    
    public boolean isSelectable() { return this.selectable; }
    
    public void remove() {
      Tree tree = getTree();
      if (tree != null) {
        tree.remove(this);
      } else {
        Node node = this.parent;
        if (node != null)
          node.remove(this); 
      } 
    }
    
    public void remove(N param1N) {
      this.children.removeValue(param1N, true);
      if (!this.expanded)
        return; 
      Tree tree = getTree();
      if (tree != null)
        param1N.removeFromTree(tree); 
    }
    
    public void removeAll() {
      Tree tree = getTree();
      if (tree != null) {
        Object[] arrayOfObject = this.children.items;
        for (int i = this.children.size - 1; i >= 0; i--)
          ((Node)arrayOfObject[i]).removeFromTree(tree); 
      } 
      this.children.clear();
    }
    
    protected void removeFromTree(Tree<N, V> param1Tree) {
      param1Tree.removeActor(this.actor);
      if (!this.expanded)
        return; 
      Object[] arrayOfObject = this.children.items;
      for (int i = this.children.size - 1; i >= 0; i--)
        ((Node)arrayOfObject[i]).removeFromTree(param1Tree); 
    }
    
    public void restoreExpandedValues(Array<V> param1Array) {
      int i = param1Array.size;
      for (byte b = 0; b < i; b++) {
        Node node = findNode(param1Array.get(b));
        if (node != null) {
          node.setExpanded(true);
          node.expandTo();
        } 
      } 
    }
    
    public void setActor(A param1A) {
      if (this.actor != null) {
        Tree tree = getTree();
        if (tree != null) {
          this.actor.remove();
          tree.addActor(param1A);
        } 
      } 
      this.actor = param1A;
    }
    
    public void setExpanded(boolean param1Boolean) {
      if (param1Boolean == this.expanded)
        return; 
      this.expanded = param1Boolean;
      if (this.children.size == 0)
        return; 
      Tree tree = getTree();
      if (tree == null)
        return; 
      if (param1Boolean) {
        byte b = 0;
        int i = this.children.size;
        while (b < i) {
          ((Node)this.children.get(b)).addToTree(tree);
          b++;
        } 
      } else {
        for (int i = this.children.size - 1; i >= 0; i--)
          ((Node)this.children.get(i)).removeFromTree(tree); 
      } 
      tree.invalidateHierarchy();
    }
    
    public void setIcon(Drawable param1Drawable) { this.icon = param1Drawable; }
    
    public void setSelectable(boolean param1Boolean) { this.selectable = param1Boolean; }
    
    public void setValue(V param1V) { this.value = param1V; }
    
    public void updateChildren() {
      if (!this.expanded)
        return; 
      Tree tree = getTree();
      if (tree == null)
        return; 
      int i;
      for (i = this.children.size - 1; i >= 0; i--)
        ((Node)this.children.get(i)).removeFromTree(tree); 
      i = 0;
      int j = this.children.size;
      while (i < j) {
        ((Node)this.children.get(i)).addToTree(tree);
        i++;
      } 
    }
  }
  
  public static class TreeStyle {
    public Drawable background;
    
    public Drawable minus;
    
    public Drawable minusOver;
    
    public Drawable over;
    
    public Drawable plus;
    
    public Drawable plusOver;
    
    public Drawable selection;
    
    public TreeStyle() {}
    
    public TreeStyle(TreeStyle param1TreeStyle) {
      this.plus = param1TreeStyle.plus;
      this.minus = param1TreeStyle.minus;
      this.plusOver = param1TreeStyle.plusOver;
      this.minusOver = param1TreeStyle.minusOver;
      this.over = param1TreeStyle.over;
      this.selection = param1TreeStyle.selection;
      this.background = param1TreeStyle.background;
    }
    
    public TreeStyle(Drawable param1Drawable1, Drawable param1Drawable2, Drawable param1Drawable3) {
      this.plus = param1Drawable1;
      this.minus = param1Drawable2;
      this.selection = param1Drawable3;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/Tree.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */