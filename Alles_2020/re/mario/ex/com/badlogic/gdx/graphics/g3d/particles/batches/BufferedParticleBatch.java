package com.badlogic.gdx.graphics.g3d.particles.batches;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.g3d.particles.ParticleSorter;
import com.badlogic.gdx.graphics.g3d.particles.renderers.ParticleControllerRenderData;
import com.badlogic.gdx.utils.Array;

public abstract class BufferedParticleBatch<T extends ParticleControllerRenderData> extends Object implements ParticleBatch<T> {
  protected int bufferedParticlesCount;
  
  protected Camera camera;
  
  protected int currentCapacity = 0;
  
  protected Array<T> renderData;
  
  protected ParticleSorter sorter = new ParticleSorter.Distance();
  
  protected BufferedParticleBatch(Class<T> paramClass) { this.renderData = new Array(false, 10, paramClass); }
  
  protected abstract void allocParticlesData(int paramInt);
  
  public void begin() {
    this.renderData.clear();
    this.bufferedParticlesCount = 0;
  }
  
  public void draw(T paramT) {
    if (paramT.controller.particles.size > 0) {
      this.renderData.add(paramT);
      this.bufferedParticlesCount += paramT.controller.particles.size;
    } 
  }
  
  public void end() {
    int i = this.bufferedParticlesCount;
    if (i > 0) {
      ensureCapacity(i);
      flush(this.sorter.sort(this.renderData));
    } 
  }
  
  public void ensureCapacity(int paramInt) {
    if (this.currentCapacity >= paramInt)
      return; 
    this.sorter.ensureCapacity(paramInt);
    allocParticlesData(paramInt);
    this.currentCapacity = paramInt;
  }
  
  protected abstract void flush(int[] paramArrayOfInt);
  
  public int getBufferedCount() { return this.bufferedParticlesCount; }
  
  public ParticleSorter getSorter() { return this.sorter; }
  
  public void resetCapacity() {
    this.bufferedParticlesCount = 0;
    this.currentCapacity = 0;
  }
  
  public void setCamera(Camera paramCamera) {
    this.camera = paramCamera;
    this.sorter.setCamera(paramCamera);
  }
  
  public void setSorter(ParticleSorter paramParticleSorter) {
    this.sorter = paramParticleSorter;
    paramParticleSorter.setCamera(this.camera);
    paramParticleSorter.ensureCapacity(this.currentCapacity);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */