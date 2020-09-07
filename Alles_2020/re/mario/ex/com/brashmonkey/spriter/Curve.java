package com.brashmonkey.spriter;

public class Curve {
  public final Constraints constraints = new Constraints(0.0F, 0.0F, 0.0F, 0.0F);
  
  private float lastCubicSolution = 0.0F;
  
  public Curve subCurve;
  
  private Type type;
  
  public Curve() { this(Type.Linear); }
  
  public Curve(Type paramType) { this(paramType, null); }
  
  public Curve(Type paramType, Curve paramCurve) {
    setType(paramType);
    this.subCurve = paramCurve;
  }
  
  public static Type getType(String paramString) { return paramString.equals("instant") ? Type.Instant : (paramString.equals("quadratic") ? Type.Quadratic : (paramString.equals("cubic") ? Type.Cubic : (paramString.equals("quartic") ? Type.Quartic : (paramString.equals("quintic") ? Type.Quintic : (paramString.equals("bezier") ? Type.Bezier : Type.Linear))))); }
  
  private float tweenSub(float paramFloat1, float paramFloat2, float paramFloat3) {
    Curve curve = this.subCurve;
    return (curve != null) ? curve.tween(paramFloat1, paramFloat2, paramFloat3) : paramFloat3;
  }
  
  public Type getType() { return this.type; }
  
  public void setType(Type paramType) {
    if (paramType != null) {
      this.type = paramType;
      return;
    } 
    throw new SpriterException("The type of a curve cannot be null!");
  }
  
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(getClass().getSimpleName());
    stringBuilder.append("|[");
    stringBuilder.append(this.type);
    stringBuilder.append(":");
    stringBuilder.append(this.constraints);
    stringBuilder.append(", subCurve: ");
    stringBuilder.append(this.subCurve);
    stringBuilder.append("]");
    return stringBuilder.toString();
  }
  
  public float tween(float paramFloat1, float paramFloat2, float paramFloat3) {
    Float float;
    float f = tweenSub(0.0F, 1.0F, paramFloat3);
    paramFloat3 = paramFloat1;
    switch (this.type) {
      default:
        return Interpolator.linear(paramFloat1, paramFloat2, f);
      case Bezier:
        float = Calculator.solveCubic((this.constraints.c1 - this.constraints.c3) * 3.0F + 1.0F, (this.constraints.c3 - this.constraints.c1 * 2.0F) * 3.0F, this.constraints.c1 * 3.0F, -f);
        if (float == null) {
          float = Float.valueOf(this.lastCubicSolution);
        } else {
          this.lastCubicSolution = float.floatValue();
        } 
        return Interpolator.linear(paramFloat1, paramFloat2, Interpolator.bezier(float.floatValue(), 0.0F, this.constraints.c2, this.constraints.c4, 1.0F));
      case Quintic:
        return Interpolator.quintic(paramFloat1, Interpolator.linear(paramFloat1, paramFloat2, this.constraints.c1), Interpolator.linear(paramFloat1, paramFloat2, this.constraints.c2), Interpolator.linear(paramFloat1, paramFloat2, this.constraints.c3), Interpolator.linear(paramFloat1, paramFloat2, this.constraints.c4), paramFloat2, f);
      case Quartic:
        return Interpolator.quartic(paramFloat1, Interpolator.linear(paramFloat1, paramFloat2, this.constraints.c1), Interpolator.linear(paramFloat1, paramFloat2, this.constraints.c2), Interpolator.linear(paramFloat1, paramFloat2, this.constraints.c3), paramFloat2, f);
      case Cubic:
        return Interpolator.cubic(paramFloat1, Interpolator.linear(paramFloat1, paramFloat2, this.constraints.c1), Interpolator.linear(paramFloat1, paramFloat2, this.constraints.c2), paramFloat2, f);
      case Quadratic:
        return Interpolator.quadratic(paramFloat1, Interpolator.linear(paramFloat1, paramFloat2, this.constraints.c1), paramFloat2, f);
      case Linear:
        paramFloat3 = Interpolator.linear(paramFloat1, paramFloat2, f);
        break;
      case Instant:
        break;
    } 
    return paramFloat3;
  }
  
  public float tweenAngle(float paramFloat1, float paramFloat2, float paramFloat3) {
    Float float;
    float f = tweenSub(0.0F, 1.0F, paramFloat3);
    paramFloat3 = paramFloat1;
    switch (this.type) {
      default:
        return Interpolator.linearAngle(paramFloat1, paramFloat2, f);
      case Bezier:
        float = Calculator.solveCubic((this.constraints.c1 - this.constraints.c3) * 3.0F + 1.0F, (this.constraints.c3 - this.constraints.c1 * 2.0F) * 3.0F, this.constraints.c1 * 3.0F, -f);
        if (float == null) {
          float = Float.valueOf(this.lastCubicSolution);
        } else {
          this.lastCubicSolution = float.floatValue();
        } 
        return Interpolator.linearAngle(paramFloat1, paramFloat2, Interpolator.bezier(float.floatValue(), 0.0F, this.constraints.c2, this.constraints.c4, 1.0F));
      case Quintic:
        return Interpolator.quinticAngle(paramFloat1, Interpolator.linearAngle(paramFloat1, paramFloat2, this.constraints.c1), Interpolator.linearAngle(paramFloat1, paramFloat2, this.constraints.c2), Interpolator.linearAngle(paramFloat1, paramFloat2, this.constraints.c3), Interpolator.linearAngle(paramFloat1, paramFloat2, this.constraints.c4), paramFloat2, f);
      case Quartic:
        return Interpolator.quarticAngle(paramFloat1, Interpolator.linearAngle(paramFloat1, paramFloat2, this.constraints.c1), Interpolator.linearAngle(paramFloat1, paramFloat2, this.constraints.c2), Interpolator.linearAngle(paramFloat1, paramFloat2, this.constraints.c3), paramFloat2, f);
      case Cubic:
        return Interpolator.cubicAngle(paramFloat1, Interpolator.linearAngle(paramFloat1, paramFloat2, this.constraints.c1), Interpolator.linearAngle(paramFloat1, paramFloat2, this.constraints.c2), paramFloat2, f);
      case Quadratic:
        return Interpolator.quadraticAngle(paramFloat1, Interpolator.linearAngle(paramFloat1, paramFloat2, this.constraints.c1), paramFloat2, f);
      case Linear:
        paramFloat3 = Interpolator.linearAngle(paramFloat1, paramFloat2, f);
        break;
      case Instant:
        break;
    } 
    return paramFloat3;
  }
  
  public float tweenAngle(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt) {
    if (paramInt > 0) {
      null = paramFloat2;
      if (paramFloat2 - paramFloat1 < 0.0F)
        null = paramFloat2 + 360.0F; 
    } else {
      null = paramFloat1;
      if (paramInt < 0) {
        null = paramFloat2;
        if (paramFloat2 - paramFloat1 > 0.0F)
          null = paramFloat2 - 360.0F; 
      } else {
        return null;
      } 
    } 
    return tween(paramFloat1, null, paramFloat3);
  }
  
  public void tweenPoint(Point paramPoint1, Point paramPoint2, float paramFloat, Point paramPoint3) { paramPoint3.set(tween(paramPoint1.x, paramPoint2.x, paramFloat), tween(paramPoint1.y, paramPoint2.y, paramFloat)); }
  
  public static class Constraints {
    public float c1;
    
    public float c2;
    
    public float c3;
    
    public float c4;
    
    public Constraints(float param1Float1, float param1Float2, float param1Float3, float param1Float4) { set(param1Float1, param1Float2, param1Float3, param1Float4); }
    
    public void set(float param1Float1, float param1Float2, float param1Float3, float param1Float4) {
      this.c1 = param1Float1;
      this.c2 = param1Float2;
      this.c3 = param1Float3;
      this.c4 = param1Float4;
    }
    
    public String toString() {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(getClass().getSimpleName());
      stringBuilder.append("| [c1:");
      stringBuilder.append(this.c1);
      stringBuilder.append(", c2:");
      stringBuilder.append(this.c2);
      stringBuilder.append(", c3:");
      stringBuilder.append(this.c3);
      stringBuilder.append(", c4:");
      stringBuilder.append(this.c4);
      stringBuilder.append("]");
      return stringBuilder.toString();
    }
  }
  
  public enum Type {
    Bezier, Cubic, Instant, Linear, Quadratic, Quartic, Quintic;
    
    static  {
      Cubic = new Type("Cubic", 3);
      Quartic = new Type("Quartic", 4);
      Quintic = new Type("Quintic", 5);
      Bezier = new Type("Bezier", 6);
      $VALUES = new Type[] { Instant, Linear, Quadratic, Cubic, Quartic, Quintic, Bezier };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Curve.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */