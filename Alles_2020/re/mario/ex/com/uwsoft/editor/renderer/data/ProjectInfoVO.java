package com.uwsoft.editor.renderer.data;

import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;

public class ProjectInfoVO {
  public HashMap<String, String> assetMeshMap = new HashMap();
  
  public HashMap<String, MeshVO> meshes = new HashMap();
  
  public ResolutionEntryVO originalResolution = new ResolutionEntryVO();
  
  public ArrayList<ResolutionEntryVO> resolutions = new ArrayList();
  
  public ArrayList<SceneVO> scenes = new ArrayList();
  
  public String addNewMesh(MeshVO paramMeshVO) {
    byte b;
    HashMap hashMap1 = this.meshes;
    if (hashMap1 != null && hashMap1.size() != 0) {
      b = Integer.parseInt((String)Collections.max(this.meshes.keySet(), new Comparator<String>() {
              public int compare(String param1String1, String param1String2) { return Integer.valueOf(param1String1).compareTo(Integer.valueOf(param1String2)); }
            }));
    } else {
      b = -1;
    } 
    HashMap hashMap2 = this.meshes;
    StringBuilder stringBuilder2 = new StringBuilder();
    stringBuilder2.append(++b);
    stringBuilder2.append("");
    hashMap2.put(stringBuilder2.toString(), paramMeshVO);
    StringBuilder stringBuilder1 = new StringBuilder();
    stringBuilder1.append(b);
    stringBuilder1.append("");
    return stringBuilder1.toString();
  }
  
  public String cloneMesh(String paramString) {
    MeshVO meshVO = (MeshVO)this.meshes.get(paramString);
    return (meshVO == null) ? paramString : addNewMesh(meshVO.clone());
  }
  
  public String constructJsonString() {
    Json json = new Json();
    json.setOutputType(JsonWriter.OutputType.json);
    String str = json.toJson(this);
    json.prettyPrint(str);
    return str;
  }
  
  public ResolutionEntryVO getResolution(String paramString) {
    for (ResolutionEntryVO resolutionEntryVO : this.resolutions) {
      if (resolutionEntryVO.name.equalsIgnoreCase(paramString))
        return resolutionEntryVO; 
    } 
    return null;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/ProjectInfoVO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */