package com.brashmonkey.spriter;

public class Timeline {
  public final int id;
  
  private int keyPointer = 0;
  
  public final Key[] keys;
  
  public final String name;
  
  public final Entity.ObjectInfo objectInfo;
  
  Timeline(int paramInt1, String paramString, Entity.ObjectInfo paramObjectInfo, int paramInt2) {
    this.id = paramInt1;
    this.name = paramString;
    this.objectInfo = paramObjectInfo;
    this.keys = new Key[paramInt2];
  }
  
  void addKey(Key paramKey) {
    Key[] arrayOfKey = this.keys;
    int i = this.keyPointer;
    this.keyPointer = i + 1;
    arrayOfKey[i] = paramKey;
  }
  
  public Key getKey(int paramInt) { return this.keys[paramInt]; }
  
  public String toString() {
    StringBuilder stringBuilder1 = new StringBuilder();
    stringBuilder1.append(getClass().getSimpleName());
    stringBuilder1.append("|[id:");
    stringBuilder1.append(this.id);
    stringBuilder1.append(", name: ");
    stringBuilder1.append(this.name);
    stringBuilder1.append(", object_info: ");
    stringBuilder1.append(this.objectInfo);
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
    public boolean active;
    
    public final Curve curve;
    
    public final int id;
    
    private Object object;
    
    public final int spin;
    
    public int time;
    
    public Key(int param1Int) { this(param1Int, 0); }
    
    public Key(int param1Int1, int param1Int2) { this(param1Int1, param1Int2, 1); }
    
    public Key(int param1Int1, int param1Int2, int param1Int3) { this(param1Int1, param1Int2, 1, new Curve()); }
    
    public Key(int param1Int1, int param1Int2, int param1Int3, Curve param1Curve) {
      this.id = param1Int1;
      this.time = param1Int2;
      this.spin = param1Int3;
      this.curve = param1Curve;
    }
    
    public Object object() { return this.object; }
    
    public void setObject(Object param1Object) {
      if (param1Object != null) {
        this.object = param1Object;
        return;
      } 
      throw new IllegalArgumentException("object can not be null!");
    }
    
    public String toString() {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(getClass().getSimpleName());
      stringBuilder.append("|[id: ");
      stringBuilder.append(this.id);
      stringBuilder.append(", time: ");
      stringBuilder.append(this.time);
      stringBuilder.append(", spin: ");
      stringBuilder.append(this.spin);
      stringBuilder.append("\ncurve: ");
      stringBuilder.append(this.curve);
      stringBuilder.append("\nobject:");
      stringBuilder.append(this.object);
      stringBuilder.append("]");
      return stringBuilder.toString();
    }
    
    public static class Bone {
      public float angle;
      
      public final Point pivot;
      
      public final Point position;
      
      public final Point scale;
      
      public Bone() { this(new Point()); }
      
      public Bone(Point param2Point) { this(param2Point, new Point(1.0F, 1.0F), new Point(0.0F, 1.0F), 0.0F); }
      
      public Bone(Point param2Point1, Point param2Point2, Point param2Point3, float param2Float) {
        this.position = new Point(param2Point1);
        this.scale = new Point(param2Point2);
        this.angle = param2Float;
        this.pivot = new Point(param2Point3);
      }
      
      public Bone(Bone param2Bone) { this(param2Bone.position, param2Bone.scale, param2Bone.pivot, param2Bone.angle); }
      
      public boolean isBone() {
        boolean bool;
        if (!(this instanceof Timeline.Key.Object)) {
          bool = true;
        } else {
          bool = false;
        } 
        return bool;
      }
      
      public void map(Bone param2Bone) {
        this.position.translate(-param2Bone.position.x, -param2Bone.position.y);
        this.position.rotate(-param2Bone.angle);
        this.position.scale(1.0F / param2Bone.scale.x, 1.0F / param2Bone.scale.y);
        this.scale.scale(1.0F / param2Bone.scale.x, 1.0F / param2Bone.scale.y);
        this.angle -= param2Bone.angle;
        this.angle *= Math.signum(param2Bone.scale.x) * Math.signum(param2Bone.scale.y);
      }
      
      public void set(float param2Float1, float param2Float2, float param2Float3, float param2Float4, float param2Float5, float param2Float6, float param2Float7) {
        this.angle = param2Float3;
        this.position.set(param2Float1, param2Float2);
        this.scale.set(param2Float4, param2Float5);
        this.pivot.set(param2Float6, param2Float7);
      }
      
      public void set(Point param2Point1, float param2Float, Point param2Point2, Point param2Point3) { set(param2Point1.x, param2Point1.y, param2Float, param2Point2.x, param2Point2.y, param2Point3.x, param2Point3.y); }
      
      public void set(Bone param2Bone) { set(param2Bone.position, param2Bone.angle, param2Bone.scale, param2Bone.pivot); }
      
      public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(getClass().getSimpleName());
        stringBuilder.append("|position: ");
        stringBuilder.append(this.position);
        stringBuilder.append(", scale: ");
        stringBuilder.append(this.scale);
        stringBuilder.append(", angle: ");
        stringBuilder.append(this.angle);
        return stringBuilder.toString();
      }
      
      public void unmap(Bone param2Bone) {
        this.angle *= Math.signum(param2Bone.scale.x) * Math.signum(param2Bone.scale.y);
        this.angle += param2Bone.angle;
        this.scale.scale(param2Bone.scale);
        this.position.scale(param2Bone.scale);
        this.position.rotate(param2Bone.angle);
        this.position.translate(param2Bone.position);
      }
    }
    
    public static class Object extends Bone {
      public float alpha;
      
      public final FileReference ref;
      
      public Object() { this(new Point()); }
      
      public Object(Point param2Point) { this(param2Point, new Point(1.0F, 1.0F), new Point(0.0F, 1.0F), 0.0F, 1.0F, new FileReference(-1, -1)); }
      
      public Object(Point param2Point1, Point param2Point2, Point param2Point3, float param2Float1, float param2Float2, FileReference param2FileReference) {
        super(param2Point1, param2Point2, param2Point3, param2Float1);
        this.alpha = param2Float2;
        this.ref = param2FileReference;
      }
      
      public Object(Object param2Object) { this(param2Object.position.copy(), param2Object.scale.copy(), param2Object.pivot.copy(), param2Object.angle, param2Object.alpha, param2Object.ref); }
      
      public void set(float param2Float1, float param2Float2, float param2Float3, float param2Float4, float param2Float5, float param2Float6, float param2Float7, float param2Float8, int param2Int1, int param2Int2) {
        set(param2Float1, param2Float2, param2Float3, param2Float4, param2Float5, param2Float6, param2Float7);
        this.alpha = param2Float8;
        FileReference fileReference = this.ref;
        fileReference.folder = param2Int1;
        fileReference.file = param2Int2;
      }
      
      public void set(Point param2Point1, float param2Float1, Point param2Point2, Point param2Point3, float param2Float2, FileReference param2FileReference) { set(param2Point1.x, param2Point1.y, param2Float1, param2Point2.x, param2Point2.y, param2Point3.x, param2Point3.y, param2Float2, param2FileReference.folder, param2FileReference.file); }
      
      public void set(Object param2Object) { set(param2Object.position, param2Object.angle, param2Object.scale, param2Object.pivot, param2Object.alpha, param2Object.ref); }
      
      public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(super.toString());
        stringBuilder.append(", pivot: ");
        stringBuilder.append(this.pivot);
        stringBuilder.append(", alpha: ");
        stringBuilder.append(this.alpha);
        stringBuilder.append(", reference: ");
        stringBuilder.append(this.ref);
        return stringBuilder.toString();
      }
    }
  }
  
  public static class Bone {
    public float angle;
    
    public final Point pivot;
    
    public final Point position;
    
    public final Point scale;
    
    public Bone() { this(new Point()); }
    
    public Bone(Point param1Point) { this(param1Point, new Point(1.0F, 1.0F), new Point(0.0F, 1.0F), 0.0F); }
    
    public Bone(Point param1Point1, Point param1Point2, Point param1Point3, float param1Float) {
      this.position = new Point(param1Point1);
      this.scale = new Point(param1Point2);
      this.angle = param1Float;
      this.pivot = new Point(param1Point3);
    }
    
    public Bone(Bone param1Bone) { this(param1Bone.position, param1Bone.scale, param1Bone.pivot, param1Bone.angle); }
    
    public boolean isBone() {
      boolean bool;
      if (!(this instanceof Timeline.Key.Object)) {
        bool = true;
      } else {
        bool = false;
      } 
      return bool;
    }
    
    public void map(Bone param1Bone) {
      this.position.translate(-param1Bone.position.x, -param1Bone.position.y);
      this.position.rotate(-param1Bone.angle);
      this.position.scale(1.0F / param1Bone.scale.x, 1.0F / param1Bone.scale.y);
      this.scale.scale(1.0F / param1Bone.scale.x, 1.0F / param1Bone.scale.y);
      this.angle -= param1Bone.angle;
      this.angle *= Math.signum(param1Bone.scale.x) * Math.signum(param1Bone.scale.y);
    }
    
    public void set(float param1Float1, float param1Float2, float param1Float3, float param1Float4, float param1Float5, float param1Float6, float param1Float7) {
      this.angle = param1Float3;
      this.position.set(param1Float1, param1Float2);
      this.scale.set(param1Float4, param1Float5);
      this.pivot.set(param1Float6, param1Float7);
    }
    
    public void set(Point param1Point1, float param1Float, Point param1Point2, Point param1Point3) { set(param1Point1.x, param1Point1.y, param1Float, param1Point2.x, param1Point2.y, param1Point3.x, param1Point3.y); }
    
    public void set(Bone param1Bone) { set(param1Bone.position, param1Bone.angle, param1Bone.scale, param1Bone.pivot); }
    
    public String toString() {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(getClass().getSimpleName());
      stringBuilder.append("|position: ");
      stringBuilder.append(this.position);
      stringBuilder.append(", scale: ");
      stringBuilder.append(this.scale);
      stringBuilder.append(", angle: ");
      stringBuilder.append(this.angle);
      return stringBuilder.toString();
    }
    
    public void unmap(Bone param1Bone) {
      this.angle *= Math.signum(param1Bone.scale.x) * Math.signum(param1Bone.scale.y);
      this.angle += param1Bone.angle;
      this.scale.scale(param1Bone.scale);
      this.position.scale(param1Bone.scale);
      this.position.rotate(param1Bone.angle);
      this.position.translate(param1Bone.position);
    }
  }
  
  public static class Object extends Key.Bone {
    public float alpha;
    
    public final FileReference ref;
    
    public Object() { this(new Point()); }
    
    public Object(Point param1Point) { this(param1Point, new Point(1.0F, 1.0F), new Point(0.0F, 1.0F), 0.0F, 1.0F, new FileReference(-1, -1)); }
    
    public Object(Point param1Point1, Point param1Point2, Point param1Point3, float param1Float1, float param1Float2, FileReference param1FileReference) {
      super(param1Point1, param1Point2, param1Point3, param1Float1);
      this.alpha = param1Float2;
      this.ref = param1FileReference;
    }
    
    public Object(Object param1Object) { this(param1Object.position.copy(), param1Object.scale.copy(), param1Object.pivot.copy(), param1Object.angle, param1Object.alpha, param1Object.ref); }
    
    public void set(float param1Float1, float param1Float2, float param1Float3, float param1Float4, float param1Float5, float param1Float6, float param1Float7, float param1Float8, int param1Int1, int param1Int2) {
      set(param1Float1, param1Float2, param1Float3, param1Float4, param1Float5, param1Float6, param1Float7);
      this.alpha = param1Float8;
      FileReference fileReference = this.ref;
      fileReference.folder = param1Int1;
      fileReference.file = param1Int2;
    }
    
    public void set(Point param1Point1, float param1Float1, Point param1Point2, Point param1Point3, float param1Float2, FileReference param1FileReference) { set(param1Point1.x, param1Point1.y, param1Float1, param1Point2.x, param1Point2.y, param1Point3.x, param1Point3.y, param1Float2, param1FileReference.folder, param1FileReference.file); }
    
    public void set(Object param1Object) { set(param1Object.position, param1Object.angle, param1Object.scale, param1Object.pivot, param1Object.alpha, param1Object.ref); }
    
    public String toString() {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(super.toString());
      stringBuilder.append(", pivot: ");
      stringBuilder.append(this.pivot);
      stringBuilder.append(", alpha: ");
      stringBuilder.append(this.alpha);
      stringBuilder.append(", reference: ");
      stringBuilder.append(this.ref);
      return stringBuilder.toString();
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Timeline.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */