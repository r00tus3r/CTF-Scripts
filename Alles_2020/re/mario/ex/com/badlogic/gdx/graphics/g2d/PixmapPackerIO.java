package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.PixmapIO;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.utils.ObjectMap;
import java.io.IOException;
import java.io.Writer;
import java.util.Iterator;

public class PixmapPackerIO {
  public void save(FileHandle paramFileHandle, PixmapPacker paramPixmapPacker) throws IOException { save(paramFileHandle, paramPixmapPacker, new SaveParameters()); }
  
  public void save(FileHandle paramFileHandle, PixmapPacker paramPixmapPacker, SaveParameters paramSaveParameters) throws IOException {
    Writer writer = paramFileHandle.writer(false);
    Iterator iterator = paramPixmapPacker.pages.iterator();
    int i = 0;
    while (iterator.hasNext()) {
      PixmapPacker.Page page = (PixmapPacker.Page)iterator.next();
      if (page.rects.size > 0) {
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append(paramFileHandle.nameWithoutExtension());
        stringBuilder2.append("_");
        int j = i + true;
        stringBuilder2.append(j);
        stringBuilder2.append(paramSaveParameters.format.getExtension());
        FileHandle fileHandle = paramFileHandle.sibling(stringBuilder2.toString());
        i = null.$SwitchMap$com$badlogic$gdx$graphics$g2d$PixmapPackerIO$ImageFormat[paramSaveParameters.format.ordinal()];
        if (i != 1) {
          if (i == 2)
            PixmapIO.writePNG(fileHandle, page.image); 
        } else {
          PixmapIO.writeCIM(fileHandle, page.image);
        } 
        writer.write("\n");
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append(fileHandle.name());
        stringBuilder3.append("\n");
        writer.write(stringBuilder3.toString());
        StringBuilder stringBuilder1 = new StringBuilder();
        stringBuilder1.append("size: ");
        stringBuilder1.append(page.image.getWidth());
        stringBuilder1.append(",");
        stringBuilder1.append(page.image.getHeight());
        stringBuilder1.append("\n");
        writer.write(stringBuilder1.toString());
        stringBuilder1 = new StringBuilder();
        stringBuilder1.append("format: ");
        stringBuilder1.append(paramPixmapPacker.pageFormat.name());
        stringBuilder1.append("\n");
        writer.write(stringBuilder1.toString());
        stringBuilder1 = new StringBuilder();
        stringBuilder1.append("filter: ");
        stringBuilder1.append(paramSaveParameters.minFilter.name());
        stringBuilder1.append(",");
        stringBuilder1.append(paramSaveParameters.magFilter.name());
        stringBuilder1.append("\n");
        writer.write(stringBuilder1.toString());
        writer.write("repeat: none\n");
        ObjectMap.Keys keys = page.rects.keys().iterator();
        while (true) {
          i = j;
          stringBuilder3 = new StringBuilder();
          stringBuilder3.append("  orig: ");
          stringBuilder3.append(stringBuilder1.originalWidth);
          stringBuilder3.append(", ");
          stringBuilder3.append(stringBuilder1.originalHeight);
          stringBuilder3.append("\n");
          writer.write(stringBuilder3.toString());
          stringBuilder3 = new StringBuilder();
          stringBuilder3.append("  offset: ");
          stringBuilder3.append(stringBuilder1.offsetX);
          stringBuilder3.append(", ");
          stringBuilder3.append((int)(stringBuilder1.originalHeight - stringBuilder1.height - stringBuilder1.offsetY));
          stringBuilder3.append("\n");
          writer.write(stringBuilder3.toString());
          stringBuilder1 = new StringBuilder();
          stringBuilder1.append("  index: ");
          stringBuilder1.append(i);
          stringBuilder1.append("\n");
          writer.write(stringBuilder1.toString());
        } 
      } 
    } 
    writer.close();
  }
  
  public enum ImageFormat {
    CIM(".cim"),
    PNG(".png");
    
    private final String extension;
    
    static  {
      $VALUES = new ImageFormat[] { CIM, PNG };
    }
    
    ImageFormat(String param1String1) { this.extension = param1String1; }
    
    public String getExtension() { return this.extension; }
  }
  
  public static class SaveParameters {
    public PixmapPackerIO.ImageFormat format = PixmapPackerIO.ImageFormat.PNG;
    
    public Texture.TextureFilter magFilter = Texture.TextureFilter.Nearest;
    
    public Texture.TextureFilter minFilter = Texture.TextureFilter.Nearest;
    
    public boolean useIndexes;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/PixmapPackerIO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */