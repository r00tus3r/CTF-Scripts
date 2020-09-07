package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;

public abstract class Value {
  public static Value maxHeight;
  
  public static Value maxWidth;
  
  public static Value minHeight;
  
  public static Value minWidth;
  
  public static Value prefHeight;
  
  public static Value prefWidth;
  
  public static final Fixed zero = new Fixed(0.0F);
  
  static  {
    minWidth = new Value() {
        public float get(Actor param1Actor) {
          float f;
          if (param1Actor instanceof Layout)
            return ((Layout)param1Actor).getMinWidth(); 
          if (param1Actor == null) {
            f = 0.0F;
          } else {
            f = param1Actor.getWidth();
          } 
          return f;
        }
      };
    minHeight = new Value() {
        public float get(Actor param1Actor) {
          float f;
          if (param1Actor instanceof Layout)
            return ((Layout)param1Actor).getMinHeight(); 
          if (param1Actor == null) {
            f = 0.0F;
          } else {
            f = param1Actor.getHeight();
          } 
          return f;
        }
      };
    prefWidth = new Value() {
        public float get(Actor param1Actor) {
          float f;
          if (param1Actor instanceof Layout)
            return ((Layout)param1Actor).getPrefWidth(); 
          if (param1Actor == null) {
            f = 0.0F;
          } else {
            f = param1Actor.getWidth();
          } 
          return f;
        }
      };
    prefHeight = new Value() {
        public float get(Actor param1Actor) {
          float f;
          if (param1Actor instanceof Layout)
            return ((Layout)param1Actor).getPrefHeight(); 
          if (param1Actor == null) {
            f = 0.0F;
          } else {
            f = param1Actor.getHeight();
          } 
          return f;
        }
      };
    maxWidth = new Value() {
        public float get(Actor param1Actor) {
          float f;
          if (param1Actor instanceof Layout)
            return ((Layout)param1Actor).getMaxWidth(); 
          if (param1Actor == null) {
            f = 0.0F;
          } else {
            f = param1Actor.getWidth();
          } 
          return f;
        }
      };
    maxHeight = new Value() {
        public float get(Actor param1Actor) {
          float f;
          if (param1Actor instanceof Layout)
            return ((Layout)param1Actor).getMaxHeight(); 
          if (param1Actor == null) {
            f = 0.0F;
          } else {
            f = param1Actor.getHeight();
          } 
          return f;
        }
      };
  }
  
  public static Value percentHeight(final float percent) { return new Value() {
        public float get(Actor param1Actor) { return param1Actor.getHeight() * percent; }
      }; }
  
  public static Value percentHeight(final float percent, final Actor actor) {
    if (paramActor != null)
      return new Value() {
          public float get(Actor param1Actor) { return actor.getHeight() * percent; }
        }; 
    throw new IllegalArgumentException("actor cannot be null.");
  }
  
  public static Value percentWidth(final float percent) { return new Value() {
        public float get(Actor param1Actor) { return param1Actor.getWidth() * percent; }
      }; }
  
  public static Value percentWidth(final float percent, final Actor actor) {
    if (paramActor != null)
      return new Value() {
          public float get(Actor param1Actor) { return actor.getWidth() * percent; }
        }; 
    throw new IllegalArgumentException("actor cannot be null.");
  }
  
  public float get() { return get(null); }
  
  public abstract float get(Actor paramActor);
  
  public static class Fixed extends Value {
    static final Fixed[] cache = new Fixed[111];
    
    private final float value;
    
    public Fixed(float param1Float) { this.value = param1Float; }
    
    public static Fixed valueOf(float param1Float) {
      if (param1Float == 0.0F)
        return zero; 
      if (param1Float >= -10.0F && param1Float <= 100.0F) {
        int i = (int)param1Float;
        if (param1Float == i) {
          Fixed[] arrayOfFixed = cache;
          i += 10;
          Fixed fixed1 = arrayOfFixed[i];
          Fixed fixed2 = fixed1;
          if (fixed1 == null) {
            fixed2 = new Fixed(param1Float);
            arrayOfFixed[i] = fixed2;
          } 
          return fixed2;
        } 
      } 
      return new Fixed(param1Float);
    }
    
    public float get(Actor param1Actor) { return this.value; }
    
    public String toString() { return Float.toString(this.value); }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/Value.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */