package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public class GradientColorValue extends ParticleValue {
  private static float[] temp = new float[3];
  
  private float[] colors = { 1.0F, 1.0F, 1.0F };
  
  public float[] timeline = { 0.0F };
  
  public void getColor(float paramFloat, float[] paramArrayOfFloat, int paramInt) { // Byte code:
    //   0: aload_0
    //   1: getfield timeline : [F
    //   4: astore #4
    //   6: aload #4
    //   8: arraylength
    //   9: istore #5
    //   11: iconst_0
    //   12: istore #6
    //   14: iconst_1
    //   15: istore #7
    //   17: iload #7
    //   19: iload #5
    //   21: if_icmpge -> 54
    //   24: aload #4
    //   26: iload #7
    //   28: faload
    //   29: fload_1
    //   30: fcmpl
    //   31: ifle -> 37
    //   34: goto -> 57
    //   37: iload #7
    //   39: iconst_1
    //   40: iadd
    //   41: istore #8
    //   43: iload #7
    //   45: istore #6
    //   47: iload #8
    //   49: istore #7
    //   51: goto -> 17
    //   54: iconst_m1
    //   55: istore #7
    //   57: aload #4
    //   59: iload #6
    //   61: faload
    //   62: fstore #9
    //   64: iload #6
    //   66: iconst_3
    //   67: imul
    //   68: istore #6
    //   70: aload_0
    //   71: getfield colors : [F
    //   74: astore #10
    //   76: aload #10
    //   78: iload #6
    //   80: faload
    //   81: fstore #11
    //   83: aload #10
    //   85: iload #6
    //   87: iconst_1
    //   88: iadd
    //   89: faload
    //   90: fstore #12
    //   92: aload #10
    //   94: iload #6
    //   96: iconst_2
    //   97: iadd
    //   98: faload
    //   99: fstore #13
    //   101: iload #7
    //   103: iconst_m1
    //   104: if_icmpne -> 127
    //   107: aload_2
    //   108: iload_3
    //   109: fload #11
    //   111: fastore
    //   112: aload_2
    //   113: iload_3
    //   114: iconst_1
    //   115: iadd
    //   116: fload #12
    //   118: fastore
    //   119: aload_2
    //   120: iload_3
    //   121: iconst_2
    //   122: iadd
    //   123: fload #13
    //   125: fastore
    //   126: return
    //   127: fload_1
    //   128: fload #9
    //   130: fsub
    //   131: aload #4
    //   133: iload #7
    //   135: faload
    //   136: fload #9
    //   138: fsub
    //   139: fdiv
    //   140: fstore_1
    //   141: iload #7
    //   143: iconst_3
    //   144: imul
    //   145: istore #7
    //   147: aload_2
    //   148: iload_3
    //   149: fload #11
    //   151: aload #10
    //   153: iload #7
    //   155: faload
    //   156: fload #11
    //   158: fsub
    //   159: fload_1
    //   160: fmul
    //   161: fadd
    //   162: fastore
    //   163: aload_2
    //   164: iload_3
    //   165: iconst_1
    //   166: iadd
    //   167: fload #12
    //   169: aload #10
    //   171: iload #7
    //   173: iconst_1
    //   174: iadd
    //   175: faload
    //   176: fload #12
    //   178: fsub
    //   179: fload_1
    //   180: fmul
    //   181: fadd
    //   182: fastore
    //   183: aload_2
    //   184: iload_3
    //   185: iconst_2
    //   186: iadd
    //   187: fload #13
    //   189: aload #10
    //   191: iload #7
    //   193: iconst_2
    //   194: iadd
    //   195: faload
    //   196: fload #13
    //   198: fsub
    //   199: fload_1
    //   200: fmul
    //   201: fadd
    //   202: fastore
    //   203: return }
  
  public float[] getColor(float paramFloat) {
    getColor(paramFloat, temp, 0);
    return temp;
  }
  
  public float[] getColors() { return this.colors; }
  
  public float[] getTimeline() { return this.timeline; }
  
  public void load(GradientColorValue paramGradientColorValue) {
    load(paramGradientColorValue);
    this.colors = new float[paramGradientColorValue.colors.length];
    float[] arrayOfFloat2 = paramGradientColorValue.colors;
    float[] arrayOfFloat3 = this.colors;
    System.arraycopy(arrayOfFloat2, 0, arrayOfFloat3, 0, arrayOfFloat3.length);
    this.timeline = new float[paramGradientColorValue.timeline.length];
    float[] arrayOfFloat1 = paramGradientColorValue.timeline;
    arrayOfFloat2 = this.timeline;
    System.arraycopy(arrayOfFloat1, 0, arrayOfFloat2, 0, arrayOfFloat2.length);
  }
  
  public void read(Json paramJson, JsonValue paramJsonValue) {
    super.read(paramJson, paramJsonValue);
    this.colors = (float[])paramJson.readValue("colors", float[].class, paramJsonValue);
    this.timeline = (float[])paramJson.readValue("timeline", float[].class, paramJsonValue);
  }
  
  public void setColors(float[] paramArrayOfFloat) { this.colors = paramArrayOfFloat; }
  
  public void setTimeline(float[] paramArrayOfFloat) { this.timeline = paramArrayOfFloat; }
  
  public void write(Json paramJson) {
    super.write(paramJson);
    paramJson.writeValue("colors", this.colors);
    paramJson.writeValue("timeline", this.timeline);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */