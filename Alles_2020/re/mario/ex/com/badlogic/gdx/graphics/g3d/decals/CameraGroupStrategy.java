package com.badlogic.gdx.graphics.g3d.decals;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.Pool;
import java.util.Comparator;

public class CameraGroupStrategy implements GroupStrategy, Disposable {
  private static final int GROUP_BLEND = 1;
  
  private static final int GROUP_OPAQUE = 0;
  
  Pool<Array<Decal>> arrayPool = new Pool<Array<Decal>>(16) {
      protected Array<Decal> newObject() { return new Array(); }
    };
  
  Camera camera;
  
  private final Comparator<Decal> cameraSorter;
  
  ObjectMap<DecalMaterial, Array<Decal>> materialGroups = new ObjectMap();
  
  ShaderProgram shader;
  
  Array<Array<Decal>> usedArrays = new Array();
  
  public CameraGroupStrategy(final Camera camera) { this(paramCamera, new Comparator<Decal>() {
          public int compare(Decal param1Decal1, Decal param1Decal2) {
            float f = this.val$camera.position.dst(param1Decal1.position);
            return (int)Math.signum(this.val$camera.position.dst(param1Decal2.position) - f);
          }
        }); }
  
  public CameraGroupStrategy(Camera paramCamera, Comparator<Decal> paramComparator) {
    this.camera = paramCamera;
    this.cameraSorter = paramComparator;
    createDefaultShader();
  }
  
  private void createDefaultShader() {
    this.shader = new ShaderProgram("attribute vec4 a_position;\nattribute vec4 a_color;\nattribute vec2 a_texCoord0;\nuniform mat4 u_projectionViewMatrix;\nvarying vec4 v_color;\nvarying vec2 v_texCoords;\n\nvoid main()\n{\n   v_color = a_color;\n   v_color.a = v_color.a * (255.0/254.0);\n   v_texCoords = a_texCoord0;\n   gl_Position =  u_projectionViewMatrix * a_position;\n}\n", "#ifdef GL_ES\nprecision mediump float;\n#endif\nvarying vec4 v_color;\nvarying vec2 v_texCoords;\nuniform sampler2D u_texture;\nvoid main()\n{\n  gl_FragColor = v_color * texture2D(u_texture, v_texCoords);\n}");
    if (this.shader.isCompiled())
      return; 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("couldn't compile shader: ");
    stringBuilder.append(this.shader.getLog());
    throw new IllegalArgumentException(stringBuilder.toString());
  }
  
  public void afterGroup(int paramInt) {
    if (paramInt == 1)
      Gdx.gl.glDisable(3042); 
  }
  
  public void afterGroups() {
    this.shader.end();
    Gdx.gl.glDisable(2929);
  }
  
  public void beforeGroup(int paramInt, Array<Decal> paramArray) {
    if (paramInt == 1) {
      Gdx.gl.glEnable(3042);
      paramArray.sort(this.cameraSorter);
    } else {
      paramInt = 0;
      int i = paramArray.size;
      while (paramInt < i) {
        Decal decal = (Decal)paramArray.get(paramInt);
        Array array1 = (Array)this.materialGroups.get(decal.material);
        Array array2 = array1;
        if (array1 == null) {
          array2 = (Array)this.arrayPool.obtain();
          array2.clear();
          this.usedArrays.add(array2);
          this.materialGroups.put(decal.material, array2);
        } 
        array2.add(decal);
        paramInt++;
      } 
      paramArray.clear();
      ObjectMap.Values values = this.materialGroups.values().iterator();
      while (values.hasNext())
        paramArray.addAll((Array)values.next()); 
      this.materialGroups.clear();
      this.arrayPool.freeAll(this.usedArrays);
      this.usedArrays.clear();
    } 
  }
  
  public void beforeGroups() {
    Gdx.gl.glEnable(2929);
    this.shader.begin();
    this.shader.setUniformMatrix("u_projectionViewMatrix", this.camera.combined);
    this.shader.setUniformi("u_texture", 0);
  }
  
  public int decideGroup(Decal paramDecal) { return paramDecal.getMaterial().isOpaque() ^ true; }
  
  public void dispose() {
    ShaderProgram shaderProgram = this.shader;
    if (shaderProgram != null)
      shaderProgram.dispose(); 
  }
  
  public Camera getCamera() { return this.camera; }
  
  public ShaderProgram getGroupShader(int paramInt) { return this.shader; }
  
  public void setCamera(Camera paramCamera) { this.camera = paramCamera; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/decals/CameraGroupStrategy.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */