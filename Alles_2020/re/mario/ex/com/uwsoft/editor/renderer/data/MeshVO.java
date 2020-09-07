package com.uwsoft.editor.renderer.data;

import com.badlogic.gdx.math.Vector2;

public class MeshVO {
  public PhysicsBodyDataVO initialProperties;
  
  public Vector2[][] minPolygonData;
  
  public MeshVO clone() {
    MeshVO meshVO = new MeshVO();
    Vector2[][] arrayOfVector2 = new Vector2[this.minPolygonData.length][];
    byte b = 0;
    while (true) {
      Vector2[][] arrayOfVector21 = this.minPolygonData;
      if (b < arrayOfVector21.length) {
        arrayOfVector2[b] = new Vector2[arrayOfVector21[b].length];
        byte b1 = 0;
        while (true) {
          arrayOfVector21 = this.minPolygonData;
          if (b1 < arrayOfVector21[b].length) {
            arrayOfVector2[b][b1] = arrayOfVector21[b][b1].cpy();
            b1++;
            continue;
          } 
          break;
        } 
        b++;
        continue;
      } 
      break;
    } 
    meshVO.minPolygonData = arrayOfVector2;
    PhysicsBodyDataVO physicsBodyDataVO = this.initialProperties;
    if (physicsBodyDataVO != null)
      meshVO.initialProperties = new PhysicsBodyDataVO(physicsBodyDataVO); 
    return meshVO;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/MeshVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */