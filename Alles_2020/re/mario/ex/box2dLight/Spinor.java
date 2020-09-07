package box2dLight;

import com.badlogic.gdx.utils.StringBuilder;

public class Spinor {
  private static final float COSINE_THRESHOLD = 0.001F;
  
  float complex;
  
  float real;
  
  public Spinor() {}
  
  public Spinor(float paramFloat) { set(paramFloat); }
  
  public Spinor(float paramFloat1, float paramFloat2) { set(paramFloat1, paramFloat2); }
  
  public Spinor(Spinor paramSpinor) { set(paramSpinor); }
  
  public Spinor add(float paramFloat) {
    paramFloat /= 2.0F;
    double d1 = this.real;
    double d2 = paramFloat;
    double d3 = Math.cos(d2);
    Double.isNaN(d1);
    this.real = (float)(d1 + d3);
    d3 = this.complex;
    d2 = Math.sin(d2);
    Double.isNaN(d3);
    this.complex = (float)(d3 + d2);
    return this;
  }
  
  public Spinor add(Spinor paramSpinor) {
    this.real += paramSpinor.real;
    this.complex += paramSpinor.complex;
    return this;
  }
  
  public float angle() { return (float)Math.atan2(this.complex, this.real) * 2.0F; }
  
  public Spinor invert() {
    this.complex = -this.complex;
    scale(len2());
    return this;
  }
  
  public float len() {
    float f1 = this.real;
    float f2 = this.complex;
    return (float)Math.sqrt((f1 * f1 + f2 * f2));
  }
  
  public float len2() {
    float f1 = this.real;
    float f2 = this.complex;
    return f1 * f1 + f2 * f2;
  }
  
  public Spinor lerp(Spinor paramSpinor1, float paramFloat, Spinor paramSpinor2) {
    scale(1.0F - paramFloat);
    paramSpinor2.set(paramSpinor1).scale(paramFloat);
    add(paramSpinor2);
    nor();
    return this;
  }
  
  public Spinor mul(Spinor paramSpinor) {
    float f1 = this.real;
    float f2 = paramSpinor.real;
    float f3 = this.complex;
    float f4 = paramSpinor.complex;
    set(f1 * f2 - f3 * f4, f1 * f4 + f3 * f2);
    return this;
  }
  
  public Spinor nor() {
    float f = len();
    this.real /= f;
    this.complex /= f;
    return this;
  }
  
  public Spinor scale(float paramFloat) {
    this.real *= paramFloat;
    this.complex *= paramFloat;
    return this;
  }
  
  public Spinor set(float paramFloat) {
    double d = (paramFloat / 2.0F);
    set((float)Math.cos(d), (float)Math.sin(d));
    return this;
  }
  
  public Spinor set(float paramFloat1, float paramFloat2) {
    this.real = paramFloat1;
    this.complex = paramFloat2;
    return this;
  }
  
  public Spinor set(Spinor paramSpinor) {
    set(paramSpinor.real, paramSpinor.complex);
    return this;
  }
  
  public Spinor slerp(Spinor paramSpinor, float paramFloat) {
    float f1 = this.real;
    float f2 = paramSpinor.real;
    float f3 = this.complex;
    float f4 = paramSpinor.complex;
    float f5 = f1 * f2 + f3 * f4;
    float f6 = f5;
    f3 = f2;
    f1 = f4;
    if (f5 < 0.0F) {
      f6 = -f5;
      f1 = -f4;
      f3 = -f2;
    } 
    if (1.0F - f6 > 0.001F) {
      f2 = (float)Math.acos(f6);
      f4 = (float)Math.sin(f2);
      f6 = (float)Math.sin(((1.0F - paramFloat) * f2)) / f4;
      paramFloat = (float)Math.sin((paramFloat * f2)) / f4;
    } else {
      f6 = 1.0F - paramFloat;
    } 
    this.complex = this.complex * f6 + f1 * paramFloat;
    this.real = f6 * this.real + paramFloat * f3;
    return this;
  }
  
  public Spinor sub(float paramFloat) {
    paramFloat /= 2.0F;
    double d1 = this.real;
    double d2 = paramFloat;
    double d3 = Math.cos(d2);
    Double.isNaN(d1);
    this.real = (float)(d1 - d3);
    d1 = this.complex;
    d2 = Math.sin(d2);
    Double.isNaN(d1);
    this.complex = (float)(d1 - d2);
    return this;
  }
  
  public Spinor sub(Spinor paramSpinor) {
    this.real -= paramSpinor.real;
    this.complex -= paramSpinor.complex;
    return this;
  }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    float f = angle();
    stringBuilder.append("radians: ");
    stringBuilder.append(f);
    stringBuilder.append(", degrees: ");
    stringBuilder.append(f * 57.295776F);
    return stringBuilder.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/box2dLight/Spinor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */