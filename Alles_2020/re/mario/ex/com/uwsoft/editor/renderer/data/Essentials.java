package com.uwsoft.editor.renderer.data;

import box2dLight.RayHandler;
import com.badlogic.gdx.physics.box2d.World;
import com.uwsoft.editor.renderer.resources.IResourceRetriever;
import com.uwsoft.editor.renderer.spine.SpineReflectionHelper;

public class Essentials {
  public boolean physicsStopped = false;
  
  public RayHandler rayHandler;
  
  public IResourceRetriever rm;
  
  public SpineReflectionHelper spineReflectionHelper;
  
  public World world;
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/data/Essentials.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */