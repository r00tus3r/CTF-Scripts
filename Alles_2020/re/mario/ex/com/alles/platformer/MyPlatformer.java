package com.alles.platformer;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.ApplicationAdapter;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.Animation;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.maps.tiled.TmxMapLoader;
import com.badlogic.gdx.maps.tiled.renderers.OrthogonalTiledMapRenderer;
import com.badlogic.gdx.math.Frustum;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.ui.Label;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Base64Coder;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.viewport.ScreenViewport;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Iterator;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class MyPlatformer extends ApplicationAdapter {
  private static final float GRAVITY = -1.5F;
  
  public static Batch absoluteBatch;
  
  private OrthographicCamera camera;
  
  Controller controller;
  
  private Animation<TextureRegion> croutch;
  
  private Animation<TextureRegion> croutchStand;
  
  private boolean debug = false;
  
  private Label debugLabel;
  
  private ShapeRenderer debugRenderer;
  
  private Stage debugStage;
  
  BitmapFont font;
  
  private Animation<TextureRegion> jump;
  
  private Koala koala;
  
  private Texture koalaTexture;
  
  private TiledMap map;
  
  private HashMap<Integer, Integer> questionMarkTileMapping;
  
  private Pool<Rectangle> rectPool = new Pool<Rectangle>() {
      protected Rectangle newObject() { return new Rectangle(); }
    };
  
  private OrthogonalTiledMapRenderer renderer;
  
  private Animation<TextureRegion> stand;
  
  private Array<Rectangle> tiles = new Array();
  
  private Animation<TextureRegion> walk;
  
  public static String bytesToHex(byte[] paramArrayOfByte) {
    StringBuffer stringBuffer = new StringBuffer();
    int i = paramArrayOfByte.length;
    for (byte b = 0; b < i; b++)
      stringBuffer.append(Integer.toString((paramArrayOfByte[b] & 0xFF) + 256, 16).substring(1)); 
    return stringBuffer.toString();
  }
  
  private void checkFlag() {
    byte[] arrayOfByte = new byte[11];
    arrayOfByte[0] = 0;
    arrayOfByte[1] = 0;
    arrayOfByte[2] = 0;
    arrayOfByte[3] = 0;
    arrayOfByte[4] = 0;
    arrayOfByte[5] = 0;
    arrayOfByte[6] = 0;
    arrayOfByte[7] = 0;
    arrayOfByte[8] = 0;
    arrayOfByte[9] = 0;
    arrayOfByte[10] = 0;
    arrayOfByte;
    TiledMapTileLayer tiledMapTileLayer = (TiledMapTileLayer)this.map.getLayers().get("questionmarks");
    byte b = 0;
    int i = 0;
    while (b < 100) {
      byte b1 = 0;
      while (b1 < 100) {
        noSuchAlgorithmException = tiledMapTileLayer.getCell(b, b1);
        int j = i;
        if (noSuchAlgorithmException != null)
          if (!noSuchAlgorithmException.getTile().getProperties().containsKey("questionmarkType")) {
            j = i;
          } else {
            j = ((Integer)noSuchAlgorithmException.getTile().getProperties().get("questionmarkType")).intValue();
            if (j == 1337) {
              j = i;
            } else {
              arrayOfByte[i] = (byte)(byte)j;
              j = i + 1;
            } 
          }  
        b1++;
        i = j;
      } 
      b++;
    } 
    try {
      noSuchAlgorithmException = MessageDigest.getInstance("SHA-256");
    } catch (NoSuchAlgorithmException noSuchAlgorithmException) {
      noSuchAlgorithmException.printStackTrace();
      noSuchAlgorithmException = null;
    } 
    noSuchAlgorithmException.update(arrayOfByte);
    noSuchAlgorithmException.update("P4ssw0rdS4lt".getBytes());
    if (toHex(noSuchAlgorithmException.digest()).equals("024800ace2ec394e6af68baa46e81dfbea93f0f6730610560c66ee9748d91420"))
      try {
        noSuchAlgorithmException.update(arrayOfByte);
        noSuchAlgorithmException.update("P4ssw0rdS4lt".getBytes());
        noSuchAlgorithmException.update(arrayOfByte);
        byte[] arrayOfByte1 = noSuchAlgorithmException.digest();
        byte[] arrayOfByte2 = Base64Coder.decode(Gdx.files.internal("flag_enc").readString());
        SecretKeySpec secretKeySpec = new SecretKeySpec();
        this(arrayOfByte1, 0, arrayOfByte1.length, "RC4");
        Cipher cipher = Cipher.getInstance("RC4");
        cipher.init(2, secretKeySpec, cipher.getParameters());
        arrayOfByte2 = cipher.doFinal(arrayOfByte2);
        String str = new String();
        this(arrayOfByte2);
        FileHandle fileHandle = Gdx.files.local("map_flag.tmx");
        fileHandle.writeString(str, false);
        Gdx.files.local("tileSet.png").writeBytes(Base64Coder.decode("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T5/+BQOY8/xvJtwPAAADAFBMVEUAAAAZGRkXPDQoJygnOzw6OjoNUisGWzUaSDcVWjUDbjgpSD0qUj44RD4kZzwOcUUZf2QsTEAsVkA0S0M1WEc+WlAtZ0EvcUI5Yks+YVAweEMyfFpBOz5SHmlVIm1oN3VIR0dIWElBW1NWWEtYV1lcWmFDZktHaFhSYE9ZZVROb2BSbGJZd2lmV01qXFVxXFdiXWBsYlloc119Y0t1ZFh6eVRqaWlqdWdlfXR8bGF0aXF6cmd6eXk5NokFV70MZb4pU50rW6EpY543dKQHUsERaMQlb8tHSY9JeqwSjDIjkjwmoz4BkkUTgmEFpEsnjEEmlEAyh0Q0mEYggWYnqEUns0o2p0c5t0o9slE7xUs91E1KlFdJsFB9ik5phHd8hG1win5itV5otWRLwlBiyl1owWF5yGx4xnJ712p94Ws9gKZNg69ujYB1jIJ8k4hpk7xxmsGKNBqmLBi9OyOVTR6cVCGxVRirVii1fxi2cjaIakyCaFuFdV+UbUWXcEaXd1iAbmGHdWiIfHWRfW6VfHOkdkSifHnCPiPDWSDLbzmOfICKniqOri25ihS4tROnuzqFl1SKgm2NgnmMl26Xg2yXhXWUmGSWl3aNsU2Oo3GHsW2NuXKSo2eQrHOesn2pgVi7hUq1iVimh2eii3ulkn20jGG4mHepq3ukvGWtvXC0vHuVyjK5zhSoyTiSxEiKyHGD126H2XGU13eF5XGa5Hq3zUKvxG+i8H7HmRvViTLapCT9lRHskSfspy7IjEjDjVLMkk/Xk0XYnVnRnXHap2vgnVDtolHgpmHF0xrc0STY5CLi7CbF3EfP40yFhISGk4qInJOWiYObkomXl5eMoZeTp52mjYaoj5WploOmm5OzjYixnIe1mJmllaKvo4qqopq2o4y7qJK7uYWnpqa0q6Wyq7G7squ2tra3wben74GT//+t///CrJXEvY7HspnUoYXVsojQs5zMq6XJrbDOvKbGvbLRvaXEvcTSwarayLHhx6vszbHMyszO///8/f0AAADTgYy9AAABAHRSTlP///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8AU/cHJQAAAAlwSFlzAAALEwAACxMBAJqcGAAAIjhJREFUeF7tfQ10G9d55cah1wwHscoJC8nYTWrXUriuSdBIp7RhoXtsq9latuIYOAoQqqzqxD2p1zq0o1qJSivrYEg6qRTXzmo5Frdpmkqg+7O05KS2kzBglKRNUydrQ6IgZcFFfAQsKDNdY7FhQkNQlhb3fu89ADPgAATIgS0KvBLxBvMD8bvvvu/nzcPoXy00ONYIEG3DYo0A0TYs1ggQbcNijQDRNizWCBBtw+JyIWB6alps1YjLgoCzqrJPUYLqlHhfCy4DAjRFUdyqqqIJamJf9bCMgJMd7e0dp8WbtxCaW1G0eCKdTsQ1cKCeFfurhUUEdMg2SZJlm22n2PEW4WwQ5qez2WwmM4uXWFAJTopDVcIaAmyyJEmgQLLJ14hdbwkmVcUdz85m8shmMB5qGwaWEADT13t9Pp8XPMgbFnbeckYcqDPUoKKmc8J4jmzMXRsDVhDQLsn+HTt6gIBPZgNBfktGQhD2o9ONyCWDSi3RwAoCJJvf7/DBfKLALtkI4lA9YWo/NJBWFXFGNbCAgA7J4ZWaJK93vcMPBmxNcAX1d4avkf3pxfaDAWhAnFQFVkzAznZonkyGCwQLgR6/12uT5DZxuF6Yhv3BUvvneJNNu1Vx2tJYIQEdNpnGvI1+AEkKBAI9O3zwheKEesHE/rlcNjvHOMgmlFPivCWxMgI2cLsLkOwYA6AAjkCcUScEkfMkjfaT9XN4oe1crOpBsCICTouOL0Cy+wLEgKPOBLyG/CdmjH9zOdhPFOSIgmyoWgZWREC7sFsHREREA3trfQlA0qsW0x8G6n8OJoLZakOB1QTADYABu9QuTqkP3O5FAigSwBjIZtTqHOGKCOiDuSzo6SE5evy2VnFGnaDCAwrLBYTtHIyBhFJVVbAiAm5ulb1eh83IgCT3OJqkuuYB00FFM44AvQCA7FwaSXFVGeFKCJCbbIh5O/LJ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"), false);
        TmxMapLoader tmxMapLoader = new TmxMapLoader();
        LocalFileResolver localFileResolver = new LocalFileResolver();
        this();
        this(localFileResolver);
        tmxMapLoader.getDependencies("", fileHandle, null);
        AssetManager assetManager = new AssetManager();
        localFileResolver = new LocalFileResolver();
        this();
        this(localFileResolver);
        assetManager.load("tileSet.png", Texture.class);
        assetManager.finishLoading();
        tmxMapLoader.loadAsync(assetManager, "map_flag.tmx", fileHandle, null);
        this.map.dispose();
        this.map = tmxMapLoader.loadSync(null, null, null, null);
        OrthogonalTiledMapRenderer orthogonalTiledMapRenderer = new OrthogonalTiledMapRenderer();
        this(this.map, 0.0625F);
        this.renderer = orthogonalTiledMapRenderer;
      } catch (Exception noSuchAlgorithmException) {
        noSuchAlgorithmException.printStackTrace();
      }  
  }
  
  private void getQuestionmarkTiles(int paramInt1, int paramInt2, int paramInt3, int paramInt4, Array<Rectangle> paramArray) {
    TiledMapTileLayer tiledMapTileLayer = (TiledMapTileLayer)this.map.getLayers().get("questionmarks");
    this.rectPool.freeAll(paramArray);
    paramArray.clear();
    while (paramInt2 <= paramInt4) {
      for (int i = paramInt1; i <= paramInt3; i++) {
        if (tiledMapTileLayer.getCell(i, paramInt2) != null) {
          Rectangle rectangle = (Rectangle)this.rectPool.obtain();
          rectangle.set(i, paramInt2, 1.0F, 1.0F);
          paramArray.add(rectangle);
        } 
      } 
      paramInt2++;
    } 
  }
  
  private void getTiles(int paramInt1, int paramInt2, int paramInt3, int paramInt4, Array<Rectangle> paramArray) {
    TiledMapTileLayer tiledMapTileLayer1 = (TiledMapTileLayer)this.map.getLayers().get("walls");
    TiledMapTileLayer tiledMapTileLayer2 = (TiledMapTileLayer)this.map.getLayers().get("questionmarks");
    this.rectPool.freeAll(paramArray);
    paramArray.clear();
    while (paramInt2 <= paramInt4) {
      for (int i = paramInt1; i <= paramInt3; i++) {
        if (tiledMapTileLayer1.getCell(i, paramInt2) != null) {
          Rectangle rectangle = (Rectangle)this.rectPool.obtain();
          rectangle.set(i, paramInt2, 1.0F, 1.0F);
          paramArray.add(rectangle);
        } 
        if (tiledMapTileLayer2.getCell(i, paramInt2) != null) {
          Rectangle rectangle = (Rectangle)this.rectPool.obtain();
          rectangle.set(i, paramInt2, 1.0F, 1.0F);
          paramArray.add(rectangle);
        } 
      } 
      paramInt2++;
    } 
  }
  
  private boolean isTouched(float paramFloat1, float paramFloat2) {
    for (byte b = 0; b < 2; b++) {
      float f = Gdx.input.getX(b) / Gdx.graphics.getWidth();
      if (Gdx.input.isTouched(b) && f >= paramFloat1 && f <= paramFloat2)
        return true; 
    } 
    return false;
  }
  
  private void renderDebug() {
    this.debugRenderer.setProjectionMatrix(this.camera.combined);
    this.debugRenderer.begin(ShapeRenderer.ShapeType.Line);
    this.debugRenderer.setColor(Color.RED);
    this.debugRenderer.rect(this.koala.position.x + 0.4375F, this.koala.position.y, Koala.WIDTH - 0.6875F, Koala.HEIGHT);
    this.debugRenderer.setColor(Color.YELLOW);
    TiledMapTileLayer tiledMapTileLayer = (TiledMapTileLayer)this.map.getLayers().get("walls");
    for (byte b = 0; b <= tiledMapTileLayer.getHeight(); b++) {
      for (byte b1 = 0; b1 <= tiledMapTileLayer.getWidth(); b1++) {
        if (tiledMapTileLayer.getCell(b1, b) != null) {
          Frustum frustum = this.camera.frustum;
          float f1 = b1;
          float f2 = b;
          if (frustum.boundsInFrustum(f1 + 0.5F, f2 + 0.5F, 0.0F, 1.0F, 1.0F, 0.0F))
            this.debugRenderer.rect(f1, f2, 1.0F, 1.0F); 
        } 
      } 
    } 
    this.debugRenderer.end();
    this.debugLabel.setText(String.format("Pos: %f : %f", new Object[] { Float.valueOf(this.koala.position.x), Float.valueOf(this.koala.position.y) }));
  }
  
  private void renderKoala(float paramFloat) {
    TextureRegion textureRegion;
    int i = null.$SwitchMap$com$alles$platformer$MyPlatformer$Koala$State[this.koala.state.ordinal()];
    if (i != 1) {
      if (i != 2) {
        if (i != 3) {
          if (i != 4) {
            if (i != 5) {
              textureRegion = null;
            } else {
              textureRegion = (TextureRegion)this.croutchStand.getKeyFrame(this.koala.stateTime);
            } 
          } else {
            textureRegion = (TextureRegion)this.croutch.getKeyFrame(this.koala.stateTime);
          } 
        } else {
          textureRegion = (TextureRegion)this.jump.getKeyFrame(this.koala.stateTime);
        } 
      } else {
        textureRegion = (TextureRegion)this.walk.getKeyFrame(this.koala.stateTime);
      } 
    } else {
      textureRegion = (TextureRegion)this.stand.getKeyFrame(this.koala.stateTime);
    } 
    Batch batch = this.renderer.getBatch();
    batch.begin();
    if (this.koala.facesRight) {
      batch.draw(textureRegion, this.koala.position.x, this.koala.position.y, Koala.WIDTH, Koala.HEIGHT);
    } else {
      paramFloat = this.koala.position.x;
      batch.draw(textureRegion, Koala.WIDTH + paramFloat, this.koala.position.y, -Koala.WIDTH, Koala.HEIGHT);
    } 
    batch.end();
  }
  
  public static String toHex(byte[] paramArrayOfByte) {
    BigInteger bigInteger = new BigInteger(true, paramArrayOfByte);
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("%0");
    stringBuilder.append(paramArrayOfByte.length << 1);
    stringBuilder.append("x");
    return String.format(stringBuilder.toString(), new Object[] { bigInteger });
  }
  
  private void updateKoala(float paramFloat) {
    float f3;
    if (paramFloat == 0.0F)
      return; 
    if (paramFloat > 0.1F)
      paramFloat = 0.1F; 
    Koala koala1 = this.koala;
    koala1.stateTime += paramFloat;
    if (this.koala.position.y < -100.0F)
      this.koala.position.set(3.0F, 100.0F); 
    boolean bool = this.controller.isUpPressed();
    int i = 0;
    int j = 0;
    if (bool && this.koala.grounded) {
      Vector2 vector21 = this.koala.velocity;
      vector21.y += Koala.JUMP_VELOCITY;
      this.koala.state = Koala.State.Jumping;
      this.koala.grounded = false;
    } 
    if (this.controller.isLeftPressed()) {
      this.koala.velocity.x = -Koala.MAX_VELOCITY;
      if (this.koala.grounded)
        this.koala.state = Koala.State.Walking; 
      this.koala.facesRight = false;
    } 
    if (this.controller.isLeftPressed() && this.controller.isDownPressed()) {
      this.koala.velocity.x = -Koala.MAX_VELOCITY;
      if (this.koala.grounded)
        this.koala.state = Koala.State.Crouching; 
      this.koala.facesRight = false;
    } 
    if (this.controller.isRightPressed()) {
      this.koala.velocity.x = Koala.MAX_VELOCITY;
      if (this.koala.grounded)
        this.koala.state = Koala.State.Walking; 
      this.koala.facesRight = true;
    } 
    if ((this.controller.isRightPressed() && this.controller.isDownPressed()) || Gdx.input.isKeyPressed(32)) {
      this.koala.velocity.x = Koala.MAX_VELOCITY;
      if (this.koala.grounded)
        this.koala.state = Koala.State.Crouching; 
      this.koala.facesRight = true;
    } 
    this.debug = false;
    this.koala.velocity.add(0.0F, -1.5F);
    this.koala.velocity.x = MathUtils.clamp(this.koala.velocity.x, -Koala.MAX_VELOCITY, Koala.MAX_VELOCITY);
    this.koala.velocity.y = MathUtils.clamp(this.koala.velocity.y, -Koala.MAX_Y_VELOCITY, Koala.MAX_Y_VELOCITY);
    if (Math.abs(this.koala.velocity.x) < 1.0F) {
      this.koala.velocity.x = 0.0F;
      if (this.koala.grounded)
        if (this.controller.isDownPressed()) {
          this.koala.state = Koala.State.CrouchingStanding;
        } else {
          this.koala.state = Koala.State.Standing;
        }  
    } 
    this.koala.velocity.scl(paramFloat);
    Rectangle rectangle = (Rectangle)this.rectPool.obtain();
    float f1 = Koala.HEIGHT;
    float f2 = f1;
    if (this.koala.state == Koala.State.Crouching)
      f2 = f1 - 0.5F; 
    rectangle.set(this.koala.position.x + 0.4375F, this.koala.position.y, Koala.WIDTH - 0.6875F, f2);
    if (this.koala.velocity.x > 0.0F) {
      f1 = rectangle.x + rectangle.width;
      f3 = this.koala.velocity.x;
    } else {
      f1 = rectangle.x;
      f3 = this.koala.velocity.x;
    } 
    int k = (int)(f1 + f3);
    getTiles(k, (int)this.koala.position.y, k, (int)(this.koala.position.y + f2), this.tiles);
    rectangle.x += this.koala.velocity.x;
    Iterator iterator1 = this.tiles.iterator();
    while (iterator1.hasNext()) {
      if (rectangle.overlaps((Rectangle)iterator1.next())) {
        this.koala.velocity.x = 0.0F;
        break;
      } 
    } 
    rectangle.x = this.koala.position.x + 0.4375F;
    if (this.koala.velocity.y > 0.0F) {
      f3 = this.koala.position.y + f2;
      f1 = this.koala.velocity.y;
    } else {
      f3 = this.koala.position.y;
      f1 = this.koala.velocity.y;
    } 
    int m = (int)(f3 + f1);
    int n = (int)(this.koala.position.x + 0.4375F);
    int i1 = (int)(this.koala.position.x + 0.4375F + Koala.WIDTH - 0.6875F);
    TiledMapTileLayer.Cell cell = ((TiledMapTileLayer)this.map.getLayers().get("walls")).getCell(n, m);
    if (cell != null && cell.getTile().getId() == 144) {
      this.koala.position.set(3.0F, 100.0F);
      return;
    } 
    getQuestionmarkTiles(n, m, i1, m, this.tiles);
    rectangle.y += this.koala.velocity.y;
    Iterator iterator2 = this.tiles.iterator();
    while (true) {
      k = i;
      if (iterator2.hasNext()) {
        Rectangle rectangle1 = (Rectangle)iterator2.next();
        if (rectangle.overlaps(rectangle1)) {
          if (this.koala.velocity.y > 0.0F) {
            this.koala.position.y = rectangle1.y - f2;
            tiledMapTileLayer = (TiledMapTileLayer)this.map.getLayers().get("questionmarks");
            TiledMapTileLayer.Cell cell1 = tiledMapTileLayer.getCell((int)rectangle1.x, (int)rectangle1.y);
            if (!cell1.getTile().getProperties().containsKey("questionmarkType"))
              continue; 
            j = ((Integer)cell1.getTile().getProperties().get("questionmarkType")).intValue();
            if (j == 1337) {
              new Array();
              checkFlag();
            } else {
              if (j == 0) {
                k = 21;
              } else if (j == 21) {
                k = 97;
              } else if (j == 97) {
                k = 37;
              } else {
                k = j;
                if (j == 37)
                  k = 0; 
              } 
              try {
                cell1.setTile(this.map.getTileSets().getTile(((Integer)this.questionMarkTileMapping.get(Integer.valueOf(k))).intValue()));
                tiledMapTileLayer.setCell((int)rectangle1.x, (int)rectangle1.y, cell1);
              } catch (Exception tiledMapTileLayer) {}
            } 
            k = 1;
          } else {
            this.koala.position.y = rectangle1.y + rectangle1.height;
            this.koala.grounded = true;
            k = j;
          } 
          this.koala.velocity.y = 0.0F;
          break;
        } 
        continue;
      } 
      break;
    } 
    if (k == 0) {
      getTiles(n, m, i1, m, this.tiles);
      for (Rectangle rectangle1 : this.tiles) {
        if (rectangle.overlaps(rectangle1)) {
          if (this.koala.velocity.y > 0.0F) {
            this.koala.position.y = rectangle1.y - Koala.HEIGHT;
          } else {
            this.koala.position.y = rectangle1.y + rectangle1.height;
            this.koala.grounded = true;
          } 
          this.koala.velocity.y = 0.0F;
          break;
        } 
      } 
    } 
    this.rectPool.free(rectangle);
    this.koala.position.add(this.koala.velocity);
    this.koala.velocity.scl(1.0F / paramFloat);
    Vector2 vector2 = this.koala.velocity;
    vector2.x *= Koala.DAMPING;
  }
  
  public void create() {
    this.koalaTexture = new Texture("mort.png");
    TextureRegion[] arrayOfTextureRegion = TextureRegion.split(this.koalaTexture, 24, 21)[0];
    this.stand = new Animation(0.15F, new Object[] { arrayOfTextureRegion[0], arrayOfTextureRegion[1], arrayOfTextureRegion[2], arrayOfTextureRegion[3] });
    this.jump = new Animation(0.0F, new Object[] { arrayOfTextureRegion[14] });
    this.walk = new Animation(0.08F, new Object[] { arrayOfTextureRegion[4], arrayOfTextureRegion[5], arrayOfTextureRegion[6], arrayOfTextureRegion[7], arrayOfTextureRegion[8], arrayOfTextureRegion[9] });
    this.croutch = new Animation(0.08F, new Object[] { arrayOfTextureRegion[17], arrayOfTextureRegion[18], arrayOfTextureRegion[19], arrayOfTextureRegion[20], arrayOfTextureRegion[21], arrayOfTextureRegion[22], arrayOfTextureRegion[23] });
    this.croutchStand = new Animation(0.0F, new TextureRegion[] { arrayOfTextureRegion[17] });
    this.walk.setPlayMode(Animation.PlayMode.LOOP_PINGPONG);
    this.croutch.setPlayMode(Animation.PlayMode.LOOP_PINGPONG);
    Koala.WIDTH = arrayOfTextureRegion[0].getRegionWidth() * 0.0625F;
    Koala.HEIGHT = arrayOfTextureRegion[0].getRegionHeight() * 0.0625F;
    this.map = (new TmxMapLoader()).load("map.tmx");
    this.renderer = new OrthogonalTiledMapRenderer(this.map, 0.0625F);
    this.camera = new OrthographicCamera();
    this.camera.setToOrtho(false, 30.0F, 20.0F);
    this.camera.update();
    this.koala = new Koala();
    this.koala.position.set(3.0F, 100.0F);
    this.debugRenderer = new ShapeRenderer();
    this.font = new BitmapFont();
    this.font.getData().setScale(2.0F);
    absoluteBatch = new SpriteBatch();
    this.debugStage = new Stage(new ScreenViewport());
    Label.LabelStyle labelStyle = new Label.LabelStyle();
    labelStyle.font = this.font;
    labelStyle.fontColor = Color.RED;
    int i = Gdx.graphics.getWidth() / 12;
    int j = Gdx.graphics.getWidth() / 12;
    this.debugLabel = new Label("Jabba Dabba Duuu", labelStyle);
    this.debugLabel.setSize(Gdx.graphics.getWidth(), i);
    this.debugLabel.setPosition(500.0F, 0.0F);
    this.debugLabel.setAlignment(8);
    this.debugStage.addActor(this.debugLabel);
    this.questionMarkTileMapping = new HashMap();
    this.questionMarkTileMapping.put(Integer.valueOf(0), Integer.valueOf(128));
    this.questionMarkTileMapping.put(Integer.valueOf(21), Integer.valueOf(160));
    this.questionMarkTileMapping.put(Integer.valueOf(37), Integer.valueOf(176));
    this.questionMarkTileMapping.put(Integer.valueOf(97), Integer.valueOf(192));
    this.controller = new Controller();
  }
  
  public void dispose() {}
  
  public void render() {
    Gdx.gl.glClearColor(0.7F, 0.7F, 1.0F, 1.0F);
    Gdx.gl.glClear(16384);
    float f = Gdx.graphics.getDeltaTime();
    updateKoala(f);
    this.camera.position.x = this.koala.position.x;
    this.camera.position.y = this.koala.position.y;
    this.camera.update();
    this.renderer.setView(this.camera);
    this.renderer.render();
    renderKoala(f);
    if (this.debug)
      renderDebug(); 
    this.debugStage.act();
    this.debugStage.draw();
    if (Gdx.app.getType() == Application.ApplicationType.Android)
      this.controller.draw(); 
  }
  
  static class Koala {
    static float DAMPING = 0.87F;
    
    static float HEIGHT = 0.0F;
    
    static float JUMP_VELOCITY = 40.0F;
    
    static float MAX_VELOCITY = 5.0F;
    
    static float MAX_Y_VELOCITY = 40.0F;
    
    static float WIDTH;
    
    boolean facesRight = true;
    
    boolean grounded = false;
    
    final Vector2 position = new Vector2();
    
    State state = State.Walking;
    
    float stateTime = 0.0F;
    
    final Vector2 velocity = new Vector2();
    
    static  {
    
    }
    
    enum State {
      Crouching, CrouchingStanding, Jumping, Standing, Walking;
      
      static  {
        Jumping = new State("Jumping", 2);
        Crouching = new State("Crouching", 3);
        CrouchingStanding = new State("CrouchingStanding", 4);
        $VALUES = new State[] { Standing, Walking, Jumping, Crouching, CrouchingStanding };
      }
    }
  }
  
  enum State {
    Standing, Crouching, CrouchingStanding, Jumping, Walking;
    
    static  {
      Jumping = new State("Jumping", 2);
      Crouching = new State("Crouching", 3);
      CrouchingStanding = new State("CrouchingStanding", 4);
      $VALUES = new State[] { Standing, Walking, Jumping, Crouching, CrouchingStanding };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/alles/platformer/MyPlatformer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */