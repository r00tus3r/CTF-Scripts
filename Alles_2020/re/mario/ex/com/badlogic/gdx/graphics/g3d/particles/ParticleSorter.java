package com.badlogic.gdx.graphics.g3d.particles;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.g3d.particles.renderers.ParticleControllerRenderData;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import java.util.Iterator;

public abstract class ParticleSorter {
  static final Vector3 TMP_V1 = new Vector3();
  
  protected Camera camera;
  
  public void ensureCapacity(int paramInt) {}
  
  public void setCamera(Camera paramCamera) { this.camera = paramCamera; }
  
  public abstract <T extends ParticleControllerRenderData> int[] sort(Array<T> paramArray);
  
  public static class Distance extends ParticleSorter {
    private int currentSize = 0;
    
    private float[] distances;
    
    private int[] particleIndices;
    
    private int[] particleOffsets;
    
    public void ensureCapacity(int param1Int) {
      if (this.currentSize < param1Int) {
        this.distances = new float[param1Int];
        this.particleIndices = new int[param1Int];
        this.particleOffsets = new int[param1Int];
        this.currentSize = param1Int;
      } 
    }
    
    public void qsort(int param1Int1, int param1Int2) {
      if (param1Int1 < param1Int2) {
        if (param1Int2 - param1Int1 <= 8) {
          for (int m = param1Int1; m <= param1Int2; m++) {
            int n = m;
            while (n > param1Int1) {
              float[] arrayOfFloat1 = this.distances;
              int i1 = n - 1;
              if (arrayOfFloat1[i1] > arrayOfFloat1[n]) {
                float f1 = arrayOfFloat1[n];
                arrayOfFloat1[n] = arrayOfFloat1[i1];
                arrayOfFloat1[i1] = f1;
                int[] arrayOfInt1 = this.particleIndices;
                int i2 = arrayOfInt1[n];
                arrayOfInt1[n] = arrayOfInt1[i1];
                arrayOfInt1[i1] = i2;
                n--;
              } 
            } 
          } 
          return;
        } 
        float f = this.distances[param1Int1];
        int j = param1Int1 + 1;
        int k = this.particleIndices[param1Int1];
        int i;
        for (i = j; j <= param1Int2; i = m) {
          float[] arrayOfFloat1 = this.distances;
          int m = i;
          if (f > arrayOfFloat1[j]) {
            if (j > i) {
              float f1 = arrayOfFloat1[j];
              arrayOfFloat1[j] = arrayOfFloat1[i];
              arrayOfFloat1[i] = f1;
              int[] arrayOfInt1 = this.particleIndices;
              m = arrayOfInt1[j];
              arrayOfInt1[j] = arrayOfInt1[i];
              arrayOfInt1[i] = m;
            } 
            m = i + 1;
          } 
          j++;
        } 
        float[] arrayOfFloat = this.distances;
        j = i - 1;
        arrayOfFloat[param1Int1] = arrayOfFloat[j];
        arrayOfFloat[j] = f;
        int[] arrayOfInt = this.particleIndices;
        arrayOfInt[param1Int1] = arrayOfInt[j];
        arrayOfInt[j] = k;
        qsort(param1Int1, i - 2);
        qsort(i, param1Int2);
      } 
    }
    
    public <T extends ParticleControllerRenderData> int[] sort(Array<T> param1Array) {
      float[] arrayOfFloat = this.camera.view.val;
      float f1 = arrayOfFloat[2];
      float f2 = arrayOfFloat[6];
      float f3 = arrayOfFloat[10];
      Iterator iterator = param1Array.iterator();
      byte b1 = 0;
      int i = 0;
      byte b2 = 0;
      while (true) {
        int j = b2;
        if (iterator.hasNext()) {
          ParticleControllerRenderData particleControllerRenderData = (ParticleControllerRenderData)iterator.next();
          int k = particleControllerRenderData.controller.particles.size;
          int m = 0;
          b2 = j;
          while (b2 < k + j) {
            this.distances[b2] = particleControllerRenderData.positionChannel.data[m + false] * f1 + particleControllerRenderData.positionChannel.data[m + true] * f2 + particleControllerRenderData.positionChannel.data[m + 2] * f3;
            this.particleIndices[b2] = b2;
            b2++;
            m += particleControllerRenderData.positionChannel.strideSize;
          } 
          i += particleControllerRenderData.controller.particles.size;
          continue;
        } 
        break;
      } 
      qsort(0, i - 1);
      for (b2 = b1; b2 < i; b2++)
        this.particleOffsets[this.particleIndices[b2]] = b2; 
      return this.particleOffsets;
    }
  }
  
  public static class None extends ParticleSorter {
    int currentCapacity = 0;
    
    int[] indices;
    
    public void ensureCapacity(int param1Int) {
      if (this.currentCapacity < param1Int) {
        this.indices = new int[param1Int];
        for (byte b = 0; b < param1Int; b++)
          this.indices[b] = b; 
        this.currentCapacity = param1Int;
      } 
    }
    
    public <T extends ParticleControllerRenderData> int[] sort(Array<T> param1Array) { return this.indices; }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/particles/ParticleSorter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */