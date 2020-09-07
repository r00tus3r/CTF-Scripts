package box2dLight;

import com.badlogic.gdx.Gdx;

public class BlendFunc {
  final int default_dfactor;
  
  final int default_sfactor;
  
  int dfactor;
  
  int sfactor;
  
  public BlendFunc(int paramInt1, int paramInt2) {
    this.default_sfactor = paramInt1;
    this.default_dfactor = paramInt2;
    this.sfactor = paramInt1;
    this.dfactor = paramInt2;
  }
  
  public void apply() { Gdx.gl20.glBlendFunc(this.sfactor, this.dfactor); }
  
  public void reset() {
    this.sfactor = this.default_sfactor;
    this.dfactor = this.default_dfactor;
  }
  
  public void set(int paramInt1, int paramInt2) {
    this.sfactor = paramInt1;
    this.dfactor = paramInt2;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/box2dLight/BlendFunc.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */