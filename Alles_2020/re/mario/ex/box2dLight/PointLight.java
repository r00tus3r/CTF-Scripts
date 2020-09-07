package box2dLight;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.MathUtils;

public class PointLight extends PositionalLight {
  public PointLight(RayHandler paramRayHandler, int paramInt) { this(paramRayHandler, paramInt, Light.DefaultColor, 15.0F, 0.0F, 0.0F); }
  
  public PointLight(RayHandler paramRayHandler, int paramInt, Color paramColor, float paramFloat1, float paramFloat2, float paramFloat3) { super(paramRayHandler, paramInt, paramColor, paramFloat1, paramFloat2, paramFloat3, 0.0F); }
  
  @Deprecated
  public void setDirection(float paramFloat) {}
  
  public void setDistance(float paramFloat) {
    float f = paramFloat * RayHandler.gammaCorrectionParameter;
    paramFloat = f;
    if (f < 0.01F)
      paramFloat = 0.01F; 
    this.distance = paramFloat;
    this.dirty = true;
  }
  
  void setEndPoints() {
    float f = 360.0F / (this.rayNum - 1);
    for (byte b = 0; b < this.rayNum; b++) {
      float f1 = b * f;
      this.sin[b] = MathUtils.sinDeg(f1);
      this.cos[b] = MathUtils.cosDeg(f1);
      this.endX[b] = this.distance * this.cos[b];
      this.endY[b] = this.distance * this.sin[b];
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


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/box2dLight/PointLight.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */