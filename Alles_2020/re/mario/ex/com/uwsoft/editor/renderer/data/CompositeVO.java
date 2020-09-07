package com.uwsoft.editor.renderer.data;

import com.uwsoft.editor.renderer.resources.FontSizePair;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;

public class CompositeVO {
  public ArrayList<LayerItemVO> layers = new ArrayList();
  
  public ArrayList<ButtonVO> sButtons = new ArrayList(true);
  
  public ArrayList<CheckBoxVO> sCheckBoxes = new ArrayList(true);
  
  public ArrayList<CompositeItemVO> sComposites = new ArrayList(true);
  
  public ArrayList<Image9patchVO> sImage9patchs = new ArrayList(true);
  
  public ArrayList<SimpleImageVO> sImages = new ArrayList(true);
  
  public ArrayList<LabelVO> sLabels = new ArrayList(true);
  
  public ArrayList<LightVO> sLights = new ArrayList(true);
  
  public ArrayList<ParticleEffectVO> sParticleEffects = new ArrayList(true);
  
  public ArrayList<SelectBoxVO> sSelectBoxes = new ArrayList(true);
  
  public ArrayList<SpineVO> sSpineAnimations = new ArrayList(true);
  
  public ArrayList<SpriteAnimationVO> sSpriteAnimations = new ArrayList(true);
  
  public ArrayList<SpriterVO> sSpriterAnimations = new ArrayList(true);
  
  public ArrayList<TextBoxVO> sTextBox = new ArrayList(true);
  
  public CompositeVO() {}
  
  public CompositeVO(CompositeVO paramCompositeVO) {
    if (paramCompositeVO == null)
      return; 
    update(paramCompositeVO);
  }
  
  private ArrayList<MainItemVO> getAllItemsRecursive(ArrayList<MainItemVO> paramArrayList, CompositeVO paramCompositeVO) {
    Iterator iterator = paramCompositeVO.sButtons.iterator();
    while (iterator.hasNext())
      paramArrayList.add((MainItemVO)iterator.next()); 
    iterator = paramCompositeVO.sCheckBoxes.iterator();
    while (iterator.hasNext())
      paramArrayList.add((MainItemVO)iterator.next()); 
    iterator = paramCompositeVO.sImage9patchs.iterator();
    while (iterator.hasNext())
      paramArrayList.add((MainItemVO)iterator.next()); 
    iterator = paramCompositeVO.sImages.iterator();
    while (iterator.hasNext())
      paramArrayList.add((MainItemVO)iterator.next()); 
    iterator = paramCompositeVO.sLabels.iterator();
    while (iterator.hasNext())
      paramArrayList.add((MainItemVO)iterator.next()); 
    iterator = paramCompositeVO.sLights.iterator();
    while (iterator.hasNext())
      paramArrayList.add((MainItemVO)iterator.next()); 
    iterator = paramCompositeVO.sParticleEffects.iterator();
    while (iterator.hasNext())
      paramArrayList.add((MainItemVO)iterator.next()); 
    iterator = paramCompositeVO.sSelectBoxes.iterator();
    while (iterator.hasNext())
      paramArrayList.add((MainItemVO)iterator.next()); 
    iterator = paramCompositeVO.sSpineAnimations.iterator();
    while (iterator.hasNext())
      paramArrayList.add((MainItemVO)iterator.next()); 
    iterator = paramCompositeVO.sSpriteAnimations.iterator();
    while (iterator.hasNext())
      paramArrayList.add((MainItemVO)iterator.next()); 
    iterator = paramCompositeVO.sSpriterAnimations.iterator();
    while (iterator.hasNext())
      paramArrayList.add((MainItemVO)iterator.next()); 
    iterator = paramCompositeVO.sTextBox.iterator();
    while (iterator.hasNext())
      paramArrayList.add((MainItemVO)iterator.next()); 
    for (CompositeItemVO compositeItemVO : paramCompositeVO.sComposites) {
      paramArrayList = getAllItemsRecursive(paramArrayList, compositeItemVO.composite);
      paramArrayList.add(compositeItemVO);
    } 
    return paramArrayList;
  }
  
  public void addItem(MainItemVO paramMainItemVO) {
    String str = paramMainItemVO.getClass().getSimpleName();
    if (str.equals("SimpleImageVO"))
      this.sImages.add((SimpleImageVO)paramMainItemVO); 
    if (str.equals("Image9patchVO"))
      this.sImage9patchs.add((Image9patchVO)paramMainItemVO); 
    if (str.equals("TextBoxVO"))
      this.sTextBox.add((TextBoxVO)paramMainItemVO); 
    if (str.equals("ButtonVO"))
      this.sButtons.add((ButtonVO)paramMainItemVO); 
    if (str.equals("LabelVO"))
      this.sLabels.add((LabelVO)paramMainItemVO); 
    if (str.equals("CompositeItemVO"))
      this.sComposites.add((CompositeItemVO)paramMainItemVO); 
    if (str.equals("CheckBoxVO"))
      this.sCheckBoxes.add((CheckBoxVO)paramMainItemVO); 
    if (str.equals("SelectBoxVO"))
      this.sSelectBoxes.add((SelectBoxVO)paramMainItemVO); 
    if (str.equals("ParticleEffectVO"))
      this.sParticleEffects.add((ParticleEffectVO)paramMainItemVO); 
    if (str.equals("LightVO"))
      this.sLights.add((LightVO)paramMainItemVO); 
    if (str.equals("SpineVO"))
      this.sSpineAnimations.add((SpineVO)paramMainItemVO); 
    if (str.equals("SpriterVO"))
      this.sSpriterAnimations.add((SpriterVO)paramMainItemVO); 
    if (str.equals("SpriteAnimationVO"))
      this.sSpriteAnimations.add((SpriteAnimationVO)paramMainItemVO); 
  }
  
  public void clear() {
    this.sImages.clear();
    this.sTextBox.clear();
    this.sButtons.clear();
    this.sLabels.clear();
    this.sComposites.clear();
    this.sCheckBoxes.clear();
    this.sSelectBoxes.clear();
    this.sParticleEffects.clear();
    this.sLights.clear();
    this.sSpineAnimations.clear();
    this.sSpriteAnimations.clear();
    this.sSpriterAnimations.clear();
  }
  
  public ArrayList<MainItemVO> getAllItems() { return getAllItemsRecursive(new ArrayList(), this); }
  
  public FontSizePair[] getRecursiveFontList() {
    HashSet hashSet = new HashSet();
    for (LabelVO labelVO : this.sLabels) {
      int i;
      String str;
      if (labelVO.style.isEmpty()) {
        str = "arial";
      } else {
        str = labelVO.style;
      } 
      if (labelVO.size == 0) {
        i = 12;
      } else {
        i = labelVO.size;
      } 
      hashSet.add(new FontSizePair(str, i));
    } 
    Iterator iterator = this.sComposites.iterator();
    while (iterator.hasNext())
      Collections.addAll(hashSet, ((CompositeItemVO)iterator.next()).composite.getRecursiveFontList()); 
    FontSizePair[] arrayOfFontSizePair = new FontSizePair[hashSet.size()];
    hashSet.toArray(arrayOfFontSizePair);
    return arrayOfFontSizePair;
  }
  
  public String[] getRecursiveParticleEffectsList() {
    HashSet hashSet = new HashSet();
    Iterator iterator = this.sParticleEffects.iterator();
    while (iterator.hasNext())
      hashSet.add(((ParticleEffectVO)iterator.next()).particleName); 
    iterator = this.sComposites.iterator();
    while (iterator.hasNext())
      Collections.addAll(hashSet, ((CompositeItemVO)iterator.next()).composite.getRecursiveParticleEffectsList()); 
    String[] arrayOfString = new String[hashSet.size()];
    hashSet.toArray(arrayOfString);
    return arrayOfString;
  }
  
  public String[] getRecursiveSpineAnimationList() {
    HashSet hashSet = new HashSet();
    Iterator iterator = this.sSpineAnimations.iterator();
    while (iterator.hasNext())
      hashSet.add(((SpineVO)iterator.next()).animationName); 
    iterator = this.sComposites.iterator();
    while (iterator.hasNext())
      Collections.addAll(hashSet, ((CompositeItemVO)iterator.next()).composite.getRecursiveSpineAnimationList()); 
    String[] arrayOfString = new String[hashSet.size()];
    hashSet.toArray(arrayOfString);
    return arrayOfString;
  }
  
  public String[] getRecursiveSpriteAnimationList() {
    HashSet hashSet = new HashSet();
    Iterator iterator = this.sSpriteAnimations.iterator();
    while (iterator.hasNext())
      hashSet.add(((SpriteAnimationVO)iterator.next()).animationName); 
    iterator = this.sComposites.iterator();
    while (iterator.hasNext())
      Collections.addAll(hashSet, ((CompositeItemVO)iterator.next()).composite.getRecursiveSpriteAnimationList()); 
    String[] arrayOfString = new String[hashSet.size()];
    hashSet.toArray(arrayOfString);
    return arrayOfString;
  }
  
  public String[] getRecursiveSpriterAnimationList() {
    HashSet hashSet = new HashSet();
    Iterator iterator = this.sSpriterAnimations.iterator();
    while (iterator.hasNext())
      hashSet.add(((SpriterVO)iterator.next()).animationName); 
    iterator = this.sComposites.iterator();
    while (iterator.hasNext())
      Collections.addAll(hashSet, ((CompositeItemVO)iterator.next()).composite.getRecursiveSpriterAnimationList()); 
    String[] arrayOfString = new String[hashSet.size()];
    hashSet.toArray(arrayOfString);
    return arrayOfString;
  }
  
  public boolean isEmpty() {
    boolean bool;
    if (this.sComposites.size() == 0 && this.sImage9patchs.size() == 0 && this.sImages.size() == 0 && this.sSpriteAnimations.size() == 0 && this.sButtons.size() == 0 && this.sCheckBoxes.size() == 0 && this.sLabels.size() == 0 && this.sLights.size() == 0 && this.sParticleEffects.size() == 0 && this.sCheckBoxes.size() == 0 && this.sSpriteAnimations.size() == 0 && this.sSpriterAnimations.size() == 0 && this.sSpineAnimations.size() == 0 && this.sSelectBoxes.size() == 0 && this.sTextBox.size() == 0) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public void removeItem(MainItemVO paramMainItemVO) {
    String str = paramMainItemVO.getClass().getSimpleName();
    if (str.equals("SimpleImageVO"))
      this.sImages.remove((SimpleImageVO)paramMainItemVO); 
    if (str.equals("Image9patchVO"))
      this.sImage9patchs.remove((Image9patchVO)paramMainItemVO); 
    if (str.equals("TextBoxVO"))
      this.sTextBox.remove((TextBoxVO)paramMainItemVO); 
    if (str.equals("ButtonVO"))
      this.sButtons.remove((ButtonVO)paramMainItemVO); 
    if (str.equals("LabelVO"))
      this.sLabels.remove((LabelVO)paramMainItemVO); 
    if (str.equals("CompositeItemVO"))
      this.sComposites.remove((CompositeItemVO)paramMainItemVO); 
    if (str.equals("CheckBoxVO"))
      this.sCheckBoxes.remove((CheckBoxVO)paramMainItemVO); 
    if (str.equals("SelectBoxVO"))
      this.sSelectBoxes.remove((SelectBoxVO)paramMainItemVO); 
    if (str.equals("ParticleEffectVO"))
      this.sParticleEffects.remove((ParticleEffectVO)paramMainItemVO); 
    if (str.equals("LightVO"))
      this.sLights.remove((LightVO)paramMainItemVO); 
    if (str.equals("SpineVO"))
      this.sSpineAnimations.remove((SpineVO)paramMainItemVO); 
    if (str.equals("SpriteAnimationVO"))
      this.sSpriteAnimations.remove((SpriteAnimationVO)paramMainItemVO); 
    if (str.equals("SpriterVO"))
      this.sSpriterAnimations.remove((SpriterVO)paramMainItemVO); 
  }
  
  public void update(CompositeVO paramCompositeVO) {
    clear();
    byte b1 = 0;
    byte b2;
    for (b2 = 0; b2 < paramCompositeVO.sImages.size(); b2++)
      this.sImages.add(new SimpleImageVO((SimpleImageVO)paramCompositeVO.sImages.get(b2))); 
    for (b2 = 0; b2 < paramCompositeVO.sImage9patchs.size(); b2++)
      this.sImage9patchs.add(new Image9patchVO((Image9patchVO)paramCompositeVO.sImage9patchs.get(b2))); 
    for (b2 = 0; b2 < paramCompositeVO.sTextBox.size(); b2++)
      this.sTextBox.add(new TextBoxVO((TextBoxVO)paramCompositeVO.sTextBox.get(b2))); 
    for (b2 = 0; b2 < paramCompositeVO.sButtons.size(); b2++)
      this.sButtons.add(new ButtonVO((ButtonVO)paramCompositeVO.sButtons.get(b2))); 
    for (b2 = 0; b2 < paramCompositeVO.sLabels.size(); b2++)
      this.sLabels.add(new LabelVO((LabelVO)paramCompositeVO.sLabels.get(b2))); 
    for (b2 = 0; b2 < paramCompositeVO.sComposites.size(); b2++)
      this.sComposites.add(new CompositeItemVO((CompositeItemVO)paramCompositeVO.sComposites.get(b2))); 
    for (b2 = 0; b2 < paramCompositeVO.sCheckBoxes.size(); b2++)
      this.sCheckBoxes.add(new CheckBoxVO((CheckBoxVO)paramCompositeVO.sCheckBoxes.get(b2))); 
    for (b2 = 0; b2 < paramCompositeVO.sSelectBoxes.size(); b2++)
      this.sSelectBoxes.add(new SelectBoxVO((SelectBoxVO)paramCompositeVO.sSelectBoxes.get(b2))); 
    for (b2 = 0; b2 < paramCompositeVO.sParticleEffects.size(); b2++)
      this.sParticleEffects.add(new ParticleEffectVO((ParticleEffectVO)paramCompositeVO.sParticleEffects.get(b2))); 
    for (b2 = 0; b2 < paramCompositeVO.sLights.size(); b2++)
      this.sLights.add(new LightVO((LightVO)paramCompositeVO.sLights.get(b2))); 
    for (b2 = 0; b2 < paramCompositeVO.sSpineAnimations.size(); b2++)
      this.sSpineAnimations.add(new SpineVO((SpineVO)paramCompositeVO.sSpineAnimations.get(b2))); 
    for (b2 = 0; b2 < paramCompositeVO.sSpriteAnimations.size(); b2++)
      this.sSpriteAnimations.add(new SpriteAnimationVO((SpriteAnimationVO)paramCompositeVO.sSpriteAnimations.get(b2))); 
    for (b2 = 0; b2 < paramCompositeVO.sSpriterAnimations.size(); b2++)
      this.sSpriterAnimations.add(new SpriterVO((SpriterVO)paramCompositeVO.sSpriterAnimations.get(b2))); 
    this.layers.clear();
    for (b2 = b1; b2 < paramCompositeVO.layers.size(); b2++)
      this.layers.add(new LayerItemVO((LayerItemVO)paramCompositeVO.layers.get(b2))); 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/CompositeVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */