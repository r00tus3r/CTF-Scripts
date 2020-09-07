package com.badlogic.gdx.maps;

import com.badlogic.gdx.graphics.Color;

public class MapObject {
  private Color color = Color.WHITE.cpy();
  
  private String name = "";
  
  private float opacity = 1.0F;
  
  private MapProperties properties = new MapProperties();
  
  private boolean visible = true;
  
  public Color getColor() { return this.color; }
  
  public String getName() { return this.name; }
  
  public float getOpacity() { return this.opacity; }
  
  public MapProperties getProperties() { return this.properties; }
  
  public boolean isVisible() { return this.visible; }
  
  public void setColor(Color paramColor) { this.color = paramColor; }
  
  public void setName(String paramString) { this.name = paramString; }
  
  public void setOpacity(float paramFloat) { this.opacity = paramFloat; }
  
  public void setVisible(boolean paramBoolean) { this.visible = paramBoolean; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/maps/MapObject.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */