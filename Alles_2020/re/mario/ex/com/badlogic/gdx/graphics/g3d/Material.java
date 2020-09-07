package com.badlogic.gdx.graphics.g3d;

import com.badlogic.gdx.utils.Array;
import java.util.Iterator;

public class Material extends Attributes {
  private static int counter;
  
  public String id;
  
  static  {
  
  }
  
  public Material() { this(stringBuilder.toString()); }
  
  public Material(Material paramMaterial) { this(paramMaterial.id, paramMaterial); }
  
  public Material(Array<Attribute> paramArray) {
    this();
    set(paramArray);
  }
  
  public Material(String paramString) { this.id = paramString; }
  
  public Material(String paramString, Material paramMaterial) {
    this(paramString);
    Iterator iterator = paramMaterial.iterator();
    while (iterator.hasNext())
      set(((Attribute)iterator.next()).copy()); 
  }
  
  public Material(String paramString, Array<Attribute> paramArray) {
    this(paramString);
    set(paramArray);
  }
  
  public Material(String paramString, Attribute... paramVarArgs) {
    this(paramString);
    set(paramVarArgs);
  }
  
  public Material(Attribute... paramVarArgs) {
    this();
    set(paramVarArgs);
  }
  
  public Material copy() { return new Material(this); }
  
  public boolean equals(Object paramObject) {
    boolean bool;
    if (paramObject instanceof Material && (paramObject == this || (((Material)paramObject).id.equals(this.id) && super.equals(paramObject)))) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public int hashCode() { return super.hashCode() + this.id.hashCode() * 3; }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/Material.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */