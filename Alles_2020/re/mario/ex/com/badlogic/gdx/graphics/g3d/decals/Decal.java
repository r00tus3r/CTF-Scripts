package com.badlogic.gdx.graphics.g3d.decals;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.NumberUtils;

public class Decal {
  public static final int C1 = 3;
  
  public static final int C2 = 9;
  
  public static final int C3 = 15;
  
  public static final int C4 = 21;
  
  public static final int SIZE = 24;
  
  public static final int U1 = 4;
  
  public static final int U2 = 10;
  
  public static final int U3 = 16;
  
  public static final int U4 = 22;
  
  public static final int V1 = 5;
  
  public static final int V2 = 11;
  
  public static final int V3 = 17;
  
  public static final int V4 = 23;
  
  private static final int VERTEX_SIZE = 6;
  
  public static final int X1 = 0;
  
  public static final int X2 = 6;
  
  public static final int X3 = 12;
  
  public static final int X4 = 18;
  
  public static final int Y1 = 1;
  
  public static final int Y2 = 7;
  
  public static final int Y3 = 13;
  
  public static final int Y4 = 19;
  
  public static final int Z1 = 2;
  
  public static final int Z2 = 8;
  
  public static final int Z3 = 14;
  
  public static final int Z4 = 20;
  
  static final Vector3 dir;
  
  protected static Quaternion rotator;
  
  private static Vector3 tmp = new Vector3();
  
  private static Vector3 tmp2 = new Vector3();
  
  protected Color color = new Color();
  
  protected Vector2 dimensions = new Vector2();
  
  protected DecalMaterial material = new DecalMaterial();
  
  protected Vector3 position = new Vector3();
  
  protected Quaternion rotation = new Quaternion();
  
  protected Vector2 scale = new Vector2(1.0F, 1.0F);
  
  public Vector2 transformationOffset = null;
  
  protected boolean updated = false;
  
  public int value;
  
  protected float[] vertices = new float[24];
  
  static  {
    dir = new Vector3();
    rotator = new Quaternion(0.0F, 0.0F, 0.0F, 0.0F);
  }
  
  public Decal() {}
  
  public Decal(DecalMaterial paramDecalMaterial) {}
  
  public static Decal newDecal(float paramFloat1, float paramFloat2, TextureRegion paramTextureRegion) { return newDecal(paramFloat1, paramFloat2, paramTextureRegion, -1, -1); }
  
  public static Decal newDecal(float paramFloat1, float paramFloat2, TextureRegion paramTextureRegion, int paramInt1, int paramInt2) {
    Decal decal = new Decal();
    decal.setTextureRegion(paramTextureRegion);
    decal.setBlending(paramInt1, paramInt2);
    Vector2 vector2 = decal.dimensions;
    vector2.x = paramFloat1;
    vector2.y = paramFloat2;
    decal.setColor(1.0F, 1.0F, 1.0F, 1.0F);
    return decal;
  }
  
  public static Decal newDecal(float paramFloat1, float paramFloat2, TextureRegion paramTextureRegion, int paramInt1, int paramInt2, DecalMaterial paramDecalMaterial) {
    Decal decal = new Decal(paramDecalMaterial);
    decal.setTextureRegion(paramTextureRegion);
    decal.setBlending(paramInt1, paramInt2);
    Vector2 vector2 = decal.dimensions;
    vector2.x = paramFloat1;
    vector2.y = paramFloat2;
    decal.setColor(1.0F, 1.0F, 1.0F, 1.0F);
    return decal;
  }
  
  public static Decal newDecal(float paramFloat1, float paramFloat2, TextureRegion paramTextureRegion, boolean paramBoolean) {
    byte b;
    short s = -1;
    if (paramBoolean) {
      b = 770;
    } else {
      b = -1;
    } 
    if (paramBoolean)
      s = 771; 
    return newDecal(paramFloat1, paramFloat2, paramTextureRegion, b, s);
  }
  
  public static Decal newDecal(TextureRegion paramTextureRegion) { return newDecal(paramTextureRegion.getRegionWidth(), paramTextureRegion.getRegionHeight(), paramTextureRegion, -1, -1); }
  
  public static Decal newDecal(TextureRegion paramTextureRegion, boolean paramBoolean) {
    byte b;
    float f1 = paramTextureRegion.getRegionWidth();
    float f2 = paramTextureRegion.getRegionHeight();
    short s = -1;
    if (paramBoolean) {
      b = 770;
    } else {
      b = -1;
    } 
    if (paramBoolean)
      s = 771; 
    return newDecal(f1, f2, paramTextureRegion, b, s);
  }
  
  public Color getColor() { return this.color; }
  
  public float getHeight() { return this.dimensions.y; }
  
  public DecalMaterial getMaterial() { return this.material; }
  
  public Vector3 getPosition() { return this.position; }
  
  public Quaternion getRotation() { return this.rotation; }
  
  public float getScaleX() { return this.scale.x; }
  
  public float getScaleY() { return this.scale.y; }
  
  public TextureRegion getTextureRegion() { return this.material.textureRegion; }
  
  public float[] getVertices() { return this.vertices; }
  
  public float getWidth() { return this.dimensions.x; }
  
  public float getX() { return this.position.x; }
  
  public float getY() { return this.position.y; }
  
  public float getZ() { return this.position.z; }
  
  public void lookAt(Vector3 paramVector31, Vector3 paramVector32) {
    dir.set(paramVector31).sub(this.position).nor();
    setRotation(dir, paramVector32);
  }
  
  protected void resetVertices() {
    float f1 = -this.dimensions.x / 2.0F;
    float f2 = this.dimensions.x + f1;
    float f3 = this.dimensions.y / 2.0F;
    float f4 = f3 - this.dimensions.y;
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[0] = f1;
    arrayOfFloat[1] = f3;
    arrayOfFloat[2] = 0.0F;
    arrayOfFloat[6] = f2;
    arrayOfFloat[7] = f3;
    arrayOfFloat[8] = 0.0F;
    arrayOfFloat[12] = f1;
    arrayOfFloat[13] = f4;
    arrayOfFloat[14] = 0.0F;
    arrayOfFloat[18] = f2;
    arrayOfFloat[19] = f4;
    arrayOfFloat[20] = 0.0F;
    this.updated = false;
  }
  
  public void rotateX(float paramFloat) {
    rotator.set(Vector3.X, paramFloat);
    this.rotation.mul(rotator);
    this.updated = false;
  }
  
  public void rotateY(float paramFloat) {
    rotator.set(Vector3.Y, paramFloat);
    this.rotation.mul(rotator);
    this.updated = false;
  }
  
  public void rotateZ(float paramFloat) {
    rotator.set(Vector3.Z, paramFloat);
    this.rotation.mul(rotator);
    this.updated = false;
  }
  
  public void setBlending(int paramInt1, int paramInt2) {
    DecalMaterial decalMaterial = this.material;
    decalMaterial.srcBlendFactor = paramInt1;
    decalMaterial.dstBlendFactor = paramInt2;
  }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.color.set(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    int i = (int)(paramFloat4 * 255.0F);
    int j = (int)(paramFloat3 * 255.0F);
    int k = (int)(paramFloat2 * 255.0F);
    paramFloat1 = NumberUtils.intToFloatColor((int)(paramFloat1 * 255.0F) | k << 8 | j << 16 | i << 24);
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[3] = paramFloat1;
    arrayOfFloat[9] = paramFloat1;
    arrayOfFloat[15] = paramFloat1;
    arrayOfFloat[21] = paramFloat1;
  }
  
  public void setColor(Color paramColor) {
    this.color.set(paramColor);
    float f = paramColor.toFloatBits();
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[3] = f;
    arrayOfFloat[9] = f;
    arrayOfFloat[15] = f;
    arrayOfFloat[21] = f;
  }
  
  public void setDimensions(float paramFloat1, float paramFloat2) {
    this.dimensions.set(paramFloat1, paramFloat2);
    this.updated = false;
  }
  
  public void setHeight(float paramFloat) {
    this.dimensions.y = paramFloat;
    this.updated = false;
  }
  
  public void setMaterial(DecalMaterial paramDecalMaterial) { this.material = paramDecalMaterial; }
  
  public void setPackedColor(float paramFloat) {
    Color.abgr8888ToColor(this.color, paramFloat);
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[3] = paramFloat;
    arrayOfFloat[9] = paramFloat;
    arrayOfFloat[15] = paramFloat;
    arrayOfFloat[21] = paramFloat;
  }
  
  public void setPosition(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.position.set(paramFloat1, paramFloat2, paramFloat3);
    this.updated = false;
  }
  
  public void setPosition(Vector3 paramVector3) {
    this.position.set(paramVector3);
    this.updated = false;
  }
  
  public void setRotation(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.rotation.setEulerAngles(paramFloat1, paramFloat2, paramFloat3);
    this.updated = false;
  }
  
  public void setRotation(Quaternion paramQuaternion) {
    this.rotation.set(paramQuaternion);
    this.updated = false;
  }
  
  public void setRotation(Vector3 paramVector31, Vector3 paramVector32) {
    tmp.set(paramVector32).crs(paramVector31).nor();
    tmp2.set(paramVector31).crs(tmp).nor();
    this.rotation.setFromAxes(tmp.x, tmp2.x, paramVector31.x, tmp.y, tmp2.y, paramVector31.y, tmp.z, tmp2.z, paramVector31.z);
    this.updated = false;
  }
  
  public void setRotationX(float paramFloat) {
    this.rotation.set(Vector3.X, paramFloat);
    this.updated = false;
  }
  
  public void setRotationY(float paramFloat) {
    this.rotation.set(Vector3.Y, paramFloat);
    this.updated = false;
  }
  
  public void setRotationZ(float paramFloat) {
    this.rotation.set(Vector3.Z, paramFloat);
    this.updated = false;
  }
  
  public void setScale(float paramFloat) {
    this.scale.set(paramFloat, paramFloat);
    this.updated = false;
  }
  
  public void setScale(float paramFloat1, float paramFloat2) {
    this.scale.set(paramFloat1, paramFloat2);
    this.updated = false;
  }
  
  public void setScaleX(float paramFloat) {
    this.scale.x = paramFloat;
    this.updated = false;
  }
  
  public void setScaleY(float paramFloat) {
    this.scale.y = paramFloat;
    this.updated = false;
  }
  
  public void setTextureRegion(TextureRegion paramTextureRegion) {
    this.material.textureRegion = paramTextureRegion;
    updateUVs();
  }
  
  public void setWidth(float paramFloat) {
    this.dimensions.x = paramFloat;
    this.updated = false;
  }
  
  public void setX(float paramFloat) {
    this.position.x = paramFloat;
    this.updated = false;
  }
  
  public void setY(float paramFloat) {
    this.position.y = paramFloat;
    this.updated = false;
  }
  
  public void setZ(float paramFloat) {
    this.position.z = paramFloat;
    this.updated = false;
  }
  
  protected void transformVertices() {
    float f2;
    float f1;
    Vector2 vector2 = this.transformationOffset;
    if (vector2 != null) {
      f1 = -vector2.x;
      f2 = -this.transformationOffset.y;
    } else {
      f1 = 0.0F;
      f2 = 0.0F;
    } 
    float f3 = (this.vertices[0] + f1) * this.scale.x;
    float f4 = (this.vertices[1] + f2) * this.scale.y;
    float[] arrayOfFloat = this.vertices;
    float f5 = arrayOfFloat[2];
    arrayOfFloat[0] = this.rotation.w * f3 + this.rotation.y * f5 - this.rotation.z * f4;
    this.vertices[1] = this.rotation.w * f4 + this.rotation.z * f3 - this.rotation.x * f5;
    this.vertices[2] = this.rotation.w * f5 + this.rotation.x * f4 - this.rotation.y * f3;
    float f6 = -this.rotation.x * f3 - this.rotation.y * f4 - this.rotation.z * f5;
    this.rotation.conjugate();
    arrayOfFloat = this.vertices;
    f4 = arrayOfFloat[0];
    f3 = arrayOfFloat[1];
    f5 = arrayOfFloat[2];
    arrayOfFloat[0] = this.rotation.x * f6 + this.rotation.w * f4 + this.rotation.z * f3 - this.rotation.y * f5;
    this.vertices[1] = this.rotation.y * f6 + this.rotation.w * f3 + this.rotation.x * f5 - this.rotation.z * f4;
    this.vertices[2] = f6 * this.rotation.z + f5 * this.rotation.w + f4 * this.rotation.y - f3 * this.rotation.x;
    this.rotation.conjugate();
    arrayOfFloat = this.vertices;
    arrayOfFloat[0] = arrayOfFloat[0] + this.position.x - f1;
    arrayOfFloat = this.vertices;
    arrayOfFloat[1] = arrayOfFloat[1] + this.position.y - f2;
    arrayOfFloat = this.vertices;
    arrayOfFloat[2] = arrayOfFloat[2] + this.position.z;
    f5 = (this.vertices[6] + f1) * this.scale.x;
    f3 = (this.vertices[7] + f2) * this.scale.y;
    arrayOfFloat = this.vertices;
    f4 = arrayOfFloat[8];
    arrayOfFloat[6] = this.rotation.w * f5 + this.rotation.y * f4 - this.rotation.z * f3;
    this.vertices[7] = this.rotation.w * f3 + this.rotation.z * f5 - this.rotation.x * f4;
    this.vertices[8] = this.rotation.w * f4 + this.rotation.x * f3 - this.rotation.y * f5;
    f3 = -this.rotation.x * f5 - this.rotation.y * f3 - this.rotation.z * f4;
    this.rotation.conjugate();
    arrayOfFloat = this.vertices;
    f4 = arrayOfFloat[6];
    f6 = arrayOfFloat[7];
    f5 = arrayOfFloat[8];
    arrayOfFloat[6] = this.rotation.x * f3 + this.rotation.w * f4 + this.rotation.z * f6 - this.rotation.y * f5;
    this.vertices[7] = this.rotation.y * f3 + this.rotation.w * f6 + this.rotation.x * f5 - this.rotation.z * f4;
    this.vertices[8] = f3 * this.rotation.z + f5 * this.rotation.w + f4 * this.rotation.y - f6 * this.rotation.x;
    this.rotation.conjugate();
    arrayOfFloat = this.vertices;
    arrayOfFloat[6] = arrayOfFloat[6] + this.position.x - f1;
    arrayOfFloat = this.vertices;
    arrayOfFloat[7] = arrayOfFloat[7] + this.position.y - f2;
    arrayOfFloat = this.vertices;
    arrayOfFloat[8] = arrayOfFloat[8] + this.position.z;
    f4 = (this.vertices[12] + f1) * this.scale.x;
    f3 = (this.vertices[13] + f2) * this.scale.y;
    arrayOfFloat = this.vertices;
    f5 = arrayOfFloat[14];
    arrayOfFloat[12] = this.rotation.w * f4 + this.rotation.y * f5 - this.rotation.z * f3;
    this.vertices[13] = this.rotation.w * f3 + this.rotation.z * f4 - this.rotation.x * f5;
    this.vertices[14] = this.rotation.w * f5 + this.rotation.x * f3 - this.rotation.y * f4;
    f5 = -this.rotation.x * f4 - this.rotation.y * f3 - this.rotation.z * f5;
    this.rotation.conjugate();
    arrayOfFloat = this.vertices;
    f4 = arrayOfFloat[12];
    f6 = arrayOfFloat[13];
    f3 = arrayOfFloat[14];
    arrayOfFloat[12] = this.rotation.x * f5 + this.rotation.w * f4 + this.rotation.z * f6 - this.rotation.y * f3;
    this.vertices[13] = this.rotation.y * f5 + this.rotation.w * f6 + this.rotation.x * f3 - this.rotation.z * f4;
    this.vertices[14] = f5 * this.rotation.z + f3 * this.rotation.w + f4 * this.rotation.y - f6 * this.rotation.x;
    this.rotation.conjugate();
    arrayOfFloat = this.vertices;
    arrayOfFloat[12] = arrayOfFloat[12] + this.position.x - f1;
    arrayOfFloat = this.vertices;
    arrayOfFloat[13] = arrayOfFloat[13] + this.position.y - f2;
    arrayOfFloat = this.vertices;
    arrayOfFloat[14] = arrayOfFloat[14] + this.position.z;
    f5 = (this.vertices[18] + f1) * this.scale.x;
    f4 = (this.vertices[19] + f2) * this.scale.y;
    arrayOfFloat = this.vertices;
    f3 = arrayOfFloat[20];
    arrayOfFloat[18] = this.rotation.w * f5 + this.rotation.y * f3 - this.rotation.z * f4;
    this.vertices[19] = this.rotation.w * f4 + this.rotation.z * f5 - this.rotation.x * f3;
    this.vertices[20] = this.rotation.w * f3 + this.rotation.x * f4 - this.rotation.y * f5;
    f5 = -this.rotation.x * f5 - this.rotation.y * f4 - this.rotation.z * f3;
    this.rotation.conjugate();
    arrayOfFloat = this.vertices;
    f3 = arrayOfFloat[18];
    f4 = arrayOfFloat[19];
    f6 = arrayOfFloat[20];
    arrayOfFloat[18] = this.rotation.x * f5 + this.rotation.w * f3 + this.rotation.z * f4 - this.rotation.y * f6;
    this.vertices[19] = this.rotation.y * f5 + this.rotation.w * f4 + this.rotation.x * f6 - this.rotation.z * f3;
    this.vertices[20] = f5 * this.rotation.z + f6 * this.rotation.w + f3 * this.rotation.y - f4 * this.rotation.x;
    this.rotation.conjugate();
    arrayOfFloat = this.vertices;
    arrayOfFloat[18] = arrayOfFloat[18] + this.position.x - f1;
    arrayOfFloat = this.vertices;
    arrayOfFloat[19] = arrayOfFloat[19] + this.position.y - f2;
    arrayOfFloat = this.vertices;
    arrayOfFloat[20] = arrayOfFloat[20] + this.position.z;
    this.updated = true;
  }
  
  public void translate(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.position.add(paramFloat1, paramFloat2, paramFloat3);
    this.updated = false;
  }
  
  public void translate(Vector3 paramVector3) {
    this.position.add(paramVector3);
    this.updated = false;
  }
  
  public void translateX(float paramFloat) {
    Vector3 vector3 = this.position;
    vector3.x += paramFloat;
    this.updated = false;
  }
  
  public void translateY(float paramFloat) {
    Vector3 vector3 = this.position;
    vector3.y += paramFloat;
    this.updated = false;
  }
  
  public void translateZ(float paramFloat) {
    Vector3 vector3 = this.position;
    vector3.z += paramFloat;
    this.updated = false;
  }
  
  protected void update() {
    if (!this.updated) {
      resetVertices();
      transformVertices();
    } 
  }
  
  protected void updateUVs() {
    TextureRegion textureRegion = this.material.textureRegion;
    this.vertices[4] = textureRegion.getU();
    this.vertices[5] = textureRegion.getV();
    this.vertices[10] = textureRegion.getU2();
    this.vertices[11] = textureRegion.getV();
    this.vertices[16] = textureRegion.getU();
    this.vertices[17] = textureRegion.getV2();
    this.vertices[22] = textureRegion.getU2();
    this.vertices[23] = textureRegion.getV2();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/decals/Decal.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */