package com.uwsoft.editor.renderer;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.World;
import com.uwsoft.editor.renderer.actor.CompositeItem;
import com.uwsoft.editor.renderer.actor.IBaseItem;
import com.uwsoft.editor.renderer.data.CompositeItemVO;
import com.uwsoft.editor.renderer.data.CompositeVO;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.PhysicsPropertiesVO;
import com.uwsoft.editor.renderer.data.SceneVO;
import com.uwsoft.editor.renderer.data.SimpleImageVO;
import com.uwsoft.editor.renderer.resources.IResourceRetriever;
import com.uwsoft.editor.renderer.resources.ResourceManager;
import com.uwsoft.editor.renderer.script.IScript;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

public class SceneLoader {
  private String curResolution = "orig";
  
  public Essentials essentials;
  
  public CompositeItem sceneActor;
  
  private SceneVO sceneVO;
  
  public SceneLoader() {
    ResourceManager resourceManager = new ResourceManager();
    resourceManager.initAllResources();
    Essentials essentials1 = new Essentials();
    essentials1.rm = resourceManager;
    this.essentials = essentials1;
  }
  
  public SceneLoader(Essentials paramEssentials) { this.essentials = paramEssentials; }
  
  public SceneLoader(IResourceRetriever paramIResourceRetriever) {
    Essentials essentials1 = new Essentials();
    essentials1.rm = paramIResourceRetriever;
    this.essentials = essentials1;
  }
  
  public SceneLoader(String paramString) {
    ResourceManager resourceManager = new ResourceManager();
    resourceManager.setWorkingResolution(paramString);
    resourceManager.initAllResources();
    Essentials essentials1 = new Essentials();
    essentials1.rm = resourceManager;
    this.essentials = essentials1;
    this.curResolution = paramString;
  }
  
  public void addScriptTo(String paramString, IScript paramIScript) { this.sceneActor.addScriptTo(paramString, paramIScript); }
  
  public void addScriptTo(String paramString, ArrayList<IScript> paramArrayList) { this.sceneActor.addScriptTo(paramString, paramArrayList); }
  
  public CompositeItem getCompositeElement(CompositeItemVO paramCompositeItemVO) { return new CompositeItem(paramCompositeItemVO, this.essentials); }
  
  public CompositeItem getCompositeElementById(String paramString) { return getCompositeElement(this.sceneActor.getCompositeById(paramString).getDataVO()); }
  
  public CompositeItem getLibraryAsActor(String paramString) {
    CompositeItemVO compositeItemVO = new CompositeItemVO((CompositeItemVO)this.sceneVO.libraryItems.get(paramString));
    if (compositeItemVO.composite == null)
      compositeItemVO.composite = new CompositeVO(); 
    CompositeItem compositeItem = new CompositeItem(compositeItemVO, this.essentials);
    compositeItem.dataVO.itemName = paramString;
    compositeItem.applyResolution(this.curResolution);
    compositeItem.setX(0.0F);
    compositeItem.setY(0.0F);
    return compositeItem;
  }
  
  public IResourceRetriever getRm() { return this.essentials.rm; }
  
  public CompositeItem getRoot() { return this.sceneActor; }
  
  public CompositeItem getSceneAsActor() {
    CompositeItemVO compositeItemVO = new CompositeItemVO(this.sceneVO.composite);
    if (compositeItemVO.composite == null)
      compositeItemVO.composite = new CompositeVO(); 
    return new CompositeItem(compositeItemVO, this.essentials);
  }
  
  public SceneVO getSceneVO() { return this.sceneVO; }
  
  public void inject(Object paramObject) {
    Field[] arrayOfField = paramObject.getClass().getDeclaredFields();
    System.out.println(arrayOfField.length);
    int i = arrayOfField.length;
    for (byte b = 0; b < i; b++) {
      field = arrayOfField[b];
      System.out.println(field.getName());
      if (IBaseItem.class.isAssignableFrom(field.getType())) {
        Class clazz1 = field.getType();
        Class clazz2 = field.getType();
        System.out.println(Arrays.toString(field.getDeclaredAnnotations()));
        if (field.isAnnotationPresent(Overlap2D.class)) {
          System.out.println("annotation found");
          String str = field.getName();
          IBaseItem iBaseItem = getRoot().getById(str, clazz1);
          System.out.println(iBaseItem);
          try {
            field.set(paramObject, clazz2.cast(iBaseItem));
          } catch (IllegalArgumentException field) {
            field.printStackTrace();
            System.exit(-1);
          } catch (IllegalAccessException field) {}
        } 
      } 
    } 
  }
  
  public void invalidateSceneVO(SceneVO paramSceneVO) { removeMissingImages(paramSceneVO.composite); }
  
  public SceneVO loadScene(String paramString) { return loadScene(paramString, true); }
  
  public SceneVO loadScene(String paramString, boolean paramBoolean) {
    this.sceneVO = this.essentials.rm.getSceneVO(paramString);
    PhysicsPropertiesVO physicsPropertiesVO = this.sceneVO.physicsPropertiesVO;
    if (this.sceneVO.physicsPropertiesVO != null && this.sceneVO.physicsPropertiesVO.enabled == true) {
      this.essentials.world = new World(new Vector2(physicsPropertiesVO.gravityX, physicsPropertiesVO.gravityY), true);
      this.essentials.rayHandler.setWorld(this.essentials.world);
    } 
    invalidateSceneVO(this.sceneVO);
    if (paramBoolean) {
      this.sceneActor = getSceneAsActor();
      if (!this.curResolution.equals("orig"))
        this.sceneActor.applyResolution(this.curResolution); 
    } 
    setAmbienceInfo(this.sceneVO);
    return this.sceneVO;
  }
  
  public void removeMissingImages(CompositeVO paramCompositeVO) {
    if (paramCompositeVO == null)
      return; 
    for (SimpleImageVO simpleImageVO : paramCompositeVO.sImages) {
      if (this.essentials.rm.getTextureRegion(simpleImageVO.imageName) == null)
        paramCompositeVO.sImages.remove(simpleImageVO); 
    } 
    Iterator iterator = paramCompositeVO.sComposites.iterator();
    while (iterator.hasNext())
      removeMissingImages(((CompositeItemVO)iterator.next()).composite); 
  }
  
  public void setAmbienceInfo(SceneVO paramSceneVO) {
    if (this.essentials.rayHandler != null && paramSceneVO.ambientColor != null) {
      Color color = new Color(paramSceneVO.ambientColor[0], paramSceneVO.ambientColor[1], paramSceneVO.ambientColor[2], paramSceneVO.ambientColor[3]);
      this.essentials.rayHandler.setAmbientLight(color);
    } 
  }
  
  public void setResolution(String paramString) {
    this.curResolution = paramString;
    CompositeItem compositeItem = this.sceneActor;
    if (compositeItem != null)
      compositeItem.applyResolution(paramString); 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/SceneLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */