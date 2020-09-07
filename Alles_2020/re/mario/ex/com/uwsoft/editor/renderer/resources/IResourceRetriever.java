package com.uwsoft.editor.renderer.resources;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.ParticleEffect;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.uwsoft.editor.renderer.data.ProjectInfoVO;
import com.uwsoft.editor.renderer.data.SceneVO;
import com.uwsoft.editor.renderer.utils.MySkin;

public interface IResourceRetriever {
  BitmapFont getBitmapFont(String paramString, int paramInt);
  
  ParticleEffect getParticleEffect(String paramString);
  
  ProjectInfoVO getProjectVO();
  
  FileHandle getSCMLFile(String paramString);
  
  SceneVO getSceneVO(String paramString);
  
  TextureAtlas getSkeletonAtlas(String paramString);
  
  FileHandle getSkeletonJSON(String paramString);
  
  MySkin getSkin();
  
  TextureAtlas getSpriteAnimation(String paramString);
  
  TextureRegion getTextureRegion(String paramString);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/resources/IResourceRetriever.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */