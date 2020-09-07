package com.brashmonkey.spriter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Entity {
  private int animationPointer = 0;
  
  private final Animation[] animations;
  
  private int charMapPointer = 0;
  
  private final CharacterMap[] characterMaps;
  
  public final int id;
  
  public final String name;
  
  private final HashMap<String, Animation> namedAnimations;
  
  private int objInfoPointer = 0;
  
  private final ObjectInfo[] objectInfos;
  
  Entity(int paramInt1, String paramString, int paramInt2, int paramInt3, int paramInt4) {
    this.id = paramInt1;
    this.name = paramString;
    this.animations = new Animation[paramInt2];
    this.characterMaps = new CharacterMap[paramInt3];
    this.objectInfos = new ObjectInfo[paramInt4];
    this.namedAnimations = new HashMap();
  }
  
  void addAnimation(Animation paramAnimation) {
    Animation[] arrayOfAnimation = this.animations;
    int i = this.animationPointer;
    this.animationPointer = i + 1;
    arrayOfAnimation[i] = paramAnimation;
    this.namedAnimations.put(paramAnimation.name, paramAnimation);
  }
  
  void addCharacterMap(CharacterMap paramCharacterMap) {
    CharacterMap[] arrayOfCharacterMap = this.characterMaps;
    int i = this.charMapPointer;
    this.charMapPointer = i + 1;
    arrayOfCharacterMap[i] = paramCharacterMap;
  }
  
  void addInfo(ObjectInfo paramObjectInfo) {
    ObjectInfo[] arrayOfObjectInfo = this.objectInfos;
    int i = this.objInfoPointer;
    this.objInfoPointer = i + 1;
    arrayOfObjectInfo[i] = paramObjectInfo;
  }
  
  public int animations() { return this.animations.length; }
  
  public boolean containsAnimation(Animation paramAnimation) {
    Animation[] arrayOfAnimation = this.animations;
    int i = arrayOfAnimation.length;
    for (byte b = 0; b < i; b++) {
      if (arrayOfAnimation[b] == paramAnimation)
        return true; 
    } 
    return false;
  }
  
  public Animation getAnimation(int paramInt) { return this.animations[paramInt]; }
  
  public Animation getAnimation(String paramString) { return (Animation)this.namedAnimations.get(paramString); }
  
  public Animation getAnimationWithMostTimelines() {
    byte b = 0;
    Animation animation = getAnimation(0);
    Animation[] arrayOfAnimation = this.animations;
    int i = arrayOfAnimation.length;
    while (b < i) {
      Animation animation1 = arrayOfAnimation[b];
      Animation animation2 = animation;
      if (animation.timelines() < animation1.timelines())
        animation2 = animation1; 
      b++;
      animation = animation2;
    } 
    return animation;
  }
  
  public CharacterMap getCharacterMap(String paramString) {
    for (CharacterMap characterMap : this.characterMaps) {
      if (characterMap.name.equals(paramString))
        return characterMap; 
    } 
    return null;
  }
  
  public ObjectInfo getInfo(int paramInt) { return this.objectInfos[paramInt]; }
  
  public ObjectInfo getInfo(String paramString) {
    for (ObjectInfo objectInfo : this.objectInfos) {
      if (objectInfo.name.equals(paramString))
        return objectInfo; 
    } 
    return null;
  }
  
  public ObjectInfo getInfo(String paramString, ObjectType paramObjectType) {
    ObjectInfo objectInfo = getInfo(paramString);
    return (objectInfo != null && objectInfo.type == paramObjectType) ? objectInfo : null;
  }
  
  public String toString() {
    StringBuilder stringBuilder1 = new StringBuilder();
    stringBuilder1.append(getClass().getSimpleName());
    stringBuilder1.append("|[id: ");
    stringBuilder1.append(this.id);
    stringBuilder1.append(", name: ");
    stringBuilder1.append(this.name);
    stringBuilder1.append("]");
    String str2 = stringBuilder1.toString();
    stringBuilder1 = new StringBuilder();
    stringBuilder1.append(str2);
    stringBuilder1.append("Object infos:\n");
    String str1 = stringBuilder1.toString();
    ObjectInfo[] arrayOfObjectInfo = this.objectInfos;
    null = arrayOfObjectInfo.length;
    boolean bool = false;
    for (null = 0; null < null; null++) {
      ObjectInfo objectInfo = arrayOfObjectInfo[null];
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(str1);
      stringBuilder.append("\n");
      stringBuilder.append(objectInfo);
      str1 = stringBuilder.toString();
    } 
    StringBuilder stringBuilder3 = new StringBuilder();
    stringBuilder3.append(str1);
    stringBuilder3.append("Character maps:\n");
    str1 = stringBuilder3.toString();
    for (CharacterMap characterMap : this.characterMaps) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(str1);
      stringBuilder.append("\n");
      stringBuilder.append(characterMap);
      str1 = stringBuilder.toString();
    } 
    stringBuilder3 = new StringBuilder();
    stringBuilder3.append(str1);
    stringBuilder3.append("Animations:\n");
    str1 = stringBuilder3.toString();
    Animation[] arrayOfAnimation = this.animations;
    int i = arrayOfAnimation.length;
    for (byte b = bool; b < i; b++) {
      Animation animation = arrayOfAnimation[b];
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(str1);
      stringBuilder.append("\n");
      stringBuilder.append(animation);
      str1 = stringBuilder.toString();
    } 
    StringBuilder stringBuilder2 = new StringBuilder();
    stringBuilder2.append(str1);
    stringBuilder2.append("]");
    return stringBuilder2.toString();
  }
  
  public static class CharacterMap extends HashMap<FileReference, FileReference> {
    private static final long serialVersionUID = 6062776450159802283L;
    
    public final int id;
    
    public final String name;
    
    public CharacterMap(int param1Int, String param1String) {
      this.id = param1Int;
      this.name = param1String;
    }
    
    public FileReference get(FileReference param1FileReference) { return !containsKey(param1FileReference) ? param1FileReference : (FileReference)get(param1FileReference); }
  }
  
  public static class ObjectInfo {
    public final List<FileReference> frames;
    
    public final String name;
    
    public final Dimension size;
    
    public final Entity.ObjectType type;
    
    ObjectInfo(String param1String, Entity.ObjectType param1ObjectType, Dimension param1Dimension) { this(param1String, param1ObjectType, param1Dimension, new ArrayList()); }
    
    ObjectInfo(String param1String, Entity.ObjectType param1ObjectType, Dimension param1Dimension, List<FileReference> param1List) {
      this.type = param1ObjectType;
      this.frames = param1List;
      this.name = param1String;
      this.size = param1Dimension;
    }
    
    ObjectInfo(String param1String, Entity.ObjectType param1ObjectType, List<FileReference> param1List) { this(param1String, param1ObjectType, new Dimension(0.0F, 0.0F), param1List); }
    
    public String toString() {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(this.name);
      stringBuilder.append(": ");
      stringBuilder.append(this.type);
      stringBuilder.append(", size: ");
      stringBuilder.append(this.size);
      stringBuilder.append("|frames:\n");
      stringBuilder.append(this.frames);
      return stringBuilder.toString();
    }
  }
  
  public enum ObjectType {
    Bone, Box, Point, Skin, Sprite;
    
    static  {
      Bone = new ObjectType("Bone", true);
      Box = new ObjectType("Box", 2);
      Point = new ObjectType("Point", 3);
      Skin = new ObjectType("Skin", 4);
      $VALUES = new ObjectType[] { Sprite, Bone, Box, Point, Skin };
    }
    
    public static ObjectType getObjectInfoFor(String param1String) { return param1String.equals("bone") ? Bone : (param1String.equals("skin") ? Skin : (param1String.equals("box") ? Box : (param1String.equals("point") ? Point : Sprite))); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Entity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */