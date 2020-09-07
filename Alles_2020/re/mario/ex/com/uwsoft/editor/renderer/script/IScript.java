package com.uwsoft.editor.renderer.script;

import com.uwsoft.editor.renderer.actor.CompositeItem;

public interface IScript {
  void act(float paramFloat);
  
  void dispose();
  
  void init(CompositeItem paramCompositeItem);
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/uwsoft/editor/renderer/script/IScript.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */