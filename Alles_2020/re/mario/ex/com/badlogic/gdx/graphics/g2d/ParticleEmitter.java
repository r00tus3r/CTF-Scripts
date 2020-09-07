package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.collision.BoundingBox;
import com.badlogic.gdx.utils.Array;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.Writer;
import java.util.Arrays;

public class ParticleEmitter {
  private static final int UPDATE_ANGLE = 2;
  
  private static final int UPDATE_GRAVITY = 32;
  
  private static final int UPDATE_ROTATION = 4;
  
  private static final int UPDATE_SCALE = 1;
  
  private static final int UPDATE_SPRITE = 128;
  
  private static final int UPDATE_TINT = 64;
  
  private static final int UPDATE_VELOCITY = 8;
  
  private static final int UPDATE_WIND = 16;
  
  private float accumulator;
  
  private boolean[] active;
  
  private int activeCount;
  
  private boolean additive = true;
  
  private boolean aligned;
  
  private boolean allowCompletion;
  
  private ScaledNumericValue angleValue = new ScaledNumericValue();
  
  private boolean attached;
  
  private boolean behind;
  
  private BoundingBox bounds;
  
  boolean cleansUpBlendFunction = true;
  
  private boolean continuous;
  
  private float delay;
  
  private float delayTimer;
  
  private RangedNumericValue delayValue = new RangedNumericValue();
  
  public float duration = 1.0F;
  
  public float durationTimer;
  
  private RangedNumericValue durationValue = new RangedNumericValue();
  
  private int emission;
  
  private int emissionDelta;
  
  private int emissionDiff;
  
  private ScaledNumericValue emissionValue = new ScaledNumericValue();
  
  private boolean firstUpdate;
  
  private boolean flipX;
  
  private boolean flipY;
  
  private ScaledNumericValue gravityValue = new ScaledNumericValue();
  
  private Array<String> imagePaths;
  
  private int life;
  
  private int lifeDiff;
  
  private int lifeOffset;
  
  private int lifeOffsetDiff;
  
  private IndependentScaledNumericValue lifeOffsetValue = new IndependentScaledNumericValue();
  
  private IndependentScaledNumericValue lifeValue = new IndependentScaledNumericValue();
  
  private int maxParticleCount = 4;
  
  private int minParticleCount;
  
  private RangedNumericValue[] motionValues;
  
  private String name;
  
  private Particle[] particles;
  
  private boolean premultipliedAlpha = false;
  
  private ScaledNumericValue rotationValue = new ScaledNumericValue();
  
  private float spawnHeight;
  
  private float spawnHeightDiff;
  
  private ScaledNumericValue spawnHeightValue = new ScaledNumericValue();
  
  private SpawnShapeValue spawnShapeValue = new SpawnShapeValue();
  
  private float spawnWidth;
  
  private float spawnWidthDiff;
  
  private ScaledNumericValue spawnWidthValue = new ScaledNumericValue();
  
  private SpriteMode spriteMode = SpriteMode.single;
  
  private Array<Sprite> sprites;
  
  private GradientColorValue tintValue = new GradientColorValue();
  
  private ScaledNumericValue transparencyValue = new ScaledNumericValue();
  
  private int updateFlags;
  
  private ScaledNumericValue velocityValue = new ScaledNumericValue();
  
  private ScaledNumericValue windValue = new ScaledNumericValue();
  
  private float x;
  
  private RangedNumericValue xOffsetValue = new ScaledNumericValue();
  
  private ScaledNumericValue xScaleValue = new ScaledNumericValue();
  
  private RangedNumericValue[] xSizeValues;
  
  private float y;
  
  private RangedNumericValue yOffsetValue = new ScaledNumericValue();
  
  private ScaledNumericValue yScaleValue = new ScaledNumericValue();
  
  private RangedNumericValue[] ySizeValues;
  
  public ParticleEmitter() { initialize(); }
  
  public ParticleEmitter(ParticleEmitter paramParticleEmitter) {
    this.sprites = new Array(paramParticleEmitter.sprites);
    this.name = paramParticleEmitter.name;
    this.imagePaths = new Array(paramParticleEmitter.imagePaths);
    setMaxParticleCount(paramParticleEmitter.maxParticleCount);
    this.minParticleCount = paramParticleEmitter.minParticleCount;
    this.delayValue.load(paramParticleEmitter.delayValue);
    this.durationValue.load(paramParticleEmitter.durationValue);
    this.emissionValue.load(paramParticleEmitter.emissionValue);
    this.lifeValue.load(paramParticleEmitter.lifeValue);
    this.lifeOffsetValue.load(paramParticleEmitter.lifeOffsetValue);
    this.xScaleValue.load(paramParticleEmitter.xScaleValue);
    this.yScaleValue.load(paramParticleEmitter.yScaleValue);
    this.rotationValue.load(paramParticleEmitter.rotationValue);
    this.velocityValue.load(paramParticleEmitter.velocityValue);
    this.angleValue.load(paramParticleEmitter.angleValue);
    this.windValue.load(paramParticleEmitter.windValue);
    this.gravityValue.load(paramParticleEmitter.gravityValue);
    this.transparencyValue.load(paramParticleEmitter.transparencyValue);
    this.tintValue.load(paramParticleEmitter.tintValue);
    this.xOffsetValue.load(paramParticleEmitter.xOffsetValue);
    this.yOffsetValue.load(paramParticleEmitter.yOffsetValue);
    this.spawnWidthValue.load(paramParticleEmitter.spawnWidthValue);
    this.spawnHeightValue.load(paramParticleEmitter.spawnHeightValue);
    this.spawnShapeValue.load(paramParticleEmitter.spawnShapeValue);
    this.attached = paramParticleEmitter.attached;
    this.continuous = paramParticleEmitter.continuous;
    this.aligned = paramParticleEmitter.aligned;
    this.behind = paramParticleEmitter.behind;
    this.additive = paramParticleEmitter.additive;
    this.premultipliedAlpha = paramParticleEmitter.premultipliedAlpha;
    this.cleansUpBlendFunction = paramParticleEmitter.cleansUpBlendFunction;
    this.spriteMode = paramParticleEmitter.spriteMode;
    setPosition(paramParticleEmitter.getX(), paramParticleEmitter.getY());
  }
  
  public ParticleEmitter(BufferedReader paramBufferedReader) throws IOException {
    initialize();
    load(paramBufferedReader);
  }
  
  private void activateParticle(int paramInt) {
    float f2;
    Sprite sprite;
    int i = null.$SwitchMap$com$badlogic$gdx$graphics$g2d$ParticleEmitter$SpriteMode[this.spriteMode.ordinal()];
    if (i != 1 && i != 2) {
      if (i != 3) {
        sprite = null;
      } else {
        sprite = (Sprite)this.sprites.random();
      } 
    } else {
      sprite = (Sprite)this.sprites.first();
    } 
    Particle[] arrayOfParticle = this.particles;
    Particle particle = arrayOfParticle[paramInt];
    if (particle == null) {
      particle = newParticle(sprite);
      arrayOfParticle[paramInt] = particle;
      particle.flip(this.flipX, this.flipY);
    } else {
      particle.set(sprite);
    } 
    float f1 = this.durationTimer / this.duration;
    paramInt = this.updateFlags;
    if (this.lifeValue.independent)
      generateLifeValues(); 
    if (this.lifeOffsetValue.independent)
      generateLifeOffsetValues(); 
    i = this.life + (int)(this.lifeDiff * this.lifeValue.getScale(f1));
    particle.life = i;
    particle.currentLife = i;
    if (this.velocityValue.active) {
      particle.velocity = this.velocityValue.newLowValue();
      particle.velocityDiff = this.velocityValue.newHighValue();
      if (!this.velocityValue.isRelative())
        particle.velocityDiff -= particle.velocity; 
    } 
    particle.angle = this.angleValue.newLowValue();
    particle.angleDiff = this.angleValue.newHighValue();
    if (!this.angleValue.isRelative())
      particle.angleDiff -= particle.angle; 
    paramInt &= 0x2;
    if (paramInt == 0) {
      f2 = particle.angle + particle.angleDiff * this.angleValue.getScale(0.0F);
      particle.angle = f2;
      particle.angleCos = MathUtils.cosDeg(f2);
      particle.angleSin = MathUtils.sinDeg(f2);
    } else {
      f2 = 0.0F;
    } 
    float f3 = sprite.getWidth();
    float f4 = sprite.getHeight();
    particle.xScale = this.xScaleValue.newLowValue() / f3;
    particle.xScaleDiff = this.xScaleValue.newHighValue() / f3;
    if (!this.xScaleValue.isRelative())
      particle.xScaleDiff -= particle.xScale; 
    if (this.yScaleValue.active) {
      particle.yScale = this.yScaleValue.newLowValue() / f4;
      particle.yScaleDiff = this.yScaleValue.newHighValue() / f4;
      if (!this.yScaleValue.isRelative())
        particle.yScaleDiff -= particle.yScale; 
      particle.setScale(particle.xScale + particle.xScaleDiff * this.xScaleValue.getScale(0.0F), particle.yScale + particle.yScaleDiff * this.yScaleValue.getScale(0.0F));
    } else {
      particle.setScale(particle.xScale + particle.xScaleDiff * this.xScaleValue.getScale(0.0F));
    } 
    if (this.rotationValue.active) {
      particle.rotation = this.rotationValue.newLowValue();
      particle.rotationDiff = this.rotationValue.newHighValue();
      if (!this.rotationValue.isRelative())
        particle.rotationDiff -= particle.rotation; 
      float f8 = particle.rotation + particle.rotationDiff * this.rotationValue.getScale(0.0F);
      float f9 = f8;
      if (this.aligned)
        f9 = f8 + f2; 
      particle.setRotation(f9);
    } 
    if (this.windValue.active) {
      particle.wind = this.windValue.newLowValue();
      particle.windDiff = this.windValue.newHighValue();
      if (!this.windValue.isRelative())
        particle.windDiff -= particle.wind; 
    } 
    if (this.gravityValue.active) {
      particle.gravity = this.gravityValue.newLowValue();
      particle.gravityDiff = this.gravityValue.newHighValue();
      if (!this.gravityValue.isRelative())
        particle.gravityDiff -= particle.gravity; 
    } 
    float[] arrayOfFloat2 = particle.tint;
    float[] arrayOfFloat1 = arrayOfFloat2;
    if (arrayOfFloat2 == null) {
      arrayOfFloat1 = new float[3];
      particle.tint = arrayOfFloat1;
    } 
    arrayOfFloat2 = this.tintValue.getColor(0.0F);
    arrayOfFloat1[0] = arrayOfFloat2[0];
    arrayOfFloat1[1] = arrayOfFloat2[1];
    arrayOfFloat1[2] = arrayOfFloat2[2];
    particle.transparency = this.transparencyValue.newLowValue();
    particle.transparencyDiff = this.transparencyValue.newHighValue() - particle.transparency;
    float f6 = this.x;
    float f7 = f6;
    if (this.xOffsetValue.active)
      f7 = f6 + this.xOffsetValue.newLowValue(); 
    f6 = this.y;
    float f5 = f6;
    if (this.yOffsetValue.active)
      f5 = f6 + this.yOffsetValue.newLowValue(); 
    i = null.$SwitchMap$com$badlogic$gdx$graphics$g2d$ParticleEmitter$SpawnShape[this.spawnShapeValue.shape.ordinal()];
    if (i != 1) {
      if (i != 2) {
        if (i != 3) {
          f2 = f7;
          f6 = f5;
        } else {
          float f = this.spawnWidth + this.spawnWidthDiff * this.spawnWidthValue.getScale(f1);
          f6 = this.spawnHeight + this.spawnHeightDiff * this.spawnHeightValue.getScale(f1);
          if (f != 0.0F) {
            float f8 = MathUtils.random() * f;
            f2 = f7 + f8;
            f6 = f5 + f8 * f6 / f;
          } else {
            f6 = f5 + f6 * MathUtils.random();
            f2 = f7;
          } 
        } 
      } else {
        float f9 = this.spawnWidth + this.spawnWidthDiff * this.spawnWidthValue.getScale(f1);
        f2 = this.spawnHeight;
        float f10 = this.spawnHeightDiff;
        f6 = this.spawnHeightValue.getScale(f1);
        float f8 = f9 / 2.0F;
        f10 = (f2 + f10 * f6) / 2.0F;
        f2 = f7;
        f6 = f5;
        if (f8 != 0.0F)
          if (f10 == 0.0F) {
            f2 = f7;
            f6 = f5;
          } else {
            f6 = f8 / f10;
            if (this.spawnShapeValue.edges) {
              i = null.$SwitchMap$com$badlogic$gdx$graphics$g2d$ParticleEmitter$SpawnEllipseSide[this.spawnShapeValue.side.ordinal()];
              if (i != 1) {
                if (i != 2) {
                  f9 = MathUtils.random(360.0F);
                } else {
                  f9 = MathUtils.random(179.0F);
                } 
              } else {
                f9 = -MathUtils.random(179.0F);
              } 
              f10 = MathUtils.cosDeg(f9);
              float f = MathUtils.sinDeg(f9);
              f7 += f10 * f8;
              f5 += f8 * f / f6;
              f2 = f7;
              f6 = f5;
              if (paramInt == 0) {
                particle.angle = f9;
                particle.angleCos = f10;
                particle.angleSin = f;
                f2 = f7;
                f6 = f5;
              } 
            } else {
              do {
                f2 = MathUtils.random(f9) - f8;
                f10 = MathUtils.random(f9) - f8;
              } while (f2 * f2 + f10 * f10 > f8 * f8);
              f2 = f7 + f2;
              f6 = f5 + f10 / f6;
            } 
          }  
      } 
    } else {
      f2 = this.spawnWidth + this.spawnWidthDiff * this.spawnWidthValue.getScale(f1);
      f6 = this.spawnHeight + this.spawnHeightDiff * this.spawnHeightValue.getScale(f1);
      f2 = f7 + MathUtils.random(f2) - f2 / 2.0F;
      f6 = f5 + MathUtils.random(f6) - f6 / 2.0F;
    } 
    particle.setBounds(f2 - f3 / 2.0F, f6 - f4 / 2.0F, f3, f4);
    i = (int)(this.lifeOffset + this.lifeOffsetDiff * this.lifeOffsetValue.getScale(f1));
    if (i > 0) {
      paramInt = i;
      if (i >= particle.currentLife)
        paramInt = particle.currentLife - 1; 
      updateParticle(particle, paramInt / 1000.0F, paramInt);
    } 
  }
  
  private void generateLifeOffsetValues() {
    boolean bool;
    if (this.lifeOffsetValue.active) {
      bool = (int)this.lifeOffsetValue.newLowValue();
    } else {
      bool = false;
    } 
    this.lifeOffset = bool;
    this.lifeOffsetDiff = (int)this.lifeOffsetValue.newHighValue();
    if (!this.lifeOffsetValue.isRelative())
      this.lifeOffsetDiff -= this.lifeOffset; 
  }
  
  private void generateLifeValues() {
    this.life = (int)this.lifeValue.newLowValue();
    this.lifeDiff = (int)this.lifeValue.newHighValue();
    if (!this.lifeValue.isRelative())
      this.lifeDiff -= this.life; 
  }
  
  private void initialize() {
    this.sprites = new Array();
    this.imagePaths = new Array();
    this.durationValue.setAlwaysActive(true);
    this.emissionValue.setAlwaysActive(true);
    this.lifeValue.setAlwaysActive(true);
    this.xScaleValue.setAlwaysActive(true);
    this.transparencyValue.setAlwaysActive(true);
    this.spawnShapeValue.setAlwaysActive(true);
    this.spawnWidthValue.setAlwaysActive(true);
    this.spawnHeightValue.setAlwaysActive(true);
  }
  
  static boolean readBoolean(BufferedReader paramBufferedReader, String paramString) throws IOException { return Boolean.parseBoolean(readString(paramBufferedReader, paramString)); }
  
  static boolean readBoolean(String paramString) throws IOException { return Boolean.parseBoolean(readString(paramString)); }
  
  static float readFloat(BufferedReader paramBufferedReader, String paramString) throws IOException { return Float.parseFloat(readString(paramBufferedReader, paramString)); }
  
  static int readInt(BufferedReader paramBufferedReader, String paramString) throws IOException { return Integer.parseInt(readString(paramBufferedReader, paramString)); }
  
  static String readString(BufferedReader paramBufferedReader, String paramString) throws IOException {
    String str = paramBufferedReader.readLine();
    if (str != null)
      return readString(str); 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Missing value: ");
    stringBuilder.append(paramString);
    throw new IOException(stringBuilder.toString());
  }
  
  static String readString(String paramString) throws IOException { return paramString.substring(paramString.indexOf(":") + 1).trim(); }
  
  private void restart() {
    float f;
    if (this.delayValue.active) {
      f = this.delayValue.newLowValue();
    } else {
      f = 0.0F;
    } 
    this.delay = f;
    this.delayTimer = 0.0F;
    this.durationTimer -= this.duration;
    this.duration = this.durationValue.newLowValue();
    this.emission = (int)this.emissionValue.newLowValue();
    this.emissionDiff = (int)this.emissionValue.newHighValue();
    if (!this.emissionValue.isRelative())
      this.emissionDiff -= this.emission; 
    if (!this.lifeValue.independent)
      generateLifeValues(); 
    if (!this.lifeOffsetValue.independent)
      generateLifeOffsetValues(); 
    this.spawnWidth = this.spawnWidthValue.newLowValue();
    this.spawnWidthDiff = this.spawnWidthValue.newHighValue();
    if (!this.spawnWidthValue.isRelative())
      this.spawnWidthDiff -= this.spawnWidth; 
    this.spawnHeight = this.spawnHeightValue.newLowValue();
    this.spawnHeightDiff = this.spawnHeightValue.newHighValue();
    if (!this.spawnHeightValue.isRelative())
      this.spawnHeightDiff -= this.spawnHeight; 
    this.updateFlags = 0;
    if (this.angleValue.active && this.angleValue.timeline.length > 1)
      this.updateFlags |= 0x2; 
    if (this.velocityValue.active)
      this.updateFlags |= 0x8; 
    if (this.xScaleValue.timeline.length > 1)
      this.updateFlags |= 0x1; 
    if (this.yScaleValue.active && this.yScaleValue.timeline.length > 1)
      this.updateFlags |= 0x1; 
    if (this.rotationValue.active && this.rotationValue.timeline.length > 1)
      this.updateFlags |= 0x4; 
    if (this.windValue.active)
      this.updateFlags |= 0x10; 
    if (this.gravityValue.active)
      this.updateFlags |= 0x20; 
    if (this.tintValue.timeline.length > 1)
      this.updateFlags |= 0x40; 
    if (this.spriteMode == SpriteMode.animated)
      this.updateFlags |= 0x80; 
  }
  
  private boolean updateParticle(Particle paramParticle, float paramFloat, int paramInt) { // Byte code:
    //   0: aload_1
    //   1: getfield currentLife : I
    //   4: iload_3
    //   5: isub
    //   6: istore_3
    //   7: iload_3
    //   8: ifgt -> 13
    //   11: iconst_0
    //   12: ireturn
    //   13: aload_1
    //   14: iload_3
    //   15: putfield currentLife : I
    //   18: aload_1
    //   19: getfield currentLife : I
    //   22: i2f
    //   23: aload_1
    //   24: getfield life : I
    //   27: i2f
    //   28: fdiv
    //   29: fstore #4
    //   31: fconst_1
    //   32: fstore #5
    //   34: fconst_1
    //   35: fload #4
    //   37: fsub
    //   38: fstore #6
    //   40: aload_0
    //   41: getfield updateFlags : I
    //   44: istore_3
    //   45: iload_3
    //   46: iconst_1
    //   47: iand
    //   48: ifeq -> 129
    //   51: aload_0
    //   52: getfield yScaleValue : Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    //   55: getfield active : Z
    //   58: ifeq -> 106
    //   61: aload_1
    //   62: aload_1
    //   63: getfield xScale : F
    //   66: aload_1
    //   67: getfield xScaleDiff : F
    //   70: aload_0
    //   71: getfield xScaleValue : Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    //   74: fload #6
    //   76: invokevirtual getScale : (F)F
    //   79: fmul
    //   80: fadd
    //   81: aload_1
    //   82: getfield yScale : F
    //   85: aload_1
    //   86: getfield yScaleDiff : F
    //   89: aload_0
    //   90: getfield yScaleValue : Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    //   93: fload #6
    //   95: invokevirtual getScale : (F)F
    //   98: fmul
    //   99: fadd
    //   100: invokevirtual setScale : (FF)V
    //   103: goto -> 129
    //   106: aload_1
    //   107: aload_1
    //   108: getfield xScale : F
    //   111: aload_1
    //   112: getfield xScaleDiff : F
    //   115: aload_0
    //   116: getfield xScaleValue : Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    //   119: fload #6
    //   121: invokevirtual getScale : (F)F
    //   124: fmul
    //   125: fadd
    //   126: invokevirtual setScale : (F)V
    //   129: iload_3
    //   130: bipush #8
    //   132: iand
    //   133: ifeq -> 455
    //   136: aload_1
    //   137: getfield velocity : F
    //   140: aload_1
    //   141: getfield velocityDiff : F
    //   144: aload_0
    //   145: getfield velocityValue : Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    //   148: fload #6
    //   150: invokevirtual getScale : (F)F
    //   153: fmul
    //   154: fadd
    //   155: fload_2
    //   156: fmul
    //   157: fstore #4
    //   159: iload_3
    //   160: iconst_2
    //   161: iand
    //   162: ifeq -> 276
    //   165: aload_1
    //   166: getfield angle : F
    //   169: aload_1
    //   170: getfield angleDiff : F
    //   173: aload_0
    //   174: getfield angleValue : Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    //   177: fload #6
    //   179: invokevirtual getScale : (F)F
    //   182: fmul
    //   183: fadd
    //   184: fstore #7
    //   186: fload #7
    //   188: invokestatic cosDeg : (F)F
    //   191: fload #4
    //   193: fmul
    //   194: fstore #8
    //   196: fload #4
    //   198: fload #7
    //   200: invokestatic sinDeg : (F)F
    //   203: fmul
    //   204: fstore #9
    //   206: fload #9
    //   208: fstore #4
    //   210: fload #8
    //   212: fstore #10
    //   214: iload_3
    //   215: iconst_4
    //   216: iand
    //   217: ifeq -> 370
    //   220: aload_1
    //   221: getfield rotation : F
    //   224: aload_1
    //   225: getfield rotationDiff : F
    //   228: aload_0
    //   229: getfield rotationValue : Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    //   232: fload #6
    //   234: invokevirtual getScale : (F)F
    //   237: fmul
    //   238: fadd
    //   239: fstore #10
    //   241: fload #10
    //   243: fstore #4
    //   245: aload_0
    //   246: getfield aligned : Z
    //   249: ifeq -> 259
    //   252: fload #10
    //   254: fload #7
    //   256: fadd
    //   257: fstore #4
    //   259: aload_1
    //   260: fload #4
    //   262: invokevirtual setRotation : (F)V
    //   265: fload #9
    //   267: fstore #4
    //   269: fload #8
    //   271: fstore #10
    //   273: goto -> 370
    //   276: fload #4
    //   278: aload_1
    //   279: getfield angleCos : F
    //   282: fmul
    //   283: fstore #8
    //   285: fload #4
    //   287: aload_1
    //   288: getfield angleSin : F
    //   291: fmul
    //   292: fstore #9
    //   294: aload_0
    //   295: getfield aligned : Z
    //   298: ifne -> 315
    //   301: fload #9
    //   303: fstore #4
    //   305: fload #8
    //   307: fstore #10
    //   309: iload_3
    //   310: iconst_4
    //   311: iand
    //   312: ifeq -> 370
    //   315: aload_1
    //   316: getfield rotation : F
    //   319: aload_1
    //   320: getfield rotationDiff : F
    //   323: aload_0
    //   324: getfield rotationValue : Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    //   327: fload #6
    //   329: invokevirtual getScale : (F)F
    //   332: fmul
    //   333: fadd
    //   334: fstore #10
    //   336: fload #10
    //   338: fstore #4
    //   340: aload_0
    //   341: getfield aligned : Z
    //   344: ifeq -> 356
    //   347: fload #10
    //   349: aload_1
    //   350: getfield angle : F
    //   353: fadd
    //   354: fstore #4
    //   356: aload_1
    //   357: fload #4
    //   359: invokevirtual setRotation : (F)V
    //   362: fload #8
    //   364: fstore #10
    //   366: fload #9
    //   368: fstore #4
    //   370: fload #10
    //   372: fstore #8
    //   374: iload_3
    //   375: bipush #16
    //   377: iand
    //   378: ifeq -> 407
    //   381: fload #10
    //   383: aload_1
    //   384: getfield wind : F
    //   387: aload_1
    //   388: getfield windDiff : F
    //   391: aload_0
    //   392: getfield windValue : Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    //   395: fload #6
    //   397: invokevirtual getScale : (F)F
    //   400: fmul
    //   401: fadd
    //   402: fload_2
    //   403: fmul
    //   404: fadd
    //   405: fstore #8
    //   407: fload #4
    //   409: fstore #10
    //   411: iload_3
    //   412: bipush #32
    //   414: iand
    //   415: ifeq -> 444
    //   418: fload #4
    //   420: aload_1
    //   421: getfield gravity : F
    //   424: aload_1
    //   425: getfield gravityDiff : F
    //   428: aload_0
    //   429: getfield gravityValue : Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    //   432: fload #6
    //   434: invokevirtual getScale : (F)F
    //   437: fmul
    //   438: fadd
    //   439: fload_2
    //   440: fmul
    //   441: fadd
    //   442: fstore #10
    //   444: aload_1
    //   445: fload #8
    //   447: fload #10
    //   449: invokevirtual translate : (FF)V
    //   452: goto -> 484
    //   455: iload_3
    //   456: iconst_4
    //   457: iand
    //   458: ifeq -> 484
    //   461: aload_1
    //   462: aload_1
    //   463: getfield rotation : F
    //   466: aload_1
    //   467: getfield rotationDiff : F
    //   470: aload_0
    //   471: getfield rotationValue : Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    //   474: fload #6
    //   476: invokevirtual getScale : (F)F
    //   479: fmul
    //   480: fadd
    //   481: invokevirtual setRotation : (F)V
    //   484: iload_3
    //   485: bipush #64
    //   487: iand
    //   488: ifeq -> 505
    //   491: aload_0
    //   492: getfield tintValue : Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;
    //   495: fload #6
    //   497: invokevirtual getColor : (F)[F
    //   500: astore #11
    //   502: goto -> 511
    //   505: aload_1
    //   506: getfield tint : [F
    //   509: astore #11
    //   511: aload_0
    //   512: getfield premultipliedAlpha : Z
    //   515: ifeq -> 583
    //   518: fload #5
    //   520: fstore_2
    //   521: aload_0
    //   522: getfield additive : Z
    //   525: ifeq -> 530
    //   528: fconst_0
    //   529: fstore_2
    //   530: aload_1
    //   531: getfield transparency : F
    //   534: aload_1
    //   535: getfield transparencyDiff : F
    //   538: aload_0
    //   539: getfield transparencyValue : Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    //   542: fload #6
    //   544: invokevirtual getScale : (F)F
    //   547: fmul
    //   548: fadd
    //   549: fstore #4
    //   551: aload_1
    //   552: aload #11
    //   554: iconst_0
    //   555: faload
    //   556: fload #4
    //   558: fmul
    //   559: aload #11
    //   561: iconst_1
    //   562: faload
    //   563: fload #4
    //   565: fmul
    //   566: aload #11
    //   568: iconst_2
    //   569: faload
    //   570: fload #4
    //   572: fmul
    //   573: fload #4
    //   575: fload_2
    //   576: fmul
    //   577: invokevirtual setColor : (FFFF)V
    //   580: goto -> 618
    //   583: aload_1
    //   584: aload #11
    //   586: iconst_0
    //   587: faload
    //   588: aload #11
    //   590: iconst_1
    //   591: faload
    //   592: aload #11
    //   594: iconst_2
    //   595: faload
    //   596: aload_1
    //   597: getfield transparency : F
    //   600: aload_1
    //   601: getfield transparencyDiff : F
    //   604: aload_0
    //   605: getfield transparencyValue : Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    //   608: fload #6
    //   610: invokevirtual getScale : (F)F
    //   613: fmul
    //   614: fadd
    //   615: invokevirtual setColor : (FFFF)V
    //   618: iload_3
    //   619: sipush #128
    //   622: iand
    //   623: ifeq -> 745
    //   626: fload #6
    //   628: aload_0
    //   629: getfield sprites : Lcom/badlogic/gdx/utils/Array;
    //   632: getfield size : I
    //   635: i2f
    //   636: fmul
    //   637: f2i
    //   638: aload_0
    //   639: getfield sprites : Lcom/badlogic/gdx/utils/Array;
    //   642: getfield size : I
    //   645: iconst_1
    //   646: isub
    //   647: invokestatic min : (II)I
    //   650: istore_3
    //   651: aload_1
    //   652: getfield frame : I
    //   655: iload_3
    //   656: if_icmpeq -> 745
    //   659: aload_0
    //   660: getfield sprites : Lcom/badlogic/gdx/utils/Array;
    //   663: iload_3
    //   664: invokevirtual get : (I)Ljava/lang/Object;
    //   667: checkcast com/badlogic/gdx/graphics/g2d/Sprite
    //   670: astore #11
    //   672: aload_1
    //   673: invokevirtual getWidth : ()F
    //   676: fstore_2
    //   677: aload_1
    //   678: invokevirtual getHeight : ()F
    //   681: fstore #4
    //   683: aload_1
    //   684: aload #11
    //   686: invokevirtual setRegion : (Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    //   689: aload_1
    //   690: aload #11
    //   692: invokevirtual getWidth : ()F
    //   695: aload #11
    //   697: invokevirtual getHeight : ()F
    //   700: invokevirtual setSize : (FF)V
    //   703: aload_1
    //   704: aload #11
    //   706: invokevirtual getOriginX : ()F
    //   709: aload #11
    //   711: invokevirtual getOriginY : ()F
    //   714: invokevirtual setOrigin : (FF)V
    //   717: aload_1
    //   718: fload_2
    //   719: aload #11
    //   721: invokevirtual getWidth : ()F
    //   724: fsub
    //   725: fconst_2
    //   726: fdiv
    //   727: fload #4
    //   729: aload #11
    //   731: invokevirtual getHeight : ()F
    //   734: fsub
    //   735: fconst_2
    //   736: fdiv
    //   737: invokevirtual translate : (FF)V
    //   740: aload_1
    //   741: iload_3
    //   742: putfield frame : I
    //   745: iconst_1
    //   746: ireturn }
  
  public void addParticle() {
    int i = this.activeCount;
    if (i == this.maxParticleCount)
      return; 
    boolean[] arrayOfBoolean = this.active;
    byte b = 0;
    int j = arrayOfBoolean.length;
    while (b < j) {
      if (!arrayOfBoolean[b]) {
        activateParticle(b);
        arrayOfBoolean[b] = true;
        this.activeCount = i + 1;
        break;
      } 
      b++;
    } 
  }
  
  public void addParticles(int paramInt) {
    int i = Math.min(paramInt, this.maxParticleCount - this.activeCount);
    if (i == 0)
      return; 
    boolean[] arrayOfBoolean = this.active;
    int j = arrayOfBoolean.length;
    byte b = 0;
    paramInt = 0;
    label16: while (b < i) {
      while (paramInt < j) {
        if (!arrayOfBoolean[paramInt]) {
          activateParticle(paramInt);
          arrayOfBoolean[paramInt] = true;
          b++;
          paramInt++;
          continue label16;
        } 
        paramInt++;
      } 
    } 
    this.activeCount += i;
  }
  
  public void allowCompletion() {
    this.allowCompletion = true;
    this.durationTimer = this.duration;
  }
  
  public boolean cleansUpBlendFunction() { return this.cleansUpBlendFunction; }
  
  public void draw(Batch paramBatch) {
    if (this.premultipliedAlpha) {
      paramBatch.setBlendFunction(1, 771);
    } else if (this.additive) {
      paramBatch.setBlendFunction(770, 1);
    } else {
      paramBatch.setBlendFunction(770, 771);
    } 
    Particle[] arrayOfParticle = this.particles;
    boolean[] arrayOfBoolean = this.active;
    byte b = 0;
    int i = arrayOfBoolean.length;
    while (b < i) {
      if (arrayOfBoolean[b])
        arrayOfParticle[b].draw(paramBatch); 
      b++;
    } 
    if (this.cleansUpBlendFunction && (this.additive || this.premultipliedAlpha))
      paramBatch.setBlendFunction(770, 771); 
  }
  
  public void draw(Batch paramBatch, float paramFloat) {
    this.accumulator += paramFloat * 1000.0F;
    float f1 = this.accumulator;
    if (f1 < 1.0F) {
      draw(paramBatch);
      return;
    } 
    int i = (int)f1;
    float f2 = i;
    this.accumulator = f1 - f2;
    if (this.premultipliedAlpha) {
      paramBatch.setBlendFunction(1, 771);
    } else if (this.additive) {
      paramBatch.setBlendFunction(770, 1);
    } else {
      paramBatch.setBlendFunction(770, 771);
    } 
    Particle[] arrayOfParticle = this.particles;
    boolean[] arrayOfBoolean = this.active;
    int j = this.activeCount;
    int k = arrayOfBoolean.length;
    byte b = 0;
    while (b < k) {
      int n = j;
      if (arrayOfBoolean[b]) {
        Particle particle = arrayOfParticle[b];
        if (updateParticle(particle, paramFloat, i)) {
          particle.draw(paramBatch);
          n = j;
        } else {
          arrayOfBoolean[b] = false;
          n = j - 1;
        } 
      } 
      b++;
      j = n;
    } 
    this.activeCount = j;
    if (this.cleansUpBlendFunction && (this.additive || this.premultipliedAlpha))
      paramBatch.setBlendFunction(770, 771); 
    paramFloat = this.delayTimer;
    if (paramFloat < this.delay) {
      this.delayTimer = paramFloat + f2;
      return;
    } 
    if (this.firstUpdate) {
      this.firstUpdate = false;
      addParticle();
    } 
    paramFloat = this.durationTimer;
    if (paramFloat < this.duration) {
      this.durationTimer = paramFloat + f2;
    } else {
      if (!this.continuous || this.allowCompletion)
        return; 
      restart();
    } 
    this.emissionDelta += i;
    paramFloat = this.emission + this.emissionDiff * this.emissionValue.getScale(this.durationTimer / this.duration);
    if (paramFloat > 0.0F) {
      paramFloat = 1000.0F / paramFloat;
      int n = this.emissionDelta;
      if (n >= paramFloat) {
        n = Math.min((int)(n / paramFloat), this.maxParticleCount - j);
        this.emissionDelta = (int)(this.emissionDelta - n * paramFloat);
        this.emissionDelta = (int)(this.emissionDelta % paramFloat);
        addParticles(n);
      } 
    } 
    int m = this.minParticleCount;
    if (j < m)
      addParticles(m - j); 
  }
  
  public void flipY() {
    ScaledNumericValue scaledNumericValue = this.angleValue;
    scaledNumericValue.setHigh(-scaledNumericValue.getHighMin(), -this.angleValue.getHighMax());
    scaledNumericValue = this.angleValue;
    scaledNumericValue.setLow(-scaledNumericValue.getLowMin(), -this.angleValue.getLowMax());
    scaledNumericValue = this.gravityValue;
    scaledNumericValue.setHigh(-scaledNumericValue.getHighMin(), -this.gravityValue.getHighMax());
    scaledNumericValue = this.gravityValue;
    scaledNumericValue.setLow(-scaledNumericValue.getLowMin(), -this.gravityValue.getLowMax());
    scaledNumericValue = this.windValue;
    scaledNumericValue.setHigh(-scaledNumericValue.getHighMin(), -this.windValue.getHighMax());
    scaledNumericValue = this.windValue;
    scaledNumericValue.setLow(-scaledNumericValue.getLowMin(), -this.windValue.getLowMax());
    scaledNumericValue = this.rotationValue;
    scaledNumericValue.setHigh(-scaledNumericValue.getHighMin(), -this.rotationValue.getHighMax());
    scaledNumericValue = this.rotationValue;
    scaledNumericValue.setLow(-scaledNumericValue.getLowMin(), -this.rotationValue.getLowMax());
    RangedNumericValue rangedNumericValue = this.yOffsetValue;
    rangedNumericValue.setLow(-rangedNumericValue.getLowMin(), -this.yOffsetValue.getLowMax());
  }
  
  public int getActiveCount() { return this.activeCount; }
  
  public ScaledNumericValue getAngle() { return this.angleValue; }
  
  public BoundingBox getBoundingBox() {
    if (this.bounds == null)
      this.bounds = new BoundingBox(); 
    Particle[] arrayOfParticle = this.particles;
    boolean[] arrayOfBoolean = this.active;
    BoundingBox boundingBox = this.bounds;
    boundingBox.inf();
    byte b = 0;
    int i = arrayOfBoolean.length;
    while (b < i) {
      if (arrayOfBoolean[b]) {
        Rectangle rectangle = arrayOfParticle[b].getBoundingRectangle();
        boundingBox.ext(rectangle.x, rectangle.y, 0.0F);
        boundingBox.ext(rectangle.x + rectangle.width, rectangle.y + rectangle.height, 0.0F);
      } 
      b++;
    } 
    return boundingBox;
  }
  
  public RangedNumericValue getDelay() { return this.delayValue; }
  
  public RangedNumericValue getDuration() { return this.durationValue; }
  
  public ScaledNumericValue getEmission() { return this.emissionValue; }
  
  public ScaledNumericValue getGravity() { return this.gravityValue; }
  
  public Array<String> getImagePaths() { return this.imagePaths; }
  
  public ScaledNumericValue getLife() { return this.lifeValue; }
  
  public ScaledNumericValue getLifeOffset() { return this.lifeOffsetValue; }
  
  public int getMaxParticleCount() { return this.maxParticleCount; }
  
  public int getMinParticleCount() { return this.minParticleCount; }
  
  protected RangedNumericValue[] getMotionValues() {
    if (this.motionValues == null) {
      this.motionValues = new RangedNumericValue[3];
      RangedNumericValue[] arrayOfRangedNumericValue = this.motionValues;
      arrayOfRangedNumericValue[0] = this.velocityValue;
      arrayOfRangedNumericValue[1] = this.windValue;
      arrayOfRangedNumericValue[2] = this.gravityValue;
    } 
    return this.motionValues;
  }
  
  public String getName() { return this.name; }
  
  protected Particle[] getParticles() { return this.particles; }
  
  public float getPercentComplete() { return (this.delayTimer < this.delay) ? 0.0F : Math.min(1.0F, this.durationTimer / this.duration); }
  
  public ScaledNumericValue getRotation() { return this.rotationValue; }
  
  public ScaledNumericValue getSpawnHeight() { return this.spawnHeightValue; }
  
  public SpawnShapeValue getSpawnShape() { return this.spawnShapeValue; }
  
  public ScaledNumericValue getSpawnWidth() { return this.spawnWidthValue; }
  
  public SpriteMode getSpriteMode() { return this.spriteMode; }
  
  public Array<Sprite> getSprites() { return this.sprites; }
  
  public GradientColorValue getTint() { return this.tintValue; }
  
  public ScaledNumericValue getTransparency() { return this.transparencyValue; }
  
  public ScaledNumericValue getVelocity() { return this.velocityValue; }
  
  public ScaledNumericValue getWind() { return this.windValue; }
  
  public float getX() { return this.x; }
  
  public RangedNumericValue getXOffsetValue() { return this.xOffsetValue; }
  
  public ScaledNumericValue getXScale() { return this.xScaleValue; }
  
  protected RangedNumericValue[] getXSizeValues() {
    if (this.xSizeValues == null) {
      this.xSizeValues = new RangedNumericValue[3];
      RangedNumericValue[] arrayOfRangedNumericValue = this.xSizeValues;
      arrayOfRangedNumericValue[0] = this.xScaleValue;
      arrayOfRangedNumericValue[1] = this.spawnWidthValue;
      arrayOfRangedNumericValue[2] = this.xOffsetValue;
    } 
    return this.xSizeValues;
  }
  
  public float getY() { return this.y; }
  
  public RangedNumericValue getYOffsetValue() { return this.yOffsetValue; }
  
  public ScaledNumericValue getYScale() { return this.yScaleValue; }
  
  protected RangedNumericValue[] getYSizeValues() {
    if (this.ySizeValues == null) {
      this.ySizeValues = new RangedNumericValue[3];
      RangedNumericValue[] arrayOfRangedNumericValue = this.ySizeValues;
      arrayOfRangedNumericValue[0] = this.yScaleValue;
      arrayOfRangedNumericValue[1] = this.spawnHeightValue;
      arrayOfRangedNumericValue[2] = this.yOffsetValue;
    } 
    return this.ySizeValues;
  }
  
  public boolean isAdditive() { return this.additive; }
  
  public boolean isAligned() { return this.aligned; }
  
  public boolean isAttached() { return this.attached; }
  
  public boolean isBehind() { return this.behind; }
  
  public boolean isComplete() {
    boolean bool = this.continuous;
    boolean bool1 = false;
    if (bool && !this.allowCompletion)
      return false; 
    if (this.delayTimer < this.delay)
      return false; 
    bool = bool1;
    if (this.durationTimer >= this.duration) {
      bool = bool1;
      if (this.activeCount == 0)
        bool = true; 
    } 
    return bool;
  }
  
  public boolean isContinuous() { return this.continuous; }
  
  public boolean isPremultipliedAlpha() { return this.premultipliedAlpha; }
  
  public void load(BufferedReader paramBufferedReader) throws IOException {
    try {
      this.name = readString(paramBufferedReader, "name");
      paramBufferedReader.readLine();
      this.delayValue.load(paramBufferedReader);
      paramBufferedReader.readLine();
      this.durationValue.load(paramBufferedReader);
      paramBufferedReader.readLine();
      setMinParticleCount(readInt(paramBufferedReader, "minParticleCount"));
      setMaxParticleCount(readInt(paramBufferedReader, "maxParticleCount"));
      paramBufferedReader.readLine();
      this.emissionValue.load(paramBufferedReader);
      paramBufferedReader.readLine();
      this.lifeValue.load(paramBufferedReader);
      paramBufferedReader.readLine();
      this.lifeOffsetValue.load(paramBufferedReader);
      paramBufferedReader.readLine();
      this.xOffsetValue.load(paramBufferedReader);
      paramBufferedReader.readLine();
      this.yOffsetValue.load(paramBufferedReader);
      paramBufferedReader.readLine();
      this.spawnShapeValue.load(paramBufferedReader);
      paramBufferedReader.readLine();
      this.spawnWidthValue.load(paramBufferedReader);
      paramBufferedReader.readLine();
      this.spawnHeightValue.load(paramBufferedReader);
      if (paramBufferedReader.readLine().trim().equals("- Scale -")) {
        this.xScaleValue.load(paramBufferedReader);
        this.yScaleValue.setActive(false);
      } else {
        this.xScaleValue.load(paramBufferedReader);
        paramBufferedReader.readLine();
        this.yScaleValue.load(paramBufferedReader);
      } 
      paramBufferedReader.readLine();
      this.velocityValue.load(paramBufferedReader);
      paramBufferedReader.readLine();
      this.angleValue.load(paramBufferedReader);
      paramBufferedReader.readLine();
      this.rotationValue.load(paramBufferedReader);
      paramBufferedReader.readLine();
      this.windValue.load(paramBufferedReader);
      paramBufferedReader.readLine();
      this.gravityValue.load(paramBufferedReader);
      paramBufferedReader.readLine();
      this.tintValue.load(paramBufferedReader);
      paramBufferedReader.readLine();
      this.transparencyValue.load(paramBufferedReader);
      paramBufferedReader.readLine();
      this.attached = readBoolean(paramBufferedReader, "attached");
      this.continuous = readBoolean(paramBufferedReader, "continuous");
      this.aligned = readBoolean(paramBufferedReader, "aligned");
      this.additive = readBoolean(paramBufferedReader, "additive");
      this.behind = readBoolean(paramBufferedReader, "behind");
      String str1 = paramBufferedReader.readLine();
      String str2 = str1;
      if (str1.startsWith("premultipliedAlpha")) {
        this.premultipliedAlpha = readBoolean(str1);
        str2 = paramBufferedReader.readLine();
      } 
      if (str2.startsWith("spriteMode")) {
        this.spriteMode = SpriteMode.valueOf(readString(str2));
        paramBufferedReader.readLine();
      } 
      Array array = new Array();
      this();
      while (true) {
        str2 = paramBufferedReader.readLine();
        if (str2 != null && !str2.isEmpty()) {
          array.add(str2);
          continue;
        } 
        break;
      } 
      setImagePaths(array);
      return;
    } catch (RuntimeException runtimeException2) {
      if (this.name == null)
        throw runtimeException2; 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("Error parsing emitter: ");
      stringBuilder.append(this.name);
      RuntimeException runtimeException1 = new RuntimeException(stringBuilder.toString(), runtimeException2);
      throw runtimeException1;
    } 
  }
  
  public void matchMotion(ParticleEmitter paramParticleEmitter) {
    RangedNumericValue[] arrayOfRangedNumericValue2 = getMotionValues();
    RangedNumericValue[] arrayOfRangedNumericValue1 = paramParticleEmitter.getMotionValues();
    for (byte b = 0; b < arrayOfRangedNumericValue2.length; b++)
      arrayOfRangedNumericValue2[b].set(arrayOfRangedNumericValue1[b]); 
  }
  
  public void matchSize(ParticleEmitter paramParticleEmitter) {
    matchXSize(paramParticleEmitter);
    matchYSize(paramParticleEmitter);
  }
  
  public void matchXSize(ParticleEmitter paramParticleEmitter) {
    RangedNumericValue[] arrayOfRangedNumericValue2 = getXSizeValues();
    RangedNumericValue[] arrayOfRangedNumericValue1 = paramParticleEmitter.getXSizeValues();
    for (byte b = 0; b < arrayOfRangedNumericValue2.length; b++)
      arrayOfRangedNumericValue2[b].set(arrayOfRangedNumericValue1[b]); 
  }
  
  public void matchYSize(ParticleEmitter paramParticleEmitter) {
    RangedNumericValue[] arrayOfRangedNumericValue2 = getYSizeValues();
    RangedNumericValue[] arrayOfRangedNumericValue1 = paramParticleEmitter.getYSizeValues();
    for (byte b = 0; b < arrayOfRangedNumericValue2.length; b++)
      arrayOfRangedNumericValue2[b].set(arrayOfRangedNumericValue1[b]); 
  }
  
  protected Particle newParticle(Sprite paramSprite) { return new Particle(paramSprite); }
  
  public void reset() {
    this.emissionDelta = 0;
    this.durationTimer = this.duration;
    boolean[] arrayOfBoolean = this.active;
    int i = arrayOfBoolean.length;
    for (byte b = 0; b < i; b++)
      arrayOfBoolean[b] = false; 
    this.activeCount = 0;
    start();
  }
  
  public void save(Writer paramWriter) throws IOException {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(this.name);
    stringBuilder.append("\n");
    paramWriter.write(stringBuilder.toString());
    paramWriter.write("- Delay -\n");
    this.delayValue.save(paramWriter);
    paramWriter.write("- Duration - \n");
    this.durationValue.save(paramWriter);
    paramWriter.write("- Count - \n");
    stringBuilder = new StringBuilder();
    stringBuilder.append("min: ");
    stringBuilder.append(this.minParticleCount);
    stringBuilder.append("\n");
    paramWriter.write(stringBuilder.toString());
    stringBuilder = new StringBuilder();
    stringBuilder.append("max: ");
    stringBuilder.append(this.maxParticleCount);
    stringBuilder.append("\n");
    paramWriter.write(stringBuilder.toString());
    paramWriter.write("- Emission - \n");
    this.emissionValue.save(paramWriter);
    paramWriter.write("- Life - \n");
    this.lifeValue.save(paramWriter);
    paramWriter.write("- Life Offset - \n");
    this.lifeOffsetValue.save(paramWriter);
    paramWriter.write("- X Offset - \n");
    this.xOffsetValue.save(paramWriter);
    paramWriter.write("- Y Offset - \n");
    this.yOffsetValue.save(paramWriter);
    paramWriter.write("- Spawn Shape - \n");
    this.spawnShapeValue.save(paramWriter);
    paramWriter.write("- Spawn Width - \n");
    this.spawnWidthValue.save(paramWriter);
    paramWriter.write("- Spawn Height - \n");
    this.spawnHeightValue.save(paramWriter);
    paramWriter.write("- X Scale - \n");
    this.xScaleValue.save(paramWriter);
    paramWriter.write("- Y Scale - \n");
    this.yScaleValue.save(paramWriter);
    paramWriter.write("- Velocity - \n");
    this.velocityValue.save(paramWriter);
    paramWriter.write("- Angle - \n");
    this.angleValue.save(paramWriter);
    paramWriter.write("- Rotation - \n");
    this.rotationValue.save(paramWriter);
    paramWriter.write("- Wind - \n");
    this.windValue.save(paramWriter);
    paramWriter.write("- Gravity - \n");
    this.gravityValue.save(paramWriter);
    paramWriter.write("- Tint - \n");
    this.tintValue.save(paramWriter);
    paramWriter.write("- Transparency - \n");
    this.transparencyValue.save(paramWriter);
    paramWriter.write("- Options - \n");
    stringBuilder = new StringBuilder();
    stringBuilder.append("attached: ");
    stringBuilder.append(this.attached);
    stringBuilder.append("\n");
    paramWriter.write(stringBuilder.toString());
    stringBuilder = new StringBuilder();
    stringBuilder.append("continuous: ");
    stringBuilder.append(this.continuous);
    stringBuilder.append("\n");
    paramWriter.write(stringBuilder.toString());
    stringBuilder = new StringBuilder();
    stringBuilder.append("aligned: ");
    stringBuilder.append(this.aligned);
    stringBuilder.append("\n");
    paramWriter.write(stringBuilder.toString());
    stringBuilder = new StringBuilder();
    stringBuilder.append("additive: ");
    stringBuilder.append(this.additive);
    stringBuilder.append("\n");
    paramWriter.write(stringBuilder.toString());
    stringBuilder = new StringBuilder();
    stringBuilder.append("behind: ");
    stringBuilder.append(this.behind);
    stringBuilder.append("\n");
    paramWriter.write(stringBuilder.toString());
    stringBuilder = new StringBuilder();
    stringBuilder.append("premultipliedAlpha: ");
    stringBuilder.append(this.premultipliedAlpha);
    stringBuilder.append("\n");
    paramWriter.write(stringBuilder.toString());
    stringBuilder = new StringBuilder();
    stringBuilder.append("spriteMode: ");
    stringBuilder.append(this.spriteMode.toString());
    stringBuilder.append("\n");
    paramWriter.write(stringBuilder.toString());
    paramWriter.write("- Image Paths -\n");
    for (String str : this.imagePaths) {
      stringBuilder = new StringBuilder();
      stringBuilder.append(str);
      stringBuilder.append("\n");
      paramWriter.write(stringBuilder.toString());
    } 
    paramWriter.write("\n");
  }
  
  public void scaleMotion(float paramFloat) {
    if (paramFloat == 1.0F)
      return; 
    RangedNumericValue[] arrayOfRangedNumericValue = getMotionValues();
    int i = arrayOfRangedNumericValue.length;
    for (byte b = 0; b < i; b++)
      arrayOfRangedNumericValue[b].scale(paramFloat); 
  }
  
  public void scaleSize(float paramFloat) {
    if (paramFloat == 1.0F)
      return; 
    scaleSize(paramFloat, paramFloat);
  }
  
  public void scaleSize(float paramFloat1, float paramFloat2) {
    if (paramFloat1 == 1.0F && paramFloat2 == 1.0F)
      return; 
    RangedNumericValue[] arrayOfRangedNumericValue = getXSizeValues();
    int i = arrayOfRangedNumericValue.length;
    byte b1 = 0;
    byte b2;
    for (b2 = 0; b2 < i; b2++)
      arrayOfRangedNumericValue[b2].scale(paramFloat1); 
    arrayOfRangedNumericValue = getYSizeValues();
    i = arrayOfRangedNumericValue.length;
    for (b2 = b1; b2 < i; b2++)
      arrayOfRangedNumericValue[b2].scale(paramFloat2); 
  }
  
  public void setAdditive(boolean paramBoolean) { this.additive = paramBoolean; }
  
  public void setAligned(boolean paramBoolean) { this.aligned = paramBoolean; }
  
  public void setAttached(boolean paramBoolean) { this.attached = paramBoolean; }
  
  public void setBehind(boolean paramBoolean) { this.behind = paramBoolean; }
  
  public void setCleansUpBlendFunction(boolean paramBoolean) { this.cleansUpBlendFunction = paramBoolean; }
  
  public void setContinuous(boolean paramBoolean) { this.continuous = paramBoolean; }
  
  public void setFlip(boolean paramBoolean1, boolean paramBoolean2) {
    this.flipX = paramBoolean1;
    this.flipY = paramBoolean2;
    Particle[] arrayOfParticle = this.particles;
    if (arrayOfParticle == null)
      return; 
    byte b = 0;
    int i = arrayOfParticle.length;
    while (b < i) {
      Particle particle = this.particles[b];
      if (particle != null)
        particle.flip(paramBoolean1, paramBoolean2); 
      b++;
    } 
  }
  
  public void setImagePaths(Array<String> paramArray) { this.imagePaths = paramArray; }
  
  public void setMaxParticleCount(int paramInt) {
    this.maxParticleCount = paramInt;
    this.active = new boolean[paramInt];
    this.activeCount = 0;
    this.particles = new Particle[paramInt];
  }
  
  public void setMinParticleCount(int paramInt) { this.minParticleCount = paramInt; }
  
  public void setName(String paramString) { this.name = paramString; }
  
  public void setPosition(float paramFloat1, float paramFloat2) {
    if (this.attached) {
      float f1 = this.x;
      float f2 = this.y;
      boolean[] arrayOfBoolean = this.active;
      byte b = 0;
      int i = arrayOfBoolean.length;
      while (b < i) {
        if (arrayOfBoolean[b])
          this.particles[b].translate(paramFloat1 - f1, paramFloat2 - f2); 
        b++;
      } 
    } 
    this.x = paramFloat1;
    this.y = paramFloat2;
  }
  
  public void setPremultipliedAlpha(boolean paramBoolean) { this.premultipliedAlpha = paramBoolean; }
  
  public void setSpriteMode(SpriteMode paramSpriteMode) { this.spriteMode = paramSpriteMode; }
  
  public void setSprites(Array<Sprite> paramArray) {
    this.sprites = paramArray;
    if (paramArray.size == 0)
      return; 
    byte b = 0;
    int i = this.particles.length;
    while (b < i) {
      Particle particle = this.particles[b];
      if (particle == null)
        break; 
      Sprite sprite = null;
      int j = null.$SwitchMap$com$badlogic$gdx$graphics$g2d$ParticleEmitter$SpriteMode[this.spriteMode.ordinal()];
      if (j != 1) {
        if (j != 2) {
          if (j == 3)
            sprite = (Sprite)paramArray.random(); 
        } else {
          particle.frame = Math.min((int)((1.0F - particle.currentLife / particle.life) * paramArray.size), paramArray.size - 1);
          sprite = (Sprite)paramArray.get(particle.frame);
        } 
      } else {
        sprite = (Sprite)paramArray.first();
      } 
      particle.setRegion(sprite);
      particle.setOrigin(sprite.getOriginX(), sprite.getOriginY());
      b++;
    } 
  }
  
  public void start() {
    this.firstUpdate = true;
    this.allowCompletion = false;
    restart();
  }
  
  public void update(float paramFloat) {
    this.accumulator += paramFloat * 1000.0F;
    float f1 = this.accumulator;
    if (f1 < 1.0F)
      return; 
    int i = (int)f1;
    float f2 = i;
    this.accumulator = f1 - f2;
    f1 = this.delayTimer;
    if (f1 < this.delay) {
      this.delayTimer = f1 + f2;
    } else {
      if (this.firstUpdate) {
        this.firstUpdate = false;
        addParticle();
      } 
      f1 = this.durationTimer;
      if (f1 < this.duration) {
        this.durationTimer = f1 + f2;
      } else {
        int m;
        if (!this.continuous || this.allowCompletion) {
          m = 1;
        } else {
          restart();
          m = 0;
        } 
        if (!m) {
          this.emissionDelta += i;
          f2 = this.emission + this.emissionDiff * this.emissionValue.getScale(this.durationTimer / this.duration);
          if (f2 > 0.0F) {
            f2 = 1000.0F / f2;
            m = this.emissionDelta;
            if (m >= f2) {
              m = Math.min((int)(m / f2), this.maxParticleCount - this.activeCount);
              this.emissionDelta = (int)(this.emissionDelta - m * f2);
              this.emissionDelta = (int)(this.emissionDelta % f2);
              addParticles(m);
            } 
          } 
          m = this.activeCount;
          int i2 = this.minParticleCount;
          if (m < i2)
            addParticles(i2 - m); 
        } 
        boolean[] arrayOfBoolean1 = this.active;
        int n = this.activeCount;
        Particle[] arrayOfParticle1 = this.particles;
        int i1 = arrayOfBoolean1.length;
        boolean bool2 = false;
      } 
      boolean bool1 = false;
    } 
    boolean[] arrayOfBoolean = this.active;
    int j = this.activeCount;
    Particle[] arrayOfParticle = this.particles;
    int k = arrayOfBoolean.length;
    boolean bool = false;
  }
  
  public static class GradientColorValue extends ParticleValue {
    private static float[] temp = new float[4];
    
    private float[] colors = { 1.0F, 1.0F, 1.0F };
    
    float[] timeline = { 0.0F };
    
    public float[] getColor(float param1Float) { // Byte code:
      //   0: aload_0
      //   1: getfield timeline : [F
      //   4: astore_2
      //   5: aload_2
      //   6: arraylength
      //   7: istore_3
      //   8: iconst_1
      //   9: istore #4
      //   11: iconst_0
      //   12: istore #5
      //   14: iload #4
      //   16: iload_3
      //   17: if_icmpge -> 42
      //   20: aload_2
      //   21: iload #4
      //   23: faload
      //   24: fload_1
      //   25: fcmpl
      //   26: ifle -> 32
      //   29: goto -> 45
      //   32: iload #4
      //   34: istore #5
      //   36: iinc #4, 1
      //   39: goto -> 14
      //   42: iconst_m1
      //   43: istore #4
      //   45: aload_2
      //   46: iload #5
      //   48: faload
      //   49: fstore #6
      //   51: iload #5
      //   53: iconst_3
      //   54: imul
      //   55: istore #5
      //   57: aload_0
      //   58: getfield colors : [F
      //   61: astore #7
      //   63: aload #7
      //   65: iload #5
      //   67: faload
      //   68: fstore #8
      //   70: aload #7
      //   72: iload #5
      //   74: iconst_1
      //   75: iadd
      //   76: faload
      //   77: fstore #9
      //   79: aload #7
      //   81: iload #5
      //   83: iconst_2
      //   84: iadd
      //   85: faload
      //   86: fstore #10
      //   88: iload #4
      //   90: iconst_m1
      //   91: if_icmpne -> 120
      //   94: getstatic com/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue.temp : [F
      //   97: astore #7
      //   99: aload #7
      //   101: iconst_0
      //   102: fload #8
      //   104: fastore
      //   105: aload #7
      //   107: iconst_1
      //   108: fload #9
      //   110: fastore
      //   111: aload #7
      //   113: iconst_2
      //   114: fload #10
      //   116: fastore
      //   117: aload #7
      //   119: areturn
      //   120: fload_1
      //   121: fload #6
      //   123: fsub
      //   124: aload_2
      //   125: iload #4
      //   127: faload
      //   128: fload #6
      //   130: fsub
      //   131: fdiv
      //   132: fstore_1
      //   133: iload #4
      //   135: iconst_3
      //   136: imul
      //   137: istore #4
      //   139: getstatic com/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue.temp : [F
      //   142: astore_2
      //   143: aload_2
      //   144: iconst_0
      //   145: fload #8
      //   147: aload #7
      //   149: iload #4
      //   151: faload
      //   152: fload #8
      //   154: fsub
      //   155: fload_1
      //   156: fmul
      //   157: fadd
      //   158: fastore
      //   159: aload_2
      //   160: iconst_1
      //   161: fload #9
      //   163: aload #7
      //   165: iload #4
      //   167: iconst_1
      //   168: iadd
      //   169: faload
      //   170: fload #9
      //   172: fsub
      //   173: fload_1
      //   174: fmul
      //   175: fadd
      //   176: fastore
      //   177: aload_2
      //   178: iconst_2
      //   179: fload #10
      //   181: aload #7
      //   183: iload #4
      //   185: iconst_2
      //   186: iadd
      //   187: faload
      //   188: fload #10
      //   190: fsub
      //   191: fload_1
      //   192: fmul
      //   193: fadd
      //   194: fastore
      //   195: aload_2
      //   196: areturn }
    
    public float[] getColors() { return this.colors; }
    
    public float[] getTimeline() { return this.timeline; }
    
    public void load(GradientColorValue param1GradientColorValue) {
      load(param1GradientColorValue);
      this.colors = new float[param1GradientColorValue.colors.length];
      float[] arrayOfFloat2 = param1GradientColorValue.colors;
      float[] arrayOfFloat3 = this.colors;
      System.arraycopy(arrayOfFloat2, 0, arrayOfFloat3, 0, arrayOfFloat3.length);
      this.timeline = new float[param1GradientColorValue.timeline.length];
      float[] arrayOfFloat1 = param1GradientColorValue.timeline;
      arrayOfFloat3 = this.timeline;
      System.arraycopy(arrayOfFloat1, 0, arrayOfFloat3, 0, arrayOfFloat3.length);
    }
    
    public void load(BufferedReader param1BufferedReader) throws IOException {
      super.load(param1BufferedReader);
      if (!this.active)
        return; 
      this.colors = new float[ParticleEmitter.readInt(param1BufferedReader, "colorsCount")];
      byte b1 = 0;
      byte b2 = 0;
      while (true) {
        float[] arrayOfFloat = this.colors;
        if (b2 < arrayOfFloat.length) {
          StringBuilder stringBuilder = new StringBuilder();
          stringBuilder.append("colors");
          stringBuilder.append(b2);
          arrayOfFloat[b2] = ParticleEmitter.readFloat(param1BufferedReader, stringBuilder.toString());
          b2++;
          continue;
        } 
        break;
      } 
      this.timeline = new float[ParticleEmitter.readInt(param1BufferedReader, "timelineCount")];
      b2 = b1;
      while (true) {
        float[] arrayOfFloat = this.timeline;
        if (b2 < arrayOfFloat.length) {
          StringBuilder stringBuilder = new StringBuilder();
          stringBuilder.append("timeline");
          stringBuilder.append(b2);
          arrayOfFloat[b2] = ParticleEmitter.readFloat(param1BufferedReader, stringBuilder.toString());
          b2++;
          continue;
        } 
        break;
      } 
    }
    
    public void save(Writer param1Writer) throws IOException {
      super.save(param1Writer);
      if (!this.active)
        return; 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("colorsCount: ");
      stringBuilder.append(this.colors.length);
      stringBuilder.append("\n");
      param1Writer.write(stringBuilder.toString());
      byte b1 = 0;
      byte b2;
      for (b2 = 0; b2 < this.colors.length; b2++) {
        stringBuilder = new StringBuilder();
        stringBuilder.append("colors");
        stringBuilder.append(b2);
        stringBuilder.append(": ");
        stringBuilder.append(this.colors[b2]);
        stringBuilder.append("\n");
        param1Writer.write(stringBuilder.toString());
      } 
      stringBuilder = new StringBuilder();
      stringBuilder.append("timelineCount: ");
      stringBuilder.append(this.timeline.length);
      stringBuilder.append("\n");
      param1Writer.write(stringBuilder.toString());
      for (b2 = b1; b2 < this.timeline.length; b2++) {
        stringBuilder = new StringBuilder();
        stringBuilder.append("timeline");
        stringBuilder.append(b2);
        stringBuilder.append(": ");
        stringBuilder.append(this.timeline[b2]);
        stringBuilder.append("\n");
        param1Writer.write(stringBuilder.toString());
      } 
    }
    
    public void setColors(float[] param1ArrayOfFloat) { this.colors = param1ArrayOfFloat; }
    
    public void setTimeline(float[] param1ArrayOfFloat) { this.timeline = param1ArrayOfFloat; }
  }
  
  public static class IndependentScaledNumericValue extends ScaledNumericValue {
    boolean independent;
    
    public boolean isIndependent() { return this.independent; }
    
    public void load(IndependentScaledNumericValue param1IndependentScaledNumericValue) {
      load(param1IndependentScaledNumericValue);
      this.independent = param1IndependentScaledNumericValue.independent;
    }
    
    public void load(BufferedReader param1BufferedReader) throws IOException {
      super.load(param1BufferedReader);
      if (param1BufferedReader.markSupported())
        param1BufferedReader.mark(100); 
      String str = param1BufferedReader.readLine();
      if (str != null) {
        if (str.contains("independent")) {
          this.independent = Boolean.parseBoolean(ParticleEmitter.readString(str));
        } else {
          if (param1BufferedReader.markSupported()) {
            param1BufferedReader.reset();
            return;
          } 
          Gdx.app.error("ParticleEmitter", "The loaded particle effect descriptor file uses an old invalid format. Please download the latest version of the Particle Editor tool and recreate the file by loading and saving it again.");
          throw new IOException("The loaded particle effect descriptor file uses an old invalid format. Please download the latest version of the Particle Editor tool and recreate the file by loading and saving it again.");
        } 
        return;
      } 
      throw new IOException("Missing value: independent");
    }
    
    public void save(Writer param1Writer) throws IOException {
      super.save(param1Writer);
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("independent: ");
      stringBuilder.append(this.independent);
      stringBuilder.append("\n");
      param1Writer.write(stringBuilder.toString());
    }
    
    public void set(IndependentScaledNumericValue param1IndependentScaledNumericValue) {
      super.set(param1IndependentScaledNumericValue);
      this.independent = param1IndependentScaledNumericValue.independent;
    }
    
    public void set(ParticleEmitter.RangedNumericValue param1RangedNumericValue) {
      if (param1RangedNumericValue instanceof IndependentScaledNumericValue) {
        set((IndependentScaledNumericValue)param1RangedNumericValue);
      } else {
        super.set(param1RangedNumericValue);
      } 
    }
    
    public void set(ParticleEmitter.ScaledNumericValue param1ScaledNumericValue) {
      if (param1ScaledNumericValue instanceof IndependentScaledNumericValue) {
        set((IndependentScaledNumericValue)param1ScaledNumericValue);
      } else {
        super.set(param1ScaledNumericValue);
      } 
    }
    
    public void setIndependent(boolean param1Boolean) { this.independent = param1Boolean; }
  }
  
  public static class NumericValue extends ParticleValue {
    private float value;
    
    public float getValue() { return this.value; }
    
    public void load(NumericValue param1NumericValue) {
      load(param1NumericValue);
      this.value = param1NumericValue.value;
    }
    
    public void load(BufferedReader param1BufferedReader) throws IOException {
      super.load(param1BufferedReader);
      if (!this.active)
        return; 
      this.value = ParticleEmitter.readFloat(param1BufferedReader, "value");
    }
    
    public void save(Writer param1Writer) throws IOException {
      super.save(param1Writer);
      if (!this.active)
        return; 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("value: ");
      stringBuilder.append(this.value);
      stringBuilder.append("\n");
      param1Writer.write(stringBuilder.toString());
    }
    
    public void setValue(float param1Float) { this.value = param1Float; }
  }
  
  public static class Particle extends Sprite {
    protected float angle;
    
    protected float angleCos;
    
    protected float angleDiff;
    
    protected float angleSin;
    
    protected int currentLife;
    
    protected int frame;
    
    protected float gravity;
    
    protected float gravityDiff;
    
    protected int life;
    
    protected float rotation;
    
    protected float rotationDiff;
    
    protected float[] tint;
    
    protected float transparency;
    
    protected float transparencyDiff;
    
    protected float velocity;
    
    protected float velocityDiff;
    
    protected float wind;
    
    protected float windDiff;
    
    protected float xScale;
    
    protected float xScaleDiff;
    
    protected float yScale;
    
    protected float yScaleDiff;
    
    public Particle(Sprite param1Sprite) { super(param1Sprite); }
  }
  
  public static class ParticleValue {
    boolean active;
    
    boolean alwaysActive;
    
    public boolean isActive() { return (this.alwaysActive || this.active); }
    
    public boolean isAlwaysActive() { return this.alwaysActive; }
    
    public void load(ParticleValue param1ParticleValue) {
      this.active = param1ParticleValue.active;
      this.alwaysActive = param1ParticleValue.alwaysActive;
    }
    
    public void load(BufferedReader param1BufferedReader) throws IOException {
      if (!this.alwaysActive) {
        this.active = ParticleEmitter.readBoolean(param1BufferedReader, "active");
      } else {
        this.active = true;
      } 
    }
    
    public void save(Writer param1Writer) throws IOException {
      if (!this.alwaysActive) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("active: ");
        stringBuilder.append(this.active);
        stringBuilder.append("\n");
        param1Writer.write(stringBuilder.toString());
      } else {
        this.active = true;
      } 
    }
    
    public void setActive(boolean param1Boolean) { this.active = param1Boolean; }
    
    public void setAlwaysActive(boolean param1Boolean) { this.alwaysActive = param1Boolean; }
  }
  
  public static class RangedNumericValue extends ParticleValue {
    private float lowMax;
    
    private float lowMin;
    
    public float getLowMax() { return this.lowMax; }
    
    public float getLowMin() { return this.lowMin; }
    
    public void load(RangedNumericValue param1RangedNumericValue) {
      load(param1RangedNumericValue);
      this.lowMax = param1RangedNumericValue.lowMax;
      this.lowMin = param1RangedNumericValue.lowMin;
    }
    
    public void load(BufferedReader param1BufferedReader) throws IOException {
      super.load(param1BufferedReader);
      if (!this.active)
        return; 
      this.lowMin = ParticleEmitter.readFloat(param1BufferedReader, "lowMin");
      this.lowMax = ParticleEmitter.readFloat(param1BufferedReader, "lowMax");
    }
    
    public float newLowValue() {
      float f = this.lowMin;
      return f + (this.lowMax - f) * MathUtils.random();
    }
    
    public void save(Writer param1Writer) throws IOException {
      super.save(param1Writer);
      if (!this.active)
        return; 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("lowMin: ");
      stringBuilder.append(this.lowMin);
      stringBuilder.append("\n");
      param1Writer.write(stringBuilder.toString());
      stringBuilder = new StringBuilder();
      stringBuilder.append("lowMax: ");
      stringBuilder.append(this.lowMax);
      stringBuilder.append("\n");
      param1Writer.write(stringBuilder.toString());
    }
    
    public void scale(float param1Float) {
      this.lowMin *= param1Float;
      this.lowMax *= param1Float;
    }
    
    public void set(RangedNumericValue param1RangedNumericValue) {
      this.lowMin = param1RangedNumericValue.lowMin;
      this.lowMax = param1RangedNumericValue.lowMax;
    }
    
    public void setLow(float param1Float) {
      this.lowMin = param1Float;
      this.lowMax = param1Float;
    }
    
    public void setLow(float param1Float1, float param1Float2) {
      this.lowMin = param1Float1;
      this.lowMax = param1Float2;
    }
    
    public void setLowMax(float param1Float) { this.lowMax = param1Float; }
    
    public void setLowMin(float param1Float) { this.lowMin = param1Float; }
  }
  
  public static class ScaledNumericValue extends RangedNumericValue {
    private float highMax;
    
    private float highMin;
    
    private boolean relative;
    
    private float[] scaling = { 1.0F };
    
    float[] timeline = { 0.0F };
    
    public float getHighMax() { return this.highMax; }
    
    public float getHighMin() { return this.highMin; }
    
    public float getScale(float param1Float) { // Byte code:
      //   0: aload_0
      //   1: getfield timeline : [F
      //   4: astore_2
      //   5: aload_2
      //   6: arraylength
      //   7: istore_3
      //   8: iconst_1
      //   9: istore #4
      //   11: iload #4
      //   13: iload_3
      //   14: if_icmpge -> 35
      //   17: aload_2
      //   18: iload #4
      //   20: faload
      //   21: fload_1
      //   22: fcmpl
      //   23: ifle -> 29
      //   26: goto -> 38
      //   29: iinc #4, 1
      //   32: goto -> 11
      //   35: iconst_m1
      //   36: istore #4
      //   38: iload #4
      //   40: iconst_m1
      //   41: if_icmpne -> 53
      //   44: aload_0
      //   45: getfield scaling : [F
      //   48: iload_3
      //   49: iconst_1
      //   50: isub
      //   51: faload
      //   52: freturn
      //   53: aload_0
      //   54: getfield scaling : [F
      //   57: astore #5
      //   59: iload #4
      //   61: iconst_1
      //   62: isub
      //   63: istore_3
      //   64: aload #5
      //   66: iload_3
      //   67: faload
      //   68: fstore #6
      //   70: aload_2
      //   71: iload_3
      //   72: faload
      //   73: fstore #7
      //   75: fload #6
      //   77: aload #5
      //   79: iload #4
      //   81: faload
      //   82: fload #6
      //   84: fsub
      //   85: fload_1
      //   86: fload #7
      //   88: fsub
      //   89: aload_2
      //   90: iload #4
      //   92: faload
      //   93: fload #7
      //   95: fsub
      //   96: fdiv
      //   97: fmul
      //   98: fadd
      //   99: freturn }
    
    public float[] getScaling() { return this.scaling; }
    
    public float[] getTimeline() { return this.timeline; }
    
    public boolean isRelative() { return this.relative; }
    
    public void load(ScaledNumericValue param1ScaledNumericValue) {
      load(param1ScaledNumericValue);
      this.highMax = param1ScaledNumericValue.highMax;
      this.highMin = param1ScaledNumericValue.highMin;
      this.scaling = new float[param1ScaledNumericValue.scaling.length];
      float[] arrayOfFloat1 = param1ScaledNumericValue.scaling;
      float[] arrayOfFloat2 = this.scaling;
      System.arraycopy(arrayOfFloat1, 0, arrayOfFloat2, 0, arrayOfFloat2.length);
      this.timeline = new float[param1ScaledNumericValue.timeline.length];
      arrayOfFloat2 = param1ScaledNumericValue.timeline;
      arrayOfFloat1 = this.timeline;
      System.arraycopy(arrayOfFloat2, 0, arrayOfFloat1, 0, arrayOfFloat1.length);
      this.relative = param1ScaledNumericValue.relative;
    }
    
    public void load(BufferedReader param1BufferedReader) throws IOException {
      super.load(param1BufferedReader);
      if (!this.active)
        return; 
      this.highMin = ParticleEmitter.readFloat(param1BufferedReader, "highMin");
      this.highMax = ParticleEmitter.readFloat(param1BufferedReader, "highMax");
      this.relative = ParticleEmitter.readBoolean(param1BufferedReader, "relative");
      this.scaling = new float[ParticleEmitter.readInt(param1BufferedReader, "scalingCount")];
      byte b1 = 0;
      byte b2 = 0;
      while (true) {
        float[] arrayOfFloat = this.scaling;
        if (b2 < arrayOfFloat.length) {
          StringBuilder stringBuilder = new StringBuilder();
          stringBuilder.append("scaling");
          stringBuilder.append(b2);
          arrayOfFloat[b2] = ParticleEmitter.readFloat(param1BufferedReader, stringBuilder.toString());
          b2++;
          continue;
        } 
        break;
      } 
      this.timeline = new float[ParticleEmitter.readInt(param1BufferedReader, "timelineCount")];
      b2 = b1;
      while (true) {
        float[] arrayOfFloat = this.timeline;
        if (b2 < arrayOfFloat.length) {
          StringBuilder stringBuilder = new StringBuilder();
          stringBuilder.append("timeline");
          stringBuilder.append(b2);
          arrayOfFloat[b2] = ParticleEmitter.readFloat(param1BufferedReader, stringBuilder.toString());
          b2++;
          continue;
        } 
        break;
      } 
    }
    
    public float newHighValue() {
      float f = this.highMin;
      return f + (this.highMax - f) * MathUtils.random();
    }
    
    public void save(Writer param1Writer) throws IOException {
      super.save(param1Writer);
      if (!this.active)
        return; 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("highMin: ");
      stringBuilder.append(this.highMin);
      stringBuilder.append("\n");
      param1Writer.write(stringBuilder.toString());
      stringBuilder = new StringBuilder();
      stringBuilder.append("highMax: ");
      stringBuilder.append(this.highMax);
      stringBuilder.append("\n");
      param1Writer.write(stringBuilder.toString());
      stringBuilder = new StringBuilder();
      stringBuilder.append("relative: ");
      stringBuilder.append(this.relative);
      stringBuilder.append("\n");
      param1Writer.write(stringBuilder.toString());
      stringBuilder = new StringBuilder();
      stringBuilder.append("scalingCount: ");
      stringBuilder.append(this.scaling.length);
      stringBuilder.append("\n");
      param1Writer.write(stringBuilder.toString());
      byte b1 = 0;
      byte b2;
      for (b2 = 0; b2 < this.scaling.length; b2++) {
        stringBuilder = new StringBuilder();
        stringBuilder.append("scaling");
        stringBuilder.append(b2);
        stringBuilder.append(": ");
        stringBuilder.append(this.scaling[b2]);
        stringBuilder.append("\n");
        param1Writer.write(stringBuilder.toString());
      } 
      stringBuilder = new StringBuilder();
      stringBuilder.append("timelineCount: ");
      stringBuilder.append(this.timeline.length);
      stringBuilder.append("\n");
      param1Writer.write(stringBuilder.toString());
      for (b2 = b1; b2 < this.timeline.length; b2++) {
        stringBuilder = new StringBuilder();
        stringBuilder.append("timeline");
        stringBuilder.append(b2);
        stringBuilder.append(": ");
        stringBuilder.append(this.timeline[b2]);
        stringBuilder.append("\n");
        param1Writer.write(stringBuilder.toString());
      } 
    }
    
    public void scale(float param1Float) {
      super.scale(param1Float);
      this.highMin *= param1Float;
      this.highMax *= param1Float;
    }
    
    public void set(ParticleEmitter.RangedNumericValue param1RangedNumericValue) {
      if (param1RangedNumericValue instanceof ScaledNumericValue) {
        set((ScaledNumericValue)param1RangedNumericValue);
      } else {
        super.set(param1RangedNumericValue);
      } 
    }
    
    public void set(ScaledNumericValue param1ScaledNumericValue) {
      super.set(param1ScaledNumericValue);
      this.highMin = param1ScaledNumericValue.highMin;
      this.highMax = param1ScaledNumericValue.highMax;
      float[] arrayOfFloat1 = this.scaling;
      int i = arrayOfFloat1.length;
      float[] arrayOfFloat2 = param1ScaledNumericValue.scaling;
      if (i != arrayOfFloat2.length) {
        this.scaling = Arrays.copyOf(arrayOfFloat2, arrayOfFloat2.length);
      } else {
        System.arraycopy(arrayOfFloat2, 0, arrayOfFloat1, 0, arrayOfFloat1.length);
      } 
      arrayOfFloat1 = this.timeline;
      i = arrayOfFloat1.length;
      arrayOfFloat2 = param1ScaledNumericValue.timeline;
      if (i != arrayOfFloat2.length) {
        this.timeline = Arrays.copyOf(arrayOfFloat2, arrayOfFloat2.length);
      } else {
        System.arraycopy(arrayOfFloat2, 0, arrayOfFloat1, 0, arrayOfFloat1.length);
      } 
      this.relative = param1ScaledNumericValue.relative;
    }
    
    public void setHigh(float param1Float) {
      this.highMin = param1Float;
      this.highMax = param1Float;
    }
    
    public void setHigh(float param1Float1, float param1Float2) {
      this.highMin = param1Float1;
      this.highMax = param1Float2;
    }
    
    public void setHighMax(float param1Float) { this.highMax = param1Float; }
    
    public void setHighMin(float param1Float) { this.highMin = param1Float; }
    
    public void setRelative(boolean param1Boolean) { this.relative = param1Boolean; }
    
    public void setScaling(float[] param1ArrayOfFloat) { this.scaling = param1ArrayOfFloat; }
    
    public void setTimeline(float[] param1ArrayOfFloat) { this.timeline = param1ArrayOfFloat; }
  }
  
  public enum SpawnEllipseSide {
    both, bottom, top;
    
    static  {
      bottom = new SpawnEllipseSide("bottom", 2);
      $VALUES = new SpawnEllipseSide[] { both, top, bottom };
    }
  }
  
  public enum SpawnShape {
    point, square, ellipse, line;
    
    static  {
      line = new SpawnShape("line", true);
      square = new SpawnShape("square", 2);
      ellipse = new SpawnShape("ellipse", 3);
      $VALUES = new SpawnShape[] { point, line, square, ellipse };
    }
  }
  
  public static class SpawnShapeValue extends ParticleValue {
    boolean edges;
    
    ParticleEmitter.SpawnShape shape = ParticleEmitter.SpawnShape.point;
    
    ParticleEmitter.SpawnEllipseSide side = ParticleEmitter.SpawnEllipseSide.both;
    
    public ParticleEmitter.SpawnShape getShape() { return this.shape; }
    
    public ParticleEmitter.SpawnEllipseSide getSide() { return this.side; }
    
    public boolean isEdges() { return this.edges; }
    
    public void load(SpawnShapeValue param1SpawnShapeValue) {
      load(param1SpawnShapeValue);
      this.shape = param1SpawnShapeValue.shape;
      this.edges = param1SpawnShapeValue.edges;
      this.side = param1SpawnShapeValue.side;
    }
    
    public void load(BufferedReader param1BufferedReader) throws IOException {
      super.load(param1BufferedReader);
      if (!this.active)
        return; 
      this.shape = ParticleEmitter.SpawnShape.valueOf(ParticleEmitter.readString(param1BufferedReader, "shape"));
      if (this.shape == ParticleEmitter.SpawnShape.ellipse) {
        this.edges = ParticleEmitter.readBoolean(param1BufferedReader, "edges");
        this.side = ParticleEmitter.SpawnEllipseSide.valueOf(ParticleEmitter.readString(param1BufferedReader, "side"));
      } 
    }
    
    public void save(Writer param1Writer) throws IOException {
      super.save(param1Writer);
      if (!this.active)
        return; 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("shape: ");
      stringBuilder.append(this.shape);
      stringBuilder.append("\n");
      param1Writer.write(stringBuilder.toString());
      if (this.shape == ParticleEmitter.SpawnShape.ellipse) {
        stringBuilder = new StringBuilder();
        stringBuilder.append("edges: ");
        stringBuilder.append(this.edges);
        stringBuilder.append("\n");
        param1Writer.write(stringBuilder.toString());
        stringBuilder = new StringBuilder();
        stringBuilder.append("side: ");
        stringBuilder.append(this.side);
        stringBuilder.append("\n");
        param1Writer.write(stringBuilder.toString());
      } 
    }
    
    public void setEdges(boolean param1Boolean) { this.edges = param1Boolean; }
    
    public void setShape(ParticleEmitter.SpawnShape param1SpawnShape) { this.shape = param1SpawnShape; }
    
    public void setSide(ParticleEmitter.SpawnEllipseSide param1SpawnEllipseSide) { this.side = param1SpawnEllipseSide; }
  }
  
  public enum SpriteMode {
    animated, random, single;
    
    static  {
      random = new SpriteMode("random", true);
      animated = new SpriteMode("animated", 2);
      $VALUES = new SpriteMode[] { single, random, animated };
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g2d/ParticleEmitter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */