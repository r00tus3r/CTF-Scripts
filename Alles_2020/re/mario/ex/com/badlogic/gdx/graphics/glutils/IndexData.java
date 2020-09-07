package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.utils.Disposable;
import java.nio.ShortBuffer;

public interface IndexData extends Disposable {
  void bind();
  
  void dispose();
  
  ShortBuffer getBuffer();
  
  int getNumIndices();
  
  int getNumMaxIndices();
  
  void invalidate();
  
  void setIndices(ShortBuffer paramShortBuffer);
  
  void setIndices(short[] paramArrayOfShort, int paramInt1, int paramInt2);
  
  void unbind();
  
  void updateIndices(int paramInt1, short[] paramArrayOfShort, int paramInt2, int paramInt3);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/IndexData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */