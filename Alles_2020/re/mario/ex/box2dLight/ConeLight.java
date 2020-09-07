package box2dLight;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.MathUtils;

public class ConeLight extends PositionalLight {
  float coneDegree;
  
  public ConeLight(RayHandler paramRayHandler, int paramInt, Color paramColor, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) {
    super(paramRayHandler, paramInt, paramColor, paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    setConeDegree(paramFloat5);
  }
  
  public float getConeDegree() { return this.coneDegree; }
  
  public void setConeDegree(float paramFloat) {
    this.coneDegree = MathUtils.clamp(paramFloat, 0.0F, 180.0F);
    this.dirty = true;
  }
  
  public void setDirection(float paramFloat) {
    this.direction = paramFloat;
    this.dirty = true;
  }
  
  public void setDistance(float paramFloat) {
    float f = paramFloat * RayHandler.gammaCorrectionParameter;
    paramFloat = f;
    if (f < 0.01F)
      paramFloat = 0.01F; 
    this.distance = paramFloat;
    this.dirty = true;
  }
  
  protected void setEndPoints() {
    for (byte b = 0; b < this.rayNum; b++) {
      float f1 = this.direction;
      float f2 = this.coneDegree;
      f1 = f1 + f2 - f2 * 2.0F * b / (this.rayNum - 1.0F);
      float[] arrayOfFloat = this.sin;
      f2 = MathUtils.sinDeg(f1);
      arrayOfFloat[b] = f2;
      arrayOfFloat = this.cos;
      f1 = MathUtils.cosDeg(f1);
      arrayOfFloat[b] = f1;
      this.endX[b] = this.distance * f1;
      this.endY[b] = this.distance * f2;
    } 
  }
  
  public void update() {
    updateBody();
    if (this.dirty)
      setEndPoints(); 
    if (cull())
      return; 
    if (this.staticLight && !this.dirty)
      return; 
    this.dirty = false;
    updateMesh();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/box2dLight/ConeLight.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */