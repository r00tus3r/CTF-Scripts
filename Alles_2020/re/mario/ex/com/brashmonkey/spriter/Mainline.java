package com.brashmonkey.spriter;

public class Mainline {
  private int keyPointer = 0;
  
  final Key[] keys;
  
  public Mainline(int paramInt) { this.keys = new Key[paramInt]; }
  
  public void addKey(Key paramKey) {
    Key[] arrayOfKey = this.keys;
    int i = this.keyPointer;
    this.keyPointer = i + 1;
    arrayOfKey[i] = paramKey;
  }
  
  public Key getKey(int paramInt) { return this.keys[paramInt]; }
  
  public Key getKeyBeforeTime(int paramInt) {
    Key[] arrayOfKey = this.keys;
    byte b = 0;
    Key key = arrayOfKey[0];
    int i = arrayOfKey.length;
    while (b < i) {
      Key key1 = arrayOfKey[b];
      if (key1.time <= paramInt) {
        b++;
        key = key1;
      } 
    } 
    return key;
  }
  
  public String toString() {
    StringBuilder stringBuilder1 = new StringBuilder();
    stringBuilder1.append(getClass().getSimpleName());
    stringBuilder1.append("|");
    String str = stringBuilder1.toString();
    for (Key key : this.keys) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(str);
      stringBuilder.append("\n");
      stringBuilder.append(key);
      str = stringBuilder.toString();
    } 
    StringBuilder stringBuilder2 = new StringBuilder();
    stringBuilder2.append(str);
    stringBuilder2.append("]");
    return stringBuilder2.toString();
  }
  
  public static class Key {
    private int bonePointer = 0;
    
    final BoneRef[] boneRefs;
    
    public final Curve curve;
    
    public final int id;
    
    private int objectPointer = 0;
    
    final ObjectRef[] objectRefs;
    
    public final int time;
    
    public Key(int param1Int1, int param1Int2, Curve param1Curve, int param1Int3, int param1Int4) {
      this.id = param1Int1;
      this.time = param1Int2;
      this.curve = param1Curve;
      this.boneRefs = new BoneRef[param1Int3];
      this.objectRefs = new ObjectRef[param1Int4];
    }
    
    public void addBoneRef(BoneRef param1BoneRef) {
      BoneRef[] arrayOfBoneRef = this.boneRefs;
      int i = this.bonePointer;
      this.bonePointer = i + 1;
      arrayOfBoneRef[i] = param1BoneRef;
    }
    
    public void addObjectRef(ObjectRef param1ObjectRef) {
      ObjectRef[] arrayOfObjectRef = this.objectRefs;
      int i = this.objectPointer;
      this.objectPointer = i + 1;
      arrayOfObjectRef[i] = param1ObjectRef;
    }
    
    public BoneRef getBoneRef(int param1Int) {
      if (param1Int >= 0) {
        BoneRef[] arrayOfBoneRef = this.boneRefs;
        if (param1Int < arrayOfBoneRef.length)
          return arrayOfBoneRef[param1Int]; 
      } 
      return null;
    }
    
    public BoneRef getBoneRef(BoneRef param1BoneRef) { return getBoneRefTimeline(param1BoneRef.timeline); }
    
    public BoneRef getBoneRefTimeline(int param1Int) {
      for (BoneRef boneRef : this.boneRefs) {
        if (boneRef.timeline == param1Int)
          return boneRef; 
      } 
      return null;
    }
    
    public ObjectRef getObjectRef(int param1Int) {
      if (param1Int >= 0) {
        ObjectRef[] arrayOfObjectRef = this.objectRefs;
        if (param1Int < arrayOfObjectRef.length)
          return arrayOfObjectRef[param1Int]; 
      } 
      return null;
    }
    
    public ObjectRef getObjectRef(ObjectRef param1ObjectRef) { return getObjectRefTimeline(param1ObjectRef.timeline); }
    
    public ObjectRef getObjectRefTimeline(int param1Int) {
      for (ObjectRef objectRef : this.objectRefs) {
        if (objectRef.timeline == param1Int)
          return objectRef; 
      } 
      return null;
    }
    
    public String toString() {
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append(getClass().getSimpleName());
      stringBuilder1.append("|[id:");
      stringBuilder1.append(this.id);
      stringBuilder1.append(", time: ");
      stringBuilder1.append(this.time);
      stringBuilder1.append(", curve: [");
      stringBuilder1.append(this.curve);
      stringBuilder1.append("]");
      String str = stringBuilder1.toString();
      BoneRef[] arrayOfBoneRef = this.boneRefs;
      int i = arrayOfBoneRef.length;
      byte b1 = 0;
      byte b2;
      for (b2 = 0; b2 < i; b2++) {
        BoneRef boneRef = arrayOfBoneRef[b2];
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append("\n");
        stringBuilder.append(boneRef);
        str = stringBuilder.toString();
      } 
      ObjectRef[] arrayOfObjectRef = this.objectRefs;
      i = arrayOfObjectRef.length;
      for (b2 = b1; b2 < i; b2++) {
        ObjectRef objectRef = arrayOfObjectRef[b2];
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append("\n");
        stringBuilder.append(objectRef);
        str = stringBuilder.toString();
      } 
      StringBuilder stringBuilder2 = new StringBuilder();
      stringBuilder2.append(str);
      stringBuilder2.append("]");
      return stringBuilder2.toString();
    }
    
    public static class BoneRef {
      public final int id;
      
      public final int key;
      
      public final BoneRef parent;
      
      public final int timeline;
      
      public BoneRef(int param2Int1, int param2Int2, int param2Int3, BoneRef param2BoneRef) {
        this.id = param2Int1;
        this.timeline = param2Int2;
        this.key = param2Int3;
        this.parent = param2BoneRef;
      }
      
      public String toString() {
        byte b;
        BoneRef boneRef = this.parent;
        if (boneRef != null) {
          b = boneRef.id;
        } else {
          b = -1;
        } 
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(getClass().getSimpleName());
        stringBuilder.append("|id: ");
        stringBuilder.append(this.id);
        stringBuilder.append(", parent:");
        stringBuilder.append(b);
        stringBuilder.append(", timeline: ");
        stringBuilder.append(this.timeline);
        stringBuilder.append(", key: ");
        stringBuilder.append(this.key);
        return stringBuilder.toString();
      }
    }
    
    public static class ObjectRef extends BoneRef implements Comparable<ObjectRef> {
      public final int zIndex;
      
      public ObjectRef(int param2Int1, int param2Int2, int param2Int3, Mainline.Key.BoneRef param2BoneRef, int param2Int4) {
        super(param2Int1, param2Int2, param2Int3, param2BoneRef);
        this.zIndex = param2Int4;
      }
      
      public int compareTo(ObjectRef param2ObjectRef) { return (int)Math.signum((this.zIndex - param2ObjectRef.zIndex)); }
      
      public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(super.toString());
        stringBuilder.append(", z_index: ");
        stringBuilder.append(this.zIndex);
        return stringBuilder.toString();
      }
    }
  }
  
  public static class BoneRef {
    public final int id;
    
    public final int key;
    
    public final BoneRef parent;
    
    public final int timeline;
    
    public BoneRef(int param1Int1, int param1Int2, int param1Int3, BoneRef param1BoneRef) {
      this.id = param1Int1;
      this.timeline = param1Int2;
      this.key = param1Int3;
      this.parent = param1BoneRef;
    }
    
    public String toString() {
      byte b;
      BoneRef boneRef = this.parent;
      if (boneRef != null) {
        b = boneRef.id;
      } else {
        b = -1;
      } 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(getClass().getSimpleName());
      stringBuilder.append("|id: ");
      stringBuilder.append(this.id);
      stringBuilder.append(", parent:");
      stringBuilder.append(b);
      stringBuilder.append(", timeline: ");
      stringBuilder.append(this.timeline);
      stringBuilder.append(", key: ");
      stringBuilder.append(this.key);
      return stringBuilder.toString();
    }
  }
  
  public static class ObjectRef extends Key.BoneRef implements Comparable<Key.ObjectRef> {
    public final int zIndex;
    
    public ObjectRef(int param1Int1, int param1Int2, int param1Int3, Mainline.Key.BoneRef param1BoneRef, int param1Int4) {
      super(param1Int1, param1Int2, param1Int3, param1BoneRef);
      this.zIndex = param1Int4;
    }
    
    public int compareTo(ObjectRef param1ObjectRef) { return (int)Math.signum((this.zIndex - param1ObjectRef.zIndex)); }
    
    public String toString() {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(super.toString());
      stringBuilder.append(", z_index: ");
      stringBuilder.append(this.zIndex);
      return stringBuilder.toString();
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Mainline.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */