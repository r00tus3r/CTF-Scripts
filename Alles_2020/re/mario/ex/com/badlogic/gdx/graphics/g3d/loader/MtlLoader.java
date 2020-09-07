package com.badlogic.gdx.graphics.g3d.loader;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g3d.model.data.ModelMaterial;
import com.badlogic.gdx.graphics.g3d.model.data.ModelTexture;
import com.badlogic.gdx.utils.Array;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

class MtlLoader {
  public Array<ModelMaterial> materials = new Array();
  
  public ModelMaterial getMaterial(String paramString) {
    for (ModelMaterial modelMaterial1 : this.materials) {
      if (modelMaterial1.id.equals(paramString))
        return modelMaterial1; 
    } 
    ModelMaterial modelMaterial = new ModelMaterial();
    modelMaterial.id = paramString;
    modelMaterial.diffuse = new Color(Color.WHITE);
    this.materials.add(modelMaterial);
    return modelMaterial;
  }
  
  public void load(FileHandle paramFileHandle) {
    Color color1 = Color.WHITE;
    Color color2 = Color.WHITE;
    if (paramFileHandle != null && paramFileHandle.exists()) {
      BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(paramFileHandle.read()), 'က');
      String str1 = null;
      float f1 = 1.0F;
      float f2 = 0.0F;
      String str2 = "default";
      try {
        String str;
        while (true) {
          String str3 = bufferedReader.readLine();
          if (str3 != null) {
            ModelMaterial modelMaterial1;
            String str4 = str3;
            if (str3.length() > 0) {
              str4 = str3;
              if (str3.charAt(0) == '\t')
                str4 = str3.substring(1).trim(); 
            } 
            Color color = str4.split("\\s+");
            if (color[0].length() == 0 || color[0].charAt(0) == '#')
              continue; 
            str3 = color[0].toLowerCase();
            if (str3.equals("newmtl")) {
              String str5;
              modelMaterial1 = new ModelMaterial();
              this();
              modelMaterial1.id = str2;
              Color color4 = new Color();
              this(color1);
              modelMaterial1.diffuse = color4;
              color1 = new Color();
              this(color2);
              modelMaterial1.specular = color1;
              modelMaterial1.opacity = f1;
              modelMaterial1.shininess = f2;
              if (str1 != null) {
                str5 = new ModelTexture();
                this();
                str5.usage = 2;
                String str6 = new String();
                this(str1);
                str5.fileName = str6;
                if (modelMaterial1.textures == null) {
                  Array array = new Array();
                  this(1);
                  modelMaterial1.textures = array;
                } 
                modelMaterial1.textures.add(str5);
              } 
              this.materials.add(modelMaterial1);
              if (color.length > 1) {
                str5 = color[1].replace('.', '_');
              } else {
                str5 = "default";
              } 
              color1 = Color.WHITE;
              color = Color.WHITE;
              f1 = 1.0F;
              f2 = 0.0F;
              str = str5;
              Color color3 = color;
              continue;
            } 
            if (modelMaterial1.equals("kd") || modelMaterial1.equals("ks")) {
              float f6;
              float f3 = Float.parseFloat(color[1]);
              float f4 = Float.parseFloat(color[2]);
              float f5 = Float.parseFloat(color[3]);
              if (color.length > 4) {
                f6 = Float.parseFloat(color[4]);
              } else {
                f6 = 1.0F;
              } 
              if (color[0].toLowerCase().equals("kd")) {
                color1 = new Color();
                this();
                color1.set(f3, f4, f5, f6);
                continue;
              } 
              color2 = new Color();
              this();
              color2.set(f3, f4, f5, f6);
              continue;
            } 
            if (modelMaterial1.equals("tr") || modelMaterial1.equals("d")) {
              f1 = Float.parseFloat(color[1]);
              continue;
            } 
            if (modelMaterial1.equals("ns")) {
              f2 = Float.parseFloat(color[1]);
              continue;
            } 
            if (modelMaterial1.equals("map_kd"))
              str1 = paramFileHandle.parent().child(color[1]).path(); 
            continue;
          } 
          break;
        } 
        bufferedReader.close();
        ModelMaterial modelMaterial = new ModelMaterial();
        modelMaterial.id = str;
        modelMaterial.diffuse = new Color(color1);
        modelMaterial.specular = new Color(color2);
        modelMaterial.opacity = f1;
        modelMaterial.shininess = f2;
        if (str1 != null) {
          ModelTexture modelTexture = new ModelTexture();
          modelTexture.usage = 2;
          modelTexture.fileName = new String(str1);
          if (modelMaterial.textures == null)
            modelMaterial.textures = new Array(true); 
          modelMaterial.textures.add(modelTexture);
        } 
        this.materials.add(modelMaterial);
      } catch (IOException paramFileHandle) {}
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/loader/MtlLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */