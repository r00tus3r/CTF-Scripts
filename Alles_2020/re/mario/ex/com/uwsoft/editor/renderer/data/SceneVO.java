package com.uwsoft.editor.renderer.data;

import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonWriter;
import java.util.Arrays;
import java.util.HashMap;

public class SceneVO {
  public float[] ambientColor = { 1.0F, 1.0F, 1.0F, 1.0F };
  
  public CompositeVO composite;
  
  public HashMap<String, CompositeItemVO> libraryItems = new HashMap();
  
  public PhysicsPropertiesVO physicsPropertiesVO = new PhysicsPropertiesVO();
  
  public String sceneName = "";
  
  public SceneVO() {}
  
  public SceneVO(SceneVO paramSceneVO) {
    this.sceneName = new String(paramSceneVO.sceneName);
    this.composite = new CompositeVO(paramSceneVO.composite);
    float[] arrayOfFloat = paramSceneVO.ambientColor;
    this.ambientColor = Arrays.copyOf(arrayOfFloat, arrayOfFloat.length);
    this.physicsPropertiesVO = new PhysicsPropertiesVO(paramSceneVO.physicsPropertiesVO);
  }
  
  public String constructJsonString() {
    Json json = new Json();
    json.setOutputType(JsonWriter.OutputType.json);
    return json.toJson(this);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/SceneVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */