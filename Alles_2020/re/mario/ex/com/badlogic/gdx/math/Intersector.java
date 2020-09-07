package com.badlogic.gdx.math;

import com.badlogic.gdx.math.collision.BoundingBox;
import com.badlogic.gdx.math.collision.Ray;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.FloatArray;
import java.util.Arrays;
import java.util.List;

public final class Intersector {
  static Vector3 best;
  
  private static final Vector3 dir;
  
  private static final Vector2 e;
  
  private static final Vector2 ep1;
  
  private static final Vector2 ep2;
  
  private static final FloatArray floatArray;
  
  private static final FloatArray floatArray2;
  
  private static final Vector3 i;
  
  static Vector3 intersection;
  
  private static final Vector2 ip;
  
  private static final Plane p;
  
  private static final Vector2 s;
  
  private static final Vector3 start;
  
  static Vector3 tmp;
  
  static Vector3 tmp1;
  
  static Vector3 tmp2;
  
  static Vector3 tmp3;
  
  private static final Vector3 v0 = new Vector3();
  
  private static final Vector3 v1 = new Vector3();
  
  private static final Vector3 v2 = new Vector3();
  
  static Vector2 v2tmp;
  
  static  {
    floatArray = new FloatArray();
    floatArray2 = new FloatArray();
    ip = new Vector2();
    ep1 = new Vector2();
    ep2 = new Vector2();
    s = new Vector2();
    e = new Vector2();
    p = new Plane(new Vector3(), 0.0F);
    i = new Vector3();
    dir = new Vector3();
    start = new Vector3();
    best = new Vector3();
    tmp = new Vector3();
    tmp1 = new Vector3();
    tmp2 = new Vector3();
    tmp3 = new Vector3();
    v2tmp = new Vector2();
    intersection = new Vector3();
  }
  
  static float det(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { return paramFloat1 * paramFloat4 - paramFloat2 * paramFloat3; }
  
  static double detd(double paramDouble1, double paramDouble2, double paramDouble3, double paramDouble4) { return paramDouble1 * paramDouble4 - paramDouble2 * paramDouble3; }
  
  public static float distanceLinePoint(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    paramFloat3 -= paramFloat1;
    paramFloat4 -= paramFloat2;
    float f = (float)Math.sqrt((paramFloat3 * paramFloat3 + paramFloat4 * paramFloat4));
    return Math.abs((paramFloat5 - paramFloat1) * paramFloat4 - (paramFloat6 - paramFloat2) * paramFloat3) / f;
  }
  
  public static float distanceSegmentPoint(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) { return nearestSegmentPoint(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, v2tmp).dst(paramFloat5, paramFloat6); }
  
  public static float distanceSegmentPoint(Vector2 paramVector21, Vector2 paramVector22, Vector2 paramVector23) { return nearestSegmentPoint(paramVector21, paramVector22, paramVector23, v2tmp).dst(paramVector23); }
  
  public static float intersectLinePlane(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, Plane paramPlane, Vector3 paramVector3) {
    Vector3 vector31 = tmp.set(paramFloat4, paramFloat5, paramFloat6).sub(paramFloat1, paramFloat2, paramFloat3);
    Vector3 vector32 = tmp2.set(paramFloat1, paramFloat2, paramFloat3);
    paramFloat1 = vector31.dot(paramPlane.getNormal());
    if (paramFloat1 != 0.0F) {
      paramFloat1 = -(vector32.dot(paramPlane.getNormal()) + paramPlane.getD()) / paramFloat1;
      if (paramVector3 != null)
        paramVector3.set(vector32).add(vector31.scl(paramFloat1)); 
      return paramFloat1;
    } 
    if (paramPlane.testPoint(vector32) == Plane.PlaneSide.OnPlane) {
      if (paramVector3 != null)
        paramVector3.set(vector32); 
      return 0.0F;
    } 
    return -1.0F;
  }
  
  public static boolean intersectLinePolygon(Vector2 paramVector21, Vector2 paramVector22, Polygon paramPolygon) {
    float[] arrayOfFloat = paramPolygon.getTransformedVertices();
    float f1 = paramVector21.x;
    float f2 = paramVector21.y;
    float f3 = paramVector22.x;
    float f4 = paramVector22.y;
    int j = arrayOfFloat.length;
    float f5 = arrayOfFloat[j - 2];
    float f6 = arrayOfFloat[j - 1];
    boolean bool = false;
    while (bool < j) {
      float f7 = arrayOfFloat[bool];
      float f8 = arrayOfFloat[bool + true];
      float f9 = f8 - f6;
      float f10 = f7 - f5;
      float f11 = (f3 - f1) * f9 - (f4 - f2) * f10;
      if (f11 != 0.0F) {
        f5 = (f10 * (f2 - f6) - f9 * (f1 - f5)) / f11;
        if (f5 >= 0.0F && f5 <= 1.0F)
          return true; 
      } 
      bool += true;
      f5 = f7;
      f6 = f8;
    } 
    return false;
  }
  
  public static boolean intersectLines(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, Vector2 paramVector2) {
    paramFloat8 -= paramFloat6;
    paramFloat3 -= paramFloat1;
    paramFloat7 -= paramFloat5;
    paramFloat4 -= paramFloat2;
    float f = paramFloat8 * paramFloat3 - paramFloat7 * paramFloat4;
    if (f == 0.0F)
      return false; 
    if (paramVector2 != null) {
      paramFloat5 = (paramFloat7 * (paramFloat2 - paramFloat6) - paramFloat8 * (paramFloat1 - paramFloat5)) / f;
      paramVector2.set(paramFloat1 + paramFloat3 * paramFloat5, paramFloat2 + paramFloat4 * paramFloat5);
    } 
    return true;
  }
  
  public static boolean intersectLines(Vector2 paramVector21, Vector2 paramVector22, Vector2 paramVector23, Vector2 paramVector24, Vector2 paramVector25) {
    float f1 = paramVector21.x;
    float f2 = paramVector21.y;
    float f3 = paramVector22.x;
    float f4 = paramVector22.y;
    float f5 = paramVector23.x;
    float f6 = paramVector23.y;
    float f7 = paramVector24.x;
    float f8 = paramVector24.y - f6;
    f3 -= f1;
    f7 -= f5;
    f4 -= f2;
    float f9 = f8 * f3 - f7 * f4;
    if (f9 == 0.0F)
      return false; 
    if (paramVector25 != null) {
      f6 = (f7 * (f2 - f6) - f8 * (f1 - f5)) / f9;
      paramVector25.set(f1 + f3 * f6, f2 + f4 * f6);
    } 
    return true;
  }
  
  public static boolean intersectPolygonEdges(FloatArray paramFloatArray1, FloatArray paramFloatArray2) {
    int j = paramFloatArray1.size - 2;
    int k = paramFloatArray2.size - 2;
    float[] arrayOfFloat1 = paramFloatArray1.items;
    float[] arrayOfFloat2 = paramFloatArray2.items;
    float f1 = arrayOfFloat1[j];
    float f2 = arrayOfFloat1[j + 1];
    boolean bool = false;
    while (bool <= j) {
      float f3 = arrayOfFloat1[bool];
      float f4 = arrayOfFloat1[bool + true];
      float f5 = arrayOfFloat2[k];
      float f6 = arrayOfFloat2[k + 1];
      boolean bool1 = false;
      while (bool1 <= k) {
        float f7 = arrayOfFloat2[bool1];
        float f8 = arrayOfFloat2[bool1 + true];
        if (intersectSegments(f1, f2, f3, f4, f5, f6, f7, f8, null))
          return true; 
        bool1 += true;
        f5 = f7;
        f6 = f8;
      } 
      bool += true;
      f1 = f3;
      f2 = f4;
    } 
    return false;
  }
  
  public static boolean intersectPolygons(Polygon paramPolygon1, Polygon paramPolygon2, Polygon paramPolygon3) {
    if (paramPolygon1.getVertices().length == 0 || paramPolygon2.getVertices().length == 0)
      return false; 
    Vector2 vector21 = ip;
    Vector2 vector22 = ep1;
    Vector2 vector23 = ep2;
    Vector2 vector24 = s;
    Vector2 vector25 = e;
    FloatArray floatArray1 = floatArray;
    FloatArray floatArray3 = floatArray2;
    floatArray1.clear();
    floatArray3.clear();
    floatArray3.addAll(paramPolygon1.getTransformedVertices());
    float[] arrayOfFloat = paramPolygon2.getTransformedVertices();
    int j = arrayOfFloat.length - 2;
    for (boolean bool = false; bool <= j; bool += true) {
      vector22.set(arrayOfFloat[bool], arrayOfFloat[bool + true]);
      if (bool < j) {
        vector23.set(arrayOfFloat[bool + 2], arrayOfFloat[bool + 3]);
      } else {
        vector23.set(arrayOfFloat[0], arrayOfFloat[1]);
      } 
      if (floatArray3.size == 0)
        return false; 
      vector24.set(floatArray3.get(floatArray3.size - 2), floatArray3.get(floatArray3.size - 1));
      for (byte b = 0; b < floatArray3.size; b += 2) {
        boolean bool1;
        vector25.set(floatArray3.get(b), floatArray3.get(b + 1));
        if (pointLineSide(vector23, vector22, vector24) > 0) {
          bool1 = true;
        } else {
          bool1 = false;
        } 
        if (pointLineSide(vector23, vector22, vector25) > 0) {
          if (!bool1) {
            intersectLines(vector24, vector25, vector22, vector23, vector21);
            if (floatArray1.size < 2 || floatArray1.get(floatArray1.size - 2) != vector21.x || floatArray1.get(floatArray1.size - 1) != vector21.y) {
              floatArray1.add(vector21.x);
              floatArray1.add(vector21.y);
            } 
          } 
          floatArray1.add(vector25.x);
          floatArray1.add(vector25.y);
        } else if (bool1) {
          intersectLines(vector24, vector25, vector22, vector23, vector21);
          floatArray1.add(vector21.x);
          floatArray1.add(vector21.y);
        } 
        vector24.set(vector25.x, vector25.y);
      } 
      floatArray3.clear();
      floatArray3.addAll(floatArray1);
      floatArray1.clear();
    } 
    if (floatArray3.size != 0) {
      if (paramPolygon3 != null)
        if (paramPolygon3.getVertices().length == floatArray3.size) {
          System.arraycopy(floatArray3.items, 0, paramPolygon3.getVertices(), 0, floatArray3.size);
        } else {
          paramPolygon3.setVertices(floatArray3.toArray());
        }  
      return true;
    } 
    return false;
  }
  
  public static boolean intersectPolygons(FloatArray paramFloatArray1, FloatArray paramFloatArray2) { return isPointInPolygon(paramFloatArray1.items, 0, paramFloatArray1.size, paramFloatArray2.items[0], paramFloatArray2.items[1]) ? true : (isPointInPolygon(paramFloatArray2.items, 0, paramFloatArray2.size, paramFloatArray1.items[0], paramFloatArray1.items[1]) ? true : intersectPolygonEdges(paramFloatArray1, paramFloatArray2)); }
  
  public static boolean intersectRayBounds(Ray paramRay, BoundingBox paramBoundingBox, Vector3 paramVector3) { // Byte code:
    //   0: aload_1
    //   1: aload_0
    //   2: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   5: invokevirtual contains : (Lcom/badlogic/gdx/math/Vector3;)Z
    //   8: ifeq -> 26
    //   11: aload_2
    //   12: ifnull -> 24
    //   15: aload_2
    //   16: aload_0
    //   17: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   20: invokevirtual set : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   23: pop
    //   24: iconst_1
    //   25: ireturn
    //   26: iconst_0
    //   27: istore_3
    //   28: aload_0
    //   29: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   32: getfield x : F
    //   35: aload_1
    //   36: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   39: getfield x : F
    //   42: fcmpg
    //   43: ifgt -> 186
    //   46: aload_0
    //   47: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   50: getfield x : F
    //   53: fconst_0
    //   54: fcmpl
    //   55: ifle -> 186
    //   58: aload_1
    //   59: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   62: getfield x : F
    //   65: aload_0
    //   66: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   69: getfield x : F
    //   72: fsub
    //   73: aload_0
    //   74: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   77: getfield x : F
    //   80: fdiv
    //   81: fstore #4
    //   83: fload #4
    //   85: fconst_0
    //   86: fcmpl
    //   87: iflt -> 186
    //   90: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   93: aload_0
    //   94: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   97: invokevirtual set : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   100: fload #4
    //   102: invokevirtual scl : (F)Lcom/badlogic/gdx/math/Vector3;
    //   105: aload_0
    //   106: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   109: invokevirtual add : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   112: pop
    //   113: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   116: getfield y : F
    //   119: aload_1
    //   120: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   123: getfield y : F
    //   126: fcmpl
    //   127: iflt -> 186
    //   130: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   133: getfield y : F
    //   136: aload_1
    //   137: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   140: getfield y : F
    //   143: fcmpg
    //   144: ifgt -> 186
    //   147: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   150: getfield z : F
    //   153: aload_1
    //   154: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   157: getfield z : F
    //   160: fcmpl
    //   161: iflt -> 186
    //   164: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   167: getfield z : F
    //   170: aload_1
    //   171: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   174: getfield z : F
    //   177: fcmpg
    //   178: ifgt -> 186
    //   181: iconst_1
    //   182: istore_3
    //   183: goto -> 189
    //   186: fconst_0
    //   187: fstore #4
    //   189: iload_3
    //   190: istore #5
    //   192: fload #4
    //   194: fstore #6
    //   196: aload_0
    //   197: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   200: getfield x : F
    //   203: aload_1
    //   204: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   207: getfield x : F
    //   210: fcmpl
    //   211: iflt -> 417
    //   214: iload_3
    //   215: istore #5
    //   217: fload #4
    //   219: fstore #6
    //   221: aload_0
    //   222: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   225: getfield x : F
    //   228: fconst_0
    //   229: fcmpg
    //   230: ifge -> 417
    //   233: aload_1
    //   234: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   237: getfield x : F
    //   240: aload_0
    //   241: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   244: getfield x : F
    //   247: fsub
    //   248: aload_0
    //   249: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   252: getfield x : F
    //   255: fdiv
    //   256: fstore #7
    //   258: iload_3
    //   259: istore #5
    //   261: fload #4
    //   263: fstore #6
    //   265: fload #7
    //   267: fconst_0
    //   268: fcmpl
    //   269: iflt -> 417
    //   272: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   275: aload_0
    //   276: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   279: invokevirtual set : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   282: fload #7
    //   284: invokevirtual scl : (F)Lcom/badlogic/gdx/math/Vector3;
    //   287: aload_0
    //   288: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   291: invokevirtual add : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   294: pop
    //   295: iload_3
    //   296: istore #5
    //   298: fload #4
    //   300: fstore #6
    //   302: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   305: getfield y : F
    //   308: aload_1
    //   309: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   312: getfield y : F
    //   315: fcmpl
    //   316: iflt -> 417
    //   319: iload_3
    //   320: istore #5
    //   322: fload #4
    //   324: fstore #6
    //   326: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   329: getfield y : F
    //   332: aload_1
    //   333: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   336: getfield y : F
    //   339: fcmpg
    //   340: ifgt -> 417
    //   343: iload_3
    //   344: istore #5
    //   346: fload #4
    //   348: fstore #6
    //   350: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   353: getfield z : F
    //   356: aload_1
    //   357: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   360: getfield z : F
    //   363: fcmpl
    //   364: iflt -> 417
    //   367: iload_3
    //   368: istore #5
    //   370: fload #4
    //   372: fstore #6
    //   374: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   377: getfield z : F
    //   380: aload_1
    //   381: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   384: getfield z : F
    //   387: fcmpg
    //   388: ifgt -> 417
    //   391: iload_3
    //   392: ifeq -> 410
    //   395: iload_3
    //   396: istore #5
    //   398: fload #4
    //   400: fstore #6
    //   402: fload #7
    //   404: fload #4
    //   406: fcmpg
    //   407: ifge -> 417
    //   410: fload #7
    //   412: fstore #6
    //   414: iconst_1
    //   415: istore #5
    //   417: iload #5
    //   419: istore #8
    //   421: fload #6
    //   423: fstore #4
    //   425: aload_0
    //   426: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   429: getfield y : F
    //   432: aload_1
    //   433: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   436: getfield y : F
    //   439: fcmpg
    //   440: ifgt -> 654
    //   443: iload #5
    //   445: istore #8
    //   447: fload #6
    //   449: fstore #4
    //   451: aload_0
    //   452: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   455: getfield y : F
    //   458: fconst_0
    //   459: fcmpl
    //   460: ifle -> 654
    //   463: aload_1
    //   464: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   467: getfield y : F
    //   470: aload_0
    //   471: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   474: getfield y : F
    //   477: fsub
    //   478: aload_0
    //   479: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   482: getfield y : F
    //   485: fdiv
    //   486: fstore #7
    //   488: iload #5
    //   490: istore #8
    //   492: fload #6
    //   494: fstore #4
    //   496: fload #7
    //   498: fconst_0
    //   499: fcmpl
    //   500: iflt -> 654
    //   503: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   506: aload_0
    //   507: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   510: invokevirtual set : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   513: fload #7
    //   515: invokevirtual scl : (F)Lcom/badlogic/gdx/math/Vector3;
    //   518: aload_0
    //   519: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   522: invokevirtual add : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   525: pop
    //   526: iload #5
    //   528: istore #8
    //   530: fload #6
    //   532: fstore #4
    //   534: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   537: getfield x : F
    //   540: aload_1
    //   541: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   544: getfield x : F
    //   547: fcmpl
    //   548: iflt -> 654
    //   551: iload #5
    //   553: istore #8
    //   555: fload #6
    //   557: fstore #4
    //   559: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   562: getfield x : F
    //   565: aload_1
    //   566: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   569: getfield x : F
    //   572: fcmpg
    //   573: ifgt -> 654
    //   576: iload #5
    //   578: istore #8
    //   580: fload #6
    //   582: fstore #4
    //   584: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   587: getfield z : F
    //   590: aload_1
    //   591: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   594: getfield z : F
    //   597: fcmpl
    //   598: iflt -> 654
    //   601: iload #5
    //   603: istore #8
    //   605: fload #6
    //   607: fstore #4
    //   609: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   612: getfield z : F
    //   615: aload_1
    //   616: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   619: getfield z : F
    //   622: fcmpg
    //   623: ifgt -> 654
    //   626: iload #5
    //   628: ifeq -> 647
    //   631: iload #5
    //   633: istore #8
    //   635: fload #6
    //   637: fstore #4
    //   639: fload #7
    //   641: fload #6
    //   643: fcmpg
    //   644: ifge -> 654
    //   647: fload #7
    //   649: fstore #4
    //   651: iconst_1
    //   652: istore #8
    //   654: iload #8
    //   656: istore_3
    //   657: fload #4
    //   659: fstore #7
    //   661: aload_0
    //   662: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   665: getfield y : F
    //   668: aload_1
    //   669: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   672: getfield y : F
    //   675: fcmpl
    //   676: iflt -> 882
    //   679: iload #8
    //   681: istore_3
    //   682: fload #4
    //   684: fstore #7
    //   686: aload_0
    //   687: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   690: getfield y : F
    //   693: fconst_0
    //   694: fcmpg
    //   695: ifge -> 882
    //   698: aload_1
    //   699: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   702: getfield y : F
    //   705: aload_0
    //   706: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   709: getfield y : F
    //   712: fsub
    //   713: aload_0
    //   714: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   717: getfield y : F
    //   720: fdiv
    //   721: fstore #6
    //   723: iload #8
    //   725: istore_3
    //   726: fload #4
    //   728: fstore #7
    //   730: fload #6
    //   732: fconst_0
    //   733: fcmpl
    //   734: iflt -> 882
    //   737: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   740: aload_0
    //   741: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   744: invokevirtual set : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   747: fload #6
    //   749: invokevirtual scl : (F)Lcom/badlogic/gdx/math/Vector3;
    //   752: aload_0
    //   753: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   756: invokevirtual add : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   759: pop
    //   760: iload #8
    //   762: istore_3
    //   763: fload #4
    //   765: fstore #7
    //   767: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   770: getfield x : F
    //   773: aload_1
    //   774: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   777: getfield x : F
    //   780: fcmpl
    //   781: iflt -> 882
    //   784: iload #8
    //   786: istore_3
    //   787: fload #4
    //   789: fstore #7
    //   791: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   794: getfield x : F
    //   797: aload_1
    //   798: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   801: getfield x : F
    //   804: fcmpg
    //   805: ifgt -> 882
    //   808: iload #8
    //   810: istore_3
    //   811: fload #4
    //   813: fstore #7
    //   815: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   818: getfield z : F
    //   821: aload_1
    //   822: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   825: getfield z : F
    //   828: fcmpl
    //   829: iflt -> 882
    //   832: iload #8
    //   834: istore_3
    //   835: fload #4
    //   837: fstore #7
    //   839: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   842: getfield z : F
    //   845: aload_1
    //   846: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   849: getfield z : F
    //   852: fcmpg
    //   853: ifgt -> 882
    //   856: iload #8
    //   858: ifeq -> 876
    //   861: iload #8
    //   863: istore_3
    //   864: fload #4
    //   866: fstore #7
    //   868: fload #6
    //   870: fload #4
    //   872: fcmpg
    //   873: ifge -> 882
    //   876: fload #6
    //   878: fstore #7
    //   880: iconst_1
    //   881: istore_3
    //   882: iload_3
    //   883: istore #5
    //   885: fload #7
    //   887: fstore #6
    //   889: aload_0
    //   890: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   893: getfield z : F
    //   896: aload_1
    //   897: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   900: getfield z : F
    //   903: fcmpg
    //   904: ifgt -> 1110
    //   907: iload_3
    //   908: istore #5
    //   910: fload #7
    //   912: fstore #6
    //   914: aload_0
    //   915: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   918: getfield z : F
    //   921: fconst_0
    //   922: fcmpl
    //   923: ifle -> 1110
    //   926: aload_1
    //   927: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   930: getfield z : F
    //   933: aload_0
    //   934: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   937: getfield z : F
    //   940: fsub
    //   941: aload_0
    //   942: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   945: getfield z : F
    //   948: fdiv
    //   949: fstore #4
    //   951: iload_3
    //   952: istore #5
    //   954: fload #7
    //   956: fstore #6
    //   958: fload #4
    //   960: fconst_0
    //   961: fcmpl
    //   962: iflt -> 1110
    //   965: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   968: aload_0
    //   969: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   972: invokevirtual set : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   975: fload #4
    //   977: invokevirtual scl : (F)Lcom/badlogic/gdx/math/Vector3;
    //   980: aload_0
    //   981: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   984: invokevirtual add : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   987: pop
    //   988: iload_3
    //   989: istore #5
    //   991: fload #7
    //   993: fstore #6
    //   995: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   998: getfield x : F
    //   1001: aload_1
    //   1002: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   1005: getfield x : F
    //   1008: fcmpl
    //   1009: iflt -> 1110
    //   1012: iload_3
    //   1013: istore #5
    //   1015: fload #7
    //   1017: fstore #6
    //   1019: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   1022: getfield x : F
    //   1025: aload_1
    //   1026: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   1029: getfield x : F
    //   1032: fcmpg
    //   1033: ifgt -> 1110
    //   1036: iload_3
    //   1037: istore #5
    //   1039: fload #7
    //   1041: fstore #6
    //   1043: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   1046: getfield y : F
    //   1049: aload_1
    //   1050: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   1053: getfield y : F
    //   1056: fcmpl
    //   1057: iflt -> 1110
    //   1060: iload_3
    //   1061: istore #5
    //   1063: fload #7
    //   1065: fstore #6
    //   1067: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   1070: getfield y : F
    //   1073: aload_1
    //   1074: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   1077: getfield y : F
    //   1080: fcmpg
    //   1081: ifgt -> 1110
    //   1084: iload_3
    //   1085: ifeq -> 1103
    //   1088: iload_3
    //   1089: istore #5
    //   1091: fload #7
    //   1093: fstore #6
    //   1095: fload #4
    //   1097: fload #7
    //   1099: fcmpg
    //   1100: ifge -> 1110
    //   1103: fload #4
    //   1105: fstore #6
    //   1107: iconst_1
    //   1108: istore #5
    //   1110: iload #5
    //   1112: istore_3
    //   1113: fload #6
    //   1115: fstore #4
    //   1117: aload_0
    //   1118: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   1121: getfield z : F
    //   1124: aload_1
    //   1125: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   1128: getfield z : F
    //   1131: fcmpl
    //   1132: iflt -> 1338
    //   1135: iload #5
    //   1137: istore_3
    //   1138: fload #6
    //   1140: fstore #4
    //   1142: aload_0
    //   1143: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   1146: getfield z : F
    //   1149: fconst_0
    //   1150: fcmpg
    //   1151: ifge -> 1338
    //   1154: aload_1
    //   1155: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   1158: getfield z : F
    //   1161: aload_0
    //   1162: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   1165: getfield z : F
    //   1168: fsub
    //   1169: aload_0
    //   1170: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   1173: getfield z : F
    //   1176: fdiv
    //   1177: fstore #7
    //   1179: iload #5
    //   1181: istore_3
    //   1182: fload #6
    //   1184: fstore #4
    //   1186: fload #7
    //   1188: fconst_0
    //   1189: fcmpl
    //   1190: iflt -> 1338
    //   1193: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   1196: aload_0
    //   1197: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   1200: invokevirtual set : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   1203: fload #7
    //   1205: invokevirtual scl : (F)Lcom/badlogic/gdx/math/Vector3;
    //   1208: aload_0
    //   1209: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   1212: invokevirtual add : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   1215: pop
    //   1216: iload #5
    //   1218: istore_3
    //   1219: fload #6
    //   1221: fstore #4
    //   1223: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   1226: getfield x : F
    //   1229: aload_1
    //   1230: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   1233: getfield x : F
    //   1236: fcmpl
    //   1237: iflt -> 1338
    //   1240: iload #5
    //   1242: istore_3
    //   1243: fload #6
    //   1245: fstore #4
    //   1247: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   1250: getfield x : F
    //   1253: aload_1
    //   1254: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   1257: getfield x : F
    //   1260: fcmpg
    //   1261: ifgt -> 1338
    //   1264: iload #5
    //   1266: istore_3
    //   1267: fload #6
    //   1269: fstore #4
    //   1271: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   1274: getfield y : F
    //   1277: aload_1
    //   1278: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   1281: getfield y : F
    //   1284: fcmpl
    //   1285: iflt -> 1338
    //   1288: iload #5
    //   1290: istore_3
    //   1291: fload #6
    //   1293: fstore #4
    //   1295: getstatic com/badlogic/gdx/math/Intersector.v2 : Lcom/badlogic/gdx/math/Vector3;
    //   1298: getfield y : F
    //   1301: aload_1
    //   1302: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   1305: getfield y : F
    //   1308: fcmpg
    //   1309: ifgt -> 1338
    //   1312: iload #5
    //   1314: ifeq -> 1332
    //   1317: iload #5
    //   1319: istore_3
    //   1320: fload #6
    //   1322: fstore #4
    //   1324: fload #7
    //   1326: fload #6
    //   1328: fcmpg
    //   1329: ifge -> 1338
    //   1332: fload #7
    //   1334: fstore #4
    //   1336: iconst_1
    //   1337: istore_3
    //   1338: iload_3
    //   1339: ifeq -> 1532
    //   1342: aload_2
    //   1343: ifnull -> 1532
    //   1346: aload_2
    //   1347: aload_0
    //   1348: getfield direction : Lcom/badlogic/gdx/math/Vector3;
    //   1351: invokevirtual set : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   1354: fload #4
    //   1356: invokevirtual scl : (F)Lcom/badlogic/gdx/math/Vector3;
    //   1359: aload_0
    //   1360: getfield origin : Lcom/badlogic/gdx/math/Vector3;
    //   1363: invokevirtual add : (Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    //   1366: pop
    //   1367: aload_2
    //   1368: getfield x : F
    //   1371: aload_1
    //   1372: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   1375: getfield x : F
    //   1378: fcmpg
    //   1379: ifge -> 1396
    //   1382: aload_2
    //   1383: aload_1
    //   1384: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   1387: getfield x : F
    //   1390: putfield x : F
    //   1393: goto -> 1422
    //   1396: aload_2
    //   1397: getfield x : F
    //   1400: aload_1
    //   1401: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   1404: getfield x : F
    //   1407: fcmpl
    //   1408: ifle -> 1422
    //   1411: aload_2
    //   1412: aload_1
    //   1413: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   1416: getfield x : F
    //   1419: putfield x : F
    //   1422: aload_2
    //   1423: getfield y : F
    //   1426: aload_1
    //   1427: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   1430: getfield y : F
    //   1433: fcmpg
    //   1434: ifge -> 1451
    //   1437: aload_2
    //   1438: aload_1
    //   1439: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   1442: getfield y : F
    //   1445: putfield y : F
    //   1448: goto -> 1477
    //   1451: aload_2
    //   1452: getfield y : F
    //   1455: aload_1
    //   1456: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   1459: getfield y : F
    //   1462: fcmpl
    //   1463: ifle -> 1477
    //   1466: aload_2
    //   1467: aload_1
    //   1468: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   1471: getfield y : F
    //   1474: putfield y : F
    //   1477: aload_2
    //   1478: getfield z : F
    //   1481: aload_1
    //   1482: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   1485: getfield z : F
    //   1488: fcmpg
    //   1489: ifge -> 1506
    //   1492: aload_2
    //   1493: aload_1
    //   1494: getfield min : Lcom/badlogic/gdx/math/Vector3;
    //   1497: getfield z : F
    //   1500: putfield z : F
    //   1503: goto -> 1532
    //   1506: aload_2
    //   1507: getfield z : F
    //   1510: aload_1
    //   1511: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   1514: getfield z : F
    //   1517: fcmpl
    //   1518: ifle -> 1532
    //   1521: aload_2
    //   1522: aload_1
    //   1523: getfield max : Lcom/badlogic/gdx/math/Vector3;
    //   1526: getfield z : F
    //   1529: putfield z : F
    //   1532: iload_3
    //   1533: ireturn }
  
  public static boolean intersectRayBoundsFast(Ray paramRay, Vector3 paramVector31, Vector3 paramVector32) {
    boolean bool;
    float f7;
    float f1 = 1.0F / paramRay.direction.x;
    float f2 = 1.0F / paramRay.direction.y;
    float f3 = 1.0F / paramRay.direction.z;
    float f4 = (paramVector31.x - paramVector32.x * 0.5F - paramRay.origin.x) * f1;
    f1 *= (paramVector31.x + paramVector32.x * 0.5F - paramRay.origin.x);
    if (f4 <= f1) {
      float f = f4;
      f4 = f1;
      f1 = f;
    } 
    float f5 = (paramVector31.y - paramVector32.y * 0.5F - paramRay.origin.y) * f2;
    f2 *= (paramVector31.y + paramVector32.y * 0.5F - paramRay.origin.y);
    if (f5 <= f2) {
      float f = f5;
      f5 = f2;
      f2 = f;
    } 
    float f6 = (paramVector31.z - paramVector32.z * 0.5F - paramRay.origin.z) * f3;
    f3 = (paramVector31.z + paramVector32.z * 0.5F - paramRay.origin.z) * f3;
    if (f6 > f3) {
      f7 = f3;
    } else {
      f7 = f6;
      f6 = f3;
    } 
    f1 = Math.max(Math.max(f1, f2), f7);
    f4 = Math.min(Math.min(f4, f5), f6);
    if (f4 >= 0.0F && f4 >= f1) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static boolean intersectRayBoundsFast(Ray paramRay, BoundingBox paramBoundingBox) { return intersectRayBoundsFast(paramRay, paramBoundingBox.getCenter(tmp1), paramBoundingBox.getDimensions(tmp2)); }
  
  public static boolean intersectRayPlane(Ray paramRay, Plane paramPlane, Vector3 paramVector3) {
    float f = paramRay.direction.dot(paramPlane.getNormal());
    if (f != 0.0F) {
      f = -(paramRay.origin.dot(paramPlane.getNormal()) + paramPlane.getD()) / f;
      if (f < 0.0F)
        return false; 
      if (paramVector3 != null)
        paramVector3.set(paramRay.origin).add(v0.set(paramRay.direction).scl(f)); 
      return true;
    } 
    if (paramPlane.testPoint(paramRay.origin) == Plane.PlaneSide.OnPlane) {
      if (paramVector3 != null)
        paramVector3.set(paramRay.origin); 
      return true;
    } 
    return false;
  }
  
  public static float intersectRayRay(Vector2 paramVector21, Vector2 paramVector22, Vector2 paramVector23, Vector2 paramVector24) {
    float f1 = paramVector23.x;
    float f2 = paramVector21.x;
    float f3 = paramVector23.y;
    float f4 = paramVector21.y;
    float f5 = paramVector22.x * paramVector24.y - paramVector22.y * paramVector24.x;
    if (f5 == 0.0F)
      return Float.POSITIVE_INFINITY; 
    float f6 = paramVector24.x / f5;
    return (f1 - f2) * paramVector24.y / f5 - (f3 - f4) * f6;
  }
  
  public static boolean intersectRaySphere(Ray paramRay, Vector3 paramVector31, float paramFloat, Vector3 paramVector32) {
    float f1 = paramRay.direction.dot(paramVector31.x - paramRay.origin.x, paramVector31.y - paramRay.origin.y, paramVector31.z - paramRay.origin.z);
    if (f1 < 0.0F)
      return false; 
    float f2 = paramVector31.dst2(paramRay.origin.x + paramRay.direction.x * f1, paramRay.origin.y + paramRay.direction.y * f1, paramRay.origin.z + paramRay.direction.z * f1);
    paramFloat *= paramFloat;
    if (f2 > paramFloat)
      return false; 
    if (paramVector32 != null)
      paramVector32.set(paramRay.direction).scl(f1 - (float)Math.sqrt((paramFloat - f2))).add(paramRay.origin); 
    return true;
  }
  
  public static boolean intersectRayTriangle(Ray paramRay, Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34) {
    Vector3 vector31 = v0.set(paramVector32).sub(paramVector31);
    Vector3 vector32 = v1.set(paramVector33).sub(paramVector31);
    Vector3 vector33 = v2.set(paramRay.direction).crs(vector32);
    float f1 = vector31.dot(vector33);
    if (MathUtils.isZero(f1)) {
      p.set(paramVector31, paramVector32, paramVector33);
      if (p.testPoint(paramRay.origin) == Plane.PlaneSide.OnPlane && isPointInTriangle(paramRay.origin, paramVector31, paramVector32, paramVector33)) {
        if (paramVector34 != null)
          paramVector34.set(paramRay.origin); 
        return true;
      } 
      return false;
    } 
    float f2 = 1.0F / f1;
    paramVector31 = i.set(paramRay.origin).sub(paramVector31);
    f1 = paramVector31.dot(vector33) * f2;
    if (f1 >= 0.0F && f1 <= 1.0F) {
      paramVector31 = paramVector31.crs(vector31);
      float f = paramRay.direction.dot(paramVector31) * f2;
      if (f >= 0.0F && f1 + f <= 1.0F) {
        f1 = vector32.dot(paramVector31) * f2;
        if (f1 < 0.0F)
          return false; 
        if (paramVector34 != null)
          if (f1 <= 1.0E-6F) {
            paramVector34.set(paramRay.origin);
          } else {
            paramRay.getEndPoint(paramVector34, f1);
          }  
        return true;
      } 
    } 
    return false;
  }
  
  public static boolean intersectRayTriangles(Ray paramRay, List<Vector3> paramList, Vector3 paramVector3) {
    if (paramList.size() % 3 == 0) {
      byte b1 = 0;
      byte b2 = 0;
      float f;
      for (f = Float.MAX_VALUE; b1 < paramList.size(); f = f1) {
        byte b = b2;
        float f1 = f;
        if (intersectRayTriangle(paramRay, (Vector3)paramList.get(b1), (Vector3)paramList.get(b1 + 1), (Vector3)paramList.get(b1 + 2), tmp)) {
          float f2 = paramRay.origin.dst2(tmp);
          b = b2;
          f1 = f;
          if (f2 < f) {
            best.set(tmp);
            f1 = f2;
            b = 1;
          } 
        } 
        b1 += 3;
        b2 = b;
      } 
      if (b2 == 0)
        return false; 
      if (paramVector3 != null)
        paramVector3.set(best); 
      return true;
    } 
    RuntimeException runtimeException = new RuntimeException("triangle list size is not a multiple of 3");
    throw runtimeException;
  }
  
  public static boolean intersectRayTriangles(Ray paramRay, float[] paramArrayOfFloat, Vector3 paramVector3) {
    if (paramArrayOfFloat.length % 9 == 0) {
      boolean bool = false;
      byte b = 0;
      float f;
      for (f = Float.MAX_VALUE; bool < paramArrayOfFloat.length; f = f1) {
        byte b1 = b;
        float f1 = f;
        if (intersectRayTriangle(paramRay, tmp1.set(paramArrayOfFloat[bool], paramArrayOfFloat[bool + true], paramArrayOfFloat[bool + 2]), tmp2.set(paramArrayOfFloat[bool + 3], paramArrayOfFloat[bool + 4], paramArrayOfFloat[bool + 5]), tmp3.set(paramArrayOfFloat[bool + 6], paramArrayOfFloat[bool + 7], paramArrayOfFloat[bool + 8]), tmp)) {
          float f2 = paramRay.origin.dst2(tmp);
          b1 = b;
          f1 = f;
          if (f2 < f) {
            best.set(tmp);
            f1 = f2;
            b1 = 1;
          } 
        } 
        bool += true;
        b = b1;
      } 
      if (b == 0)
        return false; 
      if (paramVector3 != null)
        paramVector3.set(best); 
      return true;
    } 
    RuntimeException runtimeException = new RuntimeException("triangles array size is not a multiple of 9");
    throw runtimeException;
  }
  
  public static boolean intersectRayTriangles(Ray paramRay, float[] paramArrayOfFloat, short[] paramArrayOfShort, int paramInt, Vector3 paramVector3) {
    if (paramArrayOfShort.length % 3 == 0) {
      boolean bool = false;
      byte b = 0;
      float f;
      for (f = Float.MAX_VALUE; bool < paramArrayOfShort.length; f = f1) {
        short s1 = paramArrayOfShort[bool] * paramInt;
        short s2 = paramArrayOfShort[bool + true] * paramInt;
        short s3 = paramArrayOfShort[bool + 2] * paramInt;
        byte b1 = b;
        float f1 = f;
        if (intersectRayTriangle(paramRay, tmp1.set(paramArrayOfFloat[s1], paramArrayOfFloat[s1 + 1], paramArrayOfFloat[s1 + 2]), tmp2.set(paramArrayOfFloat[s2], paramArrayOfFloat[s2 + 1], paramArrayOfFloat[s2 + 2]), tmp3.set(paramArrayOfFloat[s3], paramArrayOfFloat[s3 + 1], paramArrayOfFloat[s3 + 2]), tmp)) {
          float f2 = paramRay.origin.dst2(tmp);
          b1 = b;
          f1 = f;
          if (f2 < f) {
            best.set(tmp);
            f1 = f2;
            b1 = 1;
          } 
        } 
        bool += true;
        b = b1;
      } 
      if (b == 0)
        return false; 
      if (paramVector3 != null)
        paramVector3.set(best); 
      return true;
    } 
    RuntimeException runtimeException = new RuntimeException("triangle list size is not a multiple of 3");
    throw runtimeException;
  }
  
  public static boolean intersectRectangles(Rectangle paramRectangle1, Rectangle paramRectangle2, Rectangle paramRectangle3) {
    if (paramRectangle1.overlaps(paramRectangle2)) {
      paramRectangle3.x = Math.max(paramRectangle1.x, paramRectangle2.x);
      paramRectangle3.width = Math.min(paramRectangle1.x + paramRectangle1.width, paramRectangle2.x + paramRectangle2.width) - paramRectangle3.x;
      paramRectangle3.y = Math.max(paramRectangle1.y, paramRectangle2.y);
      paramRectangle3.height = Math.min(paramRectangle1.y + paramRectangle1.height, paramRectangle2.y + paramRectangle2.height) - paramRectangle3.y;
      return true;
    } 
    return false;
  }
  
  public static boolean intersectSegmentCircle(Vector2 paramVector21, Vector2 paramVector22, Vector2 paramVector23, float paramFloat) {
    boolean bool;
    tmp.set(paramVector22.x - paramVector21.x, paramVector22.y - paramVector21.y, 0.0F);
    tmp1.set(paramVector23.x - paramVector21.x, paramVector23.y - paramVector21.y, 0.0F);
    float f1 = tmp.len();
    float f2 = tmp1.dot(tmp.nor());
    if (f2 <= 0.0F) {
      tmp2.set(paramVector21.x, paramVector21.y, 0.0F);
    } else if (f2 >= f1) {
      tmp2.set(paramVector22.x, paramVector22.y, 0.0F);
    } else {
      tmp3.set(tmp.scl(f2));
      tmp2.set(tmp3.x + paramVector21.x, tmp3.y + paramVector21.y, 0.0F);
    } 
    f1 = paramVector23.x - tmp2.x;
    f2 = paramVector23.y - tmp2.y;
    if (f1 * f1 + f2 * f2 <= paramFloat) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static float intersectSegmentCircleDisplace(Vector2 paramVector21, Vector2 paramVector22, Vector2 paramVector23, float paramFloat, Vector2 paramVector24) {
    float f1 = paramVector23.x;
    float f2 = paramVector21.x;
    float f3 = paramVector22.x;
    float f4 = paramVector21.x;
    float f5 = paramVector23.y;
    float f6 = paramVector21.y;
    float f7 = paramVector22.y;
    float f8 = paramVector21.y;
    float f9 = paramVector21.dst(paramVector22);
    f1 = ((f1 - f2) * (f3 - f4) + (f5 - f6) * (f7 - f8)) / f9 * f9;
    if (f1 >= 0.0F && f1 <= 1.0F) {
      tmp.set(paramVector22.x, paramVector22.y, 0.0F).sub(paramVector21.x, paramVector21.y, 0.0F);
      tmp2.set(paramVector21.x, paramVector21.y, 0.0F).add(tmp.scl(f1));
      f1 = tmp2.dst(paramVector23.x, paramVector23.y, 0.0F);
      if (f1 < paramFloat) {
        paramVector24.set(paramVector23).sub(tmp2.x, tmp2.y).nor();
        return f1;
      } 
    } 
    return Float.POSITIVE_INFINITY;
  }
  
  public static boolean intersectSegmentPlane(Vector3 paramVector31, Vector3 paramVector32, Plane paramPlane, Vector3 paramVector33) {
    paramVector32 = v0.set(paramVector32).sub(paramVector31);
    float f = paramVector32.dot(paramPlane.getNormal());
    if (f == 0.0F)
      return false; 
    f = -(paramVector31.dot(paramPlane.getNormal()) + paramPlane.getD()) / f;
    if (f < 0.0F || f > 1.0F)
      return false; 
    paramVector33.set(paramVector31).add(paramVector32.scl(f));
    return true;
  }
  
  public static boolean intersectSegmentPolygon(Vector2 paramVector21, Vector2 paramVector22, Polygon paramPolygon) {
    float[] arrayOfFloat = paramPolygon.getTransformedVertices();
    float f1 = paramVector21.x;
    float f2 = paramVector21.y;
    float f3 = paramVector22.x;
    float f4 = paramVector22.y;
    int j = arrayOfFloat.length;
    float f5 = arrayOfFloat[j - 2];
    float f6 = arrayOfFloat[j - 1];
    boolean bool = false;
    while (bool < j) {
      float f7 = arrayOfFloat[bool];
      float f8 = arrayOfFloat[bool + true];
      float f9 = f8 - f6;
      float f10 = f3 - f1;
      float f11 = f7 - f5;
      float f12 = f4 - f2;
      float f13 = f9 * f10 - f11 * f12;
      if (f13 != 0.0F) {
        f6 = f2 - f6;
        f5 = f1 - f5;
        f11 = (f11 * f6 - f9 * f5) / f13;
        if (f11 >= 0.0F && f11 <= 1.0F) {
          f5 = (f10 * f6 - f12 * f5) / f13;
          if (f5 >= 0.0F && f5 <= 1.0F)
            return true; 
        } 
      } 
      bool += true;
      f5 = f7;
      f6 = f8;
    } 
    return false;
  }
  
  public static boolean intersectSegmentRectangle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, Rectangle paramRectangle) {
    float f1 = paramRectangle.x + paramRectangle.width;
    float f2 = paramRectangle.y + paramRectangle.height;
    return intersectSegments(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramRectangle.x, paramRectangle.y, paramRectangle.x, f2, null) ? true : (intersectSegments(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramRectangle.x, paramRectangle.y, f1, paramRectangle.y, null) ? true : (intersectSegments(paramFloat1, paramFloat2, paramFloat3, paramFloat4, f1, paramRectangle.y, f1, f2, null) ? true : (intersectSegments(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramRectangle.x, f2, f1, f2, null) ? true : paramRectangle.contains(paramFloat1, paramFloat2))));
  }
  
  public static boolean intersectSegmentRectangle(Vector2 paramVector21, Vector2 paramVector22, Rectangle paramRectangle) { return intersectSegmentRectangle(paramVector21.x, paramVector21.y, paramVector22.x, paramVector22.y, paramRectangle); }
  
  public static boolean intersectSegments(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, Vector2 paramVector2) {
    paramFloat8 -= paramFloat6;
    paramFloat3 -= paramFloat1;
    paramFloat7 -= paramFloat5;
    paramFloat4 -= paramFloat2;
    float f = paramFloat8 * paramFloat3 - paramFloat7 * paramFloat4;
    if (f == 0.0F)
      return false; 
    paramFloat6 = paramFloat2 - paramFloat6;
    paramFloat5 = paramFloat1 - paramFloat5;
    paramFloat7 = (paramFloat7 * paramFloat6 - paramFloat8 * paramFloat5) / f;
    if (paramFloat7 >= 0.0F && paramFloat7 <= 1.0F) {
      paramFloat5 = (paramFloat6 * paramFloat3 - paramFloat5 * paramFloat4) / f;
      if (paramFloat5 >= 0.0F && paramFloat5 <= 1.0F) {
        if (paramVector2 != null)
          paramVector2.set(paramFloat1 + paramFloat3 * paramFloat7, paramFloat2 + paramFloat4 * paramFloat7); 
        return true;
      } 
    } 
    return false;
  }
  
  public static boolean intersectSegments(Vector2 paramVector21, Vector2 paramVector22, Vector2 paramVector23, Vector2 paramVector24, Vector2 paramVector25) {
    float f1 = paramVector21.x;
    float f2 = paramVector21.y;
    float f3 = paramVector22.x;
    float f4 = paramVector22.y;
    float f5 = paramVector23.x;
    float f6 = paramVector23.y;
    float f7 = paramVector24.x;
    float f8 = paramVector24.y - f6;
    f3 -= f1;
    f7 -= f5;
    f4 -= f2;
    float f9 = f8 * f3 - f7 * f4;
    if (f9 == 0.0F)
      return false; 
    f6 = f2 - f6;
    f5 = f1 - f5;
    f8 = (f7 * f6 - f8 * f5) / f9;
    if (f8 >= 0.0F && f8 <= 1.0F) {
      f5 = (f6 * f3 - f5 * f4) / f9;
      if (f5 >= 0.0F && f5 <= 1.0F) {
        if (paramVector25 != null)
          paramVector25.set(f1 + f3 * f8, f2 + f4 * f8); 
        return true;
      } 
    } 
    return false;
  }
  
  public static boolean isPointInPolygon(Array<Vector2> paramArray, Vector2 paramVector2) { // Byte code:
    //   0: aload_0
    //   1: invokevirtual peek : ()Ljava/lang/Object;
    //   4: checkcast com/badlogic/gdx/math/Vector2
    //   7: astore_2
    //   8: aload_1
    //   9: getfield x : F
    //   12: fstore_3
    //   13: aload_1
    //   14: getfield y : F
    //   17: fstore #4
    //   19: iconst_0
    //   20: istore #5
    //   22: aload_2
    //   23: astore_1
    //   24: iconst_0
    //   25: istore #6
    //   27: iload #5
    //   29: aload_0
    //   30: getfield size : I
    //   33: if_icmpge -> 153
    //   36: aload_0
    //   37: iload #5
    //   39: invokevirtual get : (I)Ljava/lang/Object;
    //   42: checkcast com/badlogic/gdx/math/Vector2
    //   45: astore_2
    //   46: aload_2
    //   47: getfield y : F
    //   50: fload #4
    //   52: fcmpg
    //   53: ifge -> 66
    //   56: aload_1
    //   57: getfield y : F
    //   60: fload #4
    //   62: fcmpl
    //   63: ifge -> 94
    //   66: iload #6
    //   68: istore #7
    //   70: aload_1
    //   71: getfield y : F
    //   74: fload #4
    //   76: fcmpg
    //   77: ifge -> 141
    //   80: iload #6
    //   82: istore #7
    //   84: aload_2
    //   85: getfield y : F
    //   88: fload #4
    //   90: fcmpl
    //   91: iflt -> 141
    //   94: iload #6
    //   96: istore #7
    //   98: aload_2
    //   99: getfield x : F
    //   102: fload #4
    //   104: aload_2
    //   105: getfield y : F
    //   108: fsub
    //   109: aload_1
    //   110: getfield y : F
    //   113: aload_2
    //   114: getfield y : F
    //   117: fsub
    //   118: fdiv
    //   119: aload_1
    //   120: getfield x : F
    //   123: aload_2
    //   124: getfield x : F
    //   127: fsub
    //   128: fmul
    //   129: fadd
    //   130: fload_3
    //   131: fcmpg
    //   132: ifge -> 141
    //   135: iload #6
    //   137: iconst_1
    //   138: ixor
    //   139: istore #7
    //   141: iinc #5, 1
    //   144: aload_2
    //   145: astore_1
    //   146: iload #7
    //   148: istore #6
    //   150: goto -> 27
    //   153: iload #6
    //   155: ireturn }
  
  public static boolean isPointInPolygon(float[] paramArrayOfFloat, int paramInt1, int paramInt2, float paramFloat1, float paramFloat2) { // Byte code:
    //   0: aload_0
    //   1: iload_1
    //   2: faload
    //   3: fstore #5
    //   5: aload_0
    //   6: iload_1
    //   7: iconst_1
    //   8: iadd
    //   9: faload
    //   10: fstore #6
    //   12: iload_1
    //   13: iconst_3
    //   14: iadd
    //   15: istore #7
    //   17: fload #6
    //   19: fstore #8
    //   21: iconst_0
    //   22: istore #9
    //   24: iload #7
    //   26: iload_1
    //   27: iload_2
    //   28: iadd
    //   29: if_icmpge -> 139
    //   32: aload_0
    //   33: iload #7
    //   35: faload
    //   36: fstore #10
    //   38: fload #10
    //   40: fload #4
    //   42: fcmpg
    //   43: ifge -> 54
    //   46: fload #8
    //   48: fload #4
    //   50: fcmpl
    //   51: ifge -> 78
    //   54: iload #9
    //   56: istore #11
    //   58: fload #8
    //   60: fload #4
    //   62: fcmpg
    //   63: ifge -> 125
    //   66: iload #9
    //   68: istore #11
    //   70: fload #10
    //   72: fload #4
    //   74: fcmpl
    //   75: iflt -> 125
    //   78: aload_0
    //   79: iload #7
    //   81: iconst_1
    //   82: isub
    //   83: faload
    //   84: fstore #12
    //   86: iload #9
    //   88: istore #11
    //   90: fload #12
    //   92: fload #4
    //   94: fload #10
    //   96: fsub
    //   97: fload #8
    //   99: fload #10
    //   101: fsub
    //   102: fdiv
    //   103: aload_0
    //   104: iload #7
    //   106: iconst_3
    //   107: isub
    //   108: faload
    //   109: fload #12
    //   111: fsub
    //   112: fmul
    //   113: fadd
    //   114: fload_3
    //   115: fcmpg
    //   116: ifge -> 125
    //   119: iload #9
    //   121: iconst_1
    //   122: ixor
    //   123: istore #11
    //   125: iinc #7, 2
    //   128: fload #10
    //   130: fstore #8
    //   132: iload #11
    //   134: istore #9
    //   136: goto -> 24
    //   139: fload #6
    //   141: fload #4
    //   143: fcmpg
    //   144: ifge -> 155
    //   147: fload #8
    //   149: fload #4
    //   151: fcmpl
    //   152: ifge -> 179
    //   155: iload #9
    //   157: istore #11
    //   159: fload #8
    //   161: fload #4
    //   163: fcmpg
    //   164: ifge -> 218
    //   167: iload #9
    //   169: istore #11
    //   171: fload #6
    //   173: fload #4
    //   175: fcmpl
    //   176: iflt -> 218
    //   179: iload #9
    //   181: istore #11
    //   183: fload #5
    //   185: fload #4
    //   187: fload #6
    //   189: fsub
    //   190: fload #8
    //   192: fload #6
    //   194: fsub
    //   195: fdiv
    //   196: aload_0
    //   197: iload #7
    //   199: iconst_3
    //   200: isub
    //   201: faload
    //   202: fload #5
    //   204: fsub
    //   205: fmul
    //   206: fadd
    //   207: fload_3
    //   208: fcmpg
    //   209: ifge -> 218
    //   212: iload #9
    //   214: iconst_1
    //   215: ixor
    //   216: istore #11
    //   218: iload #11
    //   220: ireturn }
  
  public static boolean isPointInTriangle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8) {
    boolean bool2;
    boolean bool1;
    float f1 = paramFloat1 - paramFloat3;
    float f2 = paramFloat2 - paramFloat4;
    if ((paramFloat5 - paramFloat3) * f2 - (paramFloat6 - paramFloat4) * f1 > 0.0F) {
      bool1 = true;
    } else {
      bool1 = false;
    } 
    if ((paramFloat7 - paramFloat3) * f2 - (paramFloat8 - paramFloat4) * f1 > 0.0F) {
      bool2 = true;
    } else {
      bool2 = false;
    } 
    if (bool2 == bool1)
      return false; 
    if ((paramFloat7 - paramFloat5) * (paramFloat2 - paramFloat6) - (paramFloat8 - paramFloat6) * (paramFloat1 - paramFloat5) > 0.0F) {
      bool2 = true;
    } else {
      bool2 = false;
    } 
    return !(bool2 != bool1);
  }
  
  public static boolean isPointInTriangle(Vector2 paramVector21, Vector2 paramVector22, Vector2 paramVector23, Vector2 paramVector24) {
    boolean bool2;
    boolean bool1;
    float f1 = paramVector21.x - paramVector22.x;
    float f2 = paramVector21.y - paramVector22.y;
    if ((paramVector23.x - paramVector22.x) * f2 - (paramVector23.y - paramVector22.y) * f1 > 0.0F) {
      bool1 = true;
    } else {
      bool1 = false;
    } 
    if ((paramVector24.x - paramVector22.x) * f2 - (paramVector24.y - paramVector22.y) * f1 > 0.0F) {
      bool2 = true;
    } else {
      bool2 = false;
    } 
    if (bool2 == bool1)
      return false; 
    if ((paramVector24.x - paramVector23.x) * (paramVector21.y - paramVector23.y) - (paramVector24.y - paramVector23.y) * (paramVector21.x - paramVector23.x) > 0.0F) {
      bool2 = true;
    } else {
      bool2 = false;
    } 
    return !(bool2 != bool1);
  }
  
  public static boolean isPointInTriangle(Vector3 paramVector31, Vector3 paramVector32, Vector3 paramVector33, Vector3 paramVector34) {
    v0.set(paramVector32).sub(paramVector31);
    v1.set(paramVector33).sub(paramVector31);
    v2.set(paramVector34).sub(paramVector31);
    float f1 = v0.dot(v1);
    float f2 = v0.dot(v2);
    float f3 = v1.dot(v2);
    paramVector31 = v2;
    if (f3 * f2 - paramVector31.dot(paramVector31) * f1 < 0.0F)
      return false; 
    paramVector31 = v1;
    return !(f1 * f3 - f2 * paramVector31.dot(paramVector31) < 0.0F);
  }
  
  public static Vector2 nearestSegmentPoint(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, Vector2 paramVector2) {
    float f1 = paramFloat3 - paramFloat1;
    float f2 = paramFloat4 - paramFloat2;
    float f3 = f1 * f1 + f2 * f2;
    if (f3 == 0.0F)
      return paramVector2.set(paramFloat1, paramFloat2); 
    paramFloat5 = ((paramFloat5 - paramFloat1) * f1 + (paramFloat6 - paramFloat2) * f2) / f3;
    return (paramFloat5 < 0.0F) ? paramVector2.set(paramFloat1, paramFloat2) : ((paramFloat5 > 1.0F) ? paramVector2.set(paramFloat3, paramFloat4) : paramVector2.set(paramFloat1 + f1 * paramFloat5, paramFloat2 + paramFloat5 * f2));
  }
  
  public static Vector2 nearestSegmentPoint(Vector2 paramVector21, Vector2 paramVector22, Vector2 paramVector23, Vector2 paramVector24) {
    float f = paramVector21.dst2(paramVector22);
    if (f == 0.0F)
      return paramVector24.set(paramVector21); 
    f = ((paramVector23.x - paramVector21.x) * (paramVector22.x - paramVector21.x) + (paramVector23.y - paramVector21.y) * (paramVector22.y - paramVector21.y)) / f;
    return (f < 0.0F) ? paramVector24.set(paramVector21) : ((f > 1.0F) ? paramVector24.set(paramVector22) : paramVector24.set(paramVector21.x + (paramVector22.x - paramVector21.x) * f, paramVector21.y + f * (paramVector22.y - paramVector21.y)));
  }
  
  public static boolean overlapConvexPolygons(Polygon paramPolygon1, Polygon paramPolygon2) { return overlapConvexPolygons(paramPolygon1, paramPolygon2, null); }
  
  public static boolean overlapConvexPolygons(Polygon paramPolygon1, Polygon paramPolygon2, MinimumTranslationVector paramMinimumTranslationVector) { return overlapConvexPolygons(paramPolygon1.getTransformedVertices(), paramPolygon2.getTransformedVertices(), paramMinimumTranslationVector); }
  
  public static boolean overlapConvexPolygons(float[] paramArrayOfFloat1, int paramInt1, int paramInt2, float[] paramArrayOfFloat2, int paramInt3, int paramInt4, MinimumTranslationVector paramMinimumTranslationVector) { // Byte code:
    //   0: iload_1
    //   1: iload_2
    //   2: iadd
    //   3: istore #7
    //   5: iload #4
    //   7: iload #5
    //   9: iadd
    //   10: istore #8
    //   12: ldc_w 3.4028235E38
    //   15: fstore #9
    //   17: iload_1
    //   18: istore #10
    //   20: fconst_0
    //   21: fstore #11
    //   23: fconst_0
    //   24: fstore #12
    //   26: iload #10
    //   28: iload #7
    //   30: if_icmpge -> 582
    //   33: aload_0
    //   34: iload #10
    //   36: faload
    //   37: fstore #13
    //   39: aload_0
    //   40: iload #10
    //   42: iconst_1
    //   43: iadd
    //   44: faload
    //   45: fstore #14
    //   47: iload #10
    //   49: iconst_2
    //   50: iadd
    //   51: istore #15
    //   53: aload_0
    //   54: iload #15
    //   56: iload_2
    //   57: irem
    //   58: faload
    //   59: fstore #16
    //   61: aload_0
    //   62: iload #10
    //   64: iconst_3
    //   65: iadd
    //   66: iload_2
    //   67: irem
    //   68: faload
    //   69: fstore #17
    //   71: fload #14
    //   73: fload #17
    //   75: fsub
    //   76: fstore #18
    //   78: fload #13
    //   80: fload #16
    //   82: fsub
    //   83: fneg
    //   84: fstore #19
    //   86: fload #18
    //   88: fload #18
    //   90: fmul
    //   91: fload #19
    //   93: fload #19
    //   95: fmul
    //   96: fadd
    //   97: f2d
    //   98: invokestatic sqrt : (D)D
    //   101: d2f
    //   102: fstore #20
    //   104: fload #18
    //   106: fload #20
    //   108: fdiv
    //   109: fstore #21
    //   111: fload #19
    //   113: fload #20
    //   115: fdiv
    //   116: fstore #22
    //   118: aload_0
    //   119: iconst_0
    //   120: faload
    //   121: fload #21
    //   123: fmul
    //   124: aload_0
    //   125: iconst_1
    //   126: faload
    //   127: fload #22
    //   129: fmul
    //   130: fadd
    //   131: fstore #20
    //   133: fload #20
    //   135: fstore #19
    //   137: iload_1
    //   138: istore #10
    //   140: iload #10
    //   142: iload #7
    //   144: if_icmpge -> 223
    //   147: aload_0
    //   148: iload #10
    //   150: faload
    //   151: fload #21
    //   153: fmul
    //   154: aload_0
    //   155: iload #10
    //   157: iconst_1
    //   158: iadd
    //   159: faload
    //   160: fload #22
    //   162: fmul
    //   163: fadd
    //   164: fstore #23
    //   166: fload #23
    //   168: fload #19
    //   170: fcmpg
    //   171: ifge -> 185
    //   174: fload #23
    //   176: fstore #18
    //   178: fload #20
    //   180: fstore #24
    //   182: goto -> 209
    //   185: fload #20
    //   187: fstore #24
    //   189: fload #19
    //   191: fstore #18
    //   193: fload #23
    //   195: fload #20
    //   197: fcmpl
    //   198: ifle -> 209
    //   201: fload #23
    //   203: fstore #24
    //   205: fload #19
    //   207: fstore #18
    //   209: iinc #10, 2
    //   212: fload #24
    //   214: fstore #20
    //   216: fload #18
    //   218: fstore #19
    //   220: goto -> 140
    //   223: aload_3
    //   224: iconst_0
    //   225: faload
    //   226: fload #21
    //   228: fmul
    //   229: aload_3
    //   230: iconst_1
    //   231: faload
    //   232: fload #22
    //   234: fmul
    //   235: fadd
    //   236: fstore #23
    //   238: iload #4
    //   240: istore #10
    //   242: fload #23
    //   244: fstore #25
    //   246: iconst_0
    //   247: istore #26
    //   249: fload #21
    //   251: fstore #24
    //   253: fload #22
    //   255: fstore #18
    //   257: fload #19
    //   259: fstore #22
    //   261: fload #20
    //   263: fstore #21
    //   265: fload #25
    //   267: fstore #20
    //   269: fload #23
    //   271: fstore #19
    //   273: fload #11
    //   275: fstore #23
    //   277: fload #17
    //   279: fstore #11
    //   281: iload #10
    //   283: iload #8
    //   285: if_icmpge -> 375
    //   288: aload_3
    //   289: iload #10
    //   291: faload
    //   292: fstore #25
    //   294: iload #10
    //   296: iconst_1
    //   297: iadd
    //   298: istore #27
    //   300: iload #26
    //   302: fload #13
    //   304: fload #14
    //   306: fload #16
    //   308: fload #11
    //   310: fload #25
    //   312: aload_3
    //   313: iload #27
    //   315: faload
    //   316: invokestatic pointLineSide : (FFFFFF)I
    //   319: isub
    //   320: istore #26
    //   322: fload #24
    //   324: aload_3
    //   325: iload #10
    //   327: faload
    //   328: fmul
    //   329: fload #18
    //   331: aload_3
    //   332: iload #27
    //   334: faload
    //   335: fmul
    //   336: fadd
    //   337: fstore #25
    //   339: fload #25
    //   341: fload #20
    //   343: fcmpg
    //   344: ifge -> 354
    //   347: fload #25
    //   349: fstore #20
    //   351: goto -> 369
    //   354: fload #25
    //   356: fload #19
    //   358: fcmpl
    //   359: ifle -> 369
    //   362: fload #25
    //   364: fstore #19
    //   366: goto -> 369
    //   369: iinc #10, 2
    //   372: goto -> 281
    //   375: fload #22
    //   377: fload #20
    //   379: fcmpg
    //   380: ifgt -> 391
    //   383: fload #21
    //   385: fload #20
    //   387: fcmpl
    //   388: ifge -> 410
    //   391: fload #20
    //   393: fload #22
    //   395: fcmpg
    //   396: ifgt -> 580
    //   399: fload #19
    //   401: fload #22
    //   403: fcmpl
    //   404: ifge -> 410
    //   407: goto -> 580
    //   410: fload #21
    //   412: fload #19
    //   414: invokestatic min : (FF)F
    //   417: fload #22
    //   419: fload #20
    //   421: invokestatic max : (FF)F
    //   424: fsub
    //   425: fstore #13
    //   427: fload #22
    //   429: fload #20
    //   431: fcmpg
    //   432: ifge -> 443
    //   435: fload #21
    //   437: fload #19
    //   439: fcmpl
    //   440: ifgt -> 467
    //   443: fload #13
    //   445: fstore #11
    //   447: fload #20
    //   449: fload #22
    //   451: fcmpg
    //   452: ifge -> 512
    //   455: fload #13
    //   457: fstore #11
    //   459: fload #19
    //   461: fload #21
    //   463: fcmpl
    //   464: ifle -> 512
    //   467: fload #22
    //   469: fload #20
    //   471: fsub
    //   472: invokestatic abs : (F)F
    //   475: fstore #11
    //   477: fload #21
    //   479: fload #19
    //   481: fsub
    //   482: invokestatic abs : (F)F
    //   485: fstore #19
    //   487: fload #11
    //   489: fload #19
    //   491: fcmpg
    //   492: ifge -> 505
    //   495: fload #13
    //   497: fload #11
    //   499: fadd
    //   500: fstore #11
    //   502: goto -> 512
    //   505: fload #13
    //   507: fload #19
    //   509: fadd
    //   510: fstore #11
    //   512: fload #11
    //   514: fload #9
    //   516: fcmpg
    //   517: ifge -> 569
    //   520: iload #26
    //   522: iflt -> 532
    //   525: fload #24
    //   527: fstore #12
    //   529: goto -> 537
    //   532: fload #24
    //   534: fneg
    //   535: fstore #12
    //   537: iload #26
    //   539: iflt -> 549
    //   542: fload #18
    //   544: fstore #19
    //   546: goto -> 554
    //   549: fload #18
    //   551: fneg
    //   552: fstore #19
    //   554: fload #11
    //   556: fstore #9
    //   558: fload #12
    //   560: fstore #11
    //   562: fload #19
    //   564: fstore #12
    //   566: goto -> 573
    //   569: fload #23
    //   571: fstore #11
    //   573: iload #15
    //   575: istore #10
    //   577: goto -> 26
    //   580: iconst_0
    //   581: ireturn
    //   582: iload #4
    //   584: istore #10
    //   586: fload #9
    //   588: fstore #18
    //   590: fload #12
    //   592: fstore #24
    //   594: fload #11
    //   596: fstore #23
    //   598: iload #7
    //   600: istore_2
    //   601: iload #10
    //   603: iload #8
    //   605: if_icmpge -> 1127
    //   608: aload_3
    //   609: iload #10
    //   611: faload
    //   612: fstore #13
    //   614: aload_3
    //   615: iload #10
    //   617: iconst_1
    //   618: iadd
    //   619: faload
    //   620: fstore #25
    //   622: iload #10
    //   624: iconst_2
    //   625: iadd
    //   626: istore #7
    //   628: aload_3
    //   629: iload #7
    //   631: iload #5
    //   633: irem
    //   634: faload
    //   635: fstore #22
    //   637: aload_3
    //   638: iload #10
    //   640: iconst_3
    //   641: iadd
    //   642: iload #5
    //   644: irem
    //   645: faload
    //   646: fstore #19
    //   648: fload #25
    //   650: fload #19
    //   652: fsub
    //   653: fstore #20
    //   655: fload #13
    //   657: fload #22
    //   659: fsub
    //   660: fneg
    //   661: fstore #11
    //   663: fload #20
    //   665: fload #20
    //   667: fmul
    //   668: fload #11
    //   670: fload #11
    //   672: fmul
    //   673: fadd
    //   674: f2d
    //   675: invokestatic sqrt : (D)D
    //   678: d2f
    //   679: fstore #12
    //   681: fload #20
    //   683: fload #12
    //   685: fdiv
    //   686: fstore #9
    //   688: fload #11
    //   690: fload #12
    //   692: fdiv
    //   693: fstore #20
    //   695: aload_0
    //   696: iconst_0
    //   697: faload
    //   698: fload #9
    //   700: fmul
    //   701: aload_0
    //   702: iconst_1
    //   703: faload
    //   704: fload #20
    //   706: fmul
    //   707: fadd
    //   708: fstore #11
    //   710: iload_1
    //   711: istore #26
    //   713: fload #11
    //   715: fstore #12
    //   717: iconst_0
    //   718: istore #10
    //   720: iload #26
    //   722: iload_2
    //   723: if_icmpge -> 813
    //   726: aload_0
    //   727: iload #26
    //   729: faload
    //   730: fstore #21
    //   732: iload #26
    //   734: iconst_1
    //   735: iadd
    //   736: istore #15
    //   738: fload #21
    //   740: fload #9
    //   742: fmul
    //   743: aload_0
    //   744: iload #15
    //   746: faload
    //   747: fload #20
    //   749: fmul
    //   750: fadd
    //   751: fstore #21
    //   753: iload #10
    //   755: fload #13
    //   757: fload #25
    //   759: fload #22
    //   761: fload #19
    //   763: aload_0
    //   764: iload #26
    //   766: faload
    //   767: aload_0
    //   768: iload #15
    //   770: faload
    //   771: invokestatic pointLineSide : (FFFFFF)I
    //   774: isub
    //   775: istore #10
    //   777: fload #21
    //   779: fload #12
    //   781: fcmpg
    //   782: ifge -> 792
    //   785: fload #21
    //   787: fstore #12
    //   789: goto -> 807
    //   792: fload #21
    //   794: fload #11
    //   796: fcmpl
    //   797: ifle -> 807
    //   800: fload #21
    //   802: fstore #11
    //   804: goto -> 807
    //   807: iinc #26, 2
    //   810: goto -> 720
    //   813: fload #9
    //   815: aload_3
    //   816: iconst_0
    //   817: faload
    //   818: fmul
    //   819: fload #20
    //   821: aload_3
    //   822: iconst_1
    //   823: faload
    //   824: fmul
    //   825: fadd
    //   826: fstore #13
    //   828: iload #4
    //   830: istore #26
    //   832: fload #13
    //   834: fstore #21
    //   836: iload #26
    //   838: iload #8
    //   840: if_icmpge -> 919
    //   843: aload_3
    //   844: iload #26
    //   846: faload
    //   847: fload #9
    //   849: fmul
    //   850: fload #20
    //   852: aload_3
    //   853: iload #26
    //   855: iconst_1
    //   856: iadd
    //   857: faload
    //   858: fmul
    //   859: fadd
    //   860: fstore #25
    //   862: fload #25
    //   864: fload #13
    //   866: fcmpg
    //   867: ifge -> 881
    //   870: fload #25
    //   872: fstore #19
    //   874: fload #21
    //   876: fstore #22
    //   878: goto -> 905
    //   881: fload #21
    //   883: fstore #22
    //   885: fload #13
    //   887: fstore #19
    //   889: fload #25
    //   891: fload #21
    //   893: fcmpl
    //   894: ifle -> 905
    //   897: fload #25
    //   899: fstore #22
    //   901: fload #13
    //   903: fstore #19
    //   905: iinc #26, 2
    //   908: fload #22
    //   910: fstore #21
    //   912: fload #19
    //   914: fstore #13
    //   916: goto -> 836
    //   919: fload #12
    //   921: fload #13
    //   923: fcmpg
    //   924: ifgt -> 935
    //   927: fload #11
    //   929: fload #13
    //   931: fcmpl
    //   932: ifge -> 954
    //   935: fload #13
    //   937: fload #12
    //   939: fcmpg
    //   940: ifgt -> 1125
    //   943: fload #21
    //   945: fload #12
    //   947: fcmpl
    //   948: ifge -> 954
    //   951: goto -> 1125
    //   954: fload #11
    //   956: fload #21
    //   958: invokestatic min : (FF)F
    //   961: fload #12
    //   963: fload #13
    //   965: invokestatic max : (FF)F
    //   968: fsub
    //   969: fstore #22
    //   971: fload #12
    //   973: fload #13
    //   975: fcmpg
    //   976: ifge -> 987
    //   979: fload #11
    //   981: fload #21
    //   983: fcmpl
    //   984: ifgt -> 1011
    //   987: fload #22
    //   989: fstore #19
    //   991: fload #13
    //   993: fload #12
    //   995: fcmpg
    //   996: ifge -> 1056
    //   999: fload #22
    //   1001: fstore #19
    //   1003: fload #21
    //   1005: fload #11
    //   1007: fcmpl
    //   1008: ifle -> 1056
    //   1011: fload #12
    //   1013: fload #13
    //   1015: fsub
    //   1016: invokestatic abs : (F)F
    //   1019: fstore #12
    //   1021: fload #11
    //   1023: fload #21
    //   1025: fsub
    //   1026: invokestatic abs : (F)F
    //   1029: fstore #11
    //   1031: fload #12
    //   1033: fload #11
    //   1035: fcmpg
    //   1036: ifge -> 1049
    //   1039: fload #22
    //   1041: fload #12
    //   1043: fadd
    //   1044: fstore #19
    //   1046: goto -> 1056
    //   1049: fload #22
    //   1051: fload #11
    //   1053: fadd
    //   1054: fstore #19
    //   1056: fload #18
    //   1058: fstore #11
    //   1060: fload #19
    //   1062: fload #18
    //   1064: fcmpg
    //   1065: ifge -> 1114
    //   1068: iload #10
    //   1070: ifge -> 1080
    //   1073: fload #9
    //   1075: fstore #11
    //   1077: goto -> 1085
    //   1080: fload #9
    //   1082: fneg
    //   1083: fstore #11
    //   1085: iload #10
    //   1087: ifge -> 1097
    //   1090: fload #20
    //   1092: fstore #12
    //   1094: goto -> 1102
    //   1097: fload #20
    //   1099: fneg
    //   1100: fstore #12
    //   1102: fload #11
    //   1104: fstore #23
    //   1106: fload #19
    //   1108: fstore #11
    //   1110: fload #12
    //   1112: fstore #24
    //   1114: iload #7
    //   1116: istore #10
    //   1118: fload #11
    //   1120: fstore #18
    //   1122: goto -> 601
    //   1125: iconst_0
    //   1126: ireturn
    //   1127: aload #6
    //   1129: ifnull -> 1152
    //   1132: aload #6
    //   1134: getfield normal : Lcom/badlogic/gdx/math/Vector2;
    //   1137: fload #23
    //   1139: fload #24
    //   1141: invokevirtual set : (FF)Lcom/badlogic/gdx/math/Vector2;
    //   1144: pop
    //   1145: aload #6
    //   1147: fload #18
    //   1149: putfield depth : F
    //   1152: iconst_1
    //   1153: ireturn }
  
  public static boolean overlapConvexPolygons(float[] paramArrayOfFloat1, float[] paramArrayOfFloat2, MinimumTranslationVector paramMinimumTranslationVector) { return overlapConvexPolygons(paramArrayOfFloat1, 0, paramArrayOfFloat1.length, paramArrayOfFloat2, 0, paramArrayOfFloat2.length, paramMinimumTranslationVector); }
  
  public static boolean overlaps(Circle paramCircle1, Circle paramCircle2) { return paramCircle1.overlaps(paramCircle2); }
  
  public static boolean overlaps(Circle paramCircle, Rectangle paramRectangle) {
    boolean bool;
    float f1 = paramCircle.x;
    float f2 = paramCircle.y;
    if (paramCircle.x < paramRectangle.x) {
      f1 = paramRectangle.x;
    } else if (paramCircle.x > paramRectangle.x + paramRectangle.width) {
      f1 = paramRectangle.x + paramRectangle.width;
    } 
    if (paramCircle.y < paramRectangle.y) {
      f2 = paramRectangle.y;
    } else if (paramCircle.y > paramRectangle.y + paramRectangle.height) {
      f2 = paramRectangle.y + paramRectangle.height;
    } 
    f1 -= paramCircle.x;
    f2 -= paramCircle.y;
    if (f1 * f1 + f2 * f2 < paramCircle.radius * paramCircle.radius) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public static boolean overlaps(Rectangle paramRectangle1, Rectangle paramRectangle2) { return paramRectangle1.overlaps(paramRectangle2); }
  
  public static int pointLineSide(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) { return (int)Math.signum((paramFloat3 - paramFloat1) * (paramFloat6 - paramFloat2) - (paramFloat4 - paramFloat2) * (paramFloat5 - paramFloat1)); }
  
  public static int pointLineSide(Vector2 paramVector21, Vector2 paramVector22, Vector2 paramVector23) { return (int)Math.signum((paramVector22.x - paramVector21.x) * (paramVector23.y - paramVector21.y) - (paramVector22.y - paramVector21.y) * (paramVector23.x - paramVector21.x)); }
  
  private static void splitEdge(float[] paramArrayOfFloat1, int paramInt1, int paramInt2, int paramInt3, Plane paramPlane, float[] paramArrayOfFloat2, int paramInt4) {
    float f = intersectLinePlane(paramArrayOfFloat1[paramInt1], paramArrayOfFloat1[paramInt1 + 1], paramArrayOfFloat1[paramInt1 + 2], paramArrayOfFloat1[paramInt2], paramArrayOfFloat1[paramInt2 + 1], paramArrayOfFloat1[paramInt2 + 2], paramPlane, intersection);
    paramArrayOfFloat2[paramInt4 + 0] = intersection.x;
    paramArrayOfFloat2[paramInt4 + 1] = intersection.y;
    paramArrayOfFloat2[paramInt4 + 2] = intersection.z;
    for (int j = 3; j < paramInt3; j++) {
      float f1 = paramArrayOfFloat1[paramInt1 + j];
      paramArrayOfFloat2[paramInt4 + j] = f1 + (paramArrayOfFloat1[paramInt2 + j] - f1) * f;
    } 
  }
  
  public static void splitTriangle(float[] paramArrayOfFloat, Plane paramPlane, SplitTriangle paramSplitTriangle) {
    boolean bool3;
    boolean bool2;
    boolean bool1;
    int j = paramArrayOfFloat.length / 3;
    if (paramPlane.testPoint(paramArrayOfFloat[false], paramArrayOfFloat[true], paramArrayOfFloat[2]) == Plane.PlaneSide.Back) {
      bool1 = true;
    } else {
      bool1 = false;
    } 
    if (paramPlane.testPoint(paramArrayOfFloat[j + false], paramArrayOfFloat[j + true], paramArrayOfFloat[j + 2]) == Plane.PlaneSide.Back) {
      bool2 = true;
    } else {
      bool2 = false;
    } 
    int k = j * 2;
    if (paramPlane.testPoint(paramArrayOfFloat[k + false], paramArrayOfFloat[k + true], paramArrayOfFloat[k + 2]) == Plane.PlaneSide.Back) {
      bool3 = true;
    } else {
      bool3 = false;
    } 
    paramSplitTriangle.reset();
    if (bool1 == bool2 && bool2 == bool3) {
      paramSplitTriangle.total = 1;
      if (bool1) {
        paramSplitTriangle.numBack = 1;
        System.arraycopy(paramArrayOfFloat, 0, paramSplitTriangle.back, 0, paramArrayOfFloat.length);
      } else {
        paramSplitTriangle.numFront = 1;
        System.arraycopy(paramArrayOfFloat, 0, paramSplitTriangle.front, 0, paramArrayOfFloat.length);
      } 
      return;
    } 
    paramSplitTriangle.total = 3;
    paramSplitTriangle.numFront = (bool1 ^ true) + (bool2 ^ true) + (bool3 ^ true);
    paramSplitTriangle.numBack = paramSplitTriangle.total - paramSplitTriangle.numFront;
    paramSplitTriangle.setSide(bool1 ^ true);
    if (bool1 != bool2) {
      splitEdge(paramArrayOfFloat, 0, j, j, paramPlane, paramSplitTriangle.edgeSplit, 0);
      paramSplitTriangle.add(paramArrayOfFloat, 0, j);
      paramSplitTriangle.add(paramSplitTriangle.edgeSplit, 0, j);
      paramSplitTriangle.setSide(paramSplitTriangle.getSide() ^ true);
      paramSplitTriangle.add(paramSplitTriangle.edgeSplit, 0, j);
    } else {
      paramSplitTriangle.add(paramArrayOfFloat, 0, j);
    } 
    int m = j + j;
    if (bool2 != bool3) {
      splitEdge(paramArrayOfFloat, j, m, j, paramPlane, paramSplitTriangle.edgeSplit, 0);
      paramSplitTriangle.add(paramArrayOfFloat, j, j);
      paramSplitTriangle.add(paramSplitTriangle.edgeSplit, 0, j);
      paramSplitTriangle.setSide(paramSplitTriangle.getSide() ^ true);
      paramSplitTriangle.add(paramSplitTriangle.edgeSplit, 0, j);
    } else {
      paramSplitTriangle.add(paramArrayOfFloat, j, j);
    } 
    if (bool3 != bool1) {
      splitEdge(paramArrayOfFloat, m, 0, j, paramPlane, paramSplitTriangle.edgeSplit, 0);
      paramSplitTriangle.add(paramArrayOfFloat, m, j);
      paramSplitTriangle.add(paramSplitTriangle.edgeSplit, 0, j);
      paramSplitTriangle.setSide(paramSplitTriangle.getSide() ^ true);
      paramSplitTriangle.add(paramSplitTriangle.edgeSplit, 0, j);
    } else {
      paramSplitTriangle.add(paramArrayOfFloat, m, j);
    } 
    if (paramSplitTriangle.numFront == 2) {
      System.arraycopy(paramSplitTriangle.front, k, paramSplitTriangle.front, j * 3, k);
      System.arraycopy(paramSplitTriangle.front, 0, paramSplitTriangle.front, j * 5, j);
    } else {
      System.arraycopy(paramSplitTriangle.back, k, paramSplitTriangle.back, j * 3, k);
      System.arraycopy(paramSplitTriangle.back, 0, paramSplitTriangle.back, j * 5, j);
    } 
  }
  
  public static class MinimumTranslationVector {
    public float depth = 0.0F;
    
    public Vector2 normal = new Vector2();
  }
  
  public static class SplitTriangle {
    public float[] back;
    
    int backOffset = 0;
    
    float[] edgeSplit;
    
    public float[] front;
    
    boolean frontCurrent = false;
    
    int frontOffset = 0;
    
    public int numBack;
    
    public int numFront;
    
    public int total;
    
    public SplitTriangle(int param1Int) {
      int i = param1Int * 3 * 2;
      this.front = new float[i];
      this.back = new float[i];
      this.edgeSplit = new float[param1Int];
    }
    
    void add(float[] param1ArrayOfFloat, int param1Int1, int param1Int2) {
      if (this.frontCurrent) {
        System.arraycopy(param1ArrayOfFloat, param1Int1, this.front, this.frontOffset, param1Int2);
        this.frontOffset += param1Int2;
      } else {
        System.arraycopy(param1ArrayOfFloat, param1Int1, this.back, this.backOffset, param1Int2);
        this.backOffset += param1Int2;
      } 
    }
    
    boolean getSide() { return this.frontCurrent; }
    
    void reset() {
      this.frontCurrent = false;
      this.frontOffset = 0;
      this.backOffset = 0;
      this.numFront = 0;
      this.numBack = 0;
      this.total = 0;
    }
    
    void setSide(boolean param1Boolean) { this.frontCurrent = param1Boolean; }
    
    public String toString() {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("SplitTriangle [front=");
      stringBuilder.append(Arrays.toString(this.front));
      stringBuilder.append(", back=");
      stringBuilder.append(Arrays.toString(this.back));
      stringBuilder.append(", numFront=");
      stringBuilder.append(this.numFront);
      stringBuilder.append(", numBack=");
      stringBuilder.append(this.numBack);
      stringBuilder.append(", total=");
      stringBuilder.append(this.total);
      stringBuilder.append("]");
      return stringBuilder.toString();
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Intersector.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */