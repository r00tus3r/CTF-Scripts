package com.uwsoft.editor.renderer.resources;

import com.uwsoft.editor.renderer.data.ProjectInfoVO;
import com.uwsoft.editor.renderer.data.SceneVO;

public interface IDataLoader {
  ProjectInfoVO loadProjectVO();
  
  SceneVO loadSceneVO(String paramString);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/resources/IDataLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */