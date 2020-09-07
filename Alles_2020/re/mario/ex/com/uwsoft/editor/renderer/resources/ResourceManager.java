package com.uwsoft.editor.renderer.resources;

import com.badlogic.gdx.Files;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.ParticleEffect;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.graphics.g2d.freetype.FreeTypeFontGenerator;
import com.badlogic.gdx.utils.Json;
import com.uwsoft.editor.renderer.data.CompositeItemVO;
import com.uwsoft.editor.renderer.data.CompositeVO;
import com.uwsoft.editor.renderer.data.ProjectInfoVO;
import com.uwsoft.editor.renderer.data.ResolutionEntryVO;
import com.uwsoft.editor.renderer.data.SceneVO;
import com.uwsoft.editor.renderer.utils.MySkin;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;

public class ResourceManager implements IResourceLoader, IResourceRetriever {
  protected HashMap<FontSizePair, BitmapFont> bitmapFonts = new HashMap();
  
  public String fontsPath = "freetypefonts";
  
  protected HashSet<FontSizePair> fontsToLoad = new HashSet();
  
  protected HashMap<String, SceneVO> loadedSceneVOs = new HashMap();
  
  protected TextureAtlas mainPack;
  
  public String packResolutionName = "orig";
  
  protected HashSet<String> particleEffectNamesToLoad = new HashSet();
  
  protected HashMap<String, ParticleEffect> particleEffects = new HashMap();
  
  public String particleEffectsPath = "particles";
  
  protected ArrayList<String> preparedSceneNames = new ArrayList();
  
  protected ProjectInfoVO projectVO;
  
  protected float resMultiplier;
  
  public String scenesPath = "scenes";
  
  protected HashMap<String, TextureAtlas> skeletonAtlases = new HashMap();
  
  protected HashMap<String, FileHandle> skeletonJSON = new HashMap();
  
  protected HashSet<String> spineAnimNamesToLoad = new HashSet();
  
  public String spineAnimationsPath = "spine_animations";
  
  protected HashSet<String> spriteAnimNamesToLoad = new HashSet();
  
  protected HashMap<String, TextureAtlas> spriteAnimations = new HashMap();
  
  public String spriteAnimationsPath = "sprite_animations";
  
  protected HashSet<String> spriterAnimNamesToLoad = new HashSet();
  
  protected HashMap<String, FileHandle> spriterAnimations = new HashMap();
  
  public String spriterAnimationsPath = "spriter_animations";
  
  public void dispose() { this.mainPack.dispose(); }
  
  public BitmapFont getBitmapFont(String paramString, int paramInt) { return (BitmapFont)this.bitmapFonts.get(new FontSizePair(paramString, paramInt)); }
  
  public ParticleEffect getParticleEffect(String paramString) { return new ParticleEffect((ParticleEffect)this.particleEffects.get(paramString)); }
  
  public ProjectInfoVO getProjectVO() { return this.projectVO; }
  
  public FileHandle getSCMLFile(String paramString) { return (FileHandle)this.spriterAnimations.get(paramString); }
  
  public SceneVO getSceneVO(String paramString) { return (SceneVO)this.loadedSceneVOs.get(paramString); }
  
  public TextureAtlas getSkeletonAtlas(String paramString) { return (TextureAtlas)this.skeletonAtlases.get(paramString); }
  
  public FileHandle getSkeletonJSON(String paramString) { return (FileHandle)this.skeletonJSON.get(paramString); }
  
  public MySkin getSkin() { return null; }
  
  public TextureAtlas getSpriteAnimation(String paramString) { return (TextureAtlas)this.spriteAnimations.get(paramString); }
  
  public TextureRegion getTextureRegion(String paramString) { return this.mainPack.findRegion(paramString); }
  
  public void initAllResources() {
    loadProjectVO();
    for (byte b = 0; b < this.projectVO.scenes.size(); b++) {
      loadSceneVO(((SceneVO)this.projectVO.scenes.get(b)).sceneName);
      scheduleScene(((SceneVO)this.projectVO.scenes.get(b)).sceneName);
    } 
    prepareAssetsToLoad();
    loadAssets();
  }
  
  public void initScene(String paramString) {
    loadSceneVO(paramString);
    scheduleScene(paramString);
    prepareAssetsToLoad();
    loadAssets();
  }
  
  public void loadAssets() {
    loadAtlasPack();
    loadParticleEffects();
    loadSpineAnimations();
    loadSpriteAnimations();
    loadSpriterAnimations();
    loadFonts();
  }
  
  public void loadAtlasPack() {
    Files files = Gdx.files;
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(this.packResolutionName);
    stringBuilder.append(File.separator);
    stringBuilder.append("pack.atlas");
    FileHandle fileHandle = files.internal(stringBuilder.toString());
    if (!fileHandle.exists())
      return; 
    this.mainPack = new TextureAtlas(fileHandle);
  }
  
  public void loadFont(FontSizePair paramFontSizePair) {
    Files files = Gdx.files;
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(this.fontsPath);
    stringBuilder.append(File.separator);
    stringBuilder.append(paramFontSizePair.fontName);
    stringBuilder.append(".ttf");
    FreeTypeFontGenerator freeTypeFontGenerator = new FreeTypeFontGenerator(files.internal(stringBuilder.toString()));
    FreeTypeFontGenerator.FreeTypeFontParameter freeTypeFontParameter = new FreeTypeFontGenerator.FreeTypeFontParameter();
    freeTypeFontParameter.size = Math.round(paramFontSizePair.fontSize * this.resMultiplier);
    BitmapFont bitmapFont = freeTypeFontGenerator.generateFont(freeTypeFontParameter);
    this.bitmapFonts.put(paramFontSizePair, bitmapFont);
  }
  
  public void loadFonts() {
    ResolutionEntryVO resolutionEntryVO = getProjectVO().getResolution(this.packResolutionName);
    this.resMultiplier = 1.0F;
    if (!this.packResolutionName.equals("orig"))
      if (resolutionEntryVO.base == 0) {
        this.resMultiplier = resolutionEntryVO.width / (getProjectVO()).originalResolution.width;
      } else {
        this.resMultiplier = resolutionEntryVO.height / (getProjectVO()).originalResolution.height;
      }  
    for (FontSizePair fontSizePair : this.bitmapFonts.keySet()) {
      if (!this.fontsToLoad.contains(fontSizePair))
        this.bitmapFonts.remove(fontSizePair); 
    } 
    Iterator iterator = this.fontsToLoad.iterator();
    while (iterator.hasNext())
      loadFont((FontSizePair)iterator.next()); 
  }
  
  public void loadParticleEffects() {
    for (String str : this.particleEffects.keySet()) {
      if (!this.particleEffectNamesToLoad.contains(str))
        this.particleEffects.remove(str); 
    } 
    for (String str : this.particleEffectNamesToLoad) {
      ParticleEffect particleEffect = new ParticleEffect();
      Files files = Gdx.files;
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(this.particleEffectsPath);
      stringBuilder.append(File.separator);
      stringBuilder.append(str);
      particleEffect.load(files.internal(stringBuilder.toString()), this.mainPack, "");
      this.particleEffects.put(str, particleEffect);
    } 
  }
  
  public ProjectInfoVO loadProjectVO() {
    FileHandle fileHandle = Gdx.files.internal("project.dt");
    this.projectVO = (ProjectInfoVO)(new Json()).fromJson(ProjectInfoVO.class, fileHandle.readString());
    return this.projectVO;
  }
  
  public SceneVO loadSceneVO(String paramString) {
    Files files = Gdx.files;
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(this.scenesPath);
    stringBuilder.append(File.separator);
    stringBuilder.append(paramString);
    stringBuilder.append(".dt");
    FileHandle fileHandle = files.internal(stringBuilder.toString());
    SceneVO sceneVO = (SceneVO)(new Json()).fromJson(SceneVO.class, fileHandle.readString());
    this.loadedSceneVOs.put(paramString, sceneVO);
    return sceneVO;
  }
  
  public void loadSpineAnimation(String paramString) {
    Files files2 = Gdx.files;
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(this.packResolutionName);
    stringBuilder.append(File.separator);
    stringBuilder.append(this.spineAnimationsPath);
    stringBuilder.append(File.separator);
    stringBuilder.append(paramString);
    stringBuilder.append(File.separator);
    stringBuilder.append(paramString);
    stringBuilder.append(".atlas");
    TextureAtlas textureAtlas = new TextureAtlas(files2.internal(stringBuilder.toString()));
    this.skeletonAtlases.put(paramString, textureAtlas);
    HashMap hashMap = this.skeletonJSON;
    Files files1 = Gdx.files;
    stringBuilder = new StringBuilder();
    stringBuilder.append("orig");
    stringBuilder.append(File.separator);
    stringBuilder.append(this.spineAnimationsPath);
    stringBuilder.append(File.separator);
    stringBuilder.append(paramString);
    stringBuilder.append(File.separator);
    stringBuilder.append(paramString);
    stringBuilder.append(".json");
    hashMap.put(paramString, files1.internal(stringBuilder.toString()));
  }
  
  public void loadSpineAnimations() {
    Iterator iterator1 = this.skeletonAtlases.entrySet().iterator();
    while (iterator1.hasNext()) {
      Map.Entry entry = (Map.Entry)iterator1.next();
      if (this.spineAnimNamesToLoad.contains(entry.getKey())) {
        this.spineAnimNamesToLoad.remove(entry.getKey());
        continue;
      } 
      iterator1.remove();
      this.skeletonJSON.remove(entry.getKey());
    } 
    Iterator iterator2 = this.spineAnimNamesToLoad.iterator();
    while (iterator2.hasNext())
      loadSpineAnimation((String)iterator2.next()); 
  }
  
  public void loadSpriteAnimations() {
    for (String str : this.spriteAnimations.keySet()) {
      if (!this.spriteAnimNamesToLoad.contains(str))
        this.spriteAnimations.remove(str); 
    } 
    for (String str : this.spriteAnimNamesToLoad) {
      Files files = Gdx.files;
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(this.packResolutionName);
      stringBuilder.append(File.separator);
      stringBuilder.append(this.spriteAnimationsPath);
      stringBuilder.append(File.separator);
      stringBuilder.append(str);
      stringBuilder.append(File.separator);
      stringBuilder.append(str);
      stringBuilder.append(".atlas");
      TextureAtlas textureAtlas = new TextureAtlas(files.internal(stringBuilder.toString()));
      this.spriteAnimations.put(str, textureAtlas);
    } 
  }
  
  public void loadSpriterAnimations() {
    for (String str : this.spriterAnimations.keySet()) {
      if (!this.spriterAnimNamesToLoad.contains(str))
        this.spriterAnimations.remove(str); 
    } 
    for (String str : this.spriterAnimNamesToLoad) {
      Files files = Gdx.files;
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("orig");
      stringBuilder.append(File.separator);
      stringBuilder.append(this.spriterAnimationsPath);
      stringBuilder.append(File.separator);
      stringBuilder.append(str);
      stringBuilder.append(File.separator);
      stringBuilder.append(str);
      stringBuilder.append(".scml");
      FileHandle fileHandle = files.internal(stringBuilder.toString());
      this.spriterAnimations.put(str, fileHandle);
    } 
  }
  
  public void prepareAssetsToLoad() {
    this.particleEffectNamesToLoad.clear();
    this.spineAnimNamesToLoad.clear();
    this.spriteAnimNamesToLoad.clear();
    this.spriterAnimNamesToLoad.clear();
    this.fontsToLoad.clear();
    for (String str : this.preparedSceneNames) {
      CompositeVO compositeVO = ((SceneVO)this.loadedSceneVOs.get(str)).composite;
      if (compositeVO == null)
        continue; 
      String[] arrayOfString1 = compositeVO.getRecursiveParticleEffectsList();
      String[] arrayOfString2 = compositeVO.getRecursiveSpineAnimationList();
      String[] arrayOfString3 = compositeVO.getRecursiveSpriteAnimationList();
      String[] arrayOfString4 = compositeVO.getRecursiveSpriterAnimationList();
      FontSizePair[] arrayOfFontSizePair = compositeVO.getRecursiveFontList();
      for (CompositeItemVO compositeItemVO : ((SceneVO)this.loadedSceneVOs.get(str)).libraryItems.values()) {
        FontSizePair[] arrayOfFontSizePair1 = compositeItemVO.composite.getRecursiveFontList();
        Collections.addAll(this.fontsToLoad, arrayOfFontSizePair1);
        String[] arrayOfString = compositeItemVO.composite.getRecursiveParticleEffectsList();
        Collections.addAll(this.particleEffectNamesToLoad, arrayOfString);
      } 
      Collections.addAll(this.particleEffectNamesToLoad, arrayOfString1);
      Collections.addAll(this.spineAnimNamesToLoad, arrayOfString2);
      Collections.addAll(this.spriteAnimNamesToLoad, arrayOfString3);
      Collections.addAll(this.spriterAnimNamesToLoad, arrayOfString4);
      Collections.addAll(this.fontsToLoad, arrayOfFontSizePair);
    } 
  }
  
  public void scheduleScene(String paramString) {
    if (this.loadedSceneVOs.containsKey(paramString))
      this.preparedSceneNames.add(paramString); 
  }
  
  public void setWorkingResolution(String paramString) { this.packResolutionName = paramString; }
  
  public void unLoadScene(String paramString) {
    unScheduleScene(paramString);
    this.loadedSceneVOs.remove(paramString);
    loadAssets();
  }
  
  public void unLoadSceneVO(String paramString) { this.loadedSceneVOs.remove(paramString); }
  
  public void unScheduleScene(String paramString) { this.preparedSceneNames.remove(paramString); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/resources/ResourceManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */