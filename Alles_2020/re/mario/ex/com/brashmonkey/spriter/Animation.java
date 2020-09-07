package com.brashmonkey.spriter;

import java.util.HashMap;

public class Animation {
  Mainline.Key currentKey;
  
  public final int id;
  
  public final int length;
  
  public final boolean looping;
  
  public final Mainline mainline;
  
  public final String name;
  
  private final HashMap<String, Timeline> nameToTimeline;
  
  private boolean prepared;
  
  private int timelinePointer = 0;
  
  private final Timeline[] timelines;
  
  Timeline.Key[] tweenedKeys;
  
  Timeline.Key[] unmappedTweenedKeys;
  
  public Animation(Mainline paramMainline, int paramInt1, String paramString, int paramInt2, boolean paramBoolean, int paramInt3) {
    this.mainline = paramMainline;
    this.id = paramInt1;
    this.name = paramString;
    this.length = paramInt2;
    this.looping = paramBoolean;
    this.timelines = new Timeline[paramInt3];
    this.prepared = false;
    this.nameToTimeline = new HashMap();
  }
  
  void addTimeline(Timeline paramTimeline) {
    Timeline[] arrayOfTimeline = this.timelines;
    int i = this.timelinePointer;
    this.timelinePointer = i + 1;
    arrayOfTimeline[i] = paramTimeline;
    this.nameToTimeline.put(paramTimeline.name, paramTimeline);
  }
  
  Timeline getSimilarTimeline(Timeline paramTimeline) {
    Timeline timeline1 = getTimeline(paramTimeline.name);
    Timeline timeline2 = timeline1;
    if (timeline1 == null) {
      timeline2 = timeline1;
      if (paramTimeline.id < timelines())
        timeline2 = getTimeline(paramTimeline.id); 
    } 
    return timeline2;
  }
  
  public Timeline getTimeline(int paramInt) { return this.timelines[paramInt]; }
  
  public Timeline getTimeline(String paramString) { return (Timeline)this.nameToTimeline.get(paramString); }
  
  public void prepare() {
    if (this.prepared)
      return; 
    Timeline[] arrayOfTimeline = this.timelines;
    this.tweenedKeys = new Timeline.Key[arrayOfTimeline.length];
    this.unmappedTweenedKeys = new Timeline.Key[arrayOfTimeline.length];
    byte b = 0;
    while (true) {
      Timeline.Key[] arrayOfKey = this.tweenedKeys;
      if (b < arrayOfKey.length) {
        arrayOfKey[b] = new Timeline.Key(b);
        this.unmappedTweenedKeys[b] = new Timeline.Key(b);
        this.tweenedKeys[b].setObject(new Timeline.Key.Object(new Point(0.0F, 0.0F)));
        this.unmappedTweenedKeys[b].setObject(new Timeline.Key.Object(new Point(0.0F, 0.0F)));
        b++;
        continue;
      } 
      break;
    } 
    if (this.mainline.keys.length > 0)
      this.currentKey = this.mainline.getKey(0); 
    this.prepared = true;
  }
  
  public int timelines() { return this.timelines.length; }
  
  public String toString() {
    StringBuilder stringBuilder1 = new StringBuilder();
    stringBuilder1.append(getClass().getSimpleName());
    stringBuilder1.append("|[id: ");
    stringBuilder1.append(this.id);
    stringBuilder1.append(", ");
    stringBuilder1.append(this.name);
    stringBuilder1.append(", duration: ");
    stringBuilder1.append(this.length);
    stringBuilder1.append(", is looping: ");
    stringBuilder1.append(this.looping);
    String str2 = stringBuilder1.toString();
    stringBuilder1 = new StringBuilder();
    stringBuilder1.append(str2);
    stringBuilder1.append("Mainline:\n");
    String str1 = stringBuilder1.toString();
    StringBuilder stringBuilder2 = new StringBuilder();
    stringBuilder2.append(str1);
    stringBuilder2.append(this.mainline);
    str1 = stringBuilder2.toString();
    stringBuilder2 = new StringBuilder();
    stringBuilder2.append(str1);
    stringBuilder2.append("Timelines\n");
    str1 = stringBuilder2.toString();
    for (Timeline timeline : this.timelines) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(str1);
      stringBuilder.append(timeline);
      str1 = stringBuilder.toString();
    } 
    stringBuilder2 = new StringBuilder();
    stringBuilder2.append(str1);
    stringBuilder2.append("]");
    return stringBuilder2.toString();
  }
  
  protected void tweenBone(Timeline.Key.Bone paramBone1, Timeline.Key.Bone paramBone2, Timeline.Key.Bone paramBone3, float paramFloat, Curve paramCurve, int paramInt) {
    paramBone3.angle = paramCurve.tweenAngle(paramBone1.angle, paramBone2.angle, paramFloat, paramInt);
    paramCurve.tweenPoint(paramBone1.position, paramBone2.position, paramFloat, paramBone3.position);
    paramCurve.tweenPoint(paramBone1.scale, paramBone2.scale, paramFloat, paramBone3.scale);
    paramCurve.tweenPoint(paramBone1.pivot, paramBone2.pivot, paramFloat, paramBone3.pivot);
  }
  
  protected void tweenObject(Timeline.Key.Object paramObject1, Timeline.Key.Object paramObject2, Timeline.Key.Object paramObject3, float paramFloat, Curve paramCurve, int paramInt) {
    tweenBone(paramObject1, paramObject2, paramObject3, paramFloat, paramCurve, paramInt);
    paramObject3.alpha = paramCurve.tweenAngle(paramObject1.alpha, paramObject2.alpha, paramFloat);
    paramObject3.ref.set(paramObject1.ref);
  }
  
  void unmapTimelineObject(int paramInt, boolean paramBoolean, Timeline.Key.Bone paramBone) {
    Timeline.Key.Object object1 = this.tweenedKeys[paramInt].object();
    Timeline.Key.Object object2 = this.unmappedTweenedKeys[paramInt].object();
    if (paramBoolean) {
      ((Timeline.Key.Object)object2).set((Timeline.Key.Object)object1);
    } else {
      object2.set(object1);
    } 
    object2.unmap(paramBone);
  }
  
  public void update(int paramInt, Timeline.Key.Bone paramBone) {
    if (this.prepared) {
      if (paramBone != null) {
        this.currentKey = this.mainline.getKeyBeforeTime(paramInt);
        Timeline.Key[] arrayOfKey = this.unmappedTweenedKeys;
        int i = arrayOfKey.length;
        byte b1 = 0;
        byte b2;
        for (b2 = 0; b2 < i; b2++)
          (arrayOfKey[b2]).active = false; 
        Mainline.Key.BoneRef[] arrayOfBoneRef = this.currentKey.boneRefs;
        i = arrayOfBoneRef.length;
        for (b2 = 0; b2 < i; b2++)
          update(arrayOfBoneRef[b2], paramBone, paramInt); 
        Mainline.Key.ObjectRef[] arrayOfObjectRef = this.currentKey.objectRefs;
        i = arrayOfObjectRef.length;
        for (b2 = b1; b2 < i; b2++)
          update(arrayOfObjectRef[b2], paramBone, paramInt); 
        return;
      } 
      throw new SpriterException("The root can not be null! Set a root bone to apply this animation relative to the root bone.");
    } 
    SpriterException spriterException = new SpriterException("This animation is not ready yet to animate itself. Please call prepare()!");
    throw spriterException;
  }
  
  protected void update(Mainline.Key.BoneRef paramBoneRef, Timeline.Key.Bone paramBone, int paramInt) { // Byte code:
    //   0: aload_1
    //   1: instanceof com/brashmonkey/spriter/Mainline$Key$ObjectRef
    //   4: istore #4
    //   6: aload_0
    //   7: aload_1
    //   8: getfield timeline : I
    //   11: invokevirtual getTimeline : (I)Lcom/brashmonkey/spriter/Timeline;
    //   14: astore #5
    //   16: aload #5
    //   18: aload_1
    //   19: getfield key : I
    //   22: invokevirtual getKey : (I)Lcom/brashmonkey/spriter/Timeline$Key;
    //   25: astore #6
    //   27: aload #5
    //   29: aload_1
    //   30: getfield key : I
    //   33: iconst_1
    //   34: iadd
    //   35: aload #5
    //   37: getfield keys : [Lcom/brashmonkey/spriter/Timeline$Key;
    //   40: arraylength
    //   41: irem
    //   42: invokevirtual getKey : (I)Lcom/brashmonkey/spriter/Timeline$Key;
    //   45: astore #7
    //   47: aload #6
    //   49: getfield time : I
    //   52: istore #8
    //   54: aload #7
    //   56: getfield time : I
    //   59: istore #9
    //   61: aload #7
    //   63: astore #5
    //   65: iload #9
    //   67: istore #10
    //   69: iload #9
    //   71: iload #8
    //   73: if_icmpge -> 104
    //   76: aload_0
    //   77: getfield looping : Z
    //   80: ifne -> 94
    //   83: aload #6
    //   85: astore #5
    //   87: iload #9
    //   89: istore #10
    //   91: goto -> 104
    //   94: aload_0
    //   95: getfield length : I
    //   98: istore #10
    //   100: aload #7
    //   102: astore #5
    //   104: iload_3
    //   105: iload #8
    //   107: isub
    //   108: i2f
    //   109: fstore #11
    //   111: iload #10
    //   113: iload #8
    //   115: isub
    //   116: i2f
    //   117: fstore #12
    //   119: fload #11
    //   121: fload #12
    //   123: fdiv
    //   124: fstore #13
    //   126: fload #13
    //   128: invokestatic isNaN : (F)Z
    //   131: ifne -> 146
    //   134: fload #13
    //   136: fstore #11
    //   138: fload #13
    //   140: invokestatic isInfinite : (F)Z
    //   143: ifeq -> 149
    //   146: fconst_1
    //   147: fstore #11
    //   149: aload_0
    //   150: getfield currentKey : Lcom/brashmonkey/spriter/Mainline$Key;
    //   153: getfield time : I
    //   156: iload #8
    //   158: if_icmple -> 267
    //   161: aload_0
    //   162: getfield currentKey : Lcom/brashmonkey/spriter/Mainline$Key;
    //   165: getfield time : I
    //   168: iload #8
    //   170: isub
    //   171: i2f
    //   172: fload #12
    //   174: fdiv
    //   175: fstore #13
    //   177: fload #13
    //   179: invokestatic isNaN : (F)Z
    //   182: ifne -> 197
    //   185: fload #13
    //   187: fstore #11
    //   189: fload #13
    //   191: invokestatic isInfinite : (F)Z
    //   194: ifeq -> 200
    //   197: fconst_0
    //   198: fstore #11
    //   200: iload_3
    //   201: aload_0
    //   202: getfield currentKey : Lcom/brashmonkey/spriter/Mainline$Key;
    //   205: getfield time : I
    //   208: isub
    //   209: i2f
    //   210: iload #10
    //   212: aload_0
    //   213: getfield currentKey : Lcom/brashmonkey/spriter/Mainline$Key;
    //   216: getfield time : I
    //   219: isub
    //   220: i2f
    //   221: fdiv
    //   222: fstore #12
    //   224: fload #12
    //   226: invokestatic isNaN : (F)Z
    //   229: ifne -> 244
    //   232: fload #12
    //   234: fstore #13
    //   236: fload #12
    //   238: invokestatic isInfinite : (F)Z
    //   241: ifeq -> 247
    //   244: fconst_1
    //   245: fstore #13
    //   247: aload_0
    //   248: getfield currentKey : Lcom/brashmonkey/spriter/Mainline$Key;
    //   251: getfield curve : Lcom/brashmonkey/spriter/Curve;
    //   254: fload #11
    //   256: fconst_1
    //   257: fload #13
    //   259: invokevirtual tween : (FFF)F
    //   262: fstore #11
    //   264: goto -> 283
    //   267: aload_0
    //   268: getfield currentKey : Lcom/brashmonkey/spriter/Mainline$Key;
    //   271: getfield curve : Lcom/brashmonkey/spriter/Curve;
    //   274: fconst_0
    //   275: fconst_1
    //   276: fload #11
    //   278: invokevirtual tween : (FFF)F
    //   281: fstore #11
    //   283: aload #6
    //   285: invokevirtual object : ()Lcom/brashmonkey/spriter/Timeline$Key$Object;
    //   288: astore #7
    //   290: aload #5
    //   292: invokevirtual object : ()Lcom/brashmonkey/spriter/Timeline$Key$Object;
    //   295: astore #14
    //   297: aload_0
    //   298: getfield tweenedKeys : [Lcom/brashmonkey/spriter/Timeline$Key;
    //   301: aload_1
    //   302: getfield timeline : I
    //   305: aaload
    //   306: invokevirtual object : ()Lcom/brashmonkey/spriter/Timeline$Key$Object;
    //   309: astore #5
    //   311: iload #4
    //   313: ifeq -> 350
    //   316: aload_0
    //   317: aload #7
    //   319: checkcast com/brashmonkey/spriter/Timeline$Key$Object
    //   322: aload #14
    //   324: checkcast com/brashmonkey/spriter/Timeline$Key$Object
    //   327: aload #5
    //   329: checkcast com/brashmonkey/spriter/Timeline$Key$Object
    //   332: fload #11
    //   334: aload #6
    //   336: getfield curve : Lcom/brashmonkey/spriter/Curve;
    //   339: aload #6
    //   341: getfield spin : I
    //   344: invokevirtual tweenObject : (Lcom/brashmonkey/spriter/Timeline$Key$Object;Lcom/brashmonkey/spriter/Timeline$Key$Object;Lcom/brashmonkey/spriter/Timeline$Key$Object;FLcom/brashmonkey/spriter/Curve;I)V
    //   347: goto -> 372
    //   350: aload_0
    //   351: aload #7
    //   353: aload #14
    //   355: aload #5
    //   357: fload #11
    //   359: aload #6
    //   361: getfield curve : Lcom/brashmonkey/spriter/Curve;
    //   364: aload #6
    //   366: getfield spin : I
    //   369: invokevirtual tweenBone : (Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Timeline$Key$Bone;FLcom/brashmonkey/spriter/Curve;I)V
    //   372: aload_0
    //   373: getfield unmappedTweenedKeys : [Lcom/brashmonkey/spriter/Timeline$Key;
    //   376: aload_1
    //   377: getfield timeline : I
    //   380: aaload
    //   381: iconst_1
    //   382: putfield active : Z
    //   385: aload_1
    //   386: getfield timeline : I
    //   389: istore_3
    //   390: aload_1
    //   391: getfield parent : Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;
    //   394: ifnull -> 413
    //   397: aload_0
    //   398: getfield unmappedTweenedKeys : [Lcom/brashmonkey/spriter/Timeline$Key;
    //   401: aload_1
    //   402: getfield parent : Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;
    //   405: getfield timeline : I
    //   408: aaload
    //   409: invokevirtual object : ()Lcom/brashmonkey/spriter/Timeline$Key$Object;
    //   412: astore_2
    //   413: aload_0
    //   414: iload_3
    //   415: iload #4
    //   417: aload_2
    //   418: invokevirtual unmapTimelineObject : (IZLcom/brashmonkey/spriter/Timeline$Key$Bone;)V
    //   421: return }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Animation.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */