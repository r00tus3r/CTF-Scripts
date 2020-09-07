package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public class ScaledNumericValue extends RangedNumericValue {
  private float highMax;
  
  private float highMin;
  
  private boolean relative = false;
  
  private float[] scaling = { 1.0F };
  
  public float[] timeline = { 0.0F };
  
  public float getHighMax() { return this.highMax; }
  
  public float getHighMin() { return this.highMin; }
  
  public float getScale(float paramFloat) { // Byte code:
    //   0: aload_0
    //   1: getfield timeline : [F
    //   4: arraylength
    //   5: istore_2
    //   6: iconst_1
    //   7: istore_3
    //   8: iload_3
    //   9: iload_2
    //   10: if_icmpge -> 33
    //   13: aload_0
    //   14: getfield timeline : [F
    //   17: iload_3
    //   18: faload
    //   19: fload_1
    //   20: fcmpl
    //   21: ifle -> 27
    //   24: goto -> 35
    //   27: iinc #3, 1
    //   30: goto -> 8
    //   33: iconst_m1
    //   34: istore_3
    //   35: iload_3
    //   36: iconst_m1
    //   37: if_icmpne -> 49
    //   40: aload_0
    //   41: getfield scaling : [F
    //   44: iload_2
    //   45: iconst_1
    //   46: isub
    //   47: faload
    //   48: freturn
    //   49: iload_3
    //   50: iconst_1
    //   51: isub
    //   52: istore_2
    //   53: aload_0
    //   54: getfield scaling : [F
    //   57: astore #4
    //   59: aload #4
    //   61: iload_2
    //   62: faload
    //   63: fstore #5
    //   65: aload_0
    //   66: getfield timeline : [F
    //   69: astore #6
    //   71: aload #6
    //   73: iload_2
    //   74: faload
    //   75: fstore #7
    //   77: fload #5
    //   79: aload #4
    //   81: iload_3
    //   82: faload
    //   83: fload #5
    //   85: fsub
    //   86: fload_1
    //   87: fload #7
    //   89: fsub
    //   90: aload #6
    //   92: iload_3
    //   93: faload
    //   94: fload #7
    //   96: fsub
    //   97: fdiv
    //   98: fmul
    //   99: fadd
    //   100: freturn }
  
  public float[] getScaling() { return this.scaling; }
  
  public float[] getTimeline() { return this.timeline; }
  
  public boolean isRelative() { return this.relative; }
  
  public void load(ScaledNumericValue paramScaledNumericValue) {
    load(paramScaledNumericValue);
    this.highMax = paramScaledNumericValue.highMax;
    this.highMin = paramScaledNumericValue.highMin;
    this.scaling = new float[paramScaledNumericValue.scaling.length];
    float[] arrayOfFloat1 = paramScaledNumericValue.scaling;
    float[] arrayOfFloat2 = this.scaling;
    System.arraycopy(arrayOfFloat1, 0, arrayOfFloat2, 0, arrayOfFloat2.length);
    this.timeline = new float[paramScaledNumericValue.timeline.length];
    arrayOfFloat2 = paramScaledNumericValue.timeline;
    arrayOfFloat1 = this.timeline;
    System.arraycopy(arrayOfFloat2, 0, arrayOfFloat1, 0, arrayOfFloat1.length);
    this.relative = paramScaledNumericValue.relative;
  }
  
  public float newHighValue() {
    float f = this.highMin;
    return f + (this.highMax - f) * MathUtils.random();
  }
  
  public void read(Json paramJson, JsonValue paramJsonValue) {
    super.read(paramJson, paramJsonValue);
    this.highMin = ((Float)paramJson.readValue("highMin", float.class, paramJsonValue)).floatValue();
    this.highMax = ((Float)paramJson.readValue("highMax", float.class, paramJsonValue)).floatValue();
    this.relative = ((Boolean)paramJson.readValue("relative", boolean.class, paramJsonValue)).booleanValue();
    this.scaling = (float[])paramJson.readValue("scaling", float[].class, paramJsonValue);
    this.timeline = (float[])paramJson.readValue("timeline", float[].class, paramJsonValue);
  }
  
  public void setHigh(float paramFloat) {
    this.highMin = paramFloat;
    this.highMax = paramFloat;
  }
  
  public void setHigh(float paramFloat1, float paramFloat2) {
    this.highMin = paramFloat1;
    this.highMax = paramFloat2;
  }
  
  public void setHighMax(float paramFloat) { this.highMax = paramFloat; }
  
  public void setHighMin(float paramFloat) { this.highMin = paramFloat; }
  
  public void setRelative(boolean paramBoolean) { this.relative = paramBoolean; }
  
  public void setScaling(float[] paramArrayOfFloat) { this.scaling = paramArrayOfFloat; }
  
  public void setTimeline(float[] paramArrayOfFloat) { this.timeline = paramArrayOfFloat; }
  
  public void write(Json paramJson) {
    super.write(paramJson);
    paramJson.writeValue("highMin", Float.valueOf(this.highMin));
    paramJson.writeValue("highMax", Float.valueOf(this.highMax));
    paramJson.writeValue("relative", Boolean.valueOf(this.relative));
    paramJson.writeValue("scaling", this.scaling);
    paramJson.writeValue("timeline", this.timeline);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */