package com.badlogic.gdx.graphics.g3d.particles.renderers;

import com.badlogic.gdx.graphics.g3d.ModelInstance;
import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;

public class ModelInstanceControllerRenderData extends ParticleControllerRenderData {
  public ParallelArray.FloatChannel colorChannel;
  
  public ParallelArray.ObjectChannel<ModelInstance> modelInstanceChannel;
  
  public ParallelArray.FloatChannel rotationChannel;
  
  public ParallelArray.FloatChannel scaleChannel;
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/renderers/ModelInstanceControllerRenderData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */