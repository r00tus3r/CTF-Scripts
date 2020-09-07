package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.ObjectSet;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Comparator;

public class TextureAtlas implements Disposable {
  static final Comparator<TextureAtlasData.Region> indexComparator;
  
  static final String[] tuple = new String[4];
  
  private final Array<AtlasRegion> regions = new Array();
  
  private final ObjectSet<Texture> textures = new ObjectSet(4);
  
  static  {
    indexComparator = new Comparator<TextureAtlasData.Region>() {
        public int compare(TextureAtlas.TextureAtlasData.Region param1Region1, TextureAtlas.TextureAtlasData.Region param1Region2) {
          int i = param1Region1.index;
          int j = i;
          if (i == -1)
            j = Integer.MAX_VALUE; 
          int k = param1Region2.index;
          i = k;
          if (k == -1)
            i = Integer.MAX_VALUE; 
          return j - i;
        }
      };
  }
  
  public TextureAtlas() {}
  
  public TextureAtlas(FileHandle paramFileHandle) { this(paramFileHandle, paramFileHandle.parent()); }
  
  public TextureAtlas(FileHandle paramFileHandle1, FileHandle paramFileHandle2) { this(paramFileHandle1, paramFileHandle2, false); }
  
  public TextureAtlas(FileHandle paramFileHandle1, FileHandle paramFileHandle2, boolean paramBoolean) { this(new TextureAtlasData(paramFileHandle1, paramFileHandle2, paramBoolean)); }
  
  public TextureAtlas(FileHandle paramFileHandle, boolean paramBoolean) { this(paramFileHandle, paramFileHandle.parent(), paramBoolean); }
  
  public TextureAtlas(TextureAtlasData paramTextureAtlasData) {
    if (paramTextureAtlasData != null)
      load(paramTextureAtlasData); 
  }
  
  public TextureAtlas(String paramString) { this(Gdx.files.internal(paramString)); }
  
  private void load(TextureAtlasData paramTextureAtlasData) {
    ObjectMap objectMap = new ObjectMap();
    for (TextureAtlasData.Page page : paramTextureAtlasData.pages) {
      Texture texture;
      if (page.texture == null) {
        texture = new Texture(page.textureFile, page.format, page.useMipMaps);
        texture.setFilter(page.minFilter, page.magFilter);
        texture.setWrap(page.uWrap, page.vWrap);
      } else {
        texture = page.texture;
        texture.setFilter(page.minFilter, page.magFilter);
        texture.setWrap(page.uWrap, page.vWrap);
      } 
      this.textures.add(texture);
      objectMap.put(page, texture);
    } 
    for (TextureAtlasData.Region region : paramTextureAtlasData.regions) {
      int n;
      int i = region.width;
      int j = region.height;
      Texture texture = (Texture)objectMap.get(region.page);
      int k = region.left;
      int m = region.top;
      if (region.rotate) {
        n = j;
      } else {
        n = i;
      } 
      if (!region.rotate)
        i = j; 
      AtlasRegion atlasRegion = new AtlasRegion(texture, k, m, n, i);
      atlasRegion.index = region.index;
      atlasRegion.name = region.name;
      atlasRegion.offsetX = region.offsetX;
      atlasRegion.offsetY = region.offsetY;
      atlasRegion.originalHeight = region.originalHeight;
      atlasRegion.originalWidth = region.originalWidth;
      atlasRegion.rotate = region.rotate;
      atlasRegion.degrees = region.degrees;
      atlasRegion.splits = region.splits;
      atlasRegion.pads = region.pads;
      if (region.flip)
        atlasRegion.flip(false, true); 
      this.regions.add(atlasRegion);
    } 
  }
  
  private Sprite newSprite(AtlasRegion paramAtlasRegion) {
    if (paramAtlasRegion.packedWidth == paramAtlasRegion.originalWidth && paramAtlasRegion.packedHeight == paramAtlasRegion.originalHeight) {
      if (paramAtlasRegion.rotate) {
        Sprite sprite = new Sprite(paramAtlasRegion);
        sprite.setBounds(0.0F, 0.0F, paramAtlasRegion.getRegionHeight(), paramAtlasRegion.getRegionWidth());
        sprite.rotate90(true);
        return sprite;
      } 
      return new Sprite(paramAtlasRegion);
    } 
    return new AtlasSprite(paramAtlasRegion);
  }
  
  static int readTuple(BufferedReader paramBufferedReader) throws IOException {
    String str = paramBufferedReader.readLine();
    int i = str.indexOf(':');
    if (i != -1) {
      int j = i + 1;
      for (i = 0; i < 3; i++) {
        int k = str.indexOf(',', j);
        if (k == -1)
          break; 
        tuple[i] = str.substring(j, k).trim();
        j = k + 1;
      } 
      tuple[i] = str.substring(j).trim();
      return i + 1;
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Invalid line: ");
    stringBuilder.append(str);
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException(stringBuilder.toString());
    throw gdxRuntimeException;
  }
  
  static String readValue(BufferedReader paramBufferedReader) throws IOException {
    String str = paramBufferedReader.readLine();
    int i = str.indexOf(':');
    if (i != -1)
      return str.substring(i + 1).trim(); 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Invalid line: ");
    stringBuilder.append(str);
    throw new GdxRuntimeException(stringBuilder.toString());
  }
  
  public AtlasRegion addRegion(String paramString, Texture paramTexture, int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    this.textures.add(paramTexture);
    AtlasRegion atlasRegion = new AtlasRegion(paramTexture, paramInt1, paramInt2, paramInt3, paramInt4);
    atlasRegion.name = paramString;
    atlasRegion.index = -1;
    this.regions.add(atlasRegion);
    return atlasRegion;
  }
  
  public AtlasRegion addRegion(String paramString, TextureRegion paramTextureRegion) {
    this.textures.add(paramTextureRegion.texture);
    paramTextureRegion = new AtlasRegion(paramTextureRegion);
    paramTextureRegion.name = paramString;
    paramTextureRegion.index = -1;
    this.regions.add(paramTextureRegion);
    return paramTextureRegion;
  }
  
  public NinePatch createPatch(String paramString) {
    int i = this.regions.size;
    for (byte b = 0; b < i; b++) {
      AtlasRegion atlasRegion = (AtlasRegion)this.regions.get(b);
      if (atlasRegion.name.equals(paramString)) {
        NinePatch ninePatch;
        int[] arrayOfInt = atlasRegion.splits;
        if (arrayOfInt != null) {
          ninePatch = new NinePatch(atlasRegion, arrayOfInt[0], arrayOfInt[1], arrayOfInt[2], arrayOfInt[3]);
          if (atlasRegion.pads != null)
            ninePatch.setPadding(atlasRegion.pads[0], atlasRegion.pads[1], atlasRegion.pads[2], atlasRegion.pads[3]); 
          return ninePatch;
        } 
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Region does not have ninepatch splits: ");
        stringBuilder.append(ninePatch);
        throw new IllegalArgumentException(stringBuilder.toString());
      } 
    } 
    return null;
  }
  
  public Sprite createSprite(String paramString) {
    int i = this.regions.size;
    for (byte b = 0; b < i; b++) {
      if (((AtlasRegion)this.regions.get(b)).name.equals(paramString))
        return newSprite((AtlasRegion)this.regions.get(b)); 
    } 
    return null;
  }
  
  public Sprite createSprite(String paramString, int paramInt) {
    int i = this.regions.size;
    byte b = 0;
    while (b < i) {
      AtlasRegion atlasRegion = (AtlasRegion)this.regions.get(b);
      if (!atlasRegion.name.equals(paramString) || atlasRegion.index != paramInt) {
        b++;
        continue;
      } 
      return newSprite((AtlasRegion)this.regions.get(b));
    } 
    return null;
  }
  
  public Array<Sprite> createSprites() {
    Array array = new Array(true, this.regions.size, Sprite.class);
    int i = this.regions.size;
    for (byte b = 0; b < i; b++)
      array.add(newSprite((AtlasRegion)this.regions.get(b))); 
    return array;
  }
  
  public Array<Sprite> createSprites(String paramString) {
    Array array = new Array(Sprite.class);
    int i = this.regions.size;
    for (byte b = 0; b < i; b++) {
      AtlasRegion atlasRegion = (AtlasRegion)this.regions.get(b);
      if (atlasRegion.name.equals(paramString))
        array.add(newSprite(atlasRegion)); 
    } 
    return array;
  }
  
  public void dispose() {
    ObjectSet.ObjectSetIterator objectSetIterator = this.textures.iterator();
    while (objectSetIterator.hasNext())
      ((Texture)objectSetIterator.next()).dispose(); 
    this.textures.clear(0);
  }
  
  public AtlasRegion findRegion(String paramString) {
    int i = this.regions.size;
    for (byte b = 0; b < i; b++) {
      if (((AtlasRegion)this.regions.get(b)).name.equals(paramString))
        return (AtlasRegion)this.regions.get(b); 
    } 
    return null;
  }
  
  public AtlasRegion findRegion(String paramString, int paramInt) {
    int i = this.regions.size;
    byte b = 0;
    while (b < i) {
      AtlasRegion atlasRegion = (AtlasRegion)this.regions.get(b);
      if (!atlasRegion.name.equals(paramString) || atlasRegion.index != paramInt) {
        b++;
        continue;
      } 
      return atlasRegion;
    } 
    return null;
  }
  
  public Array<AtlasRegion> findRegions(String paramString) {
    Array array = new Array(AtlasRegion.class);
    int i = this.regions.size;
    for (byte b = 0; b < i; b++) {
      AtlasRegion atlasRegion = (AtlasRegion)this.regions.get(b);
      if (atlasRegion.name.equals(paramString))
        array.add(new AtlasRegion(atlasRegion)); 
    } 
    return array;
  }
  
  public Array<AtlasRegion> getRegions() { return this.regions; }
  
  public ObjectSet<Texture> getTextures() { return this.textures; }
  
  public static class AtlasRegion extends TextureRegion {
    public int degrees;
    
    public int index;
    
    public String name;
    
    public float offsetX;
    
    public float offsetY;
    
    public int originalHeight;
    
    public int originalWidth;
    
    public int packedHeight;
    
    public int packedWidth;
    
    public int[] pads;
    
    public boolean rotate;
    
    public int[] splits;
    
    public AtlasRegion(Texture param1Texture, int param1Int1, int param1Int2, int param1Int3, int param1Int4) {
      super(param1Texture, param1Int1, param1Int2, param1Int3, param1Int4);
      this.originalWidth = param1Int3;
      this.originalHeight = param1Int4;
      this.packedWidth = param1Int3;
      this.packedHeight = param1Int4;
    }
    
    public AtlasRegion(AtlasRegion param1AtlasRegion) {
      setRegion(param1AtlasRegion);
      this.index = param1AtlasRegion.index;
      this.name = param1AtlasRegion.name;
      this.offsetX = param1AtlasRegion.offsetX;
      this.offsetY = param1AtlasRegion.offsetY;
      this.packedWidth = param1AtlasRegion.packedWidth;
      this.packedHeight = param1AtlasRegion.packedHeight;
      this.originalWidth = param1AtlasRegion.originalWidth;
      this.originalHeight = param1AtlasRegion.originalHeight;
      this.rotate = param1AtlasRegion.rotate;
      this.degrees = param1AtlasRegion.degrees;
      this.splits = param1AtlasRegion.splits;
    }
    
    public AtlasRegion(TextureRegion param1TextureRegion) {
      setRegion(param1TextureRegion);
      this.packedWidth = param1TextureRegion.getRegionWidth();
      this.packedHeight = param1TextureRegion.getRegionHeight();
      this.originalWidth = this.packedWidth;
      this.originalHeight = this.packedHeight;
    }
    
    public void flip(boolean param1Boolean1, boolean param1Boolean2) {
      super.flip(param1Boolean1, param1Boolean2);
      if (param1Boolean1)
        this.offsetX = this.originalWidth - this.offsetX - getRotatedPackedWidth(); 
      if (param1Boolean2)
        this.offsetY = this.originalHeight - this.offsetY - getRotatedPackedHeight(); 
    }
    
    public float getRotatedPackedHeight() {
      int i;
      if (this.rotate) {
        i = this.packedWidth;
      } else {
        i = this.packedHeight;
      } 
      return i;
    }
    
    public float getRotatedPackedWidth() {
      int i;
      if (this.rotate) {
        i = this.packedHeight;
      } else {
        i = this.packedWidth;
      } 
      return i;
    }
    
    public String toString() { return this.name; }
  }
  
  public static class AtlasSprite extends Sprite {
    float originalOffsetX;
    
    float originalOffsetY;
    
    final TextureAtlas.AtlasRegion region;
    
    public AtlasSprite(TextureAtlas.AtlasRegion param1AtlasRegion) {
      this.region = new TextureAtlas.AtlasRegion(param1AtlasRegion);
      this.originalOffsetX = param1AtlasRegion.offsetX;
      this.originalOffsetY = param1AtlasRegion.offsetY;
      setRegion(param1AtlasRegion);
      setOrigin(param1AtlasRegion.originalWidth / 2.0F, param1AtlasRegion.originalHeight / 2.0F);
      int i = param1AtlasRegion.getRegionWidth();
      int j = param1AtlasRegion.getRegionHeight();
      if (param1AtlasRegion.rotate) {
        super.rotate90(true);
        super.setBounds(param1AtlasRegion.offsetX, param1AtlasRegion.offsetY, j, i);
      } else {
        super.setBounds(param1AtlasRegion.offsetX, param1AtlasRegion.offsetY, i, j);
      } 
      setColor(1.0F, 1.0F, 1.0F, 1.0F);
    }
    
    public AtlasSprite(AtlasSprite param1AtlasSprite) {
      this.region = param1AtlasSprite.region;
      this.originalOffsetX = param1AtlasSprite.originalOffsetX;
      this.originalOffsetY = param1AtlasSprite.originalOffsetY;
      set(param1AtlasSprite);
    }
    
    public void flip(boolean param1Boolean1, boolean param1Boolean2) {
      if (this.region.rotate) {
        super.flip(param1Boolean2, param1Boolean1);
      } else {
        super.flip(param1Boolean1, param1Boolean2);
      } 
      float f1 = getOriginX();
      float f2 = getOriginY();
      float f3 = this.region.offsetX;
      float f4 = this.region.offsetY;
      float f5 = getWidthRatio();
      float f6 = getHeightRatio();
      TextureAtlas.AtlasRegion atlasRegion = this.region;
      atlasRegion.offsetX = this.originalOffsetX;
      atlasRegion.offsetY = this.originalOffsetY;
      atlasRegion.flip(param1Boolean1, param1Boolean2);
      this.originalOffsetX = this.region.offsetX;
      this.originalOffsetY = this.region.offsetY;
      atlasRegion = this.region;
      atlasRegion.offsetX *= f5;
      atlasRegion = this.region;
      atlasRegion.offsetY *= f6;
      translate(this.region.offsetX - f3, this.region.offsetY - f4);
      setOrigin(f1, f2);
    }
    
    public TextureAtlas.AtlasRegion getAtlasRegion() { return this.region; }
    
    public float getHeight() { return super.getHeight() / this.region.getRotatedPackedHeight() * this.region.originalHeight; }
    
    public float getHeightRatio() { return super.getHeight() / this.region.getRotatedPackedHeight(); }
    
    public float getOriginX() { return super.getOriginX() + this.region.offsetX; }
    
    public float getOriginY() { return super.getOriginY() + this.region.offsetY; }
    
    public float getWidth() { return super.getWidth() / this.region.getRotatedPackedWidth() * this.region.originalWidth; }
    
    public float getWidthRatio() { return super.getWidth() / this.region.getRotatedPackedWidth(); }
    
    public float getX() { return super.getX() - this.region.offsetX; }
    
    public float getY() { return super.getY() - this.region.offsetY; }
    
    public void rotate90(boolean param1Boolean) {
      super.rotate90(param1Boolean);
      float f1 = getOriginX();
      float f2 = getOriginY();
      float f3 = this.region.offsetX;
      float f4 = this.region.offsetY;
      float f5 = getWidthRatio();
      float f6 = getHeightRatio();
      if (param1Boolean) {
        TextureAtlas.AtlasRegion atlasRegion = this.region;
        atlasRegion.offsetX = f4;
        atlasRegion.offsetY = atlasRegion.originalHeight * f6 - f3 - this.region.packedWidth * f5;
      } else {
        TextureAtlas.AtlasRegion atlasRegion = this.region;
        atlasRegion.offsetX = atlasRegion.originalWidth * f5 - f4 - this.region.packedHeight * f6;
        this.region.offsetY = f3;
      } 
      translate(this.region.offsetX - f3, this.region.offsetY - f4);
      setOrigin(f1, f2);
    }
    
    public void setBounds(float param1Float1, float param1Float2, float param1Float3, float param1Float4) {
      int j;
      int i;
      param1Float3 /= this.region.originalWidth;
      param1Float4 /= this.region.originalHeight;
      TextureAtlas.AtlasRegion atlasRegion = this.region;
      atlasRegion.offsetX = this.originalOffsetX * param1Float3;
      atlasRegion.offsetY = this.originalOffsetY * param1Float4;
      if (atlasRegion.rotate) {
        i = this.region.packedHeight;
      } else {
        i = this.region.packedWidth;
      } 
      if (this.region.rotate) {
        j = this.region.packedWidth;
      } else {
        j = this.region.packedHeight;
      } 
      super.setBounds(param1Float1 + this.region.offsetX, param1Float2 + this.region.offsetY, i * param1Float3, j * param1Float4);
    }
    
    public void setOrigin(float param1Float1, float param1Float2) { super.setOrigin(param1Float1 - this.region.offsetX, param1Float2 - this.region.offsetY); }
    
    public void setOriginCenter() { super.setOrigin(this.width / 2.0F - this.region.offsetX, this.height / 2.0F - this.region.offsetY); }
    
    public void setPosition(float param1Float1, float param1Float2) { super.setPosition(param1Float1 + this.region.offsetX, param1Float2 + this.region.offsetY); }
    
    public void setSize(float param1Float1, float param1Float2) { setBounds(getX(), getY(), param1Float1, param1Float2); }
    
    public void setX(float param1Float) { super.setX(param1Float + this.region.offsetX); }
    
    public void setY(float param1Float) { super.setY(param1Float + this.region.offsetY); }
    
    public String toString() { return this.region.toString(); }
  }
  
  public static class TextureAtlasData {
    final Array<Page> pages = new Array();
    
    final Array<Region> regions = new Array();
    
    public TextureAtlasData(FileHandle param1FileHandle1, FileHandle param1FileHandle2, boolean param1Boolean) {
      BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(param1FileHandle1.read()), 64);
      label62: while (true) {
        textureWrap = null;
        try {
          while (true) {
            boolean bool;
            int i;
            Page page;
            Texture.TextureWrap textureWrap1 = bufferedReader.readLine();
            if (textureWrap1 == null) {
              StreamUtils.closeQuietly(bufferedReader);
              this.regions.sort(TextureAtlas.indexComparator);
              return;
            } 
            if (textureWrap1.trim().length() == 0)
              continue label62; 
            if (textureWrap == null) {
              float f2;
              float f1;
              FileHandle fileHandle = param1FileHandle2.child(textureWrap1);
              if (TextureAtlas.readTuple(bufferedReader) == 2) {
                f1 = Integer.parseInt(TextureAtlas.tuple[0]);
                f2 = Integer.parseInt(TextureAtlas.tuple[1]);
                TextureAtlas.readTuple(bufferedReader);
              } else {
                f1 = 0.0F;
                f2 = 0.0F;
              } 
              Pixmap.Format format = Pixmap.Format.valueOf(TextureAtlas.tuple[0]);
              TextureAtlas.readTuple(bufferedReader);
              Texture.TextureFilter textureFilter1;
              Texture.TextureFilter textureFilter2 = (textureFilter1 = Texture.TextureFilter.valueOf(TextureAtlas.tuple[0])).valueOf(TextureAtlas.tuple[1]);
              String str1 = TextureAtlas.readValue(bufferedReader);
              textureWrap = Texture.TextureWrap.ClampToEdge;
              textureWrap1 = Texture.TextureWrap.ClampToEdge;
              if (str1.equals("x")) {
                textureWrap = Texture.TextureWrap.Repeat;
              } else if (str1.equals("y")) {
                textureWrap1 = Texture.TextureWrap.Repeat;
              } else if (str1.equals("xy")) {
                textureWrap = Texture.TextureWrap.Repeat;
                textureWrap1 = Texture.TextureWrap.Repeat;
              } 
              Page page1 = new Page();
              this(fileHandle, f1, f2, textureFilter1.isMipMap(), format, textureFilter1, textureFilter2, textureWrap, textureWrap1);
              this.pages.add(page1);
              page = page1;
              continue;
            } 
            String str = TextureAtlas.readValue(bufferedReader);
            if (str.equalsIgnoreCase("true")) {
              i = 90;
            } else if (str.equalsIgnoreCase("false")) {
              i = 0;
            } else {
              i = Integer.valueOf(str).intValue();
            } 
            TextureAtlas.readTuple(bufferedReader);
            int j = Integer.parseInt(TextureAtlas.tuple[0]);
            int k = Integer.parseInt(TextureAtlas.tuple[1]);
            TextureAtlas.readTuple(bufferedReader);
            int m = Integer.parseInt(TextureAtlas.tuple[0]);
            int n = Integer.parseInt(TextureAtlas.tuple[1]);
            Region region = new Region();
            this();
            region.page = page;
            region.left = j;
            region.top = k;
            region.width = m;
            region.height = n;
            region.name = textureWrap1;
            if (i == 90) {
              bool = true;
            } else {
              bool = false;
            } 
            region.rotate = bool;
            region.degrees = i;
            if (TextureAtlas.readTuple(bufferedReader) == 4) {
              region.splits = new int[] { Integer.parseInt(TextureAtlas.tuple[0]), Integer.parseInt(TextureAtlas.tuple[1]), Integer.parseInt(TextureAtlas.tuple[2]), Integer.parseInt(TextureAtlas.tuple[3]) };
              if (TextureAtlas.readTuple(bufferedReader) == 4) {
                region.pads = new int[] { Integer.parseInt(TextureAtlas.tuple[0]), Integer.parseInt(TextureAtlas.tuple[1]), Integer.parseInt(TextureAtlas.tuple[2]), Integer.parseInt(TextureAtlas.tuple[3]) };
                TextureAtlas.readTuple(bufferedReader);
              } 
            } 
            region.originalWidth = Integer.parseInt(TextureAtlas.tuple[0]);
            region.originalHeight = Integer.parseInt(TextureAtlas.tuple[1]);
            TextureAtlas.readTuple(bufferedReader);
            region.offsetX = Integer.parseInt(TextureAtlas.tuple[0]);
            region.offsetY = Integer.parseInt(TextureAtlas.tuple[1]);
            region.index = Integer.parseInt(TextureAtlas.readValue(bufferedReader));
            if (param1Boolean)
              region.flip = true; 
            this.regions.add(region);
          } 
          break;
        } catch (Exception textureWrap) {
          GdxRuntimeException gdxRuntimeException = new GdxRuntimeException();
          StringBuilder stringBuilder = new StringBuilder();
          this();
          stringBuilder.append("Error reading pack file: ");
          stringBuilder.append(param1FileHandle1);
          this(stringBuilder.toString(), textureWrap);
          throw gdxRuntimeException;
        } finally {}
        StreamUtils.closeQuietly(bufferedReader);
        throw param1FileHandle1;
      } 
    }
    
    public Array<Page> getPages() { return this.pages; }
    
    public Array<Region> getRegions() { return this.regions; }
    
    public static class Page {
      public final Pixmap.Format format;
      
      public final float height;
      
      public final Texture.TextureFilter magFilter;
      
      public final Texture.TextureFilter minFilter;
      
      public Texture texture;
      
      public final FileHandle textureFile;
      
      public final Texture.TextureWrap uWrap;
      
      public final boolean useMipMaps;
      
      public final Texture.TextureWrap vWrap;
      
      public final float width;
      
      public Page(FileHandle param2FileHandle, float param2Float1, float param2Float2, boolean param2Boolean, Pixmap.Format param2Format, Texture.TextureFilter param2TextureFilter1, Texture.TextureFilter param2TextureFilter2, Texture.TextureWrap param2TextureWrap1, Texture.TextureWrap param2TextureWrap2) {
        this.width = param2Float1;
        this.height = param2Float2;
        this.textureFile = param2FileHandle;
        this.useMipMaps = param2Boolean;
        this.format = param2Format;
        this.minFilter = param2TextureFilter1;
        this.magFilter = param2TextureFilter2;
        this.uWrap = param2TextureWrap1;
        this.vWrap = param2TextureWrap2;
      }
    }
    
    public static class Region {
      public int degrees;
      
      public boolean flip;
      
      public int height;
      
      public int index;
      
      public int left;
      
      public String name;
      
      public float offsetX;
      
      public float offsetY;
      
      public int originalHeight;
      
      public int originalWidth;
      
      public int[] pads;
      
      public TextureAtlas.TextureAtlasData.Page page;
      
      public boolean rotate;
      
      public int[] splits;
      
      public int top;
      
      public int width;
    }
  }
  
  public static class Page {
    public final Pixmap.Format format;
    
    public final float height;
    
    public final Texture.TextureFilter magFilter;
    
    public final Texture.TextureFilter minFilter;
    
    public Texture texture;
    
    public final FileHandle textureFile;
    
    public final Texture.TextureWrap uWrap;
    
    public final boolean useMipMaps;
    
    public final Texture.TextureWrap vWrap;
    
    public final float width;
    
    public Page(FileHandle param1FileHandle, float param1Float1, float param1Float2, boolean param1Boolean, Pixmap.Format param1Format, Texture.TextureFilter param1TextureFilter1, Texture.TextureFilter param1TextureFilter2, Texture.TextureWrap param1TextureWrap1, Texture.TextureWrap param1TextureWrap2) {
      this.width = param1Float1;
      this.height = param1Float2;
      this.textureFile = param1FileHandle;
      this.useMipMaps = param1Boolean;
      this.format = param1Format;
      this.minFilter = param1TextureFilter1;
      this.magFilter = param1TextureFilter2;
      this.uWrap = param1TextureWrap1;
      this.vWrap = param1TextureWrap2;
    }
  }
  
  public static class Region {
    public int degrees;
    
    public boolean flip;
    
    public int height;
    
    public int index;
    
    public int left;
    
    public String name;
    
    public float offsetX;
    
    public float offsetY;
    
    public int originalHeight;
    
    public int originalWidth;
    
    public int[] pads;
    
    public TextureAtlas.TextureAtlasData.Page page;
    
    public boolean rotate;
    
    public int[] splits;
    
    public int top;
    
    public int width;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/TextureAtlas.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */