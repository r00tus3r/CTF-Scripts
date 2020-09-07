package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.utils.Array;
import java.util.Iterator;

public class DistanceFieldFont extends BitmapFont {
  private float distanceFieldSmoothing;
  
  public DistanceFieldFont(FileHandle paramFileHandle) { super(paramFileHandle); }
  
  public DistanceFieldFont(FileHandle paramFileHandle1, FileHandle paramFileHandle2, boolean paramBoolean) { super(paramFileHandle1, paramFileHandle2, paramBoolean); }
  
  public DistanceFieldFont(FileHandle paramFileHandle1, FileHandle paramFileHandle2, boolean paramBoolean1, boolean paramBoolean2) { super(paramFileHandle1, paramFileHandle2, paramBoolean1, paramBoolean2); }
  
  public DistanceFieldFont(FileHandle paramFileHandle, TextureRegion paramTextureRegion) { super(paramFileHandle, paramTextureRegion); }
  
  public DistanceFieldFont(FileHandle paramFileHandle, TextureRegion paramTextureRegion, boolean paramBoolean) { super(paramFileHandle, paramTextureRegion, paramBoolean); }
  
  public DistanceFieldFont(FileHandle paramFileHandle, boolean paramBoolean) { super(paramFileHandle, paramBoolean); }
  
  public DistanceFieldFont(BitmapFont.BitmapFontData paramBitmapFontData, TextureRegion paramTextureRegion, boolean paramBoolean) { super(paramBitmapFontData, paramTextureRegion, paramBoolean); }
  
  public DistanceFieldFont(BitmapFont.BitmapFontData paramBitmapFontData, Array<TextureRegion> paramArray, boolean paramBoolean) { super(paramBitmapFontData, paramArray, paramBoolean); }
  
  public static ShaderProgram createDistanceFieldShader() {
    ShaderProgram shaderProgram = new ShaderProgram("attribute vec4 a_position;\nattribute vec4 a_color;\nattribute vec2 a_texCoord0;\nuniform mat4 u_projTrans;\nvarying vec4 v_color;\nvarying vec2 v_texCoords;\n\nvoid main() {\n\tv_color = a_color;\n\tv_color.a = v_color.a * (255.0/254.0);\n\tv_texCoords = a_texCoord0;\n\tgl_Position =  u_projTrans * a_position;\n}\n", "#ifdef GL_ES\n\tprecision mediump float;\n\tprecision mediump int;\n#endif\n\nuniform sampler2D u_texture;\nuniform float u_smoothing;\nvarying vec4 v_color;\nvarying vec2 v_texCoords;\n\nvoid main() {\n\tif (u_smoothing > 0.0) {\n\t\tfloat smoothing = 0.25 / u_smoothing;\n\t\tfloat distance = texture2D(u_texture, v_texCoords).a;\n\t\tfloat alpha = smoothstep(0.5 - smoothing, 0.5 + smoothing, distance);\n\t\tgl_FragColor = vec4(v_color.rgb, alpha * v_color.a);\n\t} else {\n\t\tgl_FragColor = v_color * texture2D(u_texture, v_texCoords);\n\t}\n}\n");
    if (shaderProgram.isCompiled())
      return shaderProgram; 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Error compiling distance field shader: ");
    stringBuilder.append(shaderProgram.getLog());
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public float getDistanceFieldSmoothing() { return this.distanceFieldSmoothing; }
  
  protected void load(BitmapFont.BitmapFontData paramBitmapFontData) {
    super.load(paramBitmapFontData);
    Iterator iterator = getRegions().iterator();
    while (iterator.hasNext())
      ((TextureRegion)iterator.next()).getTexture().setFilter(Texture.TextureFilter.Linear, Texture.TextureFilter.Linear); 
  }
  
  public BitmapFontCache newFontCache() { return new DistanceFieldFontCache(this, this.integer); }
  
  public void setDistanceFieldSmoothing(float paramFloat) { this.distanceFieldSmoothing = paramFloat; }
  
  private static class DistanceFieldFontCache extends BitmapFontCache {
    public DistanceFieldFontCache(DistanceFieldFont param1DistanceFieldFont) { super(param1DistanceFieldFont, param1DistanceFieldFont.usesIntegerPositions()); }
    
    public DistanceFieldFontCache(DistanceFieldFont param1DistanceFieldFont, boolean param1Boolean) { super(param1DistanceFieldFont, param1Boolean); }
    
    private float getSmoothingFactor() {
      DistanceFieldFont distanceFieldFont = (DistanceFieldFont)getFont();
      return distanceFieldFont.getDistanceFieldSmoothing() * distanceFieldFont.getScaleX();
    }
    
    private void setSmoothingUniform(Batch param1Batch, float param1Float) {
      param1Batch.flush();
      param1Batch.getShader().setUniformf("u_smoothing", param1Float);
    }
    
    public void draw(Batch param1Batch) {
      setSmoothingUniform(param1Batch, getSmoothingFactor());
      super.draw(param1Batch);
      setSmoothingUniform(param1Batch, 0.0F);
    }
    
    public void draw(Batch param1Batch, int param1Int1, int param1Int2) {
      setSmoothingUniform(param1Batch, getSmoothingFactor());
      super.draw(param1Batch, param1Int1, param1Int2);
      setSmoothingUniform(param1Batch, 0.0F);
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/DistanceFieldFont.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */