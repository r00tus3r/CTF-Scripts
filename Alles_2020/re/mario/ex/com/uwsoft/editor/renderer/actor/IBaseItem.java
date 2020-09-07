package com.uwsoft.editor.renderer.actor;

import com.badlogic.gdx.physics.box2d.Body;
import com.uwsoft.editor.renderer.data.MainItemVO;
import com.uwsoft.editor.renderer.utils.CustomVariables;

public interface IBaseItem {
  void applyResolution(float paramFloat1, float paramFloat2);
  
  void dispose();
  
  Body getBody();
  
  CustomVariables getCustomVariables();
  
  MainItemVO getDataVO();
  
  int getLayerIndex();
  
  CompositeItem getParentItem();
  
  boolean isComposite();
  
  boolean isLockedByLayer();
  
  void renew();
  
  void setBody(Body paramBody);
  
  void setLayerIndex(int paramInt);
  
  void setLockByLayer(boolean paramBoolean);
  
  void setParentItem(CompositeItem paramCompositeItem);
  
  void updateDataVO();
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/actor/IBaseItem.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */