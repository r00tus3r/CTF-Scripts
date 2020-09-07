package com.uwsoft.editor.renderer.actor;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.ScissorStack;
import com.badlogic.gdx.utils.Pools;
import com.badlogic.gdx.utils.reflect.ClassReflection;
import com.badlogic.gdx.utils.reflect.ReflectionException;
import com.uwsoft.editor.renderer.data.ButtonVO;
import com.uwsoft.editor.renderer.data.CheckBoxVO;
import com.uwsoft.editor.renderer.data.CompositeItemVO;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.Image9patchVO;
import com.uwsoft.editor.renderer.data.LabelVO;
import com.uwsoft.editor.renderer.data.LayerItemVO;
import com.uwsoft.editor.renderer.data.LightVO;
import com.uwsoft.editor.renderer.data.MainItemVO;
import com.uwsoft.editor.renderer.data.MeshVO;
import com.uwsoft.editor.renderer.data.ParticleEffectVO;
import com.uwsoft.editor.renderer.data.PhysicsBodyDataVO;
import com.uwsoft.editor.renderer.data.ResolutionEntryVO;
import com.uwsoft.editor.renderer.data.SelectBoxVO;
import com.uwsoft.editor.renderer.data.SimpleImageVO;
import com.uwsoft.editor.renderer.data.SpineVO;
import com.uwsoft.editor.renderer.data.SpriteAnimationVO;
import com.uwsoft.editor.renderer.data.SpriterVO;
import com.uwsoft.editor.renderer.data.TextBoxVO;
import com.uwsoft.editor.renderer.physics.PhysicsBodyLoader;
import com.uwsoft.editor.renderer.script.IScript;
import com.uwsoft.editor.renderer.utils.CustomVariables;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;

public class CompositeItem extends Group implements IBaseItem {
  private Comparator<IBaseItem> ZIndexComparator = new Comparator<IBaseItem>() {
      public int compare(IBaseItem param1IBaseItem1, IBaseItem param1IBaseItem2) {
        int j;
        int i;
        if (param1IBaseItem1.getLayerIndex() == param1IBaseItem2.getLayerIndex()) {
          i = (param1IBaseItem1.getDataVO()).zIndex;
          j = (param1IBaseItem2.getDataVO()).zIndex;
        } else {
          i = param1IBaseItem1.getLayerIndex();
          j = param1IBaseItem2.getLayerIndex();
        } 
        return i - j;
      }
    };
  
  private Body body;
  
  private CustomVariables customVariables = new CustomVariables();
  
  public CompositeItemVO dataVO;
  
  public Essentials essentials;
  
  private boolean isLockedByLayer = false;
  
  private HashMap<String, IBaseItem> itemIdMap = new HashMap();
  
  private HashMap<String, ArrayList<IBaseItem>> itemLayerMap = new HashMap();
  
  private ArrayList<IBaseItem> items = new ArrayList();
  
  protected int layerIndex = 0;
  
  private HashMap<String, LayerItemVO> layerMap = new HashMap();
  
  public float mulX = 1.0F;
  
  public float mulY = 1.0F;
  
  private CompositeItem parentItem = null;
  
  private Rectangle scissorBounds;
  
  private ArrayList<IScript> scripts = new ArrayList(3);
  
  public CompositeItem(CompositeItemVO paramCompositeItemVO, Essentials paramEssentials) {
    this.essentials = paramEssentials;
    this.dataVO = paramCompositeItemVO;
    setX(this.dataVO.x);
    setY(this.dataVO.y);
    setScaleX(this.dataVO.scaleX);
    setScaleY(this.dataVO.scaleY);
    this.customVariables.loadFromString(this.dataVO.customVars);
    setRotation(this.dataVO.rotation);
    if (this.dataVO.zIndex < 0)
      this.dataVO.zIndex = 0; 
    if (this.dataVO.tint == null) {
      setTint(new Color(1.0F, 1.0F, 1.0F, 1.0F));
    } else {
      setTint(new Color(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]));
    } 
    this.dataVO = paramCompositeItemVO;
    reAssemble();
  }
  
  public CompositeItem(CompositeItemVO paramCompositeItemVO, Essentials paramEssentials, CompositeItem paramCompositeItem) {
    this(paramCompositeItemVO, paramEssentials);
    setParentItem(paramCompositeItem);
  }
  
  private void assemblePhysics() {
    if (this.essentials.world == null)
      return; 
    Vector2 vector2 = new Vector2(this.mulX, this.mulY);
    for (IBaseItem iBaseItem : this.items) {
      if (iBaseItem.getBody() != null) {
        this.essentials.world.destroyBody(iBaseItem.getBody());
        iBaseItem.setBody(null);
      } 
      MainItemVO mainItemVO = iBaseItem.getDataVO();
      PhysicsBodyDataVO physicsBodyDataVO = mainItemVO.physicsBodyData;
      if (Integer.parseInt(mainItemVO.meshId) < 0 || physicsBodyDataVO == null || (this.essentials.rm.getProjectVO()).meshes.get(mainItemVO.meshId) == null)
        continue; 
      iBaseItem.setBody(PhysicsBodyLoader.createBody(this.essentials.world, physicsBodyDataVO, (MeshVO)(this.essentials.rm.getProjectVO()).meshes.get(mainItemVO.meshId), vector2));
      iBaseItem.getBody().setUserData(iBaseItem);
    } 
    positionPhysics();
  }
  
  private ArrayList<CompositeItem> findItemsByName(String paramString, CompositeItem paramCompositeItem, ArrayList<CompositeItem> paramArrayList) {
    for (byte b = 0; b < paramCompositeItem.items.size(); b++) {
      if (((IBaseItem)paramCompositeItem.items.get(b)).getClass().getSimpleName().equals("CompositeItem")) {
        CompositeItem compositeItem = (CompositeItem)paramCompositeItem.items.get(b);
        if (compositeItem.dataVO.itemName.equals(paramString))
          paramArrayList.add(compositeItem); 
        findItemsByName(paramString, compositeItem, paramArrayList);
      } 
    } 
    return paramArrayList;
  }
  
  private int getlayerIndexByName(String paramString) {
    ArrayList arrayList = this.dataVO.composite.layers;
    for (byte b = 0; b < arrayList.size(); b++) {
      if (((LayerItemVO)arrayList.get(b)).layerName.equals(paramString))
        return b; 
    } 
    return 0;
  }
  
  private void inventorize(IBaseItem paramIBaseItem) {
    String str1 = (paramIBaseItem.getDataVO()).itemIdentifier;
    String str2 = (paramIBaseItem.getDataVO()).layerName;
    if (str1.length() > 0)
      this.itemIdMap.put(str1, paramIBaseItem); 
    if (str2.length() > 0) {
      if (!this.itemLayerMap.containsKey(str2))
        this.itemLayerMap.put(str2, new ArrayList()); 
      ((ArrayList)this.itemLayerMap.get(str2)).add(paramIBaseItem);
    } 
    this.items.add(paramIBaseItem);
  }
  
  private void reAssemble() {
    byte b2;
    clear();
    ArrayList arrayList = this.items;
    boolean bool = false;
    if (arrayList != null)
      for (byte b = 0; b < this.items.size(); b++)
        ((IBaseItem)this.items.get(b)).dispose();  
    this.items.clear();
    this.itemIdMap.clear();
    this.itemLayerMap.clear();
    byte b1;
    for (b1 = 0; b1 < this.dataVO.composite.sImages.size(); b1++) {
      SimpleImageVO simpleImageVO = (SimpleImageVO)this.dataVO.composite.sImages.get(b1);
      ImageItem imageItem = new ImageItem(simpleImageVO, this.essentials, this);
      inventorize(imageItem);
      addActor(imageItem);
      imageItem.setZIndex(simpleImageVO.zIndex);
    } 
    for (b1 = 0; b1 < this.dataVO.composite.sImage9patchs.size(); b1++) {
      Image9patchVO image9patchVO = (Image9patchVO)this.dataVO.composite.sImage9patchs.get(b1);
      Image9patchItem image9patchItem = new Image9patchItem(image9patchVO, this.essentials, this);
      inventorize(image9patchItem);
      addActor(image9patchItem);
      image9patchItem.setZIndex(image9patchVO.zIndex);
    } 
    for (b1 = 0; b1 < this.dataVO.composite.sTextBox.size(); b1++) {
      TextBoxItem textBoxItem = new TextBoxItem((TextBoxVO)this.dataVO.composite.sTextBox.get(b1), this.essentials, this);
      inventorize(textBoxItem);
      addActor(textBoxItem);
      textBoxItem.setZIndex(textBoxItem.dataVO.zIndex);
    } 
    for (b1 = 0; b1 < this.dataVO.composite.sButtons.size(); b1++) {
      TextButtonItem textButtonItem = new TextButtonItem((ButtonVO)this.dataVO.composite.sButtons.get(b1), this.essentials, this);
      inventorize(textButtonItem);
      addActor(textButtonItem);
      textButtonItem.setZIndex(textButtonItem.dataVO.zIndex);
    } 
    for (b1 = 0; b1 < this.dataVO.composite.sLabels.size(); b1++) {
      LabelItem labelItem = new LabelItem((LabelVO)this.dataVO.composite.sLabels.get(b1), this.essentials, this);
      inventorize(labelItem);
      addActor(labelItem);
      labelItem.setZIndex(labelItem.dataVO.zIndex);
    } 
    for (b1 = 0; b1 < this.dataVO.composite.sCheckBoxes.size(); b1++) {
      CheckBoxItem checkBoxItem = new CheckBoxItem((CheckBoxVO)this.dataVO.composite.sCheckBoxes.get(b1), this.essentials, this);
      inventorize(checkBoxItem);
      addActor(checkBoxItem);
      checkBoxItem.setZIndex(checkBoxItem.dataVO.zIndex);
    } 
    for (b1 = 0; b1 < this.dataVO.composite.sSelectBoxes.size(); b1++) {
      SelectBoxItem selectBoxItem = new SelectBoxItem((SelectBoxVO)this.dataVO.composite.sSelectBoxes.get(b1), this.essentials, this);
      inventorize(selectBoxItem);
      addActor(selectBoxItem);
      selectBoxItem.setZIndex(selectBoxItem.dataVO.zIndex);
    } 
    for (b1 = 0; b1 < this.dataVO.composite.sComposites.size(); b1++) {
      CompositeItem compositeItem = new CompositeItem((CompositeItemVO)this.dataVO.composite.sComposites.get(b1), this.essentials, this);
      inventorize(compositeItem);
      addActor(compositeItem);
      compositeItem.setZIndex(compositeItem.dataVO.zIndex);
    } 
    for (b1 = 0; b1 < this.dataVO.composite.sParticleEffects.size(); b1++) {
      ParticleItem particleItem = new ParticleItem((ParticleEffectVO)this.dataVO.composite.sParticleEffects.get(b1), this.essentials, this);
      inventorize(particleItem);
      addActor(particleItem);
      particleItem.setZIndex(particleItem.dataVO.zIndex);
    } 
    if (this.essentials.rayHandler != null)
      for (b1 = 0; b1 < this.dataVO.composite.sLights.size(); b1++) {
        LightActor lightActor = new LightActor((LightVO)this.dataVO.composite.sLights.get(b1), this.essentials, this);
        inventorize(lightActor);
        addActor(lightActor);
      }  
    if (this.essentials.spineReflectionHelper != null)
      for (b1 = 0; b1 < this.dataVO.composite.sSpineAnimations.size(); b1++) {
        SpineActor spineActor = new SpineActor((SpineVO)this.dataVO.composite.sSpineAnimations.get(b1), this.essentials, this);
        inventorize(spineActor);
        addActor(spineActor);
        spineActor.setZIndex(spineActor.dataVO.zIndex);
      }  
    b1 = 0;
    while (true) {
      b2 = bool;
      if (b1 < this.dataVO.composite.sSpriteAnimations.size()) {
        SpriteAnimation spriteAnimation = new SpriteAnimation((SpriteAnimationVO)this.dataVO.composite.sSpriteAnimations.get(b1), this.essentials, this);
        inventorize(spriteAnimation);
        spriteAnimation.start();
        addActor(spriteAnimation);
        spriteAnimation.setZIndex(spriteAnimation.dataVO.zIndex);
        b1++;
        continue;
      } 
      break;
    } 
    while (b2 < this.dataVO.composite.sSpriterAnimations.size()) {
      SpriterActor spriterActor = new SpriterActor((SpriterVO)this.dataVO.composite.sSpriterAnimations.get(b2), this.essentials, this);
      inventorize(spriterActor);
      addActor(spriterActor);
      spriterActor.setZIndex(spriterActor.dataVO.zIndex);
      b2++;
    } 
    if (this.dataVO.composite.layers.size() == 0) {
      LayerItemVO layerItemVO = new LayerItemVO();
      layerItemVO.layerName = "Default";
      this.dataVO.composite.layers.add(layerItemVO);
    } 
    recalculateSize();
    sortZindexes();
    reAssembleLayers();
  }
  
  private void setLayerChildrenVisibilty(String paramString, boolean paramBoolean) {
    ArrayList arrayList = (ArrayList)this.itemLayerMap.get(paramString);
    if (arrayList == null)
      return; 
    for (byte b = 0; b < arrayList.size(); b++)
      ((Actor)arrayList.get(b)).setVisible(paramBoolean); 
  }
  
  public void act(float paramFloat) {
    for (byte b = 0; b < this.scripts.size(); b++)
      ((IScript)this.scripts.get(b)).act(paramFloat); 
    if (this.essentials.world != null && this.body != null && this.dataVO.physicsBodyData != null && this.dataVO.physicsBodyData.bodyType > 0 && !this.essentials.physicsStopped) {
      setX((this.body.getPosition()).x / PhysicsBodyLoader.SCALE);
      setY((this.body.getPosition()).y / PhysicsBodyLoader.SCALE);
      setRotation(this.body.getAngle() * 57.295776F);
    } 
    super.act(paramFloat);
  }
  
  public void addItem(IBaseItem paramIBaseItem) {
    this.dataVO.composite.addItem(paramIBaseItem.getDataVO());
    paramIBaseItem.setParentItem(this);
    inventorize(paramIBaseItem);
    addActor((Actor)paramIBaseItem);
    paramIBaseItem.updateDataVO();
    paramIBaseItem.applyResolution(this.mulX, this.mulY);
    recalculateSize();
    sortZindexes();
    reAssembleLayers();
    if ((paramIBaseItem.getDataVO()).physicsBodyData != null && Integer.parseInt((paramIBaseItem.getDataVO()).meshId) >= 0) {
      Vector2 vector2 = new Vector2();
      vector2.set((paramIBaseItem.getDataVO()).x * this.mulX, (paramIBaseItem.getDataVO()).y * this.mulY);
      localToStageCoordinates(vector2);
      vector2.scl(PhysicsBodyLoader.SCALE);
      if (paramIBaseItem.getBody() != null) {
        this.essentials.world.destroyBody(paramIBaseItem.getBody());
        paramIBaseItem.setBody(null);
      } 
      paramIBaseItem.setBody(PhysicsBodyLoader.createBody(this.essentials.world, (paramIBaseItem.getDataVO()).physicsBodyData, (MeshVO)(this.essentials.rm.getProjectVO()).meshes.get((paramIBaseItem.getDataVO()).meshId), new Vector2(this.mulX, this.mulY)));
      paramIBaseItem.getBody().setTransform(vector2.x, vector2.y, (float)Math.toRadians((paramIBaseItem.getDataVO()).rotation));
    } 
  }
  
  public void addScript(IScript paramIScript) {
    this.scripts.add(paramIScript);
    paramIScript.init(this);
  }
  
  public void addScript(ArrayList<IScript> paramArrayList) {
    this.scripts.addAll(paramArrayList);
    Iterator iterator = paramArrayList.iterator();
    while (iterator.hasNext())
      ((IScript)iterator.next()).init(this); 
  }
  
  public void addScriptTo(String paramString, IScript paramIScript) {
    for (IBaseItem iBaseItem : this.items) {
      if (iBaseItem instanceof CompositeItem) {
        if ((iBaseItem.getDataVO()).itemName.equals(paramString))
          ((CompositeItem)iBaseItem).addScript(paramIScript); 
        ((CompositeItem)iBaseItem).addScriptTo(paramString, paramIScript);
      } 
    } 
  }
  
  public void addScriptTo(String paramString, Class<? extends IScript> paramClass) {
    for (IBaseItem iBaseItem : this.items) {
      if (iBaseItem instanceof CompositeItem) {
        if ((iBaseItem.getDataVO()).itemName.equals(paramString)) {
          IScript iScript = null;
          try {
            IScript iScript1 = (IScript)ClassReflection.newInstance(paramClass);
            iScript = iScript1;
          } catch (ReflectionException reflectionException) {
            reflectionException.printStackTrace();
          } 
          if (iScript != null)
            ((CompositeItem)iBaseItem).addScript(iScript); 
        } 
        ((CompositeItem)iBaseItem).addScriptTo(paramString, paramClass);
      } 
    } 
  }
  
  public void addScriptTo(String paramString, ArrayList<IScript> paramArrayList) {
    for (IBaseItem iBaseItem : this.items) {
      if (iBaseItem instanceof CompositeItem) {
        if ((iBaseItem.getDataVO()).itemName.equals(paramString))
          ((CompositeItem)iBaseItem).addScript(paramArrayList); 
        ((CompositeItem)iBaseItem).addScriptTo(paramString, paramArrayList);
      } 
    } 
  }
  
  public void applyResolution(float paramFloat1, float paramFloat2) {
    this.mulX = paramFloat1;
    this.mulY = paramFloat2;
    for (byte b = 0; b < this.items.size(); b++) {
      ((IBaseItem)this.items.get(b)).applyResolution(paramFloat1, paramFloat2);
      if (((IBaseItem)this.items.get(b)).getBody() != null) {
        this.essentials.world.destroyBody(((IBaseItem)this.items.get(b)).getBody());
        ((IBaseItem)this.items.get(b)).setBody(null);
      } 
    } 
    if (getBody() != null)
      this.essentials.world.destroyBody(getBody()); 
    setBody(null);
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    updateDataVO();
    recalculateSize();
    assemblePhysics();
  }
  
  public void applyResolution(String paramString) {
    if (paramString != null && !paramString.isEmpty()) {
      ResolutionEntryVO resolutionEntryVO = this.essentials.rm.getProjectVO().getResolution(paramString);
      if (resolutionEntryVO != null) {
        float f = resolutionEntryVO.width / (this.essentials.rm.getProjectVO()).originalResolution.width;
        applyResolution(f, f);
      } 
    } 
  }
  
  public void dispose() {
    if (this.essentials.world != null && this.body != null)
      this.essentials.world.destroyBody(getBody()); 
    setBody(null);
    for (byte b = 0; b < this.items.size(); b++)
      ((IBaseItem)this.items.get(b)).dispose(); 
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    if (this.dataVO.scissorWidth > 0.0F && this.dataVO.scissorHeight > 0.0F) {
      if (isTransform())
        applyTransform(paramBatch, computeTransform()); 
      Rectangle rectangle = (Rectangle)Pools.obtain(Rectangle.class);
      getStage().calculateScissors(this.scissorBounds, rectangle);
      if (ScissorStack.pushScissors(rectangle)) {
        drawChildren(paramBatch, paramFloat);
        ScissorStack.popScissors();
        if (isTransform())
          resetTransform(paramBatch); 
        Pools.free(rectangle);
      } 
      return;
    } 
    super.draw(paramBatch, paramFloat);
  }
  
  public ArrayList<CompositeItem> findItemsByName(String paramString) { return findItemsByName(paramString, this, new ArrayList()); }
  
  public Body getBody() { return this.body; }
  
  public <T extends IBaseItem> T getById(String paramString, Class<T> paramClass) { return (T)(IBaseItem)paramClass.cast(this.itemIdMap.get(paramString)); }
  
  public CheckBoxItem getCheckBoxById(String paramString) { return (CheckBoxItem)this.itemIdMap.get(paramString); }
  
  public CompositeItem getCompositeById(String paramString) { return (CompositeItem)this.itemIdMap.get(paramString); }
  
  public CustomVariables getCustomVariables() { return this.customVariables; }
  
  public CompositeItemVO getDataVO() { return this.dataVO; }
  
  public ImageItem getImageById(String paramString) { return (ImageItem)this.itemIdMap.get(paramString); }
  
  public IBaseItem getItemById(String paramString) { return (IBaseItem)this.itemIdMap.get(paramString); }
  
  public ArrayList<IBaseItem> getItems() { return this.items; }
  
  public ArrayList<IBaseItem> getItemsByLayerName(String paramString) { return (ArrayList)this.itemLayerMap.get(paramString); }
  
  public LabelItem getLabelById(String paramString) { return (LabelItem)this.itemIdMap.get(paramString); }
  
  public int getLayerIndex() { return this.layerIndex; }
  
  public LightActor getLightActorById(String paramString) { return (LightActor)this.itemIdMap.get(paramString); }
  
  public Image9patchItem getNinePatchById(String paramString) { return (Image9patchItem)this.itemIdMap.get(paramString); }
  
  public CompositeItem getParentItem() { return this.parentItem; }
  
  public ParticleItem getParticleById(String paramString) { return (ParticleItem)this.itemIdMap.get(paramString); }
  
  public SelectBoxItem getSelectBoxById(String paramString) { return (SelectBoxItem)this.itemIdMap.get(paramString); }
  
  public SpineActor getSpineActorById(String paramString) { return (SpineActor)this.itemIdMap.get(paramString); }
  
  public SpriteAnimation getSpriteAnimationById(String paramString) { return (SpriteAnimation)this.itemIdMap.get(paramString); }
  
  public SpriterActor getSpriterActorById(String paramString) { return (SpriterActor)this.itemIdMap.get(paramString); }
  
  public TextBoxItem getTextBoxById(String paramString) { return (TextBoxItem)this.itemIdMap.get(paramString); }
  
  public TextButtonItem getTextButtonById(String paramString) { return (TextButtonItem)this.itemIdMap.get(paramString); }
  
  public boolean isComposite() { return true; }
  
  public boolean isLockedByLayer() { return this.isLockedByLayer; }
  
  public boolean layerExists(String paramString) { return this.layerMap.containsKey(paramString); }
  
  public void loadFromVO(CompositeItemVO paramCompositeItemVO) {
    this.dataVO = paramCompositeItemVO;
    reAssemble();
    recalculateSize();
    sortZindexes();
    reAssembleLayers();
  }
  
  public void positionPhysics() {
    Vector2 vector2 = new Vector2();
    for (IBaseItem iBaseItem : this.items) {
      if (iBaseItem.getBody() == null)
        continue; 
      MainItemVO mainItemVO = iBaseItem.getDataVO();
      vector2.set(mainItemVO.x * this.mulX, mainItemVO.y * this.mulY);
      localToStageCoordinates(vector2);
      vector2.scl(PhysicsBodyLoader.SCALE);
      iBaseItem.getBody().setTransform(vector2.x, vector2.y, (float)Math.toRadians((iBaseItem.getDataVO()).rotation));
    } 
  }
  
  public void reAssembleLayers() {
    this.layerMap.clear();
    for (byte b = 0; b < this.dataVO.composite.layers.size(); b++) {
      boolean bool;
      LayerItemVO layerItemVO = (LayerItemVO)this.dataVO.composite.layers.get(b);
      setLayerChildrenVisibilty(layerItemVO.layerName, layerItemVO.isVisible);
      String str = layerItemVO.layerName;
      if (layerItemVO.isLocked || !layerItemVO.isVisible) {
        bool = true;
      } else {
        bool = false;
      } 
      setLayerChildrenLock(str, bool);
      this.layerMap.put(layerItemVO.layerName, layerItemVO);
    } 
  }
  
  public void recalculateSize() {
    byte b = 0;
    float f1 = 0.0F;
    float f2 = 0.0F;
    float f3 = 0.0F;
    float f4;
    for (f4 = 0.0F; b < this.items.size(); f4 = f5) {
      Actor actor = (Actor)this.items.get(b);
      float f5 = f1;
      float f6 = f3;
      if (b == 0) {
        if (actor.getScaleX() > 0.0F && actor.getWidth() * actor.getScaleX() > 0.0F) {
          f6 = actor.getX();
          f4 = actor.getX();
          f2 = actor.getWidth();
          f3 = actor.getScaleX();
          f5 = f4 + f2 * f3;
        } else {
          f5 = actor.getX();
          f6 = actor.getX() + actor.getWidth() * actor.getScaleX();
        } 
        if (actor.getScaleY() > 0.0F && actor.getHeight() * actor.getScaleY() > 0.0F) {
          f4 = actor.getY();
          f2 = actor.getY() + actor.getHeight() * actor.getScaleY();
        } else {
          f2 = actor.getY();
          f4 = actor.getY() + actor.getHeight() * actor.getScaleY();
        } 
      } 
      if (actor.getScaleX() > 0.0F && actor.getWidth() > 0.0F) {
        float f = f6;
        if (f6 > actor.getX())
          f = actor.getX(); 
        f1 = f5;
        f3 = f;
        if (f5 < actor.getX() + actor.getWidth() * actor.getScaleX()) {
          f1 = actor.getX() + actor.getWidth() * actor.getScaleX();
          f3 = f;
        } 
      } else {
        float f = f5;
        if (f5 < actor.getX())
          f = actor.getX(); 
        f1 = f;
        f3 = f6;
        if (f6 > actor.getX() + actor.getWidth() * actor.getScaleX()) {
          f3 = actor.getX() + actor.getWidth() * actor.getScaleX();
          f1 = f;
        } 
      } 
      if (actor.getScaleY() > 0.0F && actor.getHeight() * actor.getScaleY() > 0.0F) {
        float f = f4;
        if (f4 > actor.getY())
          f = actor.getY(); 
        f6 = f2;
        f5 = f;
        if (f2 < actor.getY() + actor.getHeight() * actor.getScaleY()) {
          f6 = actor.getY() + actor.getHeight() * actor.getScaleY();
          f5 = f;
        } 
      } else {
        float f = f2;
        if (f2 < actor.getY())
          f = actor.getY(); 
        f6 = f;
        f5 = f4;
        if (f4 > actor.getY() + actor.getHeight() * actor.getScaleY()) {
          f5 = actor.getY() + actor.getHeight() * actor.getScaleY();
          f6 = f;
        } 
      } 
      b++;
      f2 = f6;
    } 
    setWidth(f1 - 0.0F);
    setHeight(f2 - 0.0F);
  }
  
  public void removeItem(IBaseItem paramIBaseItem) {
    this.items.remove(paramIBaseItem);
    this.dataVO.composite.removeItem(paramIBaseItem.getDataVO());
    paramIBaseItem.dispose();
  }
  
  public void removeScript(IScript paramIScript) {
    this.scripts.remove(paramIScript);
    paramIScript.dispose();
  }
  
  public void removeScript(String paramString, ArrayList<IScript> paramArrayList) {
    for (IBaseItem iBaseItem : this.items) {
      if (iBaseItem instanceof CompositeItem) {
        if ((iBaseItem.getDataVO()).itemName.equals(paramString))
          ((CompositeItem)iBaseItem).removeScript(paramArrayList); 
        ((CompositeItem)iBaseItem).removeScript(paramString, paramArrayList);
      } 
    } 
  }
  
  public void removeScript(ArrayList<IScript> paramArrayList) {
    this.scripts.removeAll(paramArrayList);
    Iterator iterator = paramArrayList.iterator();
    while (iterator.hasNext())
      ((IScript)iterator.next()).dispose(); 
  }
  
  public void renew() {
    setX(this.dataVO.x * this.mulX);
    setY(this.dataVO.y * this.mulY);
    setScaleX(this.dataVO.scaleX);
    setScaleY(this.dataVO.scaleY);
    setRotation(this.dataVO.rotation);
    setColor(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]);
    this.customVariables.loadFromString(this.dataVO.customVars);
    this.scissorBounds = new Rectangle(this.dataVO.scissorX * this.mulX, this.dataVO.scissorY * this.mulY, this.dataVO.scissorWidth * this.mulX, this.dataVO.scissorHeight * this.mulY);
  }
  
  public void setBody(Body paramBody) { this.body = paramBody; }
  
  public void setLayerChildrenLock(String paramString, boolean paramBoolean) {
    for (byte b = 0; b < this.items.size(); b++) {
      IBaseItem iBaseItem = (IBaseItem)this.items.get(b);
      if ((iBaseItem.getDataVO()).layerName.equals(paramString)) {
        Touchable touchable;
        iBaseItem.setLockByLayer(paramBoolean);
        Actor actor = (Actor)iBaseItem;
        if (paramBoolean) {
          touchable = Touchable.disabled;
        } else {
          touchable = Touchable.enabled;
        } 
        actor.setTouchable(touchable);
      } 
    } 
  }
  
  public void setLayerIndex(int paramInt) { this.layerIndex = paramInt; }
  
  public void setLayerLock(String paramString, boolean paramBoolean) {
    for (byte b = 0; b < this.dataVO.composite.layers.size(); b++) {
      if (((LayerItemVO)this.dataVO.composite.layers.get(b)).layerName.equals(paramString)) {
        ((LayerItemVO)this.dataVO.composite.layers.get(b)).isLocked = paramBoolean;
        setLayerChildrenLock(paramString, paramBoolean);
      } 
    } 
  }
  
  public void setLayerVisibilty(String paramString, boolean paramBoolean) {
    LayerItemVO layerItemVO = (LayerItemVO)this.layerMap.get(paramString);
    if (layerItemVO == null)
      return; 
    layerItemVO.isVisible = paramBoolean;
    setLayerChildrenVisibilty(paramString, paramBoolean);
  }
  
  public void setLockByLayer(boolean paramBoolean) { this.isLockedByLayer = paramBoolean; }
  
  public void setParentItem(CompositeItem paramCompositeItem) { this.parentItem = paramCompositeItem; }
  
  public void setScissors(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    CompositeItemVO compositeItemVO = this.dataVO;
    float f = this.mulX;
    compositeItemVO.scissorX = paramFloat1 / f;
    paramFloat1 = this.mulY;
    compositeItemVO.scissorY = paramFloat2 / paramFloat1;
    compositeItemVO.scissorWidth = paramFloat3 / f;
    compositeItemVO.scissorHeight = paramFloat4 / paramFloat1;
    this.scissorBounds = new Rectangle(compositeItemVO.scissorX * this.mulX, this.dataVO.scissorY * this.mulY, this.dataVO.scissorWidth * this.mulX, this.dataVO.scissorHeight * this.mulY);
  }
  
  protected void setStage(Stage paramStage) {
    super.setStage(paramStage);
    if (paramStage != null)
      assemblePhysics(); 
  }
  
  public void setTint(Color paramColor) {
    float f1 = paramColor.r;
    float f2 = paramColor.g;
    float f3 = paramColor.b;
    float f4 = paramColor.a;
    (getDataVO()).tint = new float[] { f1, f2, f3, f4 };
    setColor(paramColor);
  }
  
  public void sortZindexes() {
    if (this.items == null)
      return; 
    byte b;
    for (b = 0; b < this.items.size(); b++)
      ((IBaseItem)this.items.get(b)).setLayerIndex(getlayerIndexByName((((IBaseItem)this.items.get(b)).getDataVO()).layerName)); 
    Collections.sort(this.items, this.ZIndexComparator);
    for (b = 0; b < this.items.size(); b++) {
      IBaseItem iBaseItem = (IBaseItem)this.items.get(b);
      if ((iBaseItem.getDataVO()).zIndex < 0)
        (iBaseItem.getDataVO()).zIndex = 0; 
      ((Actor)iBaseItem).setZIndex(b);
      (iBaseItem.getDataVO()).zIndex = b;
    } 
  }
  
  public void updateDataVO() {
    this.dataVO.x = getX() / this.mulX;
    this.dataVO.y = getY() / this.mulY;
    this.dataVO.rotation = getRotation();
    if (getZIndex() >= 0)
      this.dataVO.zIndex = getZIndex(); 
    if (this.dataVO.layerName == null || this.dataVO.layerName.equals(""))
      this.dataVO.layerName = "Default"; 
    for (byte b = 0; b < this.items.size(); b++)
      ((IBaseItem)this.items.get(b)).updateDataVO(); 
    sortZindexes();
    this.dataVO.scaleX = getScaleX();
    this.dataVO.scaleY = getScaleY();
    this.dataVO.customVars = this.customVariables.saveAsString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/actor/CompositeItem.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */